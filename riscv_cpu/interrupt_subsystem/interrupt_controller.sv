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

    logic irq_h;
    logic exc_h;

    logic exc_set;
    logic exc_reset;
    logic exc_in;

    logic irq_set;
    logic irq_reset;
    logic irq_in;

    logic int_mask;

    assign int_mask     = irq_req_i & mie_i;

    assign irq_cause_o  = 32'h1000_0010;

    assign exc_set      = exception_i | exc_h;
    assign exc_reset    = mret_i;
    assign exc_in       = ~exc_reset & exc_set;

    assign irq_set      = irq_o | irq_h;
    assign irq_reset    = mret_i & ~exc_set;
    assign irq_in       = ~irq_reset & irq_set;

    assign irq_ret_o    = irq_reset;

    assign irq_o        = ~(exc_set | irq_h) & int_mask;

    always_ff @(posedge clk_i) begin
        if (rst_i) begin
            exc_h <= 1'b0;
            irq_h <= 1'b0;
        end else begin
            exc_h <= exc_in;
            irq_h <= irq_in;
        end
    end

endmodule
