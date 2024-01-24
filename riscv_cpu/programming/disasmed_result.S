
result.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00005197          	auipc	gp,0x5
   4:	80018193          	add	gp,gp,-2048 # 4800 <_gbl_ptr>
   8:	00007117          	auipc	sp,0x7
   c:	5f810113          	add	sp,sp,1528 # 7600 <_stack_ptr>
  10:	00005297          	auipc	t0,0x5
  14:	2b828293          	add	t0,t0,696 # 52c8 <to_change_screen>
  18:	00005317          	auipc	t1,0x5
  1c:	2b030313          	add	t1,t1,688 # 52c8 <to_change_screen>

00000020 <_bss_init_loop>:
  20:	00534863          	blt	t1,t0,30 <_irq_config>
  24:	0002a023          	sw	zero,0(t0)
  28:	00428293          	add	t0,t0,4
  2c:	ff5ff06f          	j	20 <_bss_init_loop>

00000030 <_irq_config>:
  30:	05c00293          	li	t0,92
  34:	fff00313          	li	t1,-1
  38:	00008397          	auipc	t2,0x8
  3c:	fc838393          	add	t2,t2,-56 # 8000 <_data_end>
  40:	30529073          	csrw	mtvec,t0
  44:	30431073          	csrw	mie,t1
  48:	34039073          	csrw	mscratch,t2

0000004c <_main_call>:
  4c:	00000513          	li	a0,0
  50:	00000593          	li	a1,0
  54:	26c000ef          	jal	2c0 <main>

00000058 <_endless_loop>:
  58:	0000006f          	j	58 <_endless_loop>

0000005c <_int_handler>:
  5c:	34011173          	csrrw	sp,mscratch,sp
  60:	fb010113          	add	sp,sp,-80
  64:	00112223          	sw	ra,4(sp)
  68:	00007097          	auipc	ra,0x7
  6c:	59808093          	add	ra,ra,1432 # 7600 <_stack_ptr>
  70:	fe1144e3          	blt	sp,ra,58 <_endless_loop>
  74:	00512623          	sw	t0,12(sp)
  78:	00612823          	sw	t1,16(sp)
  7c:	00712a23          	sw	t2,20(sp)
  80:	00a12c23          	sw	a0,24(sp)
  84:	00b12e23          	sw	a1,28(sp)
  88:	02c12023          	sw	a2,32(sp)
  8c:	02d12223          	sw	a3,36(sp)
  90:	02e12423          	sw	a4,40(sp)
  94:	02f12623          	sw	a5,44(sp)
  98:	03012823          	sw	a6,48(sp)
  9c:	03112a23          	sw	a7,52(sp)
  a0:	03c12c23          	sw	t3,56(sp)
  a4:	03d12e23          	sw	t4,60(sp)
  a8:	05e12023          	sw	t5,64(sp)
  ac:	05f12223          	sw	t6,68(sp)
  b0:	340022f3          	csrr	t0,mscratch
  b4:	34102373          	csrr	t1,mepc
  b8:	34202573          	csrr	a0,mcause
  bc:	00512423          	sw	t0,8(sp)
  c0:	04612423          	sw	t1,72(sp)
  c4:	04a12623          	sw	a0,76(sp)
  c8:	28c000ef          	jal	354 <int_handler>
  cc:	00010513          	mv	a0,sp
  d0:	04852303          	lw	t1,72(a0)
  d4:	05010113          	add	sp,sp,80
  d8:	34011073          	csrw	mscratch,sp
  dc:	34131073          	csrw	mepc,t1
  e0:	00452083          	lw	ra,4(a0)
  e4:	00852103          	lw	sp,8(a0)
  e8:	00c52283          	lw	t0,12(a0)
  ec:	01052303          	lw	t1,16(a0)
  f0:	01452383          	lw	t2,20(a0)
  f4:	01c52583          	lw	a1,28(a0)
  f8:	02052603          	lw	a2,32(a0)
  fc:	02452683          	lw	a3,36(a0)
 100:	02852703          	lw	a4,40(a0)
 104:	02c52783          	lw	a5,44(a0)
 108:	03052803          	lw	a6,48(a0)
 10c:	03452883          	lw	a7,52(a0)
 110:	03852e03          	lw	t3,56(a0)
 114:	03c52e83          	lw	t4,60(a0)
 118:	04052f03          	lw	t5,64(a0)
 11c:	04452f83          	lw	t6,68(a0)
 120:	02852503          	lw	a0,40(a0)
 124:	30200073          	mret

00000128 <init_color>:
 128:	fd010113          	add	sp,sp,-48
 12c:	02812623          	sw	s0,44(sp)
 130:	03010413          	add	s0,sp,48
 134:	00050793          	mv	a5,a0
 138:	00058693          	mv	a3,a1
 13c:	00060713          	mv	a4,a2
 140:	fcf40fa3          	sb	a5,-33(s0)
 144:	00068793          	mv	a5,a3
 148:	fcf40f23          	sb	a5,-34(s0)
 14c:	00070793          	mv	a5,a4
 150:	fcf40ea3          	sb	a5,-35(s0)
 154:	fe042623          	sw	zero,-20(s0)
 158:	07c0006f          	j	1d4 <init_color+0xac>
 15c:	fdf40783          	lb	a5,-33(s0)
 160:	00779793          	sll	a5,a5,0x7
 164:	01879713          	sll	a4,a5,0x18
 168:	41875713          	sra	a4,a4,0x18
 16c:	fde40783          	lb	a5,-34(s0)
 170:	00479793          	sll	a5,a5,0x4
 174:	01879793          	sll	a5,a5,0x18
 178:	4187d793          	sra	a5,a5,0x18
 17c:	00f767b3          	or	a5,a4,a5
 180:	01879713          	sll	a4,a5,0x18
 184:	41875713          	sra	a4,a4,0x18
 188:	fdf40783          	lb	a5,-33(s0)
 18c:	00379793          	sll	a5,a5,0x3
 190:	01879793          	sll	a5,a5,0x18
 194:	4187d793          	sra	a5,a5,0x18
 198:	00f767b3          	or	a5,a4,a5
 19c:	01879713          	sll	a4,a5,0x18
 1a0:	41875713          	sra	a4,a4,0x18
 1a4:	fdd40783          	lb	a5,-35(s0)
 1a8:	00f767b3          	or	a5,a4,a5
 1ac:	01879693          	sll	a3,a5,0x18
 1b0:	4186d693          	sra	a3,a3,0x18
 1b4:	07001737          	lui	a4,0x7001
 1b8:	fec42783          	lw	a5,-20(s0)
 1bc:	00f707b3          	add	a5,a4,a5
 1c0:	0ff6f713          	zext.b	a4,a3
 1c4:	00e78023          	sb	a4,0(a5)
 1c8:	fec42783          	lw	a5,-20(s0)
 1cc:	00178793          	add	a5,a5,1
 1d0:	fef42623          	sw	a5,-20(s0)
 1d4:	fec42703          	lw	a4,-20(s0)
 1d8:	000017b7          	lui	a5,0x1
 1dc:	95f78793          	add	a5,a5,-1697 # 95f <_stack_size+0x45f>
 1e0:	f6e7dee3          	bge	a5,a4,15c <init_color+0x34>
 1e4:	00000013          	nop
 1e8:	00000013          	nop
 1ec:	02c12403          	lw	s0,44(sp)
 1f0:	03010113          	add	sp,sp,48
 1f4:	00008067          	ret

000001f8 <init_text_ch>:
 1f8:	fd010113          	add	sp,sp,-48
 1fc:	02812623          	sw	s0,44(sp)
 200:	03010413          	add	s0,sp,48
 204:	00050793          	mv	a5,a0
 208:	fcf40fa3          	sb	a5,-33(s0)
 20c:	fe042623          	sw	zero,-20(s0)
 210:	0240006f          	j	234 <init_text_ch+0x3c>
 214:	07000737          	lui	a4,0x7000
 218:	fec42783          	lw	a5,-20(s0)
 21c:	00f707b3          	add	a5,a4,a5
 220:	fdf44703          	lbu	a4,-33(s0)
 224:	00e78023          	sb	a4,0(a5)
 228:	fec42783          	lw	a5,-20(s0)
 22c:	00178793          	add	a5,a5,1
 230:	fef42623          	sw	a5,-20(s0)
 234:	fec42703          	lw	a4,-20(s0)
 238:	000017b7          	lui	a5,0x1
 23c:	95f78793          	add	a5,a5,-1697 # 95f <_stack_size+0x45f>
 240:	fce7dae3          	bge	a5,a4,214 <init_text_ch+0x1c>
 244:	00000013          	nop
 248:	00000013          	nop
 24c:	02c12403          	lw	s0,44(sp)
 250:	03010113          	add	sp,sp,48
 254:	00008067          	ret

00000258 <init_text>:
 258:	fd010113          	add	sp,sp,-48
 25c:	02812623          	sw	s0,44(sp)
 260:	03010413          	add	s0,sp,48
 264:	fca42e23          	sw	a0,-36(s0)
 268:	fe042623          	sw	zero,-20(s0)
 26c:	0300006f          	j	29c <init_text+0x44>
 270:	fec42783          	lw	a5,-20(s0)
 274:	fdc42703          	lw	a4,-36(s0)
 278:	00f70733          	add	a4,a4,a5
 27c:	070006b7          	lui	a3,0x7000
 280:	fec42783          	lw	a5,-20(s0)
 284:	00f687b3          	add	a5,a3,a5
 288:	00074703          	lbu	a4,0(a4) # 7000000 <_data_end+0x6ff8000>
 28c:	00e78023          	sb	a4,0(a5)
 290:	fec42783          	lw	a5,-20(s0)
 294:	00178793          	add	a5,a5,1
 298:	fef42623          	sw	a5,-20(s0)
 29c:	fec42703          	lw	a4,-20(s0)
 2a0:	000017b7          	lui	a5,0x1
 2a4:	95f78793          	add	a5,a5,-1697 # 95f <_stack_size+0x45f>
 2a8:	fce7d4e3          	bge	a5,a4,270 <init_text+0x18>
 2ac:	00000013          	nop
 2b0:	00000013          	nop
 2b4:	02c12403          	lw	s0,44(sp)
 2b8:	03010113          	add	sp,sp,48
 2bc:	00008067          	ret

000002c0 <main>:
 2c0:	fe010113          	add	sp,sp,-32
 2c4:	00112e23          	sw	ra,28(sp)
 2c8:	00812c23          	sw	s0,24(sp)
 2cc:	02010413          	add	s0,sp,32
 2d0:	fea42623          	sw	a0,-20(s0)
 2d4:	feb42423          	sw	a1,-24(s0)
 2d8:	000057b7          	lui	a5,0x5
 2dc:	2c07a423          	sw	zero,712(a5) # 52c8 <to_change_screen>
 2e0:	000057b7          	lui	a5,0x5
 2e4:	2c07a623          	sw	zero,716(a5) # 52cc <finish>
 2e8:	030007b7          	lui	a5,0x3000
 2ec:	00100713          	li	a4,1
 2f0:	02e7a223          	sw	a4,36(a5) # 3000024 <_data_end+0x2ff8024>
 2f4:	00700613          	li	a2,7
 2f8:	00300593          	li	a1,3
 2fc:	00000513          	li	a0,0
 300:	e29ff0ef          	jal	128 <init_color>
 304:	000047b7          	lui	a5,0x4
 308:	00078513          	mv	a0,a5
 30c:	f4dff0ef          	jal	258 <init_text>
 310:	000057b7          	lui	a5,0x5
 314:	2c87a783          	lw	a5,712(a5) # 52c8 <to_change_screen>
 318:	fe078ce3          	beqz	a5,310 <main+0x50>
 31c:	000057b7          	lui	a5,0x5
 320:	2cc7a783          	lw	a5,716(a5) # 52cc <finish>
 324:	fe0796e3          	bnez	a5,310 <main+0x50>
 328:	00700613          	li	a2,7
 32c:	00400593          	li	a1,4
 330:	00000513          	li	a0,0
 334:	df5ff0ef          	jal	128 <init_color>
 338:	000057b7          	lui	a5,0x5
 33c:	96478513          	add	a0,a5,-1692 # 4964 <g_goodbye_str>
 340:	f19ff0ef          	jal	258 <init_text>
 344:	000057b7          	lui	a5,0x5
 348:	00100713          	li	a4,1
 34c:	2ce7a623          	sw	a4,716(a5) # 52cc <finish>
 350:	fc1ff06f          	j	310 <main+0x50>

00000354 <int_handler>:
 354:	ff010113          	add	sp,sp,-16
 358:	00812623          	sw	s0,12(sp)
 35c:	01010413          	add	s0,sp,16
 360:	030007b7          	lui	a5,0x3000
 364:	0047a783          	lw	a5,4(a5) # 3000004 <_data_end+0x2ff8004>
 368:	00078e63          	beqz	a5,384 <int_handler+0x30>
 36c:	000057b7          	lui	a5,0x5
 370:	2c87a783          	lw	a5,712(a5) # 52c8 <to_change_screen>
 374:	00079863          	bnez	a5,384 <int_handler+0x30>
 378:	000057b7          	lui	a5,0x5
 37c:	00100713          	li	a4,1
 380:	2ce7a423          	sw	a4,712(a5) # 52c8 <to_change_screen>
 384:	00000013          	nop
 388:	00c12403          	lw	s0,12(sp)
 38c:	01010113          	add	sp,sp,16
 390:	00008067          	ret

Disassembly of section .data:

00004000 <g_hello_str>:
    4000:	2020                	.insn	2, 0x2020
    4002:	2020                	.insn	2, 0x2020
    4004:	2020                	.insn	2, 0x2020
    4006:	2020                	.insn	2, 0x2020
    4008:	2020                	.insn	2, 0x2020
    400a:	2020                	.insn	2, 0x2020
    400c:	2020                	.insn	2, 0x2020
    400e:	2020                	.insn	2, 0x2020
    4010:	2020                	.insn	2, 0x2020
    4012:	2020                	.insn	2, 0x2020
    4014:	2020                	.insn	2, 0x2020
    4016:	2020                	.insn	2, 0x2020
    4018:	2020                	.insn	2, 0x2020
    401a:	2020                	.insn	2, 0x2020
    401c:	2020                	.insn	2, 0x2020
    401e:	2020                	.insn	2, 0x2020
    4020:	2020                	.insn	2, 0x2020
    4022:	2020                	.insn	2, 0x2020
    4024:	2020                	.insn	2, 0x2020
    4026:	2020                	.insn	2, 0x2020
    4028:	2020                	.insn	2, 0x2020
    402a:	2020                	.insn	2, 0x2020
    402c:	2020                	.insn	2, 0x2020
    402e:	2020                	.insn	2, 0x2020
    4030:	2020                	.insn	2, 0x2020
    4032:	2020                	.insn	2, 0x2020
    4034:	2020                	.insn	2, 0x2020
    4036:	2020                	.insn	2, 0x2020
    4038:	2020                	.insn	2, 0x2020
    403a:	2020                	.insn	2, 0x2020
    403c:	2020                	.insn	2, 0x2020
    403e:	2020                	.insn	2, 0x2020
    4040:	2020                	.insn	2, 0x2020
    4042:	2020                	.insn	2, 0x2020
    4044:	2020                	.insn	2, 0x2020
    4046:	2020                	.insn	2, 0x2020
    4048:	2020                	.insn	2, 0x2020
    404a:	2020                	.insn	2, 0x2020
    404c:	2020                	.insn	2, 0x2020
    404e:	2020                	.insn	2, 0x2020
    4050:	2020                	.insn	2, 0x2020
    4052:	2020                	.insn	2, 0x2020
    4054:	2020                	.insn	2, 0x2020
    4056:	2020                	.insn	2, 0x2020
    4058:	2020                	.insn	2, 0x2020
    405a:	2020                	.insn	2, 0x2020
    405c:	2020                	.insn	2, 0x2020
    405e:	2020                	.insn	2, 0x2020
    4060:	2020                	.insn	2, 0x2020
    4062:	2020                	.insn	2, 0x2020
    4064:	2020                	.insn	2, 0x2020
    4066:	2020                	.insn	2, 0x2020
    4068:	2020                	.insn	2, 0x2020
    406a:	2020                	.insn	2, 0x2020
    406c:	2020                	.insn	2, 0x2020
    406e:	2020                	.insn	2, 0x2020
    4070:	2020                	.insn	2, 0x2020
    4072:	2020                	.insn	2, 0x2020
    4074:	2020                	.insn	2, 0x2020
    4076:	2020                	.insn	2, 0x2020
    4078:	2020                	.insn	2, 0x2020
    407a:	2020                	.insn	2, 0x2020
    407c:	2020                	.insn	2, 0x2020
    407e:	2020                	.insn	2, 0x2020
    4080:	2020                	.insn	2, 0x2020
    4082:	2020                	.insn	2, 0x2020
    4084:	2020                	.insn	2, 0x2020
    4086:	2020                	.insn	2, 0x2020
    4088:	2020                	.insn	2, 0x2020
    408a:	2020                	.insn	2, 0x2020
    408c:	2020                	.insn	2, 0x2020
    408e:	2020                	.insn	2, 0x2020
    4090:	2020                	.insn	2, 0x2020
    4092:	2020                	.insn	2, 0x2020
    4094:	2020                	.insn	2, 0x2020
    4096:	2020                	.insn	2, 0x2020
    4098:	2020                	.insn	2, 0x2020
    409a:	2020                	.insn	2, 0x2020
    409c:	2020                	.insn	2, 0x2020
    409e:	2020                	.insn	2, 0x2020
    40a0:	2020                	.insn	2, 0x2020
    40a2:	2020                	.insn	2, 0x2020
    40a4:	2020                	.insn	2, 0x2020
    40a6:	2020                	.insn	2, 0x2020
    40a8:	2020                	.insn	2, 0x2020
    40aa:	2020                	.insn	2, 0x2020
    40ac:	2020                	.insn	2, 0x2020
    40ae:	2020                	.insn	2, 0x2020
    40b0:	2020                	.insn	2, 0x2020
    40b2:	2020                	.insn	2, 0x2020
    40b4:	2020                	.insn	2, 0x2020
    40b6:	2020                	.insn	2, 0x2020
    40b8:	2020                	.insn	2, 0x2020
    40ba:	2020                	.insn	2, 0x2020
    40bc:	2020                	.insn	2, 0x2020
    40be:	2020                	.insn	2, 0x2020
    40c0:	2020                	.insn	2, 0x2020
    40c2:	2020                	.insn	2, 0x2020
    40c4:	2020                	.insn	2, 0x2020
    40c6:	2020                	.insn	2, 0x2020
    40c8:	2020                	.insn	2, 0x2020
    40ca:	2020                	.insn	2, 0x2020
    40cc:	2020                	.insn	2, 0x2020
    40ce:	2020                	.insn	2, 0x2020
    40d0:	2020                	.insn	2, 0x2020
    40d2:	2020                	.insn	2, 0x2020
    40d4:	2020                	.insn	2, 0x2020
    40d6:	2020                	.insn	2, 0x2020
    40d8:	2020                	.insn	2, 0x2020
    40da:	2020                	.insn	2, 0x2020
    40dc:	2020                	.insn	2, 0x2020
    40de:	2020                	.insn	2, 0x2020
    40e0:	2020                	.insn	2, 0x2020
    40e2:	2020                	.insn	2, 0x2020
    40e4:	2020                	.insn	2, 0x2020
    40e6:	2020                	.insn	2, 0x2020
    40e8:	2020                	.insn	2, 0x2020
    40ea:	2020                	.insn	2, 0x2020
    40ec:	2020                	.insn	2, 0x2020
    40ee:	2020                	.insn	2, 0x2020
    40f0:	2020                	.insn	2, 0x2020
    40f2:	2020                	.insn	2, 0x2020
    40f4:	2020                	.insn	2, 0x2020
    40f6:	2020                	.insn	2, 0x2020
    40f8:	2020                	.insn	2, 0x2020
    40fa:	2020                	.insn	2, 0x2020
    40fc:	2020                	.insn	2, 0x2020
    40fe:	2020                	.insn	2, 0x2020
    4100:	2020                	.insn	2, 0x2020
    4102:	2020                	.insn	2, 0x2020
    4104:	2020                	.insn	2, 0x2020
    4106:	2020                	.insn	2, 0x2020
    4108:	2020                	.insn	2, 0x2020
    410a:	2020                	.insn	2, 0x2020
    410c:	2020                	.insn	2, 0x2020
    410e:	2020                	.insn	2, 0x2020
    4110:	2020                	.insn	2, 0x2020
    4112:	2020                	.insn	2, 0x2020
    4114:	2020                	.insn	2, 0x2020
    4116:	2020                	.insn	2, 0x2020
    4118:	2020                	.insn	2, 0x2020
    411a:	2020                	.insn	2, 0x2020
    411c:	2020                	.insn	2, 0x2020
    411e:	2020                	.insn	2, 0x2020
    4120:	2020                	.insn	2, 0x2020
    4122:	2020                	.insn	2, 0x2020
    4124:	2020                	.insn	2, 0x2020
    4126:	2020                	.insn	2, 0x2020
    4128:	2020                	.insn	2, 0x2020
    412a:	2020                	.insn	2, 0x2020
    412c:	2020                	.insn	2, 0x2020
    412e:	2020                	.insn	2, 0x2020
    4130:	2020                	.insn	2, 0x2020
    4132:	2020                	.insn	2, 0x2020
    4134:	2020                	.insn	2, 0x2020
    4136:	2020                	.insn	2, 0x2020
    4138:	2020                	.insn	2, 0x2020
    413a:	2020                	.insn	2, 0x2020
    413c:	2020                	.insn	2, 0x2020
    413e:	2020                	.insn	2, 0x2020
    4140:	2020                	.insn	2, 0x2020
    4142:	2020                	.insn	2, 0x2020
    4144:	2020                	.insn	2, 0x2020
    4146:	2020                	.insn	2, 0x2020
    4148:	2020                	.insn	2, 0x2020
    414a:	2020                	.insn	2, 0x2020
    414c:	2020                	.insn	2, 0x2020
    414e:	2020                	.insn	2, 0x2020
    4150:	2020                	.insn	2, 0x2020
    4152:	2020                	.insn	2, 0x2020
    4154:	2020                	.insn	2, 0x2020
    4156:	2020                	.insn	2, 0x2020
    4158:	2020                	.insn	2, 0x2020
    415a:	2020                	.insn	2, 0x2020
    415c:	2020                	.insn	2, 0x2020
    415e:	2020                	.insn	2, 0x2020
    4160:	2020                	.insn	2, 0x2020
    4162:	2020                	.insn	2, 0x2020
    4164:	2020                	.insn	2, 0x2020
    4166:	2020                	.insn	2, 0x2020
    4168:	2020                	.insn	2, 0x2020
    416a:	2020                	.insn	2, 0x2020
    416c:	2020                	.insn	2, 0x2020
    416e:	2020                	.insn	2, 0x2020
    4170:	2020                	.insn	2, 0x2020
    4172:	2020                	.insn	2, 0x2020
    4174:	2020                	.insn	2, 0x2020
    4176:	2020                	.insn	2, 0x2020
    4178:	2020                	.insn	2, 0x2020
    417a:	2020                	.insn	2, 0x2020
    417c:	2020                	.insn	2, 0x2020
    417e:	2020                	.insn	2, 0x2020
    4180:	2020                	.insn	2, 0x2020
    4182:	2020                	.insn	2, 0x2020
    4184:	2020                	.insn	2, 0x2020
    4186:	2020                	.insn	2, 0x2020
    4188:	2020                	.insn	2, 0x2020
    418a:	2020                	.insn	2, 0x2020
    418c:	2020                	.insn	2, 0x2020
    418e:	2020                	.insn	2, 0x2020
    4190:	2020                	.insn	2, 0x2020
    4192:	2020                	.insn	2, 0x2020
    4194:	2020                	.insn	2, 0x2020
    4196:	2020                	.insn	2, 0x2020
    4198:	2020                	.insn	2, 0x2020
    419a:	2020                	.insn	2, 0x2020
    419c:	2020                	.insn	2, 0x2020
    419e:	2020                	.insn	2, 0x2020
    41a0:	2020                	.insn	2, 0x2020
    41a2:	2020                	.insn	2, 0x2020
    41a4:	2020                	.insn	2, 0x2020
    41a6:	2020                	.insn	2, 0x2020
    41a8:	2020                	.insn	2, 0x2020
    41aa:	2020                	.insn	2, 0x2020
    41ac:	2020                	.insn	2, 0x2020
    41ae:	2020                	.insn	2, 0x2020
    41b0:	2020                	.insn	2, 0x2020
    41b2:	2020                	.insn	2, 0x2020
    41b4:	2020                	.insn	2, 0x2020
    41b6:	2020                	.insn	2, 0x2020
    41b8:	2020                	.insn	2, 0x2020
    41ba:	2020                	.insn	2, 0x2020
    41bc:	2020                	.insn	2, 0x2020
    41be:	2020                	.insn	2, 0x2020
    41c0:	2020                	.insn	2, 0x2020
    41c2:	2020                	.insn	2, 0x2020
    41c4:	2020                	.insn	2, 0x2020
    41c6:	2020                	.insn	2, 0x2020
    41c8:	2020                	.insn	2, 0x2020
    41ca:	2020                	.insn	2, 0x2020
    41cc:	2020                	.insn	2, 0x2020
    41ce:	2020                	.insn	2, 0x2020
    41d0:	2020                	.insn	2, 0x2020
    41d2:	2020                	.insn	2, 0x2020
    41d4:	2020                	.insn	2, 0x2020
    41d6:	2020                	.insn	2, 0x2020
    41d8:	2020                	.insn	2, 0x2020
    41da:	2020                	.insn	2, 0x2020
    41dc:	2020                	.insn	2, 0x2020
    41de:	2020                	.insn	2, 0x2020
    41e0:	2020                	.insn	2, 0x2020
    41e2:	2020                	.insn	2, 0x2020
    41e4:	2020                	.insn	2, 0x2020
    41e6:	2020                	.insn	2, 0x2020
    41e8:	2020                	.insn	2, 0x2020
    41ea:	2020                	.insn	2, 0x2020
    41ec:	2020                	.insn	2, 0x2020
    41ee:	2020                	.insn	2, 0x2020
    41f0:	2020                	.insn	2, 0x2020
    41f2:	2020                	.insn	2, 0x2020
    41f4:	2020                	.insn	2, 0x2020
    41f6:	2020                	.insn	2, 0x2020
    41f8:	2020                	.insn	2, 0x2020
    41fa:	2020                	.insn	2, 0x2020
    41fc:	2020                	.insn	2, 0x2020
    41fe:	2020                	.insn	2, 0x2020
    4200:	2020                	.insn	2, 0x2020
    4202:	2020                	.insn	2, 0x2020
    4204:	2020                	.insn	2, 0x2020
    4206:	2020                	.insn	2, 0x2020
    4208:	2020                	.insn	2, 0x2020
    420a:	2020                	.insn	2, 0x2020
    420c:	2020                	.insn	2, 0x2020
    420e:	2020                	.insn	2, 0x2020
    4210:	2020                	.insn	2, 0x2020
    4212:	2020                	.insn	2, 0x2020
    4214:	2020                	.insn	2, 0x2020
    4216:	2020                	.insn	2, 0x2020
    4218:	2020                	.insn	2, 0x2020
    421a:	2020                	.insn	2, 0x2020
    421c:	2020                	.insn	2, 0x2020
    421e:	2020                	.insn	2, 0x2020
    4220:	2020                	.insn	2, 0x2020
    4222:	2020                	.insn	2, 0x2020
    4224:	2020                	.insn	2, 0x2020
    4226:	2020                	.insn	2, 0x2020
    4228:	2020                	.insn	2, 0x2020
    422a:	2020                	.insn	2, 0x2020
    422c:	2020                	.insn	2, 0x2020
    422e:	2020                	.insn	2, 0x2020
    4230:	2020                	.insn	2, 0x2020
    4232:	2020                	.insn	2, 0x2020
    4234:	2020                	.insn	2, 0x2020
    4236:	2020                	.insn	2, 0x2020
    4238:	2020                	.insn	2, 0x2020
    423a:	2020                	.insn	2, 0x2020
    423c:	2020                	.insn	2, 0x2020
    423e:	2020                	.insn	2, 0x2020
    4240:	2020                	.insn	2, 0x2020
    4242:	2020                	.insn	2, 0x2020
    4244:	2020                	.insn	2, 0x2020
    4246:	2020                	.insn	2, 0x2020
    4248:	2020                	.insn	2, 0x2020
    424a:	2020                	.insn	2, 0x2020
    424c:	2020                	.insn	2, 0x2020
    424e:	2020                	.insn	2, 0x2020
    4250:	2020                	.insn	2, 0x2020
    4252:	2020                	.insn	2, 0x2020
    4254:	2020                	.insn	2, 0x2020
    4256:	2020                	.insn	2, 0x2020
    4258:	2020                	.insn	2, 0x2020
    425a:	2020                	.insn	2, 0x2020
    425c:	2020                	.insn	2, 0x2020
    425e:	2020                	.insn	2, 0x2020
    4260:	2020                	.insn	2, 0x2020
    4262:	2020                	.insn	2, 0x2020
    4264:	2020                	.insn	2, 0x2020
    4266:	2020                	.insn	2, 0x2020
    4268:	2020                	.insn	2, 0x2020
    426a:	2020                	.insn	2, 0x2020
    426c:	2020                	.insn	2, 0x2020
    426e:	2020                	.insn	2, 0x2020
    4270:	2020                	.insn	2, 0x2020
    4272:	2020                	.insn	2, 0x2020
    4274:	2020                	.insn	2, 0x2020
    4276:	2020                	.insn	2, 0x2020
    4278:	2020                	.insn	2, 0x2020
    427a:	2020                	.insn	2, 0x2020
    427c:	2020                	.insn	2, 0x2020
    427e:	2020                	.insn	2, 0x2020
    4280:	2020                	.insn	2, 0x2020
    4282:	2020                	.insn	2, 0x2020
    4284:	2020                	.insn	2, 0x2020
    4286:	2020                	.insn	2, 0x2020
    4288:	2020                	.insn	2, 0x2020
    428a:	2020                	.insn	2, 0x2020
    428c:	2020                	.insn	2, 0x2020
    428e:	2020                	.insn	2, 0x2020
    4290:	2020                	.insn	2, 0x2020
    4292:	2020                	.insn	2, 0x2020
    4294:	2020                	.insn	2, 0x2020
    4296:	2020                	.insn	2, 0x2020
    4298:	2020                	.insn	2, 0x2020
    429a:	2020                	.insn	2, 0x2020
    429c:	2020                	.insn	2, 0x2020
    429e:	2020                	.insn	2, 0x2020
    42a0:	2020                	.insn	2, 0x2020
    42a2:	2020                	.insn	2, 0x2020
    42a4:	2020                	.insn	2, 0x2020
    42a6:	2020                	.insn	2, 0x2020
    42a8:	2020                	.insn	2, 0x2020
    42aa:	2020                	.insn	2, 0x2020
    42ac:	2020                	.insn	2, 0x2020
    42ae:	2020                	.insn	2, 0x2020
    42b0:	2020                	.insn	2, 0x2020
    42b2:	2020                	.insn	2, 0x2020
    42b4:	2020                	.insn	2, 0x2020
    42b6:	2020                	.insn	2, 0x2020
    42b8:	2020                	.insn	2, 0x2020
    42ba:	2020                	.insn	2, 0x2020
    42bc:	2020                	.insn	2, 0x2020
    42be:	2020                	.insn	2, 0x2020
    42c0:	2020                	.insn	2, 0x2020
    42c2:	2020                	.insn	2, 0x2020
    42c4:	2020                	.insn	2, 0x2020
    42c6:	2020                	.insn	2, 0x2020
    42c8:	2020                	.insn	2, 0x2020
    42ca:	2020                	.insn	2, 0x2020
    42cc:	2020                	.insn	2, 0x2020
    42ce:	2020                	.insn	2, 0x2020
    42d0:	2020                	.insn	2, 0x2020
    42d2:	2020                	.insn	2, 0x2020
    42d4:	2020                	.insn	2, 0x2020
    42d6:	2020                	.insn	2, 0x2020
    42d8:	2020                	.insn	2, 0x2020
    42da:	2020                	.insn	2, 0x2020
    42dc:	2020                	.insn	2, 0x2020
    42de:	2020                	.insn	2, 0x2020
    42e0:	2020                	.insn	2, 0x2020
    42e2:	2020                	.insn	2, 0x2020
    42e4:	2020                	.insn	2, 0x2020
    42e6:	2020                	.insn	2, 0x2020
    42e8:	2020                	.insn	2, 0x2020
    42ea:	2020                	.insn	2, 0x2020
    42ec:	2020                	.insn	2, 0x2020
    42ee:	2020                	.insn	2, 0x2020
    42f0:	2020                	.insn	2, 0x2020
    42f2:	2020                	.insn	2, 0x2020
    42f4:	2020                	.insn	2, 0x2020
    42f6:	2020                	.insn	2, 0x2020
    42f8:	2020                	.insn	2, 0x2020
    42fa:	2020                	.insn	2, 0x2020
    42fc:	2020                	.insn	2, 0x2020
    42fe:	2020                	.insn	2, 0x2020
    4300:	2020                	.insn	2, 0x2020
    4302:	2020                	.insn	2, 0x2020
    4304:	2020                	.insn	2, 0x2020
    4306:	2020                	.insn	2, 0x2020
    4308:	2020                	.insn	2, 0x2020
    430a:	2020                	.insn	2, 0x2020
    430c:	2020                	.insn	2, 0x2020
    430e:	2020                	.insn	2, 0x2020
    4310:	2020                	.insn	2, 0x2020
    4312:	2020                	.insn	2, 0x2020
    4314:	2020                	.insn	2, 0x2020
    4316:	2020                	.insn	2, 0x2020
    4318:	2020                	.insn	2, 0x2020
    431a:	2020                	.insn	2, 0x2020
    431c:	2020                	.insn	2, 0x2020
    431e:	2020                	.insn	2, 0x2020
    4320:	2020                	.insn	2, 0x2020
    4322:	2020                	.insn	2, 0x2020
    4324:	2320                	.insn	2, 0x2320
    4326:	2020                	.insn	2, 0x2020
    4328:	2320                	.insn	2, 0x2320
    432a:	2020                	.insn	2, 0x2020
    432c:	2020                	.insn	2, 0x2020
    432e:	2020                	.insn	2, 0x2020
    4330:	2020                	.insn	2, 0x2020
    4332:	2020                	.insn	2, 0x2020
    4334:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    4338:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    433c:	2020                	.insn	2, 0x2020
    433e:	2020                	.insn	2, 0x2020
    4340:	2020                	.insn	2, 0x2020
    4342:	2020                	.insn	2, 0x2020
    4344:	2020                	.insn	2, 0x2020
    4346:	2020                	.insn	2, 0x2020
    4348:	2020                	.insn	2, 0x2020
    434a:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    434e:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    4352:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    4356:	2020                	.insn	2, 0x2020
    4358:	2020                	.insn	2, 0x2020
    435a:	2020                	.insn	2, 0x2020
    435c:	2020                	.insn	2, 0x2020
    435e:	2320                	.insn	2, 0x2320
    4360:	2020                	.insn	2, 0x2020
    4362:	2020                	.insn	2, 0x2020
    4364:	2020                	.insn	2, 0x2020
    4366:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    436a:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    436e:	2020                	.insn	2, 0x2020
    4370:	2020                	.insn	2, 0x2020
    4372:	2020                	.insn	2, 0x2020
    4374:	2320                	.insn	2, 0x2320
    4376:	2020                	.insn	2, 0x2020
    4378:	2320                	.insn	2, 0x2320
    437a:	2020                	.insn	2, 0x2020
    437c:	2020                	.insn	2, 0x2020
    437e:	2020                	.insn	2, 0x2020
    4380:	2020                	.insn	2, 0x2020
    4382:	2020                	.insn	2, 0x2020
    4384:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    4388:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    438c:	2020                	.insn	2, 0x2020
    438e:	2020                	.insn	2, 0x2020
    4390:	2020                	.insn	2, 0x2020
    4392:	2020                	.insn	2, 0x2020
    4394:	2020                	.insn	2, 0x2020
    4396:	2020                	.insn	2, 0x2020
    4398:	2020                	.insn	2, 0x2020
    439a:	23202023          	sw	s2,544(zero) # 220 <init_text_ch+0x28>
    439e:	2320                	.insn	2, 0x2320
    43a0:	2020                	.insn	2, 0x2020
    43a2:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    43a6:	2020                	.insn	2, 0x2020
    43a8:	2020                	.insn	2, 0x2020
    43aa:	2020                	.insn	2, 0x2020
    43ac:	2020                	.insn	2, 0x2020
    43ae:	2320                	.insn	2, 0x2320
    43b0:	2020                	.insn	2, 0x2020
    43b2:	2020                	.insn	2, 0x2020
    43b4:	2020                	.insn	2, 0x2020
    43b6:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    43ba:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    43be:	2020                	.insn	2, 0x2020
    43c0:	2020                	.insn	2, 0x2020
    43c2:	2020                	.insn	2, 0x2020
    43c4:	2320                	.insn	2, 0x2320
    43c6:	2020                	.insn	2, 0x2020
    43c8:	2320                	.insn	2, 0x2320
    43ca:	2020                	.insn	2, 0x2020
    43cc:	2020                	.insn	2, 0x2020
    43ce:	20202323          	sw	sp,518(zero) # 206 <init_text_ch+0xe>
    43d2:	2020                	.insn	2, 0x2020
    43d4:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    43d8:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    43dc:	2320                	.insn	2, 0x2320
    43de:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    43e2:	2020                	.insn	2, 0x2020
    43e4:	2020                	.insn	2, 0x2020
    43e6:	2020                	.insn	2, 0x2020
    43e8:	2020                	.insn	2, 0x2020
    43ea:	2320                	.insn	2, 0x2320
    43ec:	2320                	.insn	2, 0x2320
    43ee:	2320                	.insn	2, 0x2320
    43f0:	2320                	.insn	2, 0x2320
    43f2:	2020                	.insn	2, 0x2020
    43f4:	2020                	.insn	2, 0x2020
    43f6:	20202323          	sw	sp,518(zero) # 206 <init_text_ch+0xe>
    43fa:	2020                	.insn	2, 0x2020
    43fc:	23202323          	sw	s2,550(zero) # 226 <init_text_ch+0x2e>
    4400:	2020                	.insn	2, 0x2020
    4402:	2020                	.insn	2, 0x2020
    4404:	20232323          	sw	sp,518(t1)
    4408:	2020                	.insn	2, 0x2020
    440a:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    440e:	2020                	.insn	2, 0x2020
    4410:	2020                	.insn	2, 0x2020
    4412:	2020                	.insn	2, 0x2020
    4414:	2320                	.insn	2, 0x2320
    4416:	23232323          	sw	s2,550(t1)
    441a:	2020                	.insn	2, 0x2020
    441c:	2320                	.insn	2, 0x2320
    441e:	2020                	.insn	2, 0x2020
    4420:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    4424:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    4428:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    442c:	23202023          	sw	s2,544(zero) # 220 <init_text_ch+0x28>
    4430:	2020                	.insn	2, 0x2020
    4432:	2020                	.insn	2, 0x2020
    4434:	2020                	.insn	2, 0x2020
    4436:	2020                	.insn	2, 0x2020
    4438:	2020                	.insn	2, 0x2020
    443a:	2320                	.insn	2, 0x2320
    443c:	2320                	.insn	2, 0x2320
    443e:	2320                	.insn	2, 0x2320
    4440:	2320                	.insn	2, 0x2320
    4442:	2020                	.insn	2, 0x2020
    4444:	2320                	.insn	2, 0x2320
    4446:	2020                	.insn	2, 0x2020
    4448:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    444c:	23202023          	sw	s2,544(zero) # 220 <init_text_ch+0x28>
    4450:	2020                	.insn	2, 0x2020
    4452:	2320                	.insn	2, 0x2320
    4454:	2020                	.insn	2, 0x2020
    4456:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    445a:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    445e:	2020                	.insn	2, 0x2020
    4460:	2020                	.insn	2, 0x2020
    4462:	2020                	.insn	2, 0x2020
    4464:	2320                	.insn	2, 0x2320
    4466:	2020                	.insn	2, 0x2020
    4468:	2320                	.insn	2, 0x2320
    446a:	2020                	.insn	2, 0x2020
    446c:	2320                	.insn	2, 0x2320
    446e:	20232323          	sw	sp,518(t1)
    4472:	2020                	.insn	2, 0x2020
    4474:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    4478:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    447c:	23202023          	sw	s2,544(zero) # 220 <init_text_ch+0x28>
    4480:	2020                	.insn	2, 0x2020
    4482:	2020                	.insn	2, 0x2020
    4484:	2020                	.insn	2, 0x2020
    4486:	2020                	.insn	2, 0x2020
    4488:	2020                	.insn	2, 0x2020
    448a:	2320                	.insn	2, 0x2320
    448c:	2320                	.insn	2, 0x2320
    448e:	2320                	.insn	2, 0x2320
    4490:	2320                	.insn	2, 0x2320
    4492:	2020                	.insn	2, 0x2020
    4494:	2320                	.insn	2, 0x2320
    4496:	2020                	.insn	2, 0x2020
    4498:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    449c:	23202023          	sw	s2,544(zero) # 220 <init_text_ch+0x28>
    44a0:	2020                	.insn	2, 0x2020
    44a2:	2320                	.insn	2, 0x2320
    44a4:	2020                	.insn	2, 0x2020
    44a6:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    44aa:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    44ae:	2020                	.insn	2, 0x2020
    44b0:	2020                	.insn	2, 0x2020
    44b2:	2020                	.insn	2, 0x2020
    44b4:	2320                	.insn	2, 0x2320
    44b6:	2020                	.insn	2, 0x2020
    44b8:	2320                	.insn	2, 0x2320
    44ba:	2020                	.insn	2, 0x2020
    44bc:	2320                	.insn	2, 0x2320
    44be:	2020                	.insn	2, 0x2020
    44c0:	2020                	.insn	2, 0x2020
    44c2:	2020                	.insn	2, 0x2020
    44c4:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    44c8:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    44cc:	23202023          	sw	s2,544(zero) # 220 <init_text_ch+0x28>
    44d0:	2020                	.insn	2, 0x2020
    44d2:	2020                	.insn	2, 0x2020
    44d4:	2020                	.insn	2, 0x2020
    44d6:	2020                	.insn	2, 0x2020
    44d8:	2020                	.insn	2, 0x2020
    44da:	2320                	.insn	2, 0x2320
    44dc:	2320                	.insn	2, 0x2320
    44de:	2320                	.insn	2, 0x2320
    44e0:	2320                	.insn	2, 0x2320
    44e2:	2020                	.insn	2, 0x2020
    44e4:	2320                	.insn	2, 0x2320
    44e6:	2020                	.insn	2, 0x2020
    44e8:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    44ec:	23202023          	sw	s2,544(zero) # 220 <init_text_ch+0x28>
    44f0:	2020                	.insn	2, 0x2020
    44f2:	2320                	.insn	2, 0x2320
    44f4:	2020                	.insn	2, 0x2020
    44f6:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    44fa:	2020                	.insn	2, 0x2020
    44fc:	2020                	.insn	2, 0x2020
    44fe:	2020                	.insn	2, 0x2020
    4500:	2020                	.insn	2, 0x2020
    4502:	2020                	.insn	2, 0x2020
    4504:	2320                	.insn	2, 0x2320
    4506:	2020                	.insn	2, 0x2020
    4508:	2320                	.insn	2, 0x2320
    450a:	2020                	.insn	2, 0x2020
    450c:	2020                	.insn	2, 0x2020
    450e:	20232323          	sw	sp,518(t1)
    4512:	2020                	.insn	2, 0x2020
    4514:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    4518:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    451c:	2320                	.insn	2, 0x2320
    451e:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    4522:	2020                	.insn	2, 0x2020
    4524:	2020                	.insn	2, 0x2020
    4526:	2020                	.insn	2, 0x2020
    4528:	2020                	.insn	2, 0x2020
    452a:	2020                	.insn	2, 0x2020
    452c:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    4530:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    4534:	2020                	.insn	2, 0x2020
    4536:	20202323          	sw	sp,518(zero) # 206 <init_text_ch+0xe>
    453a:	2020                	.insn	2, 0x2020
    453c:	23202023          	sw	s2,544(zero) # 220 <init_text_ch+0x28>
    4540:	2020                	.insn	2, 0x2020
    4542:	2020                	.insn	2, 0x2020
    4544:	20232323          	sw	sp,518(t1)
    4548:	2020                	.insn	2, 0x2020
    454a:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    454e:	2020                	.insn	2, 0x2020
    4550:	2020                	.insn	2, 0x2020
    4552:	2020                	.insn	2, 0x2020
    4554:	2020                	.insn	2, 0x2020
    4556:	2020                	.insn	2, 0x2020
    4558:	2020                	.insn	2, 0x2020
    455a:	2020                	.insn	2, 0x2020
    455c:	2020                	.insn	2, 0x2020
    455e:	2020                	.insn	2, 0x2020
    4560:	2020                	.insn	2, 0x2020
    4562:	2020                	.insn	2, 0x2020
    4564:	2020                	.insn	2, 0x2020
    4566:	2020                	.insn	2, 0x2020
    4568:	2020                	.insn	2, 0x2020
    456a:	2020                	.insn	2, 0x2020
    456c:	2020                	.insn	2, 0x2020
    456e:	2020                	.insn	2, 0x2020
    4570:	2020                	.insn	2, 0x2020
    4572:	2020                	.insn	2, 0x2020
    4574:	2020                	.insn	2, 0x2020
    4576:	2020                	.insn	2, 0x2020
    4578:	2020                	.insn	2, 0x2020
    457a:	2020                	.insn	2, 0x2020
    457c:	2020                	.insn	2, 0x2020
    457e:	2020                	.insn	2, 0x2020
    4580:	2020                	.insn	2, 0x2020
    4582:	2020                	.insn	2, 0x2020
    4584:	2020                	.insn	2, 0x2020
    4586:	2020                	.insn	2, 0x2020
    4588:	2020                	.insn	2, 0x2020
    458a:	2020                	.insn	2, 0x2020
    458c:	2020                	.insn	2, 0x2020
    458e:	2020                	.insn	2, 0x2020
    4590:	2020                	.insn	2, 0x2020
    4592:	2020                	.insn	2, 0x2020
    4594:	2020                	.insn	2, 0x2020
    4596:	2020                	.insn	2, 0x2020
    4598:	2020                	.insn	2, 0x2020
    459a:	2020                	.insn	2, 0x2020
    459c:	2020                	.insn	2, 0x2020
    459e:	2020                	.insn	2, 0x2020
    45a0:	2020                	.insn	2, 0x2020
    45a2:	2020                	.insn	2, 0x2020
    45a4:	2020                	.insn	2, 0x2020
    45a6:	2020                	.insn	2, 0x2020
    45a8:	2020                	.insn	2, 0x2020
    45aa:	2020                	.insn	2, 0x2020
    45ac:	2020                	.insn	2, 0x2020
    45ae:	2020                	.insn	2, 0x2020
    45b0:	2020                	.insn	2, 0x2020
    45b2:	2020                	.insn	2, 0x2020
    45b4:	2020                	.insn	2, 0x2020
    45b6:	2020                	.insn	2, 0x2020
    45b8:	2020                	.insn	2, 0x2020
    45ba:	2020                	.insn	2, 0x2020
    45bc:	2020                	.insn	2, 0x2020
    45be:	2020                	.insn	2, 0x2020
    45c0:	2020                	.insn	2, 0x2020
    45c2:	2020                	.insn	2, 0x2020
    45c4:	2020                	.insn	2, 0x2020
    45c6:	2020                	.insn	2, 0x2020
    45c8:	2020                	.insn	2, 0x2020
    45ca:	2020                	.insn	2, 0x2020
    45cc:	2020                	.insn	2, 0x2020
    45ce:	2020                	.insn	2, 0x2020
    45d0:	2020                	.insn	2, 0x2020
    45d2:	2020                	.insn	2, 0x2020
    45d4:	2020                	.insn	2, 0x2020
    45d6:	2020                	.insn	2, 0x2020
    45d8:	2020                	.insn	2, 0x2020
    45da:	2020                	.insn	2, 0x2020
    45dc:	2020                	.insn	2, 0x2020
    45de:	2020                	.insn	2, 0x2020
    45e0:	2020                	.insn	2, 0x2020
    45e2:	2020                	.insn	2, 0x2020
    45e4:	2020                	.insn	2, 0x2020
    45e6:	2020                	.insn	2, 0x2020
    45e8:	2020                	.insn	2, 0x2020
    45ea:	2020                	.insn	2, 0x2020
    45ec:	2020                	.insn	2, 0x2020
    45ee:	2020                	.insn	2, 0x2020
    45f0:	4141                	.insn	2, 0x4141
    45f2:	4141                	.insn	2, 0x4141
    45f4:	4141                	.insn	2, 0x4141
    45f6:	4141                	.insn	2, 0x4141
    45f8:	4141                	.insn	2, 0x4141
    45fa:	4141                	.insn	2, 0x4141
    45fc:	4141                	.insn	2, 0x4141
    45fe:	4141                	.insn	2, 0x4141
    4600:	4141                	.insn	2, 0x4141
    4602:	4141                	.insn	2, 0x4141
    4604:	4141                	.insn	2, 0x4141
    4606:	4141                	.insn	2, 0x4141
    4608:	4141                	.insn	2, 0x4141
    460a:	4141                	.insn	2, 0x4141
    460c:	4141                	.insn	2, 0x4141
    460e:	4141                	.insn	2, 0x4141
    4610:	4141                	.insn	2, 0x4141
    4612:	4141                	.insn	2, 0x4141
    4614:	4141                	.insn	2, 0x4141
    4616:	4141                	.insn	2, 0x4141
    4618:	4141                	.insn	2, 0x4141
    461a:	4141                	.insn	2, 0x4141
    461c:	4141                	.insn	2, 0x4141
    461e:	4141                	.insn	2, 0x4141
    4620:	4141                	.insn	2, 0x4141
    4622:	4141                	.insn	2, 0x4141
    4624:	4141                	.insn	2, 0x4141
    4626:	4141                	.insn	2, 0x4141
    4628:	4141                	.insn	2, 0x4141
    462a:	4141                	.insn	2, 0x4141
    462c:	4141                	.insn	2, 0x4141
    462e:	4141                	.insn	2, 0x4141
    4630:	4141                	.insn	2, 0x4141
    4632:	4141                	.insn	2, 0x4141
    4634:	4141                	.insn	2, 0x4141
    4636:	4141                	.insn	2, 0x4141
    4638:	4141                	.insn	2, 0x4141
    463a:	4141                	.insn	2, 0x4141
    463c:	4141                	.insn	2, 0x4141
    463e:	4141                	.insn	2, 0x4141
    4640:	4141                	.insn	2, 0x4141
    4642:	4141                	.insn	2, 0x4141
    4644:	4141                	.insn	2, 0x4141
    4646:	4141                	.insn	2, 0x4141
    4648:	4141                	.insn	2, 0x4141
    464a:	4141                	.insn	2, 0x4141
    464c:	4141                	.insn	2, 0x4141
    464e:	4141                	.insn	2, 0x4141
    4650:	4141                	.insn	2, 0x4141
    4652:	4141                	.insn	2, 0x4141
    4654:	4141                	.insn	2, 0x4141
    4656:	4141                	.insn	2, 0x4141
    4658:	4141                	.insn	2, 0x4141
    465a:	4141                	.insn	2, 0x4141
    465c:	4141                	.insn	2, 0x4141
    465e:	4141                	.insn	2, 0x4141
    4660:	4141                	.insn	2, 0x4141
    4662:	4141                	.insn	2, 0x4141
    4664:	4141                	.insn	2, 0x4141
    4666:	4141                	.insn	2, 0x4141
    4668:	4141                	.insn	2, 0x4141
    466a:	4141                	.insn	2, 0x4141
    466c:	4141                	.insn	2, 0x4141
    466e:	4141                	.insn	2, 0x4141
    4670:	4141                	.insn	2, 0x4141
    4672:	4141                	.insn	2, 0x4141
    4674:	4141                	.insn	2, 0x4141
    4676:	4141                	.insn	2, 0x4141
    4678:	4141                	.insn	2, 0x4141
    467a:	4141                	.insn	2, 0x4141
    467c:	4141                	.insn	2, 0x4141
    467e:	4141                	.insn	2, 0x4141
    4680:	4141                	.insn	2, 0x4141
    4682:	4141                	.insn	2, 0x4141
    4684:	4141                	.insn	2, 0x4141
    4686:	4141                	.insn	2, 0x4141
    4688:	4141                	.insn	2, 0x4141
    468a:	4141                	.insn	2, 0x4141
    468c:	4141                	.insn	2, 0x4141
    468e:	4141                	.insn	2, 0x4141
    4690:	2020                	.insn	2, 0x2020
    4692:	2020                	.insn	2, 0x2020
    4694:	2020                	.insn	2, 0x2020
    4696:	2020                	.insn	2, 0x2020
    4698:	2020                	.insn	2, 0x2020
    469a:	2020                	.insn	2, 0x2020
    469c:	2020                	.insn	2, 0x2020
    469e:	2020                	.insn	2, 0x2020
    46a0:	2020                	.insn	2, 0x2020
    46a2:	2020                	.insn	2, 0x2020
    46a4:	2020                	.insn	2, 0x2020
    46a6:	2020                	.insn	2, 0x2020
    46a8:	2020                	.insn	2, 0x2020
    46aa:	2020                	.insn	2, 0x2020
    46ac:	2020                	.insn	2, 0x2020
    46ae:	2020                	.insn	2, 0x2020
    46b0:	2020                	.insn	2, 0x2020
    46b2:	2020                	.insn	2, 0x2020
    46b4:	2020                	.insn	2, 0x2020
    46b6:	2020                	.insn	2, 0x2020
    46b8:	2020                	.insn	2, 0x2020
    46ba:	2020                	.insn	2, 0x2020
    46bc:	2020                	.insn	2, 0x2020
    46be:	2020                	.insn	2, 0x2020
    46c0:	2020                	.insn	2, 0x2020
    46c2:	2020                	.insn	2, 0x2020
    46c4:	2020                	.insn	2, 0x2020
    46c6:	2020                	.insn	2, 0x2020
    46c8:	2020                	.insn	2, 0x2020
    46ca:	2020                	.insn	2, 0x2020
    46cc:	2020                	.insn	2, 0x2020
    46ce:	2020                	.insn	2, 0x2020
    46d0:	2020                	.insn	2, 0x2020
    46d2:	2020                	.insn	2, 0x2020
    46d4:	2020                	.insn	2, 0x2020
    46d6:	2020                	.insn	2, 0x2020
    46d8:	2020                	.insn	2, 0x2020
    46da:	2020                	.insn	2, 0x2020
    46dc:	2020                	.insn	2, 0x2020
    46de:	2020                	.insn	2, 0x2020
    46e0:	2020                	.insn	2, 0x2020
    46e2:	2020                	.insn	2, 0x2020
    46e4:	2020                	.insn	2, 0x2020
    46e6:	2020                	.insn	2, 0x2020
    46e8:	2020                	.insn	2, 0x2020
    46ea:	2020                	.insn	2, 0x2020
    46ec:	2020                	.insn	2, 0x2020
    46ee:	2020                	.insn	2, 0x2020
    46f0:	2020                	.insn	2, 0x2020
    46f2:	2020                	.insn	2, 0x2020
    46f4:	2020                	.insn	2, 0x2020
    46f6:	2020                	.insn	2, 0x2020
    46f8:	2020                	.insn	2, 0x2020
    46fa:	2020                	.insn	2, 0x2020
    46fc:	2020                	.insn	2, 0x2020
    46fe:	2020                	.insn	2, 0x2020
    4700:	2020                	.insn	2, 0x2020
    4702:	2020                	.insn	2, 0x2020
    4704:	2020                	.insn	2, 0x2020
    4706:	2020                	.insn	2, 0x2020
    4708:	2020                	.insn	2, 0x2020
    470a:	2020                	.insn	2, 0x2020
    470c:	2020                	.insn	2, 0x2020
    470e:	2020                	.insn	2, 0x2020
    4710:	2020                	.insn	2, 0x2020
    4712:	2020                	.insn	2, 0x2020
    4714:	2020                	.insn	2, 0x2020
    4716:	2020                	.insn	2, 0x2020
    4718:	2020                	.insn	2, 0x2020
    471a:	2020                	.insn	2, 0x2020
    471c:	2020                	.insn	2, 0x2020
    471e:	2020                	.insn	2, 0x2020
    4720:	2020                	.insn	2, 0x2020
    4722:	2020                	.insn	2, 0x2020
    4724:	2020                	.insn	2, 0x2020
    4726:	2020                	.insn	2, 0x2020
    4728:	2020                	.insn	2, 0x2020
    472a:	2020                	.insn	2, 0x2020
    472c:	2020                	.insn	2, 0x2020
    472e:	2020                	.insn	2, 0x2020
    4730:	2020                	.insn	2, 0x2020
    4732:	2020                	.insn	2, 0x2020
    4734:	2020                	.insn	2, 0x2020
    4736:	2020                	.insn	2, 0x2020
    4738:	2020                	.insn	2, 0x2020
    473a:	2020                	.insn	2, 0x2020
    473c:	2020                	.insn	2, 0x2020
    473e:	2020                	.insn	2, 0x2020
    4740:	2020                	.insn	2, 0x2020
    4742:	2020                	.insn	2, 0x2020
    4744:	2020                	.insn	2, 0x2020
    4746:	2020                	.insn	2, 0x2020
    4748:	2020                	.insn	2, 0x2020
    474a:	2020                	.insn	2, 0x2020
    474c:	2020                	.insn	2, 0x2020
    474e:	2020                	.insn	2, 0x2020
    4750:	2020                	.insn	2, 0x2020
    4752:	2020                	.insn	2, 0x2020
    4754:	2020                	.insn	2, 0x2020
    4756:	2020                	.insn	2, 0x2020
    4758:	2020                	.insn	2, 0x2020
    475a:	2020                	.insn	2, 0x2020
    475c:	2020                	.insn	2, 0x2020
    475e:	2020                	.insn	2, 0x2020
    4760:	2020                	.insn	2, 0x2020
    4762:	2020                	.insn	2, 0x2020
    4764:	2020                	.insn	2, 0x2020
    4766:	2020                	.insn	2, 0x2020
    4768:	2020                	.insn	2, 0x2020
    476a:	2020                	.insn	2, 0x2020
    476c:	2020                	.insn	2, 0x2020
    476e:	2020                	.insn	2, 0x2020
    4770:	2020                	.insn	2, 0x2020
    4772:	2020                	.insn	2, 0x2020
    4774:	2020                	.insn	2, 0x2020
    4776:	2020                	.insn	2, 0x2020
    4778:	2020                	.insn	2, 0x2020
    477a:	2020                	.insn	2, 0x2020
    477c:	2020                	.insn	2, 0x2020
    477e:	2020                	.insn	2, 0x2020
    4780:	2020                	.insn	2, 0x2020
    4782:	2020                	.insn	2, 0x2020
    4784:	2020                	.insn	2, 0x2020
    4786:	2020                	.insn	2, 0x2020
    4788:	2020                	.insn	2, 0x2020
    478a:	2020                	.insn	2, 0x2020
    478c:	2020                	.insn	2, 0x2020
    478e:	2020                	.insn	2, 0x2020
    4790:	2020                	.insn	2, 0x2020
    4792:	2020                	.insn	2, 0x2020
    4794:	2020                	.insn	2, 0x2020
    4796:	2020                	.insn	2, 0x2020
    4798:	2020                	.insn	2, 0x2020
    479a:	2020                	.insn	2, 0x2020
    479c:	2020                	.insn	2, 0x2020
    479e:	2020                	.insn	2, 0x2020
    47a0:	2020                	.insn	2, 0x2020
    47a2:	2020                	.insn	2, 0x2020
    47a4:	2020                	.insn	2, 0x2020
    47a6:	2020                	.insn	2, 0x2020
    47a8:	2020                	.insn	2, 0x2020
    47aa:	2020                	.insn	2, 0x2020
    47ac:	2020                	.insn	2, 0x2020
    47ae:	2020                	.insn	2, 0x2020
    47b0:	2020                	.insn	2, 0x2020
    47b2:	2020                	.insn	2, 0x2020
    47b4:	2020                	.insn	2, 0x2020
    47b6:	2020                	.insn	2, 0x2020
    47b8:	2020                	.insn	2, 0x2020
    47ba:	2020                	.insn	2, 0x2020
    47bc:	2020                	.insn	2, 0x2020
    47be:	2020                	.insn	2, 0x2020
    47c0:	2020                	.insn	2, 0x2020
    47c2:	2020                	.insn	2, 0x2020
    47c4:	2020                	.insn	2, 0x2020
    47c6:	2020                	.insn	2, 0x2020
    47c8:	2020                	.insn	2, 0x2020
    47ca:	2020                	.insn	2, 0x2020
    47cc:	2020                	.insn	2, 0x2020
    47ce:	2020                	.insn	2, 0x2020
    47d0:	2020                	.insn	2, 0x2020
    47d2:	2020                	.insn	2, 0x2020
    47d4:	2020                	.insn	2, 0x2020
    47d6:	2020                	.insn	2, 0x2020
    47d8:	2020                	.insn	2, 0x2020
    47da:	2020                	.insn	2, 0x2020
    47dc:	2020                	.insn	2, 0x2020
    47de:	2020                	.insn	2, 0x2020
    47e0:	2020                	.insn	2, 0x2020
    47e2:	2020                	.insn	2, 0x2020
    47e4:	2020                	.insn	2, 0x2020
    47e6:	2020                	.insn	2, 0x2020
    47e8:	2020                	.insn	2, 0x2020
    47ea:	2020                	.insn	2, 0x2020
    47ec:	2020                	.insn	2, 0x2020
    47ee:	2020                	.insn	2, 0x2020
    47f0:	2020                	.insn	2, 0x2020
    47f2:	2020                	.insn	2, 0x2020
    47f4:	2020                	.insn	2, 0x2020
    47f6:	2020                	.insn	2, 0x2020
    47f8:	2020                	.insn	2, 0x2020
    47fa:	2020                	.insn	2, 0x2020
    47fc:	2020                	.insn	2, 0x2020
    47fe:	2020                	.insn	2, 0x2020
    4800:	2020                	.insn	2, 0x2020
    4802:	2020                	.insn	2, 0x2020
    4804:	2020                	.insn	2, 0x2020
    4806:	2020                	.insn	2, 0x2020
    4808:	2020                	.insn	2, 0x2020
    480a:	2020                	.insn	2, 0x2020
    480c:	2020                	.insn	2, 0x2020
    480e:	2020                	.insn	2, 0x2020
    4810:	2020                	.insn	2, 0x2020
    4812:	2020                	.insn	2, 0x2020
    4814:	2020                	.insn	2, 0x2020
    4816:	2020                	.insn	2, 0x2020
    4818:	2020                	.insn	2, 0x2020
    481a:	2020                	.insn	2, 0x2020
    481c:	2020                	.insn	2, 0x2020
    481e:	2020                	.insn	2, 0x2020
    4820:	2020                	.insn	2, 0x2020
    4822:	2020                	.insn	2, 0x2020
    4824:	2020                	.insn	2, 0x2020
    4826:	2020                	.insn	2, 0x2020
    4828:	2020                	.insn	2, 0x2020
    482a:	2020                	.insn	2, 0x2020
    482c:	2020                	.insn	2, 0x2020
    482e:	2020                	.insn	2, 0x2020
    4830:	2020                	.insn	2, 0x2020
    4832:	2020                	.insn	2, 0x2020
    4834:	2020                	.insn	2, 0x2020
    4836:	2020                	.insn	2, 0x2020
    4838:	2020                	.insn	2, 0x2020
    483a:	2020                	.insn	2, 0x2020
    483c:	2020                	.insn	2, 0x2020
    483e:	2020                	.insn	2, 0x2020
    4840:	2020                	.insn	2, 0x2020
    4842:	2020                	.insn	2, 0x2020
    4844:	2020                	.insn	2, 0x2020
    4846:	2020                	.insn	2, 0x2020
    4848:	2020                	.insn	2, 0x2020
    484a:	2020                	.insn	2, 0x2020
    484c:	2020                	.insn	2, 0x2020
    484e:	2020                	.insn	2, 0x2020
    4850:	2020                	.insn	2, 0x2020
    4852:	2020                	.insn	2, 0x2020
    4854:	2020                	.insn	2, 0x2020
    4856:	2020                	.insn	2, 0x2020
    4858:	2020                	.insn	2, 0x2020
    485a:	2020                	.insn	2, 0x2020
    485c:	2020                	.insn	2, 0x2020
    485e:	2020                	.insn	2, 0x2020
    4860:	2020                	.insn	2, 0x2020
    4862:	2020                	.insn	2, 0x2020
    4864:	2020                	.insn	2, 0x2020
    4866:	2020                	.insn	2, 0x2020
    4868:	2020                	.insn	2, 0x2020
    486a:	2020                	.insn	2, 0x2020
    486c:	2020                	.insn	2, 0x2020
    486e:	2020                	.insn	2, 0x2020
    4870:	2020                	.insn	2, 0x2020
    4872:	2020                	.insn	2, 0x2020
    4874:	2020                	.insn	2, 0x2020
    4876:	2020                	.insn	2, 0x2020
    4878:	2020                	.insn	2, 0x2020
    487a:	2020                	.insn	2, 0x2020
    487c:	2020                	.insn	2, 0x2020
    487e:	2020                	.insn	2, 0x2020
    4880:	2020                	.insn	2, 0x2020
    4882:	2020                	.insn	2, 0x2020
    4884:	2020                	.insn	2, 0x2020
    4886:	2020                	.insn	2, 0x2020
    4888:	2020                	.insn	2, 0x2020
    488a:	2020                	.insn	2, 0x2020
    488c:	2020                	.insn	2, 0x2020
    488e:	2020                	.insn	2, 0x2020
    4890:	2020                	.insn	2, 0x2020
    4892:	2020                	.insn	2, 0x2020
    4894:	2020                	.insn	2, 0x2020
    4896:	2020                	.insn	2, 0x2020
    4898:	2020                	.insn	2, 0x2020
    489a:	2020                	.insn	2, 0x2020
    489c:	2020                	.insn	2, 0x2020
    489e:	2020                	.insn	2, 0x2020
    48a0:	2020                	.insn	2, 0x2020
    48a2:	2020                	.insn	2, 0x2020
    48a4:	2020                	.insn	2, 0x2020
    48a6:	2020                	.insn	2, 0x2020
    48a8:	2020                	.insn	2, 0x2020
    48aa:	2020                	.insn	2, 0x2020
    48ac:	2020                	.insn	2, 0x2020
    48ae:	2020                	.insn	2, 0x2020
    48b0:	2020                	.insn	2, 0x2020
    48b2:	2020                	.insn	2, 0x2020
    48b4:	2020                	.insn	2, 0x2020
    48b6:	2020                	.insn	2, 0x2020
    48b8:	2020                	.insn	2, 0x2020
    48ba:	2020                	.insn	2, 0x2020
    48bc:	2020                	.insn	2, 0x2020
    48be:	2020                	.insn	2, 0x2020
    48c0:	2020                	.insn	2, 0x2020
    48c2:	2020                	.insn	2, 0x2020
    48c4:	2020                	.insn	2, 0x2020
    48c6:	2020                	.insn	2, 0x2020
    48c8:	2020                	.insn	2, 0x2020
    48ca:	2020                	.insn	2, 0x2020
    48cc:	2020                	.insn	2, 0x2020
    48ce:	2020                	.insn	2, 0x2020
    48d0:	2020                	.insn	2, 0x2020
    48d2:	2020                	.insn	2, 0x2020
    48d4:	2020                	.insn	2, 0x2020
    48d6:	2020                	.insn	2, 0x2020
    48d8:	5020                	.insn	2, 0x5020
    48da:	6572                	.insn	2, 0x6572
    48dc:	61207373          	csrrc	t1,0x612,0
    48e0:	796e                	.insn	2, 0x796e
    48e2:	6b20                	.insn	2, 0x6b20
    48e4:	7965                	.insn	2, 0x7965
    48e6:	7420                	.insn	2, 0x7420
    48e8:	6173206f          	j	376fe <_data_end+0x2f6fe>
    48ec:	2079                	.insn	2, 0x2079
    48ee:	646f6f67          	.insn	4, 0x646f6f67
    48f2:	7962                	.insn	2, 0x7962
    48f4:	2065                	.insn	2, 0x2065
    48f6:	6f74                	.insn	2, 0x6f74
    48f8:	7420                	.insn	2, 0x7420
    48fa:	6968                	.insn	2, 0x6968
    48fc:	72632073          	csrs	mhpmevent6h,t1
    4900:	6575                	.insn	2, 0x6575
    4902:	206c                	.insn	2, 0x206c
    4904:	6c726f77          	.insn	4, 0x6c726f77
    4908:	2064                	.insn	2, 0x2064
    490a:	283a                	.insn	2, 0x283a
    490c:	2828                	.insn	2, 0x2828
    490e:	2020                	.insn	2, 0x2020
    4910:	2020                	.insn	2, 0x2020
    4912:	2020                	.insn	2, 0x2020
    4914:	2020                	.insn	2, 0x2020
    4916:	2020                	.insn	2, 0x2020
    4918:	2020                	.insn	2, 0x2020
    491a:	2020                	.insn	2, 0x2020
    491c:	2020                	.insn	2, 0x2020
    491e:	2020                	.insn	2, 0x2020
    4920:	2020                	.insn	2, 0x2020
    4922:	2020                	.insn	2, 0x2020
    4924:	2020                	.insn	2, 0x2020
    4926:	2020                	.insn	2, 0x2020
    4928:	2020                	.insn	2, 0x2020
    492a:	2020                	.insn	2, 0x2020
    492c:	2020                	.insn	2, 0x2020
    492e:	2020                	.insn	2, 0x2020
    4930:	2020                	.insn	2, 0x2020
    4932:	2020                	.insn	2, 0x2020
    4934:	2020                	.insn	2, 0x2020
    4936:	2020                	.insn	2, 0x2020
    4938:	2020                	.insn	2, 0x2020
    493a:	2020                	.insn	2, 0x2020
    493c:	2020                	.insn	2, 0x2020
    493e:	2020                	.insn	2, 0x2020
    4940:	2020                	.insn	2, 0x2020
    4942:	2020                	.insn	2, 0x2020
    4944:	2020                	.insn	2, 0x2020
    4946:	2020                	.insn	2, 0x2020
    4948:	2020                	.insn	2, 0x2020
    494a:	2020                	.insn	2, 0x2020
    494c:	2020                	.insn	2, 0x2020
    494e:	2020                	.insn	2, 0x2020
    4950:	2020                	.insn	2, 0x2020
    4952:	2020                	.insn	2, 0x2020
    4954:	2020                	.insn	2, 0x2020
    4956:	2020                	.insn	2, 0x2020
    4958:	2020                	.insn	2, 0x2020
    495a:	2020                	.insn	2, 0x2020
    495c:	2020                	.insn	2, 0x2020
    495e:	2020                	.insn	2, 0x2020
    4960:	0000                	.insn	2, 0x
	...

00004964 <g_goodbye_str>:
    4964:	2020                	.insn	2, 0x2020
    4966:	2020                	.insn	2, 0x2020
    4968:	2020                	.insn	2, 0x2020
    496a:	2020                	.insn	2, 0x2020
    496c:	2020                	.insn	2, 0x2020
    496e:	2020                	.insn	2, 0x2020
    4970:	2020                	.insn	2, 0x2020
    4972:	2020                	.insn	2, 0x2020
    4974:	2020                	.insn	2, 0x2020
    4976:	2020                	.insn	2, 0x2020
    4978:	2020                	.insn	2, 0x2020
    497a:	2020                	.insn	2, 0x2020
    497c:	2020                	.insn	2, 0x2020
    497e:	2020                	.insn	2, 0x2020
    4980:	2020                	.insn	2, 0x2020
    4982:	2020                	.insn	2, 0x2020
    4984:	2020                	.insn	2, 0x2020
    4986:	2020                	.insn	2, 0x2020
    4988:	2020                	.insn	2, 0x2020
    498a:	2020                	.insn	2, 0x2020
    498c:	2020                	.insn	2, 0x2020
    498e:	2020                	.insn	2, 0x2020
    4990:	2020                	.insn	2, 0x2020
    4992:	2020                	.insn	2, 0x2020
    4994:	2020                	.insn	2, 0x2020
    4996:	2020                	.insn	2, 0x2020
    4998:	2020                	.insn	2, 0x2020
    499a:	2020                	.insn	2, 0x2020
    499c:	2020                	.insn	2, 0x2020
    499e:	2020                	.insn	2, 0x2020
    49a0:	2020                	.insn	2, 0x2020
    49a2:	2020                	.insn	2, 0x2020
    49a4:	2020                	.insn	2, 0x2020
    49a6:	2020                	.insn	2, 0x2020
    49a8:	2020                	.insn	2, 0x2020
    49aa:	2020                	.insn	2, 0x2020
    49ac:	2020                	.insn	2, 0x2020
    49ae:	2020                	.insn	2, 0x2020
    49b0:	2020                	.insn	2, 0x2020
    49b2:	2020                	.insn	2, 0x2020
    49b4:	2020                	.insn	2, 0x2020
    49b6:	2020                	.insn	2, 0x2020
    49b8:	2020                	.insn	2, 0x2020
    49ba:	2020                	.insn	2, 0x2020
    49bc:	2020                	.insn	2, 0x2020
    49be:	2020                	.insn	2, 0x2020
    49c0:	2020                	.insn	2, 0x2020
    49c2:	2020                	.insn	2, 0x2020
    49c4:	2020                	.insn	2, 0x2020
    49c6:	2020                	.insn	2, 0x2020
    49c8:	2020                	.insn	2, 0x2020
    49ca:	2020                	.insn	2, 0x2020
    49cc:	2020                	.insn	2, 0x2020
    49ce:	2020                	.insn	2, 0x2020
    49d0:	2020                	.insn	2, 0x2020
    49d2:	2020                	.insn	2, 0x2020
    49d4:	2020                	.insn	2, 0x2020
    49d6:	2020                	.insn	2, 0x2020
    49d8:	2020                	.insn	2, 0x2020
    49da:	2020                	.insn	2, 0x2020
    49dc:	2020                	.insn	2, 0x2020
    49de:	2020                	.insn	2, 0x2020
    49e0:	2020                	.insn	2, 0x2020
    49e2:	2020                	.insn	2, 0x2020
    49e4:	2020                	.insn	2, 0x2020
    49e6:	2020                	.insn	2, 0x2020
    49e8:	2020                	.insn	2, 0x2020
    49ea:	2020                	.insn	2, 0x2020
    49ec:	2020                	.insn	2, 0x2020
    49ee:	2020                	.insn	2, 0x2020
    49f0:	2020                	.insn	2, 0x2020
    49f2:	2020                	.insn	2, 0x2020
    49f4:	2020                	.insn	2, 0x2020
    49f6:	2020                	.insn	2, 0x2020
    49f8:	2020                	.insn	2, 0x2020
    49fa:	2020                	.insn	2, 0x2020
    49fc:	2020                	.insn	2, 0x2020
    49fe:	2020                	.insn	2, 0x2020
    4a00:	2020                	.insn	2, 0x2020
    4a02:	2020                	.insn	2, 0x2020
    4a04:	2020                	.insn	2, 0x2020
    4a06:	2020                	.insn	2, 0x2020
    4a08:	2020                	.insn	2, 0x2020
    4a0a:	2020                	.insn	2, 0x2020
    4a0c:	2020                	.insn	2, 0x2020
    4a0e:	2020                	.insn	2, 0x2020
    4a10:	2020                	.insn	2, 0x2020
    4a12:	2020                	.insn	2, 0x2020
    4a14:	2020                	.insn	2, 0x2020
    4a16:	2020                	.insn	2, 0x2020
    4a18:	2020                	.insn	2, 0x2020
    4a1a:	2020                	.insn	2, 0x2020
    4a1c:	2020                	.insn	2, 0x2020
    4a1e:	2020                	.insn	2, 0x2020
    4a20:	2020                	.insn	2, 0x2020
    4a22:	2020                	.insn	2, 0x2020
    4a24:	2020                	.insn	2, 0x2020
    4a26:	2020                	.insn	2, 0x2020
    4a28:	2020                	.insn	2, 0x2020
    4a2a:	2020                	.insn	2, 0x2020
    4a2c:	2020                	.insn	2, 0x2020
    4a2e:	2020                	.insn	2, 0x2020
    4a30:	2020                	.insn	2, 0x2020
    4a32:	2020                	.insn	2, 0x2020
    4a34:	2020                	.insn	2, 0x2020
    4a36:	2020                	.insn	2, 0x2020
    4a38:	2020                	.insn	2, 0x2020
    4a3a:	2020                	.insn	2, 0x2020
    4a3c:	2020                	.insn	2, 0x2020
    4a3e:	2020                	.insn	2, 0x2020
    4a40:	2020                	.insn	2, 0x2020
    4a42:	2020                	.insn	2, 0x2020
    4a44:	2020                	.insn	2, 0x2020
    4a46:	2020                	.insn	2, 0x2020
    4a48:	2020                	.insn	2, 0x2020
    4a4a:	2020                	.insn	2, 0x2020
    4a4c:	2020                	.insn	2, 0x2020
    4a4e:	2020                	.insn	2, 0x2020
    4a50:	2020                	.insn	2, 0x2020
    4a52:	2020                	.insn	2, 0x2020
    4a54:	2020                	.insn	2, 0x2020
    4a56:	2020                	.insn	2, 0x2020
    4a58:	2020                	.insn	2, 0x2020
    4a5a:	2020                	.insn	2, 0x2020
    4a5c:	2020                	.insn	2, 0x2020
    4a5e:	2020                	.insn	2, 0x2020
    4a60:	2020                	.insn	2, 0x2020
    4a62:	2020                	.insn	2, 0x2020
    4a64:	2020                	.insn	2, 0x2020
    4a66:	2020                	.insn	2, 0x2020
    4a68:	2020                	.insn	2, 0x2020
    4a6a:	2020                	.insn	2, 0x2020
    4a6c:	2020                	.insn	2, 0x2020
    4a6e:	2020                	.insn	2, 0x2020
    4a70:	2020                	.insn	2, 0x2020
    4a72:	2020                	.insn	2, 0x2020
    4a74:	2020                	.insn	2, 0x2020
    4a76:	2020                	.insn	2, 0x2020
    4a78:	2020                	.insn	2, 0x2020
    4a7a:	2020                	.insn	2, 0x2020
    4a7c:	2020                	.insn	2, 0x2020
    4a7e:	2020                	.insn	2, 0x2020
    4a80:	2020                	.insn	2, 0x2020
    4a82:	2020                	.insn	2, 0x2020
    4a84:	2020                	.insn	2, 0x2020
    4a86:	2020                	.insn	2, 0x2020
    4a88:	2020                	.insn	2, 0x2020
    4a8a:	2020                	.insn	2, 0x2020
    4a8c:	2020                	.insn	2, 0x2020
    4a8e:	2020                	.insn	2, 0x2020
    4a90:	2020                	.insn	2, 0x2020
    4a92:	2020                	.insn	2, 0x2020
    4a94:	2020                	.insn	2, 0x2020
    4a96:	2020                	.insn	2, 0x2020
    4a98:	2020                	.insn	2, 0x2020
    4a9a:	2020                	.insn	2, 0x2020
    4a9c:	2020                	.insn	2, 0x2020
    4a9e:	2020                	.insn	2, 0x2020
    4aa0:	2020                	.insn	2, 0x2020
    4aa2:	2020                	.insn	2, 0x2020
    4aa4:	2020                	.insn	2, 0x2020
    4aa6:	2020                	.insn	2, 0x2020
    4aa8:	2020                	.insn	2, 0x2020
    4aaa:	2020                	.insn	2, 0x2020
    4aac:	2020                	.insn	2, 0x2020
    4aae:	2020                	.insn	2, 0x2020
    4ab0:	2020                	.insn	2, 0x2020
    4ab2:	2020                	.insn	2, 0x2020
    4ab4:	2020                	.insn	2, 0x2020
    4ab6:	2020                	.insn	2, 0x2020
    4ab8:	2020                	.insn	2, 0x2020
    4aba:	2020                	.insn	2, 0x2020
    4abc:	2020                	.insn	2, 0x2020
    4abe:	2020                	.insn	2, 0x2020
    4ac0:	2020                	.insn	2, 0x2020
    4ac2:	2020                	.insn	2, 0x2020
    4ac4:	2020                	.insn	2, 0x2020
    4ac6:	2020                	.insn	2, 0x2020
    4ac8:	2020                	.insn	2, 0x2020
    4aca:	2020                	.insn	2, 0x2020
    4acc:	2020                	.insn	2, 0x2020
    4ace:	2020                	.insn	2, 0x2020
    4ad0:	2020                	.insn	2, 0x2020
    4ad2:	2020                	.insn	2, 0x2020
    4ad4:	2020                	.insn	2, 0x2020
    4ad6:	2020                	.insn	2, 0x2020
    4ad8:	2020                	.insn	2, 0x2020
    4ada:	2020                	.insn	2, 0x2020
    4adc:	2020                	.insn	2, 0x2020
    4ade:	2020                	.insn	2, 0x2020
    4ae0:	2020                	.insn	2, 0x2020
    4ae2:	2020                	.insn	2, 0x2020
    4ae4:	2020                	.insn	2, 0x2020
    4ae6:	2020                	.insn	2, 0x2020
    4ae8:	2020                	.insn	2, 0x2020
    4aea:	2020                	.insn	2, 0x2020
    4aec:	2020                	.insn	2, 0x2020
    4aee:	2020                	.insn	2, 0x2020
    4af0:	2020                	.insn	2, 0x2020
    4af2:	2020                	.insn	2, 0x2020
    4af4:	2020                	.insn	2, 0x2020
    4af6:	2020                	.insn	2, 0x2020
    4af8:	2020                	.insn	2, 0x2020
    4afa:	2020                	.insn	2, 0x2020
    4afc:	2020                	.insn	2, 0x2020
    4afe:	2020                	.insn	2, 0x2020
    4b00:	2020                	.insn	2, 0x2020
    4b02:	2020                	.insn	2, 0x2020
    4b04:	2020                	.insn	2, 0x2020
    4b06:	2020                	.insn	2, 0x2020
    4b08:	2020                	.insn	2, 0x2020
    4b0a:	2020                	.insn	2, 0x2020
    4b0c:	2020                	.insn	2, 0x2020
    4b0e:	2020                	.insn	2, 0x2020
    4b10:	2020                	.insn	2, 0x2020
    4b12:	2020                	.insn	2, 0x2020
    4b14:	2020                	.insn	2, 0x2020
    4b16:	2020                	.insn	2, 0x2020
    4b18:	2020                	.insn	2, 0x2020
    4b1a:	2020                	.insn	2, 0x2020
    4b1c:	2020                	.insn	2, 0x2020
    4b1e:	2020                	.insn	2, 0x2020
    4b20:	2020                	.insn	2, 0x2020
    4b22:	2020                	.insn	2, 0x2020
    4b24:	2020                	.insn	2, 0x2020
    4b26:	2020                	.insn	2, 0x2020
    4b28:	2020                	.insn	2, 0x2020
    4b2a:	2020                	.insn	2, 0x2020
    4b2c:	2020                	.insn	2, 0x2020
    4b2e:	2020                	.insn	2, 0x2020
    4b30:	2020                	.insn	2, 0x2020
    4b32:	2020                	.insn	2, 0x2020
    4b34:	2020                	.insn	2, 0x2020
    4b36:	2020                	.insn	2, 0x2020
    4b38:	2020                	.insn	2, 0x2020
    4b3a:	2020                	.insn	2, 0x2020
    4b3c:	2020                	.insn	2, 0x2020
    4b3e:	2020                	.insn	2, 0x2020
    4b40:	2020                	.insn	2, 0x2020
    4b42:	2020                	.insn	2, 0x2020
    4b44:	2020                	.insn	2, 0x2020
    4b46:	2020                	.insn	2, 0x2020
    4b48:	2020                	.insn	2, 0x2020
    4b4a:	2020                	.insn	2, 0x2020
    4b4c:	2320                	.insn	2, 0x2320
    4b4e:	20232323          	sw	sp,518(t1)
    4b52:	2020                	.insn	2, 0x2020
    4b54:	2020                	.insn	2, 0x2020
    4b56:	2020                	.insn	2, 0x2020
    4b58:	2020                	.insn	2, 0x2020
    4b5a:	2020                	.insn	2, 0x2020
    4b5c:	2020                	.insn	2, 0x2020
    4b5e:	2020                	.insn	2, 0x2020
    4b60:	2020                	.insn	2, 0x2020
    4b62:	2020                	.insn	2, 0x2020
    4b64:	2020                	.insn	2, 0x2020
    4b66:	2020                	.insn	2, 0x2020
    4b68:	2020                	.insn	2, 0x2020
    4b6a:	2320                	.insn	2, 0x2320
    4b6c:	2020                	.insn	2, 0x2020
    4b6e:	2320                	.insn	2, 0x2320
    4b70:	2020                	.insn	2, 0x2020
    4b72:	2320                	.insn	2, 0x2320
    4b74:	2020                	.insn	2, 0x2020
    4b76:	2020                	.insn	2, 0x2020
    4b78:	2020                	.insn	2, 0x2020
    4b7a:	2020                	.insn	2, 0x2020
    4b7c:	2020                	.insn	2, 0x2020
    4b7e:	2020                	.insn	2, 0x2020
    4b80:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    4b84:	2020                	.insn	2, 0x2020
    4b86:	2320                	.insn	2, 0x2320
    4b88:	2020                	.insn	2, 0x2020
    4b8a:	2320                	.insn	2, 0x2320
    4b8c:	2020                	.insn	2, 0x2020
    4b8e:	2020                	.insn	2, 0x2020
    4b90:	2020                	.insn	2, 0x2020
    4b92:	2020                	.insn	2, 0x2020
    4b94:	2020                	.insn	2, 0x2020
    4b96:	2020                	.insn	2, 0x2020
    4b98:	2020                	.insn	2, 0x2020
    4b9a:	2020                	.insn	2, 0x2020
    4b9c:	2320                	.insn	2, 0x2320
    4b9e:	2020                	.insn	2, 0x2020
    4ba0:	2320                	.insn	2, 0x2320
    4ba2:	2020                	.insn	2, 0x2020
    4ba4:	2020                	.insn	2, 0x2020
    4ba6:	2020                	.insn	2, 0x2020
    4ba8:	2020                	.insn	2, 0x2020
    4baa:	2020                	.insn	2, 0x2020
    4bac:	2020                	.insn	2, 0x2020
    4bae:	2020                	.insn	2, 0x2020
    4bb0:	2020                	.insn	2, 0x2020
    4bb2:	2020                	.insn	2, 0x2020
    4bb4:	2020                	.insn	2, 0x2020
    4bb6:	2020                	.insn	2, 0x2020
    4bb8:	2020                	.insn	2, 0x2020
    4bba:	2320                	.insn	2, 0x2320
    4bbc:	2020                	.insn	2, 0x2020
    4bbe:	20232023          	sw	sp,512(t1)
    4bc2:	2320                	.insn	2, 0x2320
    4bc4:	2020                	.insn	2, 0x2020
    4bc6:	2020                	.insn	2, 0x2020
    4bc8:	2020                	.insn	2, 0x2020
    4bca:	2020                	.insn	2, 0x2020
    4bcc:	2020                	.insn	2, 0x2020
    4bce:	2020                	.insn	2, 0x2020
    4bd0:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    4bd4:	2020                	.insn	2, 0x2020
    4bd6:	2320                	.insn	2, 0x2320
    4bd8:	2020                	.insn	2, 0x2020
    4bda:	2320                	.insn	2, 0x2320
    4bdc:	2020                	.insn	2, 0x2020
    4bde:	2020                	.insn	2, 0x2020
    4be0:	2020                	.insn	2, 0x2020
    4be2:	2020                	.insn	2, 0x2020
    4be4:	2020                	.insn	2, 0x2020
    4be6:	2020                	.insn	2, 0x2020
    4be8:	2020                	.insn	2, 0x2020
    4bea:	2020                	.insn	2, 0x2020
    4bec:	2320                	.insn	2, 0x2320
    4bee:	2020                	.insn	2, 0x2020
    4bf0:	2320                	.insn	2, 0x2320
    4bf2:	2020                	.insn	2, 0x2020
    4bf4:	2320                	.insn	2, 0x2320
    4bf6:	2020                	.insn	2, 0x2020
    4bf8:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    4bfc:	20202323          	sw	sp,518(zero) # 206 <init_text_ch+0xe>
    4c00:	2020                	.insn	2, 0x2020
    4c02:	2020                	.insn	2, 0x2020
    4c04:	2020                	.insn	2, 0x2020
    4c06:	2020                	.insn	2, 0x2020
    4c08:	2020                	.insn	2, 0x2020
    4c0a:	2020                	.insn	2, 0x2020
    4c0c:	20232023          	sw	sp,512(t1)
    4c10:	20232023          	sw	sp,512(t1)
    4c14:	2020                	.insn	2, 0x2020
    4c16:	2320                	.insn	2, 0x2320
    4c18:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    4c1c:	2320                	.insn	2, 0x2320
    4c1e:	20232023          	sw	sp,512(t1)
    4c22:	2020                	.insn	2, 0x2020
    4c24:	2320                	.insn	2, 0x2320
    4c26:	20202323          	sw	sp,518(zero) # 206 <init_text_ch+0xe>
    4c2a:	2320                	.insn	2, 0x2320
    4c2c:	2020                	.insn	2, 0x2020
    4c2e:	2020                	.insn	2, 0x2020
    4c30:	2020                	.insn	2, 0x2020
    4c32:	2020                	.insn	2, 0x2020
    4c34:	2020                	.insn	2, 0x2020
    4c36:	2020                	.insn	2, 0x2020
    4c38:	2020                	.insn	2, 0x2020
    4c3a:	2020                	.insn	2, 0x2020
    4c3c:	2320                	.insn	2, 0x2320
    4c3e:	20232323          	sw	sp,518(t1)
    4c42:	2020                	.insn	2, 0x2020
    4c44:	2320                	.insn	2, 0x2320
    4c46:	2020                	.insn	2, 0x2020
    4c48:	23202023          	sw	s2,544(zero) # 220 <init_text_ch+0x28>
    4c4c:	2020                	.insn	2, 0x2020
    4c4e:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    4c52:	2020                	.insn	2, 0x2020
    4c54:	2020                	.insn	2, 0x2020
    4c56:	2020                	.insn	2, 0x2020
    4c58:	2020                	.insn	2, 0x2020
    4c5a:	2020                	.insn	2, 0x2020
    4c5c:	20232023          	sw	sp,512(t1)
    4c60:	20232023          	sw	sp,512(t1)
    4c64:	2020                	.insn	2, 0x2020
    4c66:	23202023          	sw	s2,544(zero) # 220 <init_text_ch+0x28>
    4c6a:	2020                	.insn	2, 0x2020
    4c6c:	2320                	.insn	2, 0x2320
    4c6e:	2020                	.insn	2, 0x2020
    4c70:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    4c74:	23202023          	sw	s2,544(zero) # 220 <init_text_ch+0x28>
    4c78:	2020                	.insn	2, 0x2020
    4c7a:	2320                	.insn	2, 0x2320
    4c7c:	2020                	.insn	2, 0x2020
    4c7e:	2020                	.insn	2, 0x2020
    4c80:	2020                	.insn	2, 0x2020
    4c82:	2020                	.insn	2, 0x2020
    4c84:	2020                	.insn	2, 0x2020
    4c86:	2020                	.insn	2, 0x2020
    4c88:	2020                	.insn	2, 0x2020
    4c8a:	2020                	.insn	2, 0x2020
    4c8c:	2320                	.insn	2, 0x2320
    4c8e:	2020                	.insn	2, 0x2020
    4c90:	2320                	.insn	2, 0x2320
    4c92:	2020                	.insn	2, 0x2020
    4c94:	2320                	.insn	2, 0x2320
    4c96:	2020                	.insn	2, 0x2020
    4c98:	23202023          	sw	s2,544(zero) # 220 <init_text_ch+0x28>
    4c9c:	20232323          	sw	sp,518(t1)
    4ca0:	2020                	.insn	2, 0x2020
    4ca2:	2020                	.insn	2, 0x2020
    4ca4:	2020                	.insn	2, 0x2020
    4ca6:	2020                	.insn	2, 0x2020
    4ca8:	2020                	.insn	2, 0x2020
    4caa:	2020                	.insn	2, 0x2020
    4cac:	20232023          	sw	sp,512(t1)
    4cb0:	20232023          	sw	sp,512(t1)
    4cb4:	2020                	.insn	2, 0x2020
    4cb6:	23202023          	sw	s2,544(zero) # 220 <init_text_ch+0x28>
    4cba:	2020                	.insn	2, 0x2020
    4cbc:	2320                	.insn	2, 0x2320
    4cbe:	2020                	.insn	2, 0x2020
    4cc0:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    4cc4:	23202023          	sw	s2,544(zero) # 220 <init_text_ch+0x28>
    4cc8:	2020                	.insn	2, 0x2020
    4cca:	2320                	.insn	2, 0x2320
    4ccc:	2020                	.insn	2, 0x2020
    4cce:	2020                	.insn	2, 0x2020
    4cd0:	2020                	.insn	2, 0x2020
    4cd2:	2020                	.insn	2, 0x2020
    4cd4:	2020                	.insn	2, 0x2020
    4cd6:	2020                	.insn	2, 0x2020
    4cd8:	2020                	.insn	2, 0x2020
    4cda:	2020                	.insn	2, 0x2020
    4cdc:	2320                	.insn	2, 0x2320
    4cde:	2020                	.insn	2, 0x2020
    4ce0:	2320                	.insn	2, 0x2320
    4ce2:	2020                	.insn	2, 0x2020
    4ce4:	2020                	.insn	2, 0x2020
    4ce6:	20202323          	sw	sp,518(zero) # 206 <init_text_ch+0xe>
    4cea:	2320                	.insn	2, 0x2320
    4cec:	2020                	.insn	2, 0x2020
    4cee:	2020                	.insn	2, 0x2020
    4cf0:	2020                	.insn	2, 0x2020
    4cf2:	2020                	.insn	2, 0x2020
    4cf4:	2020                	.insn	2, 0x2020
    4cf6:	2020                	.insn	2, 0x2020
    4cf8:	2020                	.insn	2, 0x2020
    4cfa:	2020                	.insn	2, 0x2020
    4cfc:	20232023          	sw	sp,512(t1)
    4d00:	20232023          	sw	sp,512(t1)
    4d04:	2020                	.insn	2, 0x2020
    4d06:	23202023          	sw	s2,544(zero) # 220 <init_text_ch+0x28>
    4d0a:	2020                	.insn	2, 0x2020
    4d0c:	2320                	.insn	2, 0x2320
    4d0e:	2020                	.insn	2, 0x2020
    4d10:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    4d14:	23202023          	sw	s2,544(zero) # 220 <init_text_ch+0x28>
    4d18:	2020                	.insn	2, 0x2020
    4d1a:	2020                	.insn	2, 0x2020
    4d1c:	2020                	.insn	2, 0x2020
    4d1e:	2020                	.insn	2, 0x2020
    4d20:	2020                	.insn	2, 0x2020
    4d22:	2020                	.insn	2, 0x2020
    4d24:	2020                	.insn	2, 0x2020
    4d26:	2020                	.insn	2, 0x2020
    4d28:	2020                	.insn	2, 0x2020
    4d2a:	2020                	.insn	2, 0x2020
    4d2c:	2320                	.insn	2, 0x2320
    4d2e:	20232323          	sw	sp,518(t1)
    4d32:	2020                	.insn	2, 0x2020
    4d34:	2320                	.insn	2, 0x2320
    4d36:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    4d3a:	2020                	.insn	2, 0x2020
    4d3c:	20232323          	sw	sp,518(t1)
    4d40:	2020                	.insn	2, 0x2020
    4d42:	2020                	.insn	2, 0x2020
    4d44:	2020                	.insn	2, 0x2020
    4d46:	2020                	.insn	2, 0x2020
    4d48:	2020                	.insn	2, 0x2020
    4d4a:	2020                	.insn	2, 0x2020
    4d4c:	2320                	.insn	2, 0x2320
    4d4e:	2020                	.insn	2, 0x2020
    4d50:	2320                	.insn	2, 0x2320
    4d52:	2020                	.insn	2, 0x2020
    4d54:	2020                	.insn	2, 0x2020
    4d56:	2320                	.insn	2, 0x2320
    4d58:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    4d5c:	2320                	.insn	2, 0x2320
    4d5e:	2020                	.insn	2, 0x2020
    4d60:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    4d64:	2320                	.insn	2, 0x2320
    4d66:	20202323          	sw	sp,518(zero) # 206 <init_text_ch+0xe>
    4d6a:	2320                	.insn	2, 0x2320
    4d6c:	2020                	.insn	2, 0x2020
    4d6e:	2020                	.insn	2, 0x2020
    4d70:	2020                	.insn	2, 0x2020
    4d72:	2020                	.insn	2, 0x2020
    4d74:	2020                	.insn	2, 0x2020
    4d76:	2020                	.insn	2, 0x2020
    4d78:	2020                	.insn	2, 0x2020
    4d7a:	2020                	.insn	2, 0x2020
    4d7c:	2020                	.insn	2, 0x2020
    4d7e:	2020                	.insn	2, 0x2020
    4d80:	2020                	.insn	2, 0x2020
    4d82:	2020                	.insn	2, 0x2020
    4d84:	2020                	.insn	2, 0x2020
    4d86:	2020                	.insn	2, 0x2020
    4d88:	2020                	.insn	2, 0x2020
    4d8a:	2020                	.insn	2, 0x2020
    4d8c:	2020                	.insn	2, 0x2020
    4d8e:	2020                	.insn	2, 0x2020
    4d90:	2020                	.insn	2, 0x2020
    4d92:	2020                	.insn	2, 0x2020
    4d94:	2020                	.insn	2, 0x2020
    4d96:	2020                	.insn	2, 0x2020
    4d98:	2020                	.insn	2, 0x2020
    4d9a:	2020                	.insn	2, 0x2020
    4d9c:	2020                	.insn	2, 0x2020
    4d9e:	2020                	.insn	2, 0x2020
    4da0:	2020                	.insn	2, 0x2020
    4da2:	2020                	.insn	2, 0x2020
    4da4:	2020                	.insn	2, 0x2020
    4da6:	2020                	.insn	2, 0x2020
    4da8:	2020                	.insn	2, 0x2020
    4daa:	2020                	.insn	2, 0x2020
    4dac:	2020                	.insn	2, 0x2020
    4dae:	2020                	.insn	2, 0x2020
    4db0:	2020                	.insn	2, 0x2020
    4db2:	2020                	.insn	2, 0x2020
    4db4:	2020                	.insn	2, 0x2020
    4db6:	2020                	.insn	2, 0x2020
    4db8:	2020                	.insn	2, 0x2020
    4dba:	2020                	.insn	2, 0x2020
    4dbc:	2020                	.insn	2, 0x2020
    4dbe:	2020                	.insn	2, 0x2020
    4dc0:	2020                	.insn	2, 0x2020
    4dc2:	2020                	.insn	2, 0x2020
    4dc4:	2020                	.insn	2, 0x2020
    4dc6:	2020                	.insn	2, 0x2020
    4dc8:	2020                	.insn	2, 0x2020
    4dca:	2020                	.insn	2, 0x2020
    4dcc:	2020                	.insn	2, 0x2020
    4dce:	2020                	.insn	2, 0x2020
    4dd0:	2020                	.insn	2, 0x2020
    4dd2:	2020                	.insn	2, 0x2020
    4dd4:	2020                	.insn	2, 0x2020
    4dd6:	2020                	.insn	2, 0x2020
    4dd8:	2020                	.insn	2, 0x2020
    4dda:	2020                	.insn	2, 0x2020
    4ddc:	2020                	.insn	2, 0x2020
    4dde:	2020                	.insn	2, 0x2020
    4de0:	2020                	.insn	2, 0x2020
    4de2:	2020                	.insn	2, 0x2020
    4de4:	2020                	.insn	2, 0x2020
    4de6:	2020                	.insn	2, 0x2020
    4de8:	2020                	.insn	2, 0x2020
    4dea:	2020                	.insn	2, 0x2020
    4dec:	2020                	.insn	2, 0x2020
    4dee:	2020                	.insn	2, 0x2020
    4df0:	2020                	.insn	2, 0x2020
    4df2:	2020                	.insn	2, 0x2020
    4df4:	2020                	.insn	2, 0x2020
    4df6:	2020                	.insn	2, 0x2020
    4df8:	2020                	.insn	2, 0x2020
    4dfa:	2020                	.insn	2, 0x2020
    4dfc:	2020                	.insn	2, 0x2020
    4dfe:	2020                	.insn	2, 0x2020
    4e00:	2020                	.insn	2, 0x2020
    4e02:	2020                	.insn	2, 0x2020
    4e04:	2020                	.insn	2, 0x2020
    4e06:	2020                	.insn	2, 0x2020
    4e08:	2020                	.insn	2, 0x2020
    4e0a:	2020                	.insn	2, 0x2020
    4e0c:	2020                	.insn	2, 0x2020
    4e0e:	2020                	.insn	2, 0x2020
    4e10:	2020                	.insn	2, 0x2020
    4e12:	2020                	.insn	2, 0x2020
    4e14:	2020                	.insn	2, 0x2020
    4e16:	2020                	.insn	2, 0x2020
    4e18:	2020                	.insn	2, 0x2020
    4e1a:	2020                	.insn	2, 0x2020
    4e1c:	2020                	.insn	2, 0x2020
    4e1e:	2020                	.insn	2, 0x2020
    4e20:	2020                	.insn	2, 0x2020
    4e22:	2020                	.insn	2, 0x2020
    4e24:	2020                	.insn	2, 0x2020
    4e26:	2020                	.insn	2, 0x2020
    4e28:	2020                	.insn	2, 0x2020
    4e2a:	2020                	.insn	2, 0x2020
    4e2c:	2020                	.insn	2, 0x2020
    4e2e:	2020                	.insn	2, 0x2020
    4e30:	2020                	.insn	2, 0x2020
    4e32:	2020                	.insn	2, 0x2020
    4e34:	2020                	.insn	2, 0x2020
    4e36:	2020                	.insn	2, 0x2020
    4e38:	2020                	.insn	2, 0x2020
    4e3a:	2020                	.insn	2, 0x2020
    4e3c:	2020                	.insn	2, 0x2020
    4e3e:	2020                	.insn	2, 0x2020
    4e40:	2020                	.insn	2, 0x2020
    4e42:	2020                	.insn	2, 0x2020
    4e44:	2020                	.insn	2, 0x2020
    4e46:	2020                	.insn	2, 0x2020
    4e48:	2020                	.insn	2, 0x2020
    4e4a:	2020                	.insn	2, 0x2020
    4e4c:	2020                	.insn	2, 0x2020
    4e4e:	2020                	.insn	2, 0x2020
    4e50:	2020                	.insn	2, 0x2020
    4e52:	2020                	.insn	2, 0x2020
    4e54:	2020                	.insn	2, 0x2020
    4e56:	2020                	.insn	2, 0x2020
    4e58:	2020                	.insn	2, 0x2020
    4e5a:	2020                	.insn	2, 0x2020
    4e5c:	2020                	.insn	2, 0x2020
    4e5e:	2020                	.insn	2, 0x2020
    4e60:	2020                	.insn	2, 0x2020
    4e62:	2020                	.insn	2, 0x2020
    4e64:	2020                	.insn	2, 0x2020
    4e66:	2020                	.insn	2, 0x2020
    4e68:	2020                	.insn	2, 0x2020
    4e6a:	2020                	.insn	2, 0x2020
    4e6c:	2020                	.insn	2, 0x2020
    4e6e:	2020                	.insn	2, 0x2020
    4e70:	2020                	.insn	2, 0x2020
    4e72:	2020                	.insn	2, 0x2020
    4e74:	2020                	.insn	2, 0x2020
    4e76:	2020                	.insn	2, 0x2020
    4e78:	2020                	.insn	2, 0x2020
    4e7a:	2020                	.insn	2, 0x2020
    4e7c:	2020                	.insn	2, 0x2020
    4e7e:	2020                	.insn	2, 0x2020
    4e80:	2020                	.insn	2, 0x2020
    4e82:	2020                	.insn	2, 0x2020
    4e84:	2020                	.insn	2, 0x2020
    4e86:	2020                	.insn	2, 0x2020
    4e88:	2020                	.insn	2, 0x2020
    4e8a:	2020                	.insn	2, 0x2020
    4e8c:	2020                	.insn	2, 0x2020
    4e8e:	2020                	.insn	2, 0x2020
    4e90:	2020                	.insn	2, 0x2020
    4e92:	2020                	.insn	2, 0x2020
    4e94:	2020                	.insn	2, 0x2020
    4e96:	2020                	.insn	2, 0x2020
    4e98:	2020                	.insn	2, 0x2020
    4e9a:	2020                	.insn	2, 0x2020
    4e9c:	2020                	.insn	2, 0x2020
    4e9e:	2020                	.insn	2, 0x2020
    4ea0:	2020                	.insn	2, 0x2020
    4ea2:	2020                	.insn	2, 0x2020
    4ea4:	2020                	.insn	2, 0x2020
    4ea6:	2020                	.insn	2, 0x2020
    4ea8:	2020                	.insn	2, 0x2020
    4eaa:	2020                	.insn	2, 0x2020
    4eac:	2020                	.insn	2, 0x2020
    4eae:	2020                	.insn	2, 0x2020
    4eb0:	2020                	.insn	2, 0x2020
    4eb2:	2020                	.insn	2, 0x2020
    4eb4:	2020                	.insn	2, 0x2020
    4eb6:	2020                	.insn	2, 0x2020
    4eb8:	2020                	.insn	2, 0x2020
    4eba:	2020                	.insn	2, 0x2020
    4ebc:	2020                	.insn	2, 0x2020
    4ebe:	2020                	.insn	2, 0x2020
    4ec0:	2020                	.insn	2, 0x2020
    4ec2:	2020                	.insn	2, 0x2020
    4ec4:	2020                	.insn	2, 0x2020
    4ec6:	2020                	.insn	2, 0x2020
    4ec8:	2020                	.insn	2, 0x2020
    4eca:	2020                	.insn	2, 0x2020
    4ecc:	2020                	.insn	2, 0x2020
    4ece:	2020                	.insn	2, 0x2020
    4ed0:	2020                	.insn	2, 0x2020
    4ed2:	2020                	.insn	2, 0x2020
    4ed4:	2020                	.insn	2, 0x2020
    4ed6:	2020                	.insn	2, 0x2020
    4ed8:	2020                	.insn	2, 0x2020
    4eda:	2020                	.insn	2, 0x2020
    4edc:	2020                	.insn	2, 0x2020
    4ede:	2020                	.insn	2, 0x2020
    4ee0:	2020                	.insn	2, 0x2020
    4ee2:	2020                	.insn	2, 0x2020
    4ee4:	2020                	.insn	2, 0x2020
    4ee6:	2020                	.insn	2, 0x2020
    4ee8:	2020                	.insn	2, 0x2020
    4eea:	2020                	.insn	2, 0x2020
    4eec:	2020                	.insn	2, 0x2020
    4eee:	2020                	.insn	2, 0x2020
    4ef0:	2020                	.insn	2, 0x2020
    4ef2:	2020                	.insn	2, 0x2020
    4ef4:	2020                	.insn	2, 0x2020
    4ef6:	2020                	.insn	2, 0x2020
    4ef8:	2020                	.insn	2, 0x2020
    4efa:	2020                	.insn	2, 0x2020
    4efc:	2020                	.insn	2, 0x2020
    4efe:	2020                	.insn	2, 0x2020
    4f00:	2020                	.insn	2, 0x2020
    4f02:	2020                	.insn	2, 0x2020
    4f04:	2020                	.insn	2, 0x2020
    4f06:	2020                	.insn	2, 0x2020
    4f08:	2020                	.insn	2, 0x2020
    4f0a:	2020                	.insn	2, 0x2020
    4f0c:	2020                	.insn	2, 0x2020
    4f0e:	2020                	.insn	2, 0x2020
    4f10:	2020                	.insn	2, 0x2020
    4f12:	2020                	.insn	2, 0x2020
    4f14:	2020                	.insn	2, 0x2020
    4f16:	2020                	.insn	2, 0x2020
    4f18:	2020                	.insn	2, 0x2020
    4f1a:	2020                	.insn	2, 0x2020
    4f1c:	2020                	.insn	2, 0x2020
    4f1e:	2020                	.insn	2, 0x2020
    4f20:	2020                	.insn	2, 0x2020
    4f22:	2020                	.insn	2, 0x2020
    4f24:	2020                	.insn	2, 0x2020
    4f26:	2020                	.insn	2, 0x2020
    4f28:	2020                	.insn	2, 0x2020
    4f2a:	2020                	.insn	2, 0x2020
    4f2c:	2020                	.insn	2, 0x2020
    4f2e:	2020                	.insn	2, 0x2020
    4f30:	2020                	.insn	2, 0x2020
    4f32:	2020                	.insn	2, 0x2020
    4f34:	2020                	.insn	2, 0x2020
    4f36:	2020                	.insn	2, 0x2020
    4f38:	2020                	.insn	2, 0x2020
    4f3a:	2020                	.insn	2, 0x2020
    4f3c:	2020                	.insn	2, 0x2020
    4f3e:	2020                	.insn	2, 0x2020
    4f40:	2020                	.insn	2, 0x2020
    4f42:	2020                	.insn	2, 0x2020
    4f44:	2020                	.insn	2, 0x2020
    4f46:	2020                	.insn	2, 0x2020
    4f48:	2020                	.insn	2, 0x2020
    4f4a:	2020                	.insn	2, 0x2020
    4f4c:	2020                	.insn	2, 0x2020
    4f4e:	2020                	.insn	2, 0x2020
    4f50:	2020                	.insn	2, 0x2020
    4f52:	2020                	.insn	2, 0x2020
    4f54:	4242                	.insn	2, 0x4242
    4f56:	4242                	.insn	2, 0x4242
    4f58:	4242                	.insn	2, 0x4242
    4f5a:	4242                	.insn	2, 0x4242
    4f5c:	4242                	.insn	2, 0x4242
    4f5e:	4242                	.insn	2, 0x4242
    4f60:	4242                	.insn	2, 0x4242
    4f62:	4242                	.insn	2, 0x4242
    4f64:	4242                	.insn	2, 0x4242
    4f66:	4242                	.insn	2, 0x4242
    4f68:	4242                	.insn	2, 0x4242
    4f6a:	4242                	.insn	2, 0x4242
    4f6c:	4242                	.insn	2, 0x4242
    4f6e:	4242                	.insn	2, 0x4242
    4f70:	4242                	.insn	2, 0x4242
    4f72:	4242                	.insn	2, 0x4242
    4f74:	4242                	.insn	2, 0x4242
    4f76:	4242                	.insn	2, 0x4242
    4f78:	4242                	.insn	2, 0x4242
    4f7a:	4242                	.insn	2, 0x4242
    4f7c:	4242                	.insn	2, 0x4242
    4f7e:	4242                	.insn	2, 0x4242
    4f80:	4242                	.insn	2, 0x4242
    4f82:	4242                	.insn	2, 0x4242
    4f84:	4242                	.insn	2, 0x4242
    4f86:	4242                	.insn	2, 0x4242
    4f88:	4242                	.insn	2, 0x4242
    4f8a:	4242                	.insn	2, 0x4242
    4f8c:	4242                	.insn	2, 0x4242
    4f8e:	4242                	.insn	2, 0x4242
    4f90:	4242                	.insn	2, 0x4242
    4f92:	4242                	.insn	2, 0x4242
    4f94:	4242                	.insn	2, 0x4242
    4f96:	4242                	.insn	2, 0x4242
    4f98:	4242                	.insn	2, 0x4242
    4f9a:	4242                	.insn	2, 0x4242
    4f9c:	4242                	.insn	2, 0x4242
    4f9e:	4242                	.insn	2, 0x4242
    4fa0:	4242                	.insn	2, 0x4242
    4fa2:	4242                	.insn	2, 0x4242
    4fa4:	4242                	.insn	2, 0x4242
    4fa6:	4242                	.insn	2, 0x4242
    4fa8:	4242                	.insn	2, 0x4242
    4faa:	4242                	.insn	2, 0x4242
    4fac:	4242                	.insn	2, 0x4242
    4fae:	4242                	.insn	2, 0x4242
    4fb0:	4242                	.insn	2, 0x4242
    4fb2:	4242                	.insn	2, 0x4242
    4fb4:	4242                	.insn	2, 0x4242
    4fb6:	4242                	.insn	2, 0x4242
    4fb8:	4242                	.insn	2, 0x4242
    4fba:	4242                	.insn	2, 0x4242
    4fbc:	4242                	.insn	2, 0x4242
    4fbe:	4242                	.insn	2, 0x4242
    4fc0:	4242                	.insn	2, 0x4242
    4fc2:	4242                	.insn	2, 0x4242
    4fc4:	4242                	.insn	2, 0x4242
    4fc6:	4242                	.insn	2, 0x4242
    4fc8:	4242                	.insn	2, 0x4242
    4fca:	4242                	.insn	2, 0x4242
    4fcc:	4242                	.insn	2, 0x4242
    4fce:	4242                	.insn	2, 0x4242
    4fd0:	4242                	.insn	2, 0x4242
    4fd2:	4242                	.insn	2, 0x4242
    4fd4:	4242                	.insn	2, 0x4242
    4fd6:	4242                	.insn	2, 0x4242
    4fd8:	4242                	.insn	2, 0x4242
    4fda:	4242                	.insn	2, 0x4242
    4fdc:	4242                	.insn	2, 0x4242
    4fde:	4242                	.insn	2, 0x4242
    4fe0:	4242                	.insn	2, 0x4242
    4fe2:	4242                	.insn	2, 0x4242
    4fe4:	4242                	.insn	2, 0x4242
    4fe6:	4242                	.insn	2, 0x4242
    4fe8:	4242                	.insn	2, 0x4242
    4fea:	4242                	.insn	2, 0x4242
    4fec:	4242                	.insn	2, 0x4242
    4fee:	4242                	.insn	2, 0x4242
    4ff0:	4242                	.insn	2, 0x4242
    4ff2:	4242                	.insn	2, 0x4242
    4ff4:	2020                	.insn	2, 0x2020
    4ff6:	2020                	.insn	2, 0x2020
    4ff8:	2020                	.insn	2, 0x2020
    4ffa:	2020                	.insn	2, 0x2020
    4ffc:	2020                	.insn	2, 0x2020
    4ffe:	2020                	.insn	2, 0x2020
    5000:	2020                	.insn	2, 0x2020
    5002:	2020                	.insn	2, 0x2020
    5004:	2020                	.insn	2, 0x2020
    5006:	2020                	.insn	2, 0x2020
    5008:	2020                	.insn	2, 0x2020
    500a:	2020                	.insn	2, 0x2020
    500c:	2020                	.insn	2, 0x2020
    500e:	2020                	.insn	2, 0x2020
    5010:	2020                	.insn	2, 0x2020
    5012:	2020                	.insn	2, 0x2020
    5014:	2020                	.insn	2, 0x2020
    5016:	2020                	.insn	2, 0x2020
    5018:	2020                	.insn	2, 0x2020
    501a:	2020                	.insn	2, 0x2020
    501c:	2020                	.insn	2, 0x2020
    501e:	2020                	.insn	2, 0x2020
    5020:	2020                	.insn	2, 0x2020
    5022:	2020                	.insn	2, 0x2020
    5024:	2020                	.insn	2, 0x2020
    5026:	2020                	.insn	2, 0x2020
    5028:	2020                	.insn	2, 0x2020
    502a:	2020                	.insn	2, 0x2020
    502c:	2020                	.insn	2, 0x2020
    502e:	2020                	.insn	2, 0x2020
    5030:	2020                	.insn	2, 0x2020
    5032:	2020                	.insn	2, 0x2020
    5034:	2020                	.insn	2, 0x2020
    5036:	2020                	.insn	2, 0x2020
    5038:	2020                	.insn	2, 0x2020
    503a:	2020                	.insn	2, 0x2020
    503c:	2020                	.insn	2, 0x2020
    503e:	2020                	.insn	2, 0x2020
    5040:	2020                	.insn	2, 0x2020
    5042:	2020                	.insn	2, 0x2020
    5044:	2020                	.insn	2, 0x2020
    5046:	2020                	.insn	2, 0x2020
    5048:	2020                	.insn	2, 0x2020
    504a:	2020                	.insn	2, 0x2020
    504c:	2020                	.insn	2, 0x2020
    504e:	2020                	.insn	2, 0x2020
    5050:	2020                	.insn	2, 0x2020
    5052:	2020                	.insn	2, 0x2020
    5054:	2020                	.insn	2, 0x2020
    5056:	2020                	.insn	2, 0x2020
    5058:	2020                	.insn	2, 0x2020
    505a:	2020                	.insn	2, 0x2020
    505c:	2020                	.insn	2, 0x2020
    505e:	2020                	.insn	2, 0x2020
    5060:	2020                	.insn	2, 0x2020
    5062:	2020                	.insn	2, 0x2020
    5064:	2020                	.insn	2, 0x2020
    5066:	2020                	.insn	2, 0x2020
    5068:	2020                	.insn	2, 0x2020
    506a:	2020                	.insn	2, 0x2020
    506c:	2020                	.insn	2, 0x2020
    506e:	2020                	.insn	2, 0x2020
    5070:	2020                	.insn	2, 0x2020
    5072:	2020                	.insn	2, 0x2020
    5074:	2020                	.insn	2, 0x2020
    5076:	2020                	.insn	2, 0x2020
    5078:	2020                	.insn	2, 0x2020
    507a:	2020                	.insn	2, 0x2020
    507c:	2020                	.insn	2, 0x2020
    507e:	2020                	.insn	2, 0x2020
    5080:	2020                	.insn	2, 0x2020
    5082:	2020                	.insn	2, 0x2020
    5084:	2020                	.insn	2, 0x2020
    5086:	2020                	.insn	2, 0x2020
    5088:	2020                	.insn	2, 0x2020
    508a:	2020                	.insn	2, 0x2020
    508c:	2020                	.insn	2, 0x2020
    508e:	2020                	.insn	2, 0x2020
    5090:	2020                	.insn	2, 0x2020
    5092:	2020                	.insn	2, 0x2020
    5094:	2020                	.insn	2, 0x2020
    5096:	2020                	.insn	2, 0x2020
    5098:	2020                	.insn	2, 0x2020
    509a:	2020                	.insn	2, 0x2020
    509c:	2020                	.insn	2, 0x2020
    509e:	2020                	.insn	2, 0x2020
    50a0:	2020                	.insn	2, 0x2020
    50a2:	2020                	.insn	2, 0x2020
    50a4:	2020                	.insn	2, 0x2020
    50a6:	2020                	.insn	2, 0x2020
    50a8:	2020                	.insn	2, 0x2020
    50aa:	2020                	.insn	2, 0x2020
    50ac:	2020                	.insn	2, 0x2020
    50ae:	2020                	.insn	2, 0x2020
    50b0:	2020                	.insn	2, 0x2020
    50b2:	2020                	.insn	2, 0x2020
    50b4:	2020                	.insn	2, 0x2020
    50b6:	2020                	.insn	2, 0x2020
    50b8:	2020                	.insn	2, 0x2020
    50ba:	2020                	.insn	2, 0x2020
    50bc:	2020                	.insn	2, 0x2020
    50be:	2020                	.insn	2, 0x2020
    50c0:	2020                	.insn	2, 0x2020
    50c2:	2020                	.insn	2, 0x2020
    50c4:	2020                	.insn	2, 0x2020
    50c6:	2020                	.insn	2, 0x2020
    50c8:	2020                	.insn	2, 0x2020
    50ca:	2020                	.insn	2, 0x2020
    50cc:	2020                	.insn	2, 0x2020
    50ce:	2020                	.insn	2, 0x2020
    50d0:	2020                	.insn	2, 0x2020
    50d2:	2020                	.insn	2, 0x2020
    50d4:	2020                	.insn	2, 0x2020
    50d6:	2020                	.insn	2, 0x2020
    50d8:	2020                	.insn	2, 0x2020
    50da:	2020                	.insn	2, 0x2020
    50dc:	2020                	.insn	2, 0x2020
    50de:	2020                	.insn	2, 0x2020
    50e0:	2020                	.insn	2, 0x2020
    50e2:	2020                	.insn	2, 0x2020
    50e4:	2020                	.insn	2, 0x2020
    50e6:	2020                	.insn	2, 0x2020
    50e8:	2020                	.insn	2, 0x2020
    50ea:	2020                	.insn	2, 0x2020
    50ec:	2020                	.insn	2, 0x2020
    50ee:	2020                	.insn	2, 0x2020
    50f0:	2020                	.insn	2, 0x2020
    50f2:	2020                	.insn	2, 0x2020
    50f4:	2020                	.insn	2, 0x2020
    50f6:	2020                	.insn	2, 0x2020
    50f8:	2020                	.insn	2, 0x2020
    50fa:	2020                	.insn	2, 0x2020
    50fc:	2020                	.insn	2, 0x2020
    50fe:	2020                	.insn	2, 0x2020
    5100:	2020                	.insn	2, 0x2020
    5102:	2020                	.insn	2, 0x2020
    5104:	2020                	.insn	2, 0x2020
    5106:	2020                	.insn	2, 0x2020
    5108:	2020                	.insn	2, 0x2020
    510a:	2020                	.insn	2, 0x2020
    510c:	2020                	.insn	2, 0x2020
    510e:	2020                	.insn	2, 0x2020
    5110:	2020                	.insn	2, 0x2020
    5112:	2020                	.insn	2, 0x2020
    5114:	2020                	.insn	2, 0x2020
    5116:	2020                	.insn	2, 0x2020
    5118:	2020                	.insn	2, 0x2020
    511a:	2020                	.insn	2, 0x2020
    511c:	2020                	.insn	2, 0x2020
    511e:	2020                	.insn	2, 0x2020
    5120:	2020                	.insn	2, 0x2020
    5122:	2020                	.insn	2, 0x2020
    5124:	2020                	.insn	2, 0x2020
    5126:	2020                	.insn	2, 0x2020
    5128:	2020                	.insn	2, 0x2020
    512a:	2020                	.insn	2, 0x2020
    512c:	2020                	.insn	2, 0x2020
    512e:	2020                	.insn	2, 0x2020
    5130:	2020                	.insn	2, 0x2020
    5132:	2020                	.insn	2, 0x2020
    5134:	2020                	.insn	2, 0x2020
    5136:	2020                	.insn	2, 0x2020
    5138:	2020                	.insn	2, 0x2020
    513a:	2020                	.insn	2, 0x2020
    513c:	2020                	.insn	2, 0x2020
    513e:	2020                	.insn	2, 0x2020
    5140:	2020                	.insn	2, 0x2020
    5142:	2020                	.insn	2, 0x2020
    5144:	2020                	.insn	2, 0x2020
    5146:	2020                	.insn	2, 0x2020
    5148:	2020                	.insn	2, 0x2020
    514a:	2020                	.insn	2, 0x2020
    514c:	2020                	.insn	2, 0x2020
    514e:	2020                	.insn	2, 0x2020
    5150:	2020                	.insn	2, 0x2020
    5152:	2020                	.insn	2, 0x2020
    5154:	2020                	.insn	2, 0x2020
    5156:	2020                	.insn	2, 0x2020
    5158:	2020                	.insn	2, 0x2020
    515a:	2020                	.insn	2, 0x2020
    515c:	2020                	.insn	2, 0x2020
    515e:	2020                	.insn	2, 0x2020
    5160:	2020                	.insn	2, 0x2020
    5162:	2020                	.insn	2, 0x2020
    5164:	2020                	.insn	2, 0x2020
    5166:	2020                	.insn	2, 0x2020
    5168:	2020                	.insn	2, 0x2020
    516a:	2020                	.insn	2, 0x2020
    516c:	2020                	.insn	2, 0x2020
    516e:	2020                	.insn	2, 0x2020
    5170:	2020                	.insn	2, 0x2020
    5172:	2020                	.insn	2, 0x2020
    5174:	2020                	.insn	2, 0x2020
    5176:	2020                	.insn	2, 0x2020
    5178:	2020                	.insn	2, 0x2020
    517a:	2020                	.insn	2, 0x2020
    517c:	2020                	.insn	2, 0x2020
    517e:	2020                	.insn	2, 0x2020
    5180:	2020                	.insn	2, 0x2020
    5182:	2020                	.insn	2, 0x2020
    5184:	2020                	.insn	2, 0x2020
    5186:	2020                	.insn	2, 0x2020
    5188:	2020                	.insn	2, 0x2020
    518a:	2020                	.insn	2, 0x2020
    518c:	2020                	.insn	2, 0x2020
    518e:	2020                	.insn	2, 0x2020
    5190:	2020                	.insn	2, 0x2020
    5192:	2020                	.insn	2, 0x2020
    5194:	2020                	.insn	2, 0x2020
    5196:	2020                	.insn	2, 0x2020
    5198:	2020                	.insn	2, 0x2020
    519a:	2020                	.insn	2, 0x2020
    519c:	2020                	.insn	2, 0x2020
    519e:	2020                	.insn	2, 0x2020
    51a0:	2020                	.insn	2, 0x2020
    51a2:	2020                	.insn	2, 0x2020
    51a4:	2020                	.insn	2, 0x2020
    51a6:	2020                	.insn	2, 0x2020
    51a8:	2020                	.insn	2, 0x2020
    51aa:	2020                	.insn	2, 0x2020
    51ac:	2020                	.insn	2, 0x2020
    51ae:	2020                	.insn	2, 0x2020
    51b0:	2020                	.insn	2, 0x2020
    51b2:	2020                	.insn	2, 0x2020
    51b4:	2020                	.insn	2, 0x2020
    51b6:	2020                	.insn	2, 0x2020
    51b8:	2020                	.insn	2, 0x2020
    51ba:	2020                	.insn	2, 0x2020
    51bc:	2020                	.insn	2, 0x2020
    51be:	2020                	.insn	2, 0x2020
    51c0:	2020                	.insn	2, 0x2020
    51c2:	2020                	.insn	2, 0x2020
    51c4:	2020                	.insn	2, 0x2020
    51c6:	2020                	.insn	2, 0x2020
    51c8:	2020                	.insn	2, 0x2020
    51ca:	2020                	.insn	2, 0x2020
    51cc:	2020                	.insn	2, 0x2020
    51ce:	2020                	.insn	2, 0x2020
    51d0:	2020                	.insn	2, 0x2020
    51d2:	2020                	.insn	2, 0x2020
    51d4:	2020                	.insn	2, 0x2020
    51d6:	2020                	.insn	2, 0x2020
    51d8:	2020                	.insn	2, 0x2020
    51da:	2020                	.insn	2, 0x2020
    51dc:	2020                	.insn	2, 0x2020
    51de:	2020                	.insn	2, 0x2020
    51e0:	2020                	.insn	2, 0x2020
    51e2:	2020                	.insn	2, 0x2020
    51e4:	2020                	.insn	2, 0x2020
    51e6:	2020                	.insn	2, 0x2020
    51e8:	2020                	.insn	2, 0x2020
    51ea:	2020                	.insn	2, 0x2020
    51ec:	2020                	.insn	2, 0x2020
    51ee:	2020                	.insn	2, 0x2020
    51f0:	2020                	.insn	2, 0x2020
    51f2:	2020                	.insn	2, 0x2020
    51f4:	2020                	.insn	2, 0x2020
    51f6:	2020                	.insn	2, 0x2020
    51f8:	2020                	.insn	2, 0x2020
    51fa:	2020                	.insn	2, 0x2020
    51fc:	2020                	.insn	2, 0x2020
    51fe:	2020                	.insn	2, 0x2020
    5200:	2020                	.insn	2, 0x2020
    5202:	2020                	.insn	2, 0x2020
    5204:	2020                	.insn	2, 0x2020
    5206:	2020                	.insn	2, 0x2020
    5208:	2020                	.insn	2, 0x2020
    520a:	2020                	.insn	2, 0x2020
    520c:	2020                	.insn	2, 0x2020
    520e:	2020                	.insn	2, 0x2020
    5210:	2020                	.insn	2, 0x2020
    5212:	2020                	.insn	2, 0x2020
    5214:	2020                	.insn	2, 0x2020
    5216:	2020                	.insn	2, 0x2020
    5218:	2020                	.insn	2, 0x2020
    521a:	2020                	.insn	2, 0x2020
    521c:	2020                	.insn	2, 0x2020
    521e:	2020                	.insn	2, 0x2020
    5220:	2020                	.insn	2, 0x2020
    5222:	2020                	.insn	2, 0x2020
    5224:	2020                	.insn	2, 0x2020
    5226:	2020                	.insn	2, 0x2020
    5228:	2020                	.insn	2, 0x2020
    522a:	2020                	.insn	2, 0x2020
    522c:	2020                	.insn	2, 0x2020
    522e:	2020                	.insn	2, 0x2020
    5230:	2020                	.insn	2, 0x2020
    5232:	2020                	.insn	2, 0x2020
    5234:	2020                	.insn	2, 0x2020
    5236:	2020                	.insn	2, 0x2020
    5238:	2020                	.insn	2, 0x2020
    523a:	2020                	.insn	2, 0x2020
    523c:	2020                	.insn	2, 0x2020
    523e:	2020                	.insn	2, 0x2020
    5240:	2020                	.insn	2, 0x2020
    5242:	2020                	.insn	2, 0x2020
    5244:	4920                	.insn	2, 0x4920
    5246:	74692073          	csrs	0x746,s2
    524a:	7320                	.insn	2, 0x7320
    524c:	7265                	.insn	2, 0x7265
    524e:	6f69                	.insn	2, 0x6f69
    5250:	7375                	.insn	2, 0x7375
    5252:	796c                	.insn	2, 0x796c
    5254:	7920                	.insn	2, 0x7920
    5256:	2072756f          	jal	a0,2cc5c <_data_end+0x24c5c>
    525a:	7270                	.insn	2, 0x7270
    525c:	6172676f          	jal	a4,2c072 <_data_end+0x24072>
    5260:	3f6d                	.insn	2, 0x3f6d
    5262:	2820                	.insn	2, 0x2820
    5264:	44202943          	.insn	4, 0x44202943
    5268:	6c40                	.insn	2, 0x6c40
    526a:	233e4023          	.insn	4, 0x233e4023
    526e:	2020                	.insn	2, 0x2020
    5270:	2020                	.insn	2, 0x2020
    5272:	2020                	.insn	2, 0x2020
    5274:	2020                	.insn	2, 0x2020
    5276:	2020                	.insn	2, 0x2020
    5278:	2020                	.insn	2, 0x2020
    527a:	2020                	.insn	2, 0x2020
    527c:	2020                	.insn	2, 0x2020
    527e:	2020                	.insn	2, 0x2020
    5280:	2020                	.insn	2, 0x2020
    5282:	2020                	.insn	2, 0x2020
    5284:	2020                	.insn	2, 0x2020
    5286:	2020                	.insn	2, 0x2020
    5288:	2020                	.insn	2, 0x2020
    528a:	2020                	.insn	2, 0x2020
    528c:	2020                	.insn	2, 0x2020
    528e:	2020                	.insn	2, 0x2020
    5290:	2020                	.insn	2, 0x2020
    5292:	2020                	.insn	2, 0x2020
    5294:	2020                	.insn	2, 0x2020
    5296:	2020                	.insn	2, 0x2020
    5298:	2020                	.insn	2, 0x2020
    529a:	2020                	.insn	2, 0x2020
    529c:	2020                	.insn	2, 0x2020
    529e:	2020                	.insn	2, 0x2020
    52a0:	2020                	.insn	2, 0x2020
    52a2:	2020                	.insn	2, 0x2020
    52a4:	2020                	.insn	2, 0x2020
    52a6:	2020                	.insn	2, 0x2020
    52a8:	2020                	.insn	2, 0x2020
    52aa:	2020                	.insn	2, 0x2020
    52ac:	2020                	.insn	2, 0x2020
    52ae:	2020                	.insn	2, 0x2020
    52b0:	2020                	.insn	2, 0x2020
    52b2:	2020                	.insn	2, 0x2020
    52b4:	2020                	.insn	2, 0x2020
    52b6:	2020                	.insn	2, 0x2020
    52b8:	2020                	.insn	2, 0x2020
    52ba:	2020                	.insn	2, 0x2020
    52bc:	2020                	.insn	2, 0x2020
    52be:	2020                	.insn	2, 0x2020
    52c0:	2020                	.insn	2, 0x2020
    52c2:	2020                	.insn	2, 0x2020
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	.insn	4, 0x3a434347
   4:	2820                	.insn	2, 0x2820
   6:	39386367          	.insn	4, 0x39386367
   a:	6431                	.insn	2, 0x6431
   c:	6438                	.insn	2, 0x6438
   e:	65333263          	.insn	4, 0x65333263
  12:	2029                	.insn	2, 0x2029
  14:	3331                	.insn	2, 0x3331
  16:	322e                	.insn	2, 0x322e
  18:	302e                	.insn	2, 0x302e
	...

Disassembly of section .riscv.attributes:

00000000 <.riscv.attributes>:
   0:	2841                	.insn	2, 0x2841
   2:	0000                	.insn	2, 0x
   4:	7200                	.insn	2, 0x7200
   6:	7369                	.insn	2, 0x7369
   8:	01007663          	bgeu	zero,a6,14 <_start+0x14>
   c:	001e                	.insn	2, 0x001e
   e:	0000                	.insn	2, 0x
  10:	1004                	.insn	2, 0x1004
  12:	7205                	.insn	2, 0x7205
  14:	3376                	.insn	2, 0x3376
  16:	6932                	.insn	2, 0x6932
  18:	7032                	.insn	2, 0x7032
  1a:	5f31                	.insn	2, 0x5f31
  1c:	697a                	.insn	2, 0x697a
  1e:	32727363          	bgeu	tp,t2,344 <main+0x84>
  22:	3070                	.insn	2, 0x3070
  24:	0800                	.insn	2, 0x0800
  26:	0a01                	.insn	2, 0x0a01
  28:	Address 0x28 is out of bounds.

