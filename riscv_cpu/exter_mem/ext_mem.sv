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
            // case (byte_enable_i)
            //     4'b0001: RAM[addr_i[31:2]] <= {current_data[31: 8], write_data_i[7:  0]                                           };
            //     4'b0010: RAM[addr_i[31:2]] <= {current_data[31:16], write_data_i[15: 8], current_data[7:  0]                      };
            //     4'b0011: RAM[addr_i[31:2]] <= {current_data[31:16], write_data_i[15: 0]                                           };
            //     4'b0100: RAM[addr_i[31:2]] <= {current_data[31:24], write_data_i[23:16], current_data[15: 0]                      };
            //     4'b0101: RAM[addr_i[31:2]] <= {current_data[31:24], write_data_i[23:16], current_data[15: 8], write_data_i[7  :0] };
            //     4'b0110: RAM[addr_i[31:2]] <= {current_data[31:24], write_data_i[23: 8], current_data[7:  8]                      };
            //     4'b0111: RAM[addr_i[31:2]] <= {current_data[31:24], write_data_i[23: 0]                                           };
            //     4'b1000: RAM[addr_i[31:2]] <= {write_data_i[31:24], current_data[23: 0]                                           };
            //     4'b1001: RAM[addr_i[31:2]] <= {write_data_i[31:24], current_data[23: 8], write_data_i[7:  0]                      };
            //     4'b1010: RAM[addr_i[31:2]] <= {write_data_i[31:24], current_data[23:16], write_data_i[15: 8], current_data[7  :0] };
            //     4'b1011: RAM[addr_i[31:2]] <= {write_data_i[31:24], current_data[23:16], write_data_i[15: 0]                      };
            //     4'b1100: RAM[addr_i[31:2]] <= {write_data_i[31:16], current_data[15: 0]                                           };
            //     4'b1101: RAM[addr_i[31:2]] <= {write_data_i[31:16], current_data[15: 8], write_data_i[7:  0]                      };
            //     4'b1110: RAM[addr_i[31:2]] <= {write_data_i[31: 8], current_data[7:  0]                                           };
            //     4'b1111: RAM[addr_i[31:2]] <= write_data_i[31:0];
            //     default: RAM[addr_i[31:2]] <= current_data[31:0];
            // endcase

            if (byte_enable_i[0])
                RAM[addr_i[31:2]][7:  0] <=     write_data_i [7:  0];
            else
                RAM[addr_i[31:2]][7:  0] <= RAM[addr_i[31:2]][7:  0];

            if (byte_enable_i[1])
                RAM[addr_i[31:2]][15: 8] <=     write_data_i [15: 8];
            else
                RAM[addr_i[31:2]][15: 8] <= RAM[addr_i[31:2]][15: 8];

            if (byte_enable_i[2])
                RAM[addr_i[31:2]][23:16] <=     write_data_i [23:16];
            else
                RAM[addr_i[31:2]][23:16] <= RAM[addr_i[31:2]][23:16];

            if (byte_enable_i[3])
                RAM[addr_i[31:2]][31:24] <=     write_data_i [31:24];
            else
                RAM[addr_i[31:2]][31:24] <= RAM[addr_i[31:2]][31:24];
        end else begin
            RAM[addr_i[31:2]] <= RAM[addr_i[31:2]];
        end
    end
    
    always_comb begin
        if (!mem_req_i || write_enable_i)
            read_data_o = 32'hfa11_1eaf;
        else if (mem_req_i && addr_i <= 32'd16383)
            read_data_o = current_data;
        else if (mem_req_i && addr_i > 32'd16383)
            read_data_o = 32'hdead_beef;
        else
            read_data_o = read_data_o;
    end

endmodule
