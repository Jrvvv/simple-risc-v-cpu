`timescale 1ns / 1ps

module ext_mem
(
    input   logic        clk_i,
    input   logic        mem_req_i,
    input   logic        write_enable_i,
    input   logic [ 3:0] byte_enable_i, 
    input   logic [31:0] addr_i,
    input   logic [31:0] write_data_i,
    output  logic [31:0] read_data_o,
    output  logic        ready_o
);

    logic [31:0] RAM [4095:0];
    logic [31:0] current_data;
    
    initial $readmemh("lab_12_ps2ascii_data.mem", RAM);
    
    assign ready_o = 1'b1;
    
    // reading
    always_ff @(posedge clk_i) begin
        if (mem_req_i)
            current_data <= RAM[addr_i[31:2]];
        else
            current_data <= current_data;
    end

    // writing
    always_ff @(posedge clk_i) begin
        if (mem_req_i && write_enable_i) begin
            RAM[addr_i[31:2]][7 : 0] <= (byte_enable_i[0]) ? write_data_i [7 : 0] : RAM[addr_i[31:2]][7 : 0];
            RAM[addr_i[31:2]][15: 8] <= (byte_enable_i[1]) ? write_data_i [15: 8] : RAM[addr_i[31:2]][15: 8];
            RAM[addr_i[31:2]][23:16] <= (byte_enable_i[2]) ? write_data_i [23:16] : RAM[addr_i[31:2]][23:16];
            RAM[addr_i[31:2]][31:24] <= (byte_enable_i[3]) ? write_data_i [31:24] : RAM[addr_i[31:2]][31:24];
        end else begin
            RAM[addr_i[31:2]] <= RAM[addr_i[31:2]];
        end
    end

    always_comb begin
        if (!mem_req_i || write_enable_i) begin
            read_data_o = 32'hfa11_1eaf;
        end else if (mem_req_i && addr_i <= 32'd16383) begin
            read_data_o = current_data;
        end else if (mem_req_i && addr_i > 32'd16383) begin
            read_data_o = 32'hdead_beef;
        end else begin
            // CHECK IF RIGHT!!
            read_data_o = read_data_o;
        end
    end

endmodule
