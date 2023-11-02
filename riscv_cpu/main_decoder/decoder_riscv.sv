`timescale 1ns / 1ps

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
        alu_op_o        <= ALU_ADD;

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
            // REG-REG OPERS
            {OP_OPCODE,       2'b11}: begin
                b_sel_o     <= OP_B_RS2;

                case(funct3)
                    // ADD and SUB
                    3'h0: begin
                        case(funct7)
                            // ADD
                            7'h0:    begin
                                alu_op_o <= ALU_ADD;
                            end
                            // SUB
                            7'h20:   begin
                                alu_op_o <= ALU_SUB;
                            end
                            default: begin
                                illegal_instr_o <= 1'b1;
                                gpr_we_o        <= 1'b0;
                            end
                        endcase 
                    end

                    // XOR
                    3'h4: begin
                        case(funct7)
                            7'h0:    begin
                                alu_op_o <= ALU_XOR;
                            end
                            default: begin
                                illegal_instr_o <= 1'b1;
                                gpr_we_o        <= 1'b0;
                            end
                        endcase 
                    end

                    // OR
                    3'h6: begin
                        case(funct7)
                            7'h0:    begin
                                alu_op_o <= ALU_OR;
                            end
                            default: begin
                                illegal_instr_o <= 1'b1;
                                gpr_we_o        <= 1'b0;
                            end
                        endcase 
                    end

                    // AND
                    3'h7: begin
                        case(funct7)
                            7'h0:    begin
                                alu_op_o <= ALU_AND;
                            end
                            default: begin
                                illegal_instr_o <= 1'b1;
                                gpr_we_o        <= 1'b0;
                            end
                        endcase 
                    end

                    // SHIFT LEFT LOGICAL
                    3'h1: begin
                        case(funct7)
                            7'h0:    begin
                                alu_op_o <= ALU_SLL;
                            end
                            default: begin
                                illegal_instr_o <= 1'b1;
                                gpr_we_o        <= 1'b0;
                            end
                        endcase 
                    end

                    // SHIFT RIGHT LOGICAL/ARITHMETIC
                    3'h5: begin
                        case(funct7)
                            // SHIFT RIGHT LOGICAL
                            7'h0:   begin
                                alu_op_o <= ALU_SRL;
                            end
                            // SHIFT RIGHT ARITHMETIC
                            7'h20:   begin
                                alu_op_o <= ALU_SRA;
                            end
                            default: begin
                                illegal_instr_o <= 1'b1;
                                gpr_we_o        <= 1'b0;
                            end
                        endcase
                    end

                    // SET LESS THEN (rs1 < rs2)
                    3'h2: begin
                        case(funct7)
                            7'h0:    begin
                                alu_op_o <= ALU_SLTS;
                            end
                            default: begin
                                illegal_instr_o <= 1'b1;
                                gpr_we_o        <= 1'b0;
                            end
                        endcase
                    end

                    // SET LESS THEN UNSIGNED (rs1 < rs2)
                    3'h3: begin
                        case(funct7)
                            7'h0:    begin
                                alu_op_o <= ALU_SLTU;
                            end
                            default: begin
                                illegal_instr_o <= 1'b1;
                                gpr_we_o        <= 1'b0;
                            end
                        endcase
                    end
                    default: begin
                        illegal_instr_o <= 1'b1;
                        gpr_we_o        <= 1'b0;
                    end
                endcase
            end

            // REG-IMM OPERS
            {OP_IMM_OPCODE,   2'b11}: begin
                case(funct3)
                    // ADD I
                    3'h0: begin
                        alu_op_o <= ALU_ADD;
                    end

                    // XOR I
                    3'h4: begin
                        alu_op_o <= ALU_XOR;
                    end

                    // OR I
                    3'h6: begin
                        alu_op_o <= ALU_OR;
                    end

                    // AND I
                    3'h7: begin
                        alu_op_o <= ALU_AND;
                    end

                    // SHIFT LEFT LOGICAL I
                    3'h1: begin
                        case(funct7)
                            7'h0:    begin
                                alu_op_o <= ALU_AND;
                            end
                            default: begin
                                illegal_instr_o <= 1'b1;
                                gpr_we_o        <= 1'b0;
                            end
                        endcase
                    end

                    // SHIFT RIGHT L/A I
                    3'h5: begin
                        case(funct7)
                            // SHIFT RIGHT LOGICAL I
                            7'h0:    begin
                                alu_op_o <= ALU_SRL;
                            end
                            // SHIFT RIGHT ARITHMETIC I
                            7'h20:   begin
                                alu_op_o <= ALU_SRA;
                            end
                            default: begin
                                illegal_instr_o <= 1'b1;
                                gpr_we_o        <= 1'b0;
                            end
                        endcase
                    end

                    // SET LESS THEN I (rs1 < imm)
                    3'h2: begin
                        alu_op_o <= ALU_SLTS;
                    end

                    // SET LESS THEN I UNSIGNED (rs1 < imm)
                    3'h3: begin
                        alu_op_o <= ALU_SLTU;
                    end
                    default: begin
                        illegal_instr_o <= 1'b1;
                        gpr_we_o        <= 1'b0;
                    end
                endcase
            end

            // LOAD OPERS
            {LOAD_OPCODE,     2'b11}: begin
                wb_sel_o  <= WB_LSU_DATA;
                mem_req_o <= 1'b1;

                case(funct3)
                    // LOAD BYTE
                    3'h0: begin
                        mem_size_o <= LDST_B;
                    end

                    // LOAD HALF
                    3'h1: begin
                        mem_size_o <= LDST_H;
                    end

                    // LOAD WORD
                    3'h2: begin
                        mem_size_o <= LDST_W;
                    end

                    // LOAD BYTE INSIGNED
                    3'h4: begin
                        mem_size_o <= LDST_BU;
                    end

                    // LOAD HALF INSIGNED
                    3'h5: begin
                        mem_size_o <= LDST_HU;
                    end
                    default: begin
                        illegal_instr_o <= 1'b1;
                        gpr_we_o        <= 1'b0;
                        mem_req_o       <= 1'b0;
                    end
                endcase
            end

            // STORE OPERS
            {STORE_OPCODE,    2'b11}: begin
                gpr_we_o  <= 1'b0;
                mem_req_o <= 1'b1;
                mem_we_o  <= 1'b1;
                b_sel_o   <= OP_B_IMM_S;
                case(funct3)
                    // STORE BYTE
                    3'h0: begin
                        mem_size_o <= LDST_B;
                    end

                    // STORE HALF
                    3'h1: begin
                        mem_size_o <= LDST_H;
                    end

                    // STORE WORD
                    3'h2: begin
                        mem_size_o <= LDST_W;
                    end
                    default: begin
                        mem_req_o <= 1'b0;
                        mem_we_o  <= 1'b0;
                    end
                endcase
            end

            // BRANCH OPERS
            {BRANCH_OPCODE,   2'b11}: begin
                case(funct3)
                    // IF EQUAL (rs1 == rs2) pc += imm
                    3'h0: begin
                    end

                    // IF NOT EQUAL (rs1 != rs2) pc += imm
                    3'h1: begin
                    end

                    // IF LESS THEN (rs1 < rs2) pc += imm
                    3'h4: begin
                    end

                    // IF GREATER OR EQ (rs1 >= rs2) pc += imm
                    3'h5: begin
                    end

                    // IF LESS THEN UNSIGNED (rs1 < rs2) pc += imm
                    3'h6: begin
                    end

                    // IF GREATER OR EQ UNSIGNED (rs1 >= rs2) pc += imm
                    3'h7: begin
                    end

                    default: begin
                    end
                endcase
            end

            // JAL OPER (rd = pc + 4, pc += imm)
            {JAL_OPCODE,      2'b11}: begin

            end

            // JALR OPER (rd = pc + 4, pc = rs1 + imm)
            {JALR_OPCODE,     2'b11}: begin
                case(funct3)
                    3'h0: begin
                    end

                    default: begin
                    end
                endcase
            end

            // LOAD UPPER IMM OPER (rd = imm << 12)
            {LUI_OPCODE,      2'b11}: begin
            
            end

            // ADD UPPER IMM TO PC OPER (rd = pc + (imm << 12))
            {AUIPC_OPCODE,    2'b11}: begin
            
            end

            // FENCE OPER (in current cpu ~ nop oper)
            {MISC_MEM_OPCODE, 2'b11}: begin
                case(funct3)
                    3'h0: begin
                    end

                    default: begin
                    end
                endcase
            end

            // CALL/BREAK OPERS (csr = csr_op(rs1); rd = csr)
            {SYSTEM_OPCODE,   2'b11}: begin
                case(funct3)
                    3'h0: begin
                        case(funct7)
                            // CALL
                            7'h0:    begin
                            end

                            // BREAK
                            7'h1:    begin
                            end
                            default: begin
                            end
                        endcase
                    end

                    default: begin
                    end
                endcase
            end

            default: begin
            end
        endcase
    
    end

endmodule
