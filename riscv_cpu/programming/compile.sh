#!/bin/bash
rm -rf obj_files/* *.elf mem_files/* disasmed_result.S
sudo mkdir obj_files/

# Compiler and flags
CC=/opt/riscv/bin/riscv64-unknown-elf-gcc
ISA=-march=rv32i_zicsr                      # указание ISA (integer + ziscr регистры)
ABI=-mabi=ilp32                             # указание ABI. Здесь сказано, что типы int, long и pointer являются 32-разрядными.

# Compiling obj files
${CC} -c ${ISA} ${ABI} code/startup.S -o obj_files/startup.o
${CC} -c ${ISA} ${ABI} code/main.c -o obj_files/main.o

# ERR="-Wall -Werror -Wextra"
# ${CC} ${ERR} -c ${ISA} ${ABI} startup.S -o startup.o
# ${CC} ${ERR} -c ${ISA} ${ABI} main.c -o main.o

# if [ $? -ne "0"]; then
#   exit 0

# linker flags
UNUSED_SECTIONS=-Wl,--gc-sections           # удалять компоновщиком неиспользуемые секции
STARTUP_CONF=-nostartfiles                  # не использовать компоновщиком стартап-файлы стандартных библиотек

# Linking obj files to get exec
${CC} ${ISA} ${ABI} ${UNUSED_SECTIONS} ${STARTUP_CONF} -T code/linker_script.ld obj_files/startup.o obj_files/main.o -o result.elf


# Obj copy and flags
OBJ_CP=/opt/riscv/bin/riscv64-unknown-elf-objcopy
OBJ_CP_FLAGS="-O verilog --verilog-data-width=4"

# Exporting sections to init mem (Verilog mem files)
# Instruction sections
${OBJ_CP} ${OBJ_CP_FLAGS} -j .text result.elf mem_files/init_instr.mem
# Data sections
${OBJ_CP} ${OBJ_CP_FLAGS} -j .data -j .bss -j .sdata result.elf mem_files/init_data.mem

# !!! DON'T FORGET TO DEL @ LINE IN DATA MEM INIT FILE !!!
echo "!!! DON'T FORGET TO DEL @ LINE IN DATA MEM INIT FILE !!!"

# Assembler objdump to check instructions
OBJ_DUMP=/opt/riscv/bin/riscv64-unknown-elf-objdump

${OBJ_DUMP} -D result.elf > disasmed_result.S