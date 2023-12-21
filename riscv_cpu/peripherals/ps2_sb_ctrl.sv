`timescale 1ns / 1ps

module ps2_sb_ctrl
(
    // Часть интерфейса модуля, отвечающая за подключение к системной шине
    input  logic         clk_i,
    input  logic         rst_i,
    input  logic [31:0]  addr_i,
    input  logic         req_i,
    input  logic [31:0]  write_data_i,
    input  logic         write_enable_i,
    output logic [31:0]  read_data_o,

    // Часть интерфейса модуля, отвечающая за отправку запросов на прерывание
    // процессорного ядра
    output logic        interrupt_request_o,
    input  logic        interrupt_return_i,

    // Часть интерфейса модуля, отвечающая за подключение к модулю,
    // осуществляющему прием данных с клавиатуры
    input  logic        kclk_i,
    input  logic        kdata_i
);

    logic [7:0]     scan_code;
    logic           scan_code_is_unread;
    logic [7:0]     keycode;
    logic           keycode_is_valid;

    logic [31:0]    rd_reg;
        
    logic is_pressed_addr;
    logic is_unread_addr;
    logic is_reset_addr;
    
    logic rst;
    logic write_req;
    logic read_req;
    
    // reg addresses
    localparam PRESSED_KEY_ADDR = 32'h0000_0000;
    localparam UNREAD_DATA_ADDR = 32'h0000_0004;
    localparam RESET_ADDR       = 32'h0000_0024;
    
    // wires to check addr
    assign is_pressed_addr = (addr_i == PRESSED_KEY_ADDR);
    assign is_unread_addr  = (addr_i == UNREAD_DATA_ADDR);
    assign is_reset_addr   = (addr_i == RESET_ADDR);
    
    // 
    assign write_req = req_i &  write_enable_i;
    assign read_req  = req_i & ~write_enable_i;
    
    assign rst = rst_i | ((write_data_i == 32'd1) & is_reset_addr & write_req);

    

    PS2Receiver ps2_reciever_dev 
    (
        .clk_i          (clk_i),                            // Сигнал тактирования процессора и вашего модуля-контроллера
        .kclk_i         (kclk_i),                           // Тактовый сигнал, приходящий с клавиатуры
        .kdata_i        (kdata_i),                          // Сигнал данных, приходящий с клавиатуры
        .keycode_o      (keycode),                          // Сигнал полученного с клавиатуры скан-кода клавиши
        .keycode_valid_o(keycode_is_valid)                  // Сигнал готовности данных на выходе keycodeout
    );
    
    assign interrupt_request_o = scan_code_is_unread;
    assign read_data_o         = rd_reg;

    always_ff@(posedge clk_i) begin
        if (rst) begin
            rd_reg              <= 32'b0;
            scan_code           <= 8 'b0;
            scan_code_is_unread <= 1 'b0;
            
//        end else if (keycode_valid_o) begin
//            scan_code <= 
        end
        
    end


endmodule