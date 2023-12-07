`timescale 1ns / 1ps


module interrupt_controller
(
    input  logic        clk_i,
    input  logic        rst_i,
    input  logic        exception_i,
    input  logic        irq_req_i,
    input  logic        mie_i,
    input  logic        mret_i,

    output logic        irq_ret_o,
    output logic [31:0] irq_cause_o,
    output logic        irq_o
);
    
    
endmodule
