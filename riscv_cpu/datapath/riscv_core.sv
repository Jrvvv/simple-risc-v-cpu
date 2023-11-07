`timescale 1ns / 1ps

module riscv_core
(
    input   logic        clk_i,
    input   logic        rst_i,
    
    input   logic        stall_i,
    input   logic [31:0] instr_i,
    input   logic [31:0] mem_rd_i,
    
    output  logic [31:0] instr_addr_o,
    output  logic [31:0] mem_addr_o,
    output  logic [ 2:0] mem_size_o,
    output  logic        mem_req_o,
    output  logic        mem_we_o,
    output  logic [31:0] mem_wd_o

);
endmodule
