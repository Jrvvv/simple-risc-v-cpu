`timescale 1ns / 1ps

module ps2_sb_ctrl
(
    // The part of the module interface responsible for connecting to the system bus
    input  logic         clk_i,
    input  logic         rst_i,
    input  logic [31:0]  addr_i,
    input  logic         req_i,
    input  logic [31:0]  write_data_i,
    input  logic         write_enable_i,
    output logic [31:0]  read_data_o,

    // The part of the module interface responsible for sending interrupt requests
    // of the processor core
    output logic        interrupt_request_o,
    input  logic        interrupt_return_i,

    // The part of the module interface responsible for connecting to the module,
    // receiving data from the keyboard
    input  logic        kclk_i,
    input  logic        kdata_i
);

    // module registers
    logic [7:0]     scan_code;
    logic           scan_code_is_unread;

    // wires from ps/2 reciever
    logic [7:0]     keycode;
    logic           keycode_valid;

    // out read register
    logic [31:0]    rd_reg;
    // read reg enable wire
    logic           rd_reg_en;

    // wires to check which address used
    logic is_pressed_addr;
    logic is_unread_addr;
    logic is_reset_addr;

    // signals to indicate which req and if rst
    logic rst;
    logic write_req;
    logic read_req;

    // wire to indicate if write data for rst is valid
    logic rst_valid;

    // reg addresses
    localparam PRESSED_KEY_ADDR = 32'h0000_0000;
    localparam UNREAD_DATA_ADDR = 32'h0000_0004;
    localparam RESET_ADDR       = 32'h0000_0024;

    // wires to check addr
    assign is_pressed_addr = (addr_i == PRESSED_KEY_ADDR);
    assign is_unread_addr  = (addr_i == UNREAD_DATA_ADDR);
    assign is_reset_addr   = (addr_i == RESET_ADDR);

    // sires to check which req
    assign write_req = req_i &  write_enable_i;
    assign read_req  = req_i & ~write_enable_i;

    assign rst_valid = (write_data_i == 32'h0000_0001);

    assign rst = rst_i | (rst_valid & is_reset_addr & write_req);

    PS2Receiver ps2_reciever_dev
    (
        .clk_i          (clk_i),                // The clock signal of the processor and your controller module
        .kclk_i         (kclk_i),               // Clock signal coming from the keyboard
        .kdata_i        (kdata_i),              // Data signal coming from the keyboard
        .keycode_o      (keycode),              // Signal of the key scan code received from the keyboard
        .keycode_valid_o(keycode_valid)         // Data readiness signal at the keycodeout output
    );

    assign interrupt_request_o = scan_code_is_unread;
    assign read_data_o         = rd_reg;

    assign rd_reg_en           = (is_pressed_addr | is_unread_addr) & read_req;

    always_ff@(posedge clk_i) begin
        if (rst) begin
            scan_code           <= 8 'b0;
            scan_code_is_unread <= 1 'b0;
        end else begin
            case(keycode_valid)
                1'b1: begin
                    scan_code           <= keycode;
                    scan_code_is_unread <= 1'b1;
                end
                1'b0: begin
                    if (read_req) begin
                        scan_code_is_unread <= (is_pressed_addr) ? 1'b0 : scan_code_is_unread;
                    end

                    if (interrupt_return_i)
                        scan_code_is_unread <= 1'b0;
                end
            endcase
        end
    end

    // read data reg
    always_ff@(posedge clk_i) begin
        if (rst) begin
            rd_reg <= 32'b0;
        end else if (rd_reg_en) begin
            case(1'b1)
                is_pressed_addr: rd_reg <= {24'b0, scan_code};
                is_unread_addr : rd_reg <= {31'b0, scan_code_is_unread};
                default        : rd_reg <= rd_reg;    // is necessary? rd_reg_en true only if one of is_pressed/is_unread true
            endcase
        end else begin
            rd_reg <= rd_reg;
        end

    end

endmodule