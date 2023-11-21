`timescale 1ns / 1ps

module riscv_lsu
(
  input logic clk_i,
  input logic rst_i,

  input  logic        core_req_i,
  input  logic        core_we_i,
  input  logic [ 2:0] core_size_i,
  input  logic [31:0] core_addr_i,
  input  logic [31:0] core_wd_i,
  output logic [31:0] core_rd_o,
  output logic        core_stall_o,

  output logic        mem_req_o,
  output logic        mem_we_o,
  output logic [ 3:0] mem_be_o,
  output logic [31:0] mem_addr_o,
  output logic [31:0] mem_wd_o,
  input  logic [31:0] mem_rd_i,
  input  logic        mem_ready_i
);

    import riscv_pkg::*;

    logic stall_reg;
    
    // wires
    logic [1:0] byte_offset;
    
    // assignin wires
    assign byte_offset = core_addr_i[1:0];
    
    // stright from in to out
    assign mem_req_o    = core_req_i;
    assign mem_we_o     = core_we_i; 
    assign core_addr_o  = mem_addr_o;
    
    // setting stall out value
    assign core_stall_o = core_req_i & ~(mem_ready_i & stall_reg);
    // setting stall reg value
    always_ff@(posedge clk_i)
        stall_reg <= core_stall_o;
  
  // LDST_B          = 3'b000; Знаковое 8-битное значение
  // LDST_H          = 3'b001; Знаковое 16-битное значение
  // LDST_W          = 3'b010; 32-битное значение
  // LDST_BU         = 3'b100; Беззнаковое 8-битное значение
  // LDST_HU         = 3'b101; Беззнаковое 16-битное значение
    
    // setting mem_be_o value
    always_comb begin
        case (core_size_i)
            LDST_B: begin
            end
            
            LDST_H: begin
            end
            
            LDST_W: begin
            end
            
            default: mem_be_o <= mem_be_o;
        endcase
        
    end
    
    // setting core_rd_o value
    always_comb begin
        case (core_size_i)
            LDST_B: begin
            end
            
            LDST_H: begin
            end
            
            LDST_W: begin
            end
            
            default: mem_be_o <= mem_be_o;
        endcase
    end
    
    // setting mem_wd_o value
    always_comb begin
        case (core_size_i)
            LDST_B: begin
            end
            
            LDST_H: begin
            end
            
            LDST_W: begin
            end
            
            default: mem_be_o <= mem_be_o;
        endcase
    end

endmodule
