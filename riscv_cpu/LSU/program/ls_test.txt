addi x1,  x0, -0x453     # x1 = 0xfffffbad

sh   x1,       0x2(x0)
sb   x1,       0x3(x0)
sw   x1,       0x0(x0)

addi x1,  x0,  0x0

lh   x1,       0x2(x0)
lb   x1,       0x1(x0)
lw   x1,       0x0(x0)
lbu  x1,       0x3(x0)

jal  x17,      rep

rep:
jalr x14,      0x0(x17)  # repeat this instr by addr from x17