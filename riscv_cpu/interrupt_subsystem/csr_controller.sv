`timescale 1ns / 1ps

module csr_controller
(
    input  logic        clk_i,
    input  logic        rst_i,
    input  logic        trap_i,

    input  logic [ 2:0] opcode_i,

    input  logic [11:0] addr_i,
    input  logic [31:0] pc_i,
    input  logic [31:0] mcause_i,
    input  logic [31:0] rs1_data_i,
    input  logic [31:0] imm_data_i,
    input  logic        write_enable_i,

    output logic [31:0] read_data_o,
    output logic [31:0] mie_o,
    output logic [31:0] mepc_o,
    output logic [31:0] mtvec_o
);

    import csr_pkg::*;

    logic [31:0] mie_reg;
    logic [31:0] mtvec_reg;
    logic [31:0] mscratch_reg;
    logic [31:0] mepc_reg;
    logic [31:0] mcause_reg;

    logic mie_en;
    logic mtvec_en;
    logic mscratch_en;
    logic mepc_en;
    logic mcause_en;

// 0x304    MRW     mie         Регистр маски прерываний.
// 0x305    MRW     mtvec       Базовый адрес обработчика перехвата.
// 0x340    MRW     mscratch    Адрес верхушки стека обработчика перехвата.
// 0x341    MRW     mepc        Регистр, хранящий адрес перехваченной инструкции.
// 0x342    MRW     mcause      Причина перехвата

    logic [31:0] data_wire_mux;

    always_comb begin
        case(opcode_i)
            CSR_RW : data_wire_mux <= rs1_data_i;                   // 3'b001
            CSR_RS : data_wire_mux <= read_data_o | rs1_data_i;     // 3'b010
            CSR_RC : data_wire_mux <= read_data_o & ~(rs1_data_i);  // 3'b011
            CSR_RWI: data_wire_mux <= imm_data_i;                   // 3'b101
            CSR_RSI: data_wire_mux <= read_data_o | imm_data_i;     // 3'b110
            CSR_RCI: data_wire_mux <= read_data_o & ~(imm_data_i);  // 3'b111
            default: data_wire_mux <= data_wire_mux;
        endcase
    end

    always_comb begin
        mie_en      <= 1'b0;
        mtvec_en    <= 1'b0;
        mscratch_en <= 1'b0;
        mepc_en     <= 1'b0;
        mcause_en   <= 1'b0;

        read_data_o <= 1'b0;

        case(addr_i)
            MIE_ADDR        : begin
                mie_en        <= write_enable_i;
                read_data_o   <= mie_reg;
            end
            MTVEC_ADDR      : begin
                mtvec_en      <= write_enable_i;
                read_data_o   <= mtvec_reg;
            end
            MSCRATCH_ADDR   : begin
                mscratch_en   <= write_enable_i;
                read_data_o   <= mscratch_reg;
            end
            MEPC_ADDR       : begin
                mepc_en       <= write_enable_i;
                read_data_o   <= mepc_reg;
            end
            MCAUSE_ADDR     : begin
                mcause_en     <= write_enable_i;
                read_data_o   <= mcause_reg;
            end
        endcase
    end

    always_ff @(posedge clk_i) begin
        if (rst_i) begin
            mie_reg         <= 32'b0;
            mtvec_reg       <= 32'b0;
            mscratch_reg    <= 32'b0;
            mepc_reg        <= 32'b0;
            mcause_reg      <= 32'b0;
        end else begin
            if (mie_en)
                mie_reg <= data_wire_mux;
            else
                mie_reg <= mie_reg;

            if (mtvec_en)
                mtvec_reg <= data_wire_mux;
            else
                mtvec_reg <= mtvec_reg;

            if (mscratch_en)
                mscratch_reg <= data_wire_mux;
            else
                mscratch_reg <= mscratch_reg;

            if (mepc_en | trap_i)
                mepc_reg <= (trap_i) ? pc_i : data_wire_mux;
            else
                mepc_reg <= mepc_reg;

            if (mcause_en | trap_i)
                mcause_reg <= (trap_i) ? mcause_i : data_wire_mux;
            else
                mcause_reg <= mcause_reg;
        end
    end

    assign mie_o    = mie_reg;
    assign mtvec_o  = mtvec_reg;
    assign mepc_o   = mepc_reg;

endmodule
