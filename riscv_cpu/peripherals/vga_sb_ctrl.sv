`timescale 1ns / 1ps

module vga_sb_ctrl
(
  input  logic        clk_i,
  input  logic        rst_i,
  input  logic        clk100m_i,
  input  logic        req_i,
  input  logic        write_enable_i,
  input  logic [3:0]  mem_be_i,
  input  logic [31:0] addr_i,
  input  logic [31:0] write_data_i,
  output logic [31:0] read_data_o,

  output logic [3:0]  vga_r_o,
  output logic [3:0]  vga_g_o,
  output logic [3:0]  vga_b_o,
  output logic        vga_hs_o,
  output logic        vga_vs_o
);



endmodule
