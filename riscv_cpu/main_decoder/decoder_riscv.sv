`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2023 11:03:34 AM
// Design Name: 
// Module Name: decoder_riscv
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module decoder_riscv
(
    input  logic [31:0] fetched_instr_i,
    output logic [1:0]  a_sel_o,
    output logic [2:0]  b_sel_o,
    output logic [4:0]  alu_op_o,
    output logic [2:0]  csr_op_o,
    output logic        csr_we_o,
    output logic        mem_req_o,
    output logic        mem_we_o,
    output logic [2:0]  mem_size_o,
    output logic        gpr_we_o,
    output logic [1:0]  wb_sel_o,
    output logic        illegal_instr_o,
    output logic        branch_o,
    output logic        jal_o,
    output logic        jalr_o,
    output logic        mret_o      
    
);

    import riscv_pkg::*;
    
    logic [6:0] opcode;
    logic [2:0] funct3;
    logic [6:0] funct7;
    
    assign opcode = fetched_instr_i[6 : 0];
    assign funct3 = fetched_instr_i[14:12];
    assign funct7 = fetched_instr_i[31:25];
    
    always_comb begin
    // output values by-default (not case's default!!)
        a_sel_o         <= OP_A_RS1;
        b_sel_o         <= OP_B_IMM_I;
        alu_op_o        <= OP_OPCODE;

        csr_op_o        <= CSR_RW;
        csr_we_o        <= 1'b0;

        mem_req_o       <= 1'b0;
        mem_we_o        <= 1'b0;
        mem_size_o      <= LDST_W;

        gpr_we_o        <= 1'b1;
        wb_sel_o        <= WB_EX_RESULT;

        illegal_instr_o <= 1'b0;
        branch_o        <= 1'b0;
        jal_o           <= 1'b0;
        jalr_o          <= 1'b0;
        mret_o          <= 1'b0;

        case(opcode)
            {OP_OPCODE,       2'b11}: begin
                case(funct3)
                    3'h0: begin
                        case(funct7)
                            7'h0 :   begin
                            end

                            7'h20:   begin
                            end

                            default: begin
                            end
                        endcase 
                    end

                    3'h4: begin
                    end

                    3'h6: begin
                    end

                    3'h7: begin
                    end

                    3'h1: begin
                    end

                    // 
                    3'h5: begin
                        case(funct7)
                            7'h0 : begin
                            end

                            7'h20: begin
                            end

                            default: begin
                            end
                        endcase
                    end

                    3'h2: begin
                    end

                    3'h3: begin
                    end

                    default: begin
                    end
                endcase
            end

            {OP_IMM_OPCODE,   2'b11}: begin
                case(funct3)
                    3'h0: begin
                    end

                    3'h4: begin
                    end

                    3'h6: begin
                    end

                    3'h7: begin
                    end

                    3'h1: begin
                        case(funct7)
                            7'h0: begin
                            end

                            default: begin
                            end
                        endcase
                    end

                    3'h5: begin
                        case(funct7)
                            7'h0: begin
                            end

                            7'h20: begin
                            end

                            default: begin
                            end
                        endcase
                    end

                    3'h2: begin
                    end

                    3'h3: begin
                    end

                    default: begin
                    end
                endcase
            end


            {LOAD_OPCODE,     2'b11}: begin
                case(funct3)
                    3'h0: begin
                    end

                    3'h1: begin
                    end

                    3'h2: begin
                    end

                    3'h4: begin
                    end

                    3'h5: begin
                    end

                    default: begin
                    end
                endcase
            end

            {STORE_OPCODE,    2'b11}: begin
                case(funct3)
                    3'h0: begin
                    end

                    3'h1: begin
                    end

                    3'h2: begin
                    end

                    default: begin
                    end
                endcase
            end

            {BRANCH_OPCODE,   2'b11}: begin
                case(funct3)
                    3'h0: begin
                    end

                    3'h1: begin
                    end

                    3'h4: begin
                    end

                    3'h5: begin
                    end

                    3'h6: begin
                    end

                    3'h7: begin
                    end

                    default: begin
                    end
                endcase
            end

            {JAL_OPCODE,      2'b11}: begin

            end

            {JALR_OPCODE,     2'b11}: begin
                case(funct3)
                    3'h0: begin
                    end

                    default: begin
                    end
                endcase
            end

            {LUI_OPCODE,      2'b11}: begin
            
            end

            {AUIPC_OPCODE,    2'b11}: begin
            
            end

            {MISC_MEM_OPCODE, 2'b11}: begin
            
            end

            {SYSTEM_OPCODE,   2'b11}: begin
            
            end

            default: begin
            
            end
        endcase
    
    end

endmodule
