`timescale 1ns / 1ps

module riscv_unit
(
    input  logic        clk_i,
    input  logic        rst_i
);

    // core <-> LSU wires
    // from core to LSU
    logic           core_req;
    logic           core_we;
    logic   [2: 0]  core_size;
    logic   [31:0]  core_wd;
    logic   [31:0]  core_addr;
    // to core from LSU
    logic           core_stall;
    logic   [31:0]  core_rd;

    // LSU <-> data mem wires
    // from LSU to data mem
    logic           data_req;
    logic           data_we;
    logic   [3: 0]  data_be;
    logic   [31:0]  data_wd;
    logic   [31:0]  data_addr;
    // to LSU from data mem
    logic           data_ready;
    logic   [31:0]  data_rd;

    // instr mem <-> core wires
    logic   [31:0]  instr_addr;
    logic   [31:0]  instr;

    logic           irq_ret;
    logic           irq_req;

    riscv_core core
    (
        .clk_i          (clk_i),
        .rst_i          (rst_i),

        .stall_i        (core_stall),
        .instr_i        (instr),
        .mem_rd_i       (core_rd),
        .irq_req_i      (irq_req),

        .instr_addr_o   (instr_addr),
        .mem_addr_o     (core_addr),
        .mem_size_o     (core_size),
        .mem_req_o      (core_req),
        .mem_we_o       (core_we),
        .mem_wd_o       (core_wd),
        .irq_ret_o      (irq_ret)
    );

    riscv_lsu lsu
    (
        .clk_i          (clk_i),
        .rst_i          (rst_i),

        .core_req_i     (core_req),
        .core_we_i      (core_we),
        .core_size_i    (core_size),
        .core_addr_i    (core_addr),
        .core_wd_i      (core_wd),
        .core_rd_o      (core_rd),
        .core_stall_o   (core_stall),

        .mem_req_o      (data_req),
        .mem_we_o       (data_we),
        .mem_be_o       (data_be),
        .mem_addr_o     (data_addr),
        .mem_wd_o       (data_wd),
        .mem_rd_i       (data_rd),
        .mem_ready_i    (data_ready)
    );

    instr_mem instr_mem_dev
    (
        .addr_i      (instr_addr),
        .read_data_o (instr)
    );

    ext_mem ext_mem_dev
    (
        .clk_i          (clk_i),
        .mem_req_i      (data_req),
        .write_enable_i (data_we),
        .byte_enable_i  (data_be),
        .addr_i         (data_addr),
        .write_data_i   (data_wd),
        .read_data_o    (data_rd),
        .ready_o        (data_ready)
    );

endmodule