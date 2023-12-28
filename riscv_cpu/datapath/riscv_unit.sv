`timescale 1ns / 1ps

module riscv_unit
(
    input  logic        clk_i,
    input  logic        resetn_i,

    // Peripherial in's/out's
    // Switches
    input  logic [15:0] sw_i,
    
    // Leds
    output logic [15:0] led_o,

    // Keyboard (PS/2)
    input  logic        kclk_i,
    input  logic        kdata_i,

    // 7-seg leds
    output logic [ 6:0] hex_led_o,  // out
    output logic [ 7:0] hex_sel_o,  // selector

    // UART
    input  logic        rx_i,       // recieve
    output logic        tx_o,       // transceive

    // VGA
    output logic [3:0]  vga_r_o,    // red chanel
    output logic [3:0]  vga_g_o,    // green chanel
    output logic [3:0]  vga_b_o,    // blue chanel
    output logic        vga_hs_o,   // horizontal sync 
    output logic        vga_vs_o    // vertical sync 
);

    // Freq devider wires
    logic sysclk, rst;

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

    // interrupt signals out(ret)/in(req)
    logic           irq_ret;
    logic           irq_req;

    // one hot encoder
    logic [255:0] one_hot_encoder;

    // address in perepherial mem space
    logic [31 :0] peripherial_addr;

    assign one_hot_encoder  = 256'b1 << data_addr[31:24];
    assign peripherial_addr = {8'd0, data_addr[23:0]};

    // freq devider
    sys_clk_rst_gen divider
    (
        .ex_clk_i       (clk_i),
        .ex_areset_n_i  (resetn_i),
        .div_i          (5),
        .sys_clk_o      (sysclk),
        .sys_reset_o    (rst)
    );

    riscv_core core
    (
        .clk_i          (sysclk),
        .rst_i          (rst),

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
        .clk_i          (sysclk),
        .rst_i          (rst),

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
        .clk_i          (sysclk),
        .mem_req_i      (data_req),
        .write_enable_i (data_we),
        .byte_enable_i  (data_be),
        .addr_i         (data_addr),
        .write_data_i   (data_wd),
        .read_data_o    (data_rd),
        .ready_o        (data_ready)
    );

endmodule