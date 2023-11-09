addi x1,  x0, -0x453     # x1    = data_in               = 0xfffffbad written to x1
addi x2,  x0,  0xff      # x2    = mask                  = 11111111
addi x5,  x0,  8         # x5    = shift                 = 8
and  x3,  x1,  x2        # x3    = x1 & x2               = data_in & mask
sll  x3,  x3,  x5        # x3    = x3 << x5              = x3 << shift
srl  x4,  x1,  x5        # x4    = x1 >> x5              = data_in >> shift
and  x4,  x4,  x2        # x4    = x4 & x2               = x4 & mask
or   x5,  x4,  x3        # x5    = unsig_swap            = x4 | x3
lui  x2,       0xffff0   # x2    = mask                  = ~(0xff_ff_f0_00)
and  x1,  x1,  x2        # x1    = res                   = data_in & mask
or   x1,  x1,  x5        # x1    = res                   = res | unsig_swap
addi x1,  x1,  0
jal  x17,      rep

rep:
jalr x14,      0x0(x17)  # repeat this instr by addr from x17
