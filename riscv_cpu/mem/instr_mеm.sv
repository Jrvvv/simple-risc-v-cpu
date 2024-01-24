`timescale 1ns / 1ps

module instr_mem
(
    input   logic [31:0] addr_i,
    output  logic [31:0] read_data_o 
);

    logic [31:0] RAM [1023:0];          // 4KiB size
    
    initial begin
        // for cybercobra
//        $readmemh("program.txt", RAM);
//        $readmemh("example.txt", RAM);
//        $readmemh("demo.txt", RAM);
//        $readmemh("my_prog_converted.txt", RAM);
//        $readmemh("converted_looped.txt", RAM);

        // for risc-v core
//        $readmemh("program.mem", RAM);
//        $readmemh("my_riscv_prog.mem", RAM);
        
        // for testing LSU
//        $readmemh("ls_test.mem", RAM);
        
        // for testing CSR and IRQ
//        $readmemh("interrupt_prog_code.mem", RAM);
       
        // for vga/ps2 testing
        // $readmemh("lab_12_ps2_vga_instr.mem", RAM);
        
        // hello wrld prog init
       $readmemh("init_instr.mem", RAM);
    end

    // addr_i[11:2] because of 4KiB size of RAM
    assign read_data_o = RAM[addr_i[11:2]];

endmodule
