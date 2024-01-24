
result.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00001197          	auipc	gp,0x1
   4:	c0018193          	add	gp,gp,-1024 # c00 <_gbl_ptr>
   8:	00002117          	auipc	sp,0x2
   c:	ef810113          	add	sp,sp,-264 # 1f00 <_stack_ptr>
  10:	00001297          	auipc	t0,0x1
  14:	6b828293          	add	t0,t0,1720 # 16c8 <to_change_screen>
  18:	00001317          	auipc	t1,0x1
  1c:	6b030313          	add	t1,t1,1712 # 16c8 <to_change_screen>

00000020 <_bss_init_loop>:
  20:	00534863          	blt	t1,t0,30 <_irq_config>
  24:	0002a023          	sw	zero,0(t0)
  28:	00428293          	add	t0,t0,4
  2c:	ff5ff06f          	j	20 <_bss_init_loop>

00000030 <_irq_config>:
  30:	05c00293          	li	t0,92
  34:	fff00313          	li	t1,-1
  38:	00002397          	auipc	t2,0x2
  3c:	3c838393          	add	t2,t2,968 # 2400 <_data_end>
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
  68:	00002097          	auipc	ra,0x2
  6c:	e9808093          	add	ra,ra,-360 # 1f00 <_stack_ptr>
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
  c8:	288000ef          	jal	350 <int_handler>
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
 1dc:	95f78793          	add	a5,a5,-1697 # 95f <_trap_stack_size+0x45f>
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
 23c:	95f78793          	add	a5,a5,-1697 # 95f <_trap_stack_size+0x45f>
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
 26c:	0300006f          	j	29c <_stack_size+0x1c>
 270:	fec42783          	lw	a5,-20(s0)
 274:	fdc42703          	lw	a4,-36(s0)
 278:	00f70733          	add	a4,a4,a5
 27c:	070006b7          	lui	a3,0x7000
 280:	fec42783          	lw	a5,-20(s0)
 284:	00f687b3          	add	a5,a3,a5
 288:	00074703          	lbu	a4,0(a4) # 7000000 <_data_end+0x6ffdc00>
 28c:	00e78023          	sb	a4,0(a5)
 290:	fec42783          	lw	a5,-20(s0)
 294:	00178793          	add	a5,a5,1
 298:	fef42623          	sw	a5,-20(s0)
 29c:	fec42703          	lw	a4,-20(s0)
 2a0:	000017b7          	lui	a5,0x1
 2a4:	95f78793          	add	a5,a5,-1697 # 95f <_trap_stack_size+0x45f>
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
 2d8:	000017b7          	lui	a5,0x1
 2dc:	6c07a423          	sw	zero,1736(a5) # 16c8 <to_change_screen>
 2e0:	000017b7          	lui	a5,0x1
 2e4:	6c07a623          	sw	zero,1740(a5) # 16cc <finish>
 2e8:	030007b7          	lui	a5,0x3000
 2ec:	00100713          	li	a4,1
 2f0:	02e7a223          	sw	a4,36(a5) # 3000024 <_data_end+0x2ffdc24>
 2f4:	00700613          	li	a2,7
 2f8:	00300593          	li	a1,3
 2fc:	00000513          	li	a0,0
 300:	e29ff0ef          	jal	128 <init_color>
 304:	40000513          	li	a0,1024
 308:	f51ff0ef          	jal	258 <init_text>
 30c:	000017b7          	lui	a5,0x1
 310:	6c87a783          	lw	a5,1736(a5) # 16c8 <to_change_screen>
 314:	fe078ce3          	beqz	a5,30c <main+0x4c>
 318:	000017b7          	lui	a5,0x1
 31c:	6cc7a783          	lw	a5,1740(a5) # 16cc <finish>
 320:	fe0796e3          	bnez	a5,30c <main+0x4c>
 324:	00700613          	li	a2,7
 328:	00400593          	li	a1,4
 32c:	00000513          	li	a0,0
 330:	df9ff0ef          	jal	128 <init_color>
 334:	000017b7          	lui	a5,0x1
 338:	d6478513          	add	a0,a5,-668 # d64 <g_goodbye_str>
 33c:	f1dff0ef          	jal	258 <init_text>
 340:	000017b7          	lui	a5,0x1
 344:	00100713          	li	a4,1
 348:	6ce7a623          	sw	a4,1740(a5) # 16cc <finish>
 34c:	fc1ff06f          	j	30c <main+0x4c>

00000350 <int_handler>:
 350:	ff010113          	add	sp,sp,-16
 354:	00812623          	sw	s0,12(sp)
 358:	01010413          	add	s0,sp,16
 35c:	030007b7          	lui	a5,0x3000
 360:	0047a783          	lw	a5,4(a5) # 3000004 <_data_end+0x2ffdc04>
 364:	00078e63          	beqz	a5,380 <int_handler+0x30>
 368:	000017b7          	lui	a5,0x1
 36c:	6c87a783          	lw	a5,1736(a5) # 16c8 <to_change_screen>
 370:	00079863          	bnez	a5,380 <int_handler+0x30>
 374:	000017b7          	lui	a5,0x1
 378:	00100713          	li	a4,1
 37c:	6ce7a423          	sw	a4,1736(a5) # 16c8 <to_change_screen>
 380:	00000013          	nop
 384:	00c12403          	lw	s0,12(sp)
 388:	01010113          	add	sp,sp,16
 38c:	00008067          	ret

Disassembly of section .data:

00000400 <g_hello_str>:
     400:	2020                	.insn	2, 0x2020
     402:	2020                	.insn	2, 0x2020
     404:	2020                	.insn	2, 0x2020
     406:	2020                	.insn	2, 0x2020
     408:	2020                	.insn	2, 0x2020
     40a:	2020                	.insn	2, 0x2020
     40c:	2020                	.insn	2, 0x2020
     40e:	2020                	.insn	2, 0x2020
     410:	2020                	.insn	2, 0x2020
     412:	2020                	.insn	2, 0x2020
     414:	2020                	.insn	2, 0x2020
     416:	2020                	.insn	2, 0x2020
     418:	2020                	.insn	2, 0x2020
     41a:	2020                	.insn	2, 0x2020
     41c:	2020                	.insn	2, 0x2020
     41e:	2020                	.insn	2, 0x2020
     420:	2020                	.insn	2, 0x2020
     422:	2020                	.insn	2, 0x2020
     424:	2020                	.insn	2, 0x2020
     426:	2020                	.insn	2, 0x2020
     428:	2020                	.insn	2, 0x2020
     42a:	2020                	.insn	2, 0x2020
     42c:	2020                	.insn	2, 0x2020
     42e:	2020                	.insn	2, 0x2020
     430:	2020                	.insn	2, 0x2020
     432:	2020                	.insn	2, 0x2020
     434:	2020                	.insn	2, 0x2020
     436:	2020                	.insn	2, 0x2020
     438:	2020                	.insn	2, 0x2020
     43a:	2020                	.insn	2, 0x2020
     43c:	2020                	.insn	2, 0x2020
     43e:	2020                	.insn	2, 0x2020
     440:	2020                	.insn	2, 0x2020
     442:	2020                	.insn	2, 0x2020
     444:	2020                	.insn	2, 0x2020
     446:	2020                	.insn	2, 0x2020
     448:	2020                	.insn	2, 0x2020
     44a:	2020                	.insn	2, 0x2020
     44c:	2020                	.insn	2, 0x2020
     44e:	2020                	.insn	2, 0x2020
     450:	2020                	.insn	2, 0x2020
     452:	2020                	.insn	2, 0x2020
     454:	2020                	.insn	2, 0x2020
     456:	2020                	.insn	2, 0x2020
     458:	2020                	.insn	2, 0x2020
     45a:	2020                	.insn	2, 0x2020
     45c:	2020                	.insn	2, 0x2020
     45e:	2020                	.insn	2, 0x2020
     460:	2020                	.insn	2, 0x2020
     462:	2020                	.insn	2, 0x2020
     464:	2020                	.insn	2, 0x2020
     466:	2020                	.insn	2, 0x2020
     468:	2020                	.insn	2, 0x2020
     46a:	2020                	.insn	2, 0x2020
     46c:	2020                	.insn	2, 0x2020
     46e:	2020                	.insn	2, 0x2020
     470:	2020                	.insn	2, 0x2020
     472:	2020                	.insn	2, 0x2020
     474:	2020                	.insn	2, 0x2020
     476:	2020                	.insn	2, 0x2020
     478:	2020                	.insn	2, 0x2020
     47a:	2020                	.insn	2, 0x2020
     47c:	2020                	.insn	2, 0x2020
     47e:	2020                	.insn	2, 0x2020
     480:	2020                	.insn	2, 0x2020
     482:	2020                	.insn	2, 0x2020
     484:	2020                	.insn	2, 0x2020
     486:	2020                	.insn	2, 0x2020
     488:	2020                	.insn	2, 0x2020
     48a:	2020                	.insn	2, 0x2020
     48c:	2020                	.insn	2, 0x2020
     48e:	2020                	.insn	2, 0x2020
     490:	2020                	.insn	2, 0x2020
     492:	2020                	.insn	2, 0x2020
     494:	2020                	.insn	2, 0x2020
     496:	2020                	.insn	2, 0x2020
     498:	2020                	.insn	2, 0x2020
     49a:	2020                	.insn	2, 0x2020
     49c:	2020                	.insn	2, 0x2020
     49e:	2020                	.insn	2, 0x2020
     4a0:	2020                	.insn	2, 0x2020
     4a2:	2020                	.insn	2, 0x2020
     4a4:	2020                	.insn	2, 0x2020
     4a6:	2020                	.insn	2, 0x2020
     4a8:	2020                	.insn	2, 0x2020
     4aa:	2020                	.insn	2, 0x2020
     4ac:	2020                	.insn	2, 0x2020
     4ae:	2020                	.insn	2, 0x2020
     4b0:	2020                	.insn	2, 0x2020
     4b2:	2020                	.insn	2, 0x2020
     4b4:	2020                	.insn	2, 0x2020
     4b6:	2020                	.insn	2, 0x2020
     4b8:	2020                	.insn	2, 0x2020
     4ba:	2020                	.insn	2, 0x2020
     4bc:	2020                	.insn	2, 0x2020
     4be:	2020                	.insn	2, 0x2020
     4c0:	2020                	.insn	2, 0x2020
     4c2:	2020                	.insn	2, 0x2020
     4c4:	2020                	.insn	2, 0x2020
     4c6:	2020                	.insn	2, 0x2020
     4c8:	2020                	.insn	2, 0x2020
     4ca:	2020                	.insn	2, 0x2020
     4cc:	2020                	.insn	2, 0x2020
     4ce:	2020                	.insn	2, 0x2020
     4d0:	2020                	.insn	2, 0x2020
     4d2:	2020                	.insn	2, 0x2020
     4d4:	2020                	.insn	2, 0x2020
     4d6:	2020                	.insn	2, 0x2020
     4d8:	2020                	.insn	2, 0x2020
     4da:	2020                	.insn	2, 0x2020
     4dc:	2020                	.insn	2, 0x2020
     4de:	2020                	.insn	2, 0x2020
     4e0:	2020                	.insn	2, 0x2020
     4e2:	2020                	.insn	2, 0x2020
     4e4:	2020                	.insn	2, 0x2020
     4e6:	2020                	.insn	2, 0x2020
     4e8:	2020                	.insn	2, 0x2020
     4ea:	2020                	.insn	2, 0x2020
     4ec:	2020                	.insn	2, 0x2020
     4ee:	2020                	.insn	2, 0x2020
     4f0:	2020                	.insn	2, 0x2020
     4f2:	2020                	.insn	2, 0x2020
     4f4:	2020                	.insn	2, 0x2020
     4f6:	2020                	.insn	2, 0x2020
     4f8:	2020                	.insn	2, 0x2020
     4fa:	2020                	.insn	2, 0x2020
     4fc:	2020                	.insn	2, 0x2020
     4fe:	2020                	.insn	2, 0x2020
     500:	2020                	.insn	2, 0x2020
     502:	2020                	.insn	2, 0x2020
     504:	2020                	.insn	2, 0x2020
     506:	2020                	.insn	2, 0x2020
     508:	2020                	.insn	2, 0x2020
     50a:	2020                	.insn	2, 0x2020
     50c:	2020                	.insn	2, 0x2020
     50e:	2020                	.insn	2, 0x2020
     510:	2020                	.insn	2, 0x2020
     512:	2020                	.insn	2, 0x2020
     514:	2020                	.insn	2, 0x2020
     516:	2020                	.insn	2, 0x2020
     518:	2020                	.insn	2, 0x2020
     51a:	2020                	.insn	2, 0x2020
     51c:	2020                	.insn	2, 0x2020
     51e:	2020                	.insn	2, 0x2020
     520:	2020                	.insn	2, 0x2020
     522:	2020                	.insn	2, 0x2020
     524:	2020                	.insn	2, 0x2020
     526:	2020                	.insn	2, 0x2020
     528:	2020                	.insn	2, 0x2020
     52a:	2020                	.insn	2, 0x2020
     52c:	2020                	.insn	2, 0x2020
     52e:	2020                	.insn	2, 0x2020
     530:	2020                	.insn	2, 0x2020
     532:	2020                	.insn	2, 0x2020
     534:	2020                	.insn	2, 0x2020
     536:	2020                	.insn	2, 0x2020
     538:	2020                	.insn	2, 0x2020
     53a:	2020                	.insn	2, 0x2020
     53c:	2020                	.insn	2, 0x2020
     53e:	2020                	.insn	2, 0x2020
     540:	2020                	.insn	2, 0x2020
     542:	2020                	.insn	2, 0x2020
     544:	2020                	.insn	2, 0x2020
     546:	2020                	.insn	2, 0x2020
     548:	2020                	.insn	2, 0x2020
     54a:	2020                	.insn	2, 0x2020
     54c:	2020                	.insn	2, 0x2020
     54e:	2020                	.insn	2, 0x2020
     550:	2020                	.insn	2, 0x2020
     552:	2020                	.insn	2, 0x2020
     554:	2020                	.insn	2, 0x2020
     556:	2020                	.insn	2, 0x2020
     558:	2020                	.insn	2, 0x2020
     55a:	2020                	.insn	2, 0x2020
     55c:	2020                	.insn	2, 0x2020
     55e:	2020                	.insn	2, 0x2020
     560:	2020                	.insn	2, 0x2020
     562:	2020                	.insn	2, 0x2020
     564:	2020                	.insn	2, 0x2020
     566:	2020                	.insn	2, 0x2020
     568:	2020                	.insn	2, 0x2020
     56a:	2020                	.insn	2, 0x2020
     56c:	2020                	.insn	2, 0x2020
     56e:	2020                	.insn	2, 0x2020
     570:	2020                	.insn	2, 0x2020
     572:	2020                	.insn	2, 0x2020
     574:	2020                	.insn	2, 0x2020
     576:	2020                	.insn	2, 0x2020
     578:	2020                	.insn	2, 0x2020
     57a:	2020                	.insn	2, 0x2020
     57c:	2020                	.insn	2, 0x2020
     57e:	2020                	.insn	2, 0x2020
     580:	2020                	.insn	2, 0x2020
     582:	2020                	.insn	2, 0x2020
     584:	2020                	.insn	2, 0x2020
     586:	2020                	.insn	2, 0x2020
     588:	2020                	.insn	2, 0x2020
     58a:	2020                	.insn	2, 0x2020
     58c:	2020                	.insn	2, 0x2020
     58e:	2020                	.insn	2, 0x2020
     590:	2020                	.insn	2, 0x2020
     592:	2020                	.insn	2, 0x2020
     594:	2020                	.insn	2, 0x2020
     596:	2020                	.insn	2, 0x2020
     598:	2020                	.insn	2, 0x2020
     59a:	2020                	.insn	2, 0x2020
     59c:	2020                	.insn	2, 0x2020
     59e:	2020                	.insn	2, 0x2020
     5a0:	2020                	.insn	2, 0x2020
     5a2:	2020                	.insn	2, 0x2020
     5a4:	2020                	.insn	2, 0x2020
     5a6:	2020                	.insn	2, 0x2020
     5a8:	2020                	.insn	2, 0x2020
     5aa:	2020                	.insn	2, 0x2020
     5ac:	2020                	.insn	2, 0x2020
     5ae:	2020                	.insn	2, 0x2020
     5b0:	2020                	.insn	2, 0x2020
     5b2:	2020                	.insn	2, 0x2020
     5b4:	2020                	.insn	2, 0x2020
     5b6:	2020                	.insn	2, 0x2020
     5b8:	2020                	.insn	2, 0x2020
     5ba:	2020                	.insn	2, 0x2020
     5bc:	2020                	.insn	2, 0x2020
     5be:	2020                	.insn	2, 0x2020
     5c0:	2020                	.insn	2, 0x2020
     5c2:	2020                	.insn	2, 0x2020
     5c4:	2020                	.insn	2, 0x2020
     5c6:	2020                	.insn	2, 0x2020
     5c8:	2020                	.insn	2, 0x2020
     5ca:	2020                	.insn	2, 0x2020
     5cc:	2020                	.insn	2, 0x2020
     5ce:	2020                	.insn	2, 0x2020
     5d0:	2020                	.insn	2, 0x2020
     5d2:	2020                	.insn	2, 0x2020
     5d4:	2020                	.insn	2, 0x2020
     5d6:	2020                	.insn	2, 0x2020
     5d8:	2020                	.insn	2, 0x2020
     5da:	2020                	.insn	2, 0x2020
     5dc:	2020                	.insn	2, 0x2020
     5de:	2020                	.insn	2, 0x2020
     5e0:	2020                	.insn	2, 0x2020
     5e2:	2020                	.insn	2, 0x2020
     5e4:	2020                	.insn	2, 0x2020
     5e6:	2020                	.insn	2, 0x2020
     5e8:	2020                	.insn	2, 0x2020
     5ea:	2020                	.insn	2, 0x2020
     5ec:	2020                	.insn	2, 0x2020
     5ee:	2020                	.insn	2, 0x2020
     5f0:	2020                	.insn	2, 0x2020
     5f2:	2020                	.insn	2, 0x2020
     5f4:	2020                	.insn	2, 0x2020
     5f6:	2020                	.insn	2, 0x2020
     5f8:	2020                	.insn	2, 0x2020
     5fa:	2020                	.insn	2, 0x2020
     5fc:	2020                	.insn	2, 0x2020
     5fe:	2020                	.insn	2, 0x2020
     600:	2020                	.insn	2, 0x2020
     602:	2020                	.insn	2, 0x2020
     604:	2020                	.insn	2, 0x2020
     606:	2020                	.insn	2, 0x2020
     608:	2020                	.insn	2, 0x2020
     60a:	2020                	.insn	2, 0x2020
     60c:	2020                	.insn	2, 0x2020
     60e:	2020                	.insn	2, 0x2020
     610:	2020                	.insn	2, 0x2020
     612:	2020                	.insn	2, 0x2020
     614:	2020                	.insn	2, 0x2020
     616:	2020                	.insn	2, 0x2020
     618:	2020                	.insn	2, 0x2020
     61a:	2020                	.insn	2, 0x2020
     61c:	2020                	.insn	2, 0x2020
     61e:	2020                	.insn	2, 0x2020
     620:	2020                	.insn	2, 0x2020
     622:	2020                	.insn	2, 0x2020
     624:	2020                	.insn	2, 0x2020
     626:	2020                	.insn	2, 0x2020
     628:	2020                	.insn	2, 0x2020
     62a:	2020                	.insn	2, 0x2020
     62c:	2020                	.insn	2, 0x2020
     62e:	2020                	.insn	2, 0x2020
     630:	2020                	.insn	2, 0x2020
     632:	2020                	.insn	2, 0x2020
     634:	2020                	.insn	2, 0x2020
     636:	2020                	.insn	2, 0x2020
     638:	2020                	.insn	2, 0x2020
     63a:	2020                	.insn	2, 0x2020
     63c:	2020                	.insn	2, 0x2020
     63e:	2020                	.insn	2, 0x2020
     640:	2020                	.insn	2, 0x2020
     642:	2020                	.insn	2, 0x2020
     644:	2020                	.insn	2, 0x2020
     646:	2020                	.insn	2, 0x2020
     648:	2020                	.insn	2, 0x2020
     64a:	2020                	.insn	2, 0x2020
     64c:	2020                	.insn	2, 0x2020
     64e:	2020                	.insn	2, 0x2020
     650:	2020                	.insn	2, 0x2020
     652:	2020                	.insn	2, 0x2020
     654:	2020                	.insn	2, 0x2020
     656:	2020                	.insn	2, 0x2020
     658:	2020                	.insn	2, 0x2020
     65a:	2020                	.insn	2, 0x2020
     65c:	2020                	.insn	2, 0x2020
     65e:	2020                	.insn	2, 0x2020
     660:	2020                	.insn	2, 0x2020
     662:	2020                	.insn	2, 0x2020
     664:	2020                	.insn	2, 0x2020
     666:	2020                	.insn	2, 0x2020
     668:	2020                	.insn	2, 0x2020
     66a:	2020                	.insn	2, 0x2020
     66c:	2020                	.insn	2, 0x2020
     66e:	2020                	.insn	2, 0x2020
     670:	2020                	.insn	2, 0x2020
     672:	2020                	.insn	2, 0x2020
     674:	2020                	.insn	2, 0x2020
     676:	2020                	.insn	2, 0x2020
     678:	2020                	.insn	2, 0x2020
     67a:	2020                	.insn	2, 0x2020
     67c:	2020                	.insn	2, 0x2020
     67e:	2020                	.insn	2, 0x2020
     680:	2020                	.insn	2, 0x2020
     682:	2020                	.insn	2, 0x2020
     684:	2020                	.insn	2, 0x2020
     686:	2020                	.insn	2, 0x2020
     688:	2020                	.insn	2, 0x2020
     68a:	2020                	.insn	2, 0x2020
     68c:	2020                	.insn	2, 0x2020
     68e:	2020                	.insn	2, 0x2020
     690:	2020                	.insn	2, 0x2020
     692:	2020                	.insn	2, 0x2020
     694:	2020                	.insn	2, 0x2020
     696:	2020                	.insn	2, 0x2020
     698:	2020                	.insn	2, 0x2020
     69a:	2020                	.insn	2, 0x2020
     69c:	2020                	.insn	2, 0x2020
     69e:	2020                	.insn	2, 0x2020
     6a0:	2020                	.insn	2, 0x2020
     6a2:	2020                	.insn	2, 0x2020
     6a4:	2020                	.insn	2, 0x2020
     6a6:	2020                	.insn	2, 0x2020
     6a8:	2020                	.insn	2, 0x2020
     6aa:	2020                	.insn	2, 0x2020
     6ac:	2020                	.insn	2, 0x2020
     6ae:	2020                	.insn	2, 0x2020
     6b0:	2020                	.insn	2, 0x2020
     6b2:	2020                	.insn	2, 0x2020
     6b4:	2020                	.insn	2, 0x2020
     6b6:	2020                	.insn	2, 0x2020
     6b8:	2020                	.insn	2, 0x2020
     6ba:	2020                	.insn	2, 0x2020
     6bc:	2020                	.insn	2, 0x2020
     6be:	2020                	.insn	2, 0x2020
     6c0:	2020                	.insn	2, 0x2020
     6c2:	2020                	.insn	2, 0x2020
     6c4:	2020                	.insn	2, 0x2020
     6c6:	2020                	.insn	2, 0x2020
     6c8:	2020                	.insn	2, 0x2020
     6ca:	2020                	.insn	2, 0x2020
     6cc:	2020                	.insn	2, 0x2020
     6ce:	2020                	.insn	2, 0x2020
     6d0:	2020                	.insn	2, 0x2020
     6d2:	2020                	.insn	2, 0x2020
     6d4:	2020                	.insn	2, 0x2020
     6d6:	2020                	.insn	2, 0x2020
     6d8:	2020                	.insn	2, 0x2020
     6da:	2020                	.insn	2, 0x2020
     6dc:	2020                	.insn	2, 0x2020
     6de:	2020                	.insn	2, 0x2020
     6e0:	2020                	.insn	2, 0x2020
     6e2:	2020                	.insn	2, 0x2020
     6e4:	2020                	.insn	2, 0x2020
     6e6:	2020                	.insn	2, 0x2020
     6e8:	2020                	.insn	2, 0x2020
     6ea:	2020                	.insn	2, 0x2020
     6ec:	2020                	.insn	2, 0x2020
     6ee:	2020                	.insn	2, 0x2020
     6f0:	2020                	.insn	2, 0x2020
     6f2:	2020                	.insn	2, 0x2020
     6f4:	2020                	.insn	2, 0x2020
     6f6:	2020                	.insn	2, 0x2020
     6f8:	2020                	.insn	2, 0x2020
     6fa:	2020                	.insn	2, 0x2020
     6fc:	2020                	.insn	2, 0x2020
     6fe:	2020                	.insn	2, 0x2020
     700:	2020                	.insn	2, 0x2020
     702:	2020                	.insn	2, 0x2020
     704:	2020                	.insn	2, 0x2020
     706:	2020                	.insn	2, 0x2020
     708:	2020                	.insn	2, 0x2020
     70a:	2020                	.insn	2, 0x2020
     70c:	2020                	.insn	2, 0x2020
     70e:	2020                	.insn	2, 0x2020
     710:	2020                	.insn	2, 0x2020
     712:	2020                	.insn	2, 0x2020
     714:	2020                	.insn	2, 0x2020
     716:	2020                	.insn	2, 0x2020
     718:	2020                	.insn	2, 0x2020
     71a:	2020                	.insn	2, 0x2020
     71c:	2020                	.insn	2, 0x2020
     71e:	2020                	.insn	2, 0x2020
     720:	2020                	.insn	2, 0x2020
     722:	2020                	.insn	2, 0x2020
     724:	2320                	.insn	2, 0x2320
     726:	2020                	.insn	2, 0x2020
     728:	2320                	.insn	2, 0x2320
     72a:	2020                	.insn	2, 0x2020
     72c:	2020                	.insn	2, 0x2020
     72e:	2020                	.insn	2, 0x2020
     730:	2020                	.insn	2, 0x2020
     732:	2020                	.insn	2, 0x2020
     734:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     738:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     73c:	2020                	.insn	2, 0x2020
     73e:	2020                	.insn	2, 0x2020
     740:	2020                	.insn	2, 0x2020
     742:	2020                	.insn	2, 0x2020
     744:	2020                	.insn	2, 0x2020
     746:	2020                	.insn	2, 0x2020
     748:	2020                	.insn	2, 0x2020
     74a:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     74e:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     752:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     756:	2020                	.insn	2, 0x2020
     758:	2020                	.insn	2, 0x2020
     75a:	2020                	.insn	2, 0x2020
     75c:	2020                	.insn	2, 0x2020
     75e:	2320                	.insn	2, 0x2320
     760:	2020                	.insn	2, 0x2020
     762:	2020                	.insn	2, 0x2020
     764:	2020                	.insn	2, 0x2020
     766:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     76a:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     76e:	2020                	.insn	2, 0x2020
     770:	2020                	.insn	2, 0x2020
     772:	2020                	.insn	2, 0x2020
     774:	2320                	.insn	2, 0x2320
     776:	2020                	.insn	2, 0x2020
     778:	2320                	.insn	2, 0x2320
     77a:	2020                	.insn	2, 0x2020
     77c:	2020                	.insn	2, 0x2020
     77e:	2020                	.insn	2, 0x2020
     780:	2020                	.insn	2, 0x2020
     782:	2020                	.insn	2, 0x2020
     784:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     788:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     78c:	2020                	.insn	2, 0x2020
     78e:	2020                	.insn	2, 0x2020
     790:	2020                	.insn	2, 0x2020
     792:	2020                	.insn	2, 0x2020
     794:	2020                	.insn	2, 0x2020
     796:	2020                	.insn	2, 0x2020
     798:	2020                	.insn	2, 0x2020
     79a:	23202023          	sw	s2,544(zero) # 220 <init_text_ch+0x28>
     79e:	2320                	.insn	2, 0x2320
     7a0:	2020                	.insn	2, 0x2020
     7a2:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     7a6:	2020                	.insn	2, 0x2020
     7a8:	2020                	.insn	2, 0x2020
     7aa:	2020                	.insn	2, 0x2020
     7ac:	2020                	.insn	2, 0x2020
     7ae:	2320                	.insn	2, 0x2320
     7b0:	2020                	.insn	2, 0x2020
     7b2:	2020                	.insn	2, 0x2020
     7b4:	2020                	.insn	2, 0x2020
     7b6:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     7ba:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     7be:	2020                	.insn	2, 0x2020
     7c0:	2020                	.insn	2, 0x2020
     7c2:	2020                	.insn	2, 0x2020
     7c4:	2320                	.insn	2, 0x2320
     7c6:	2020                	.insn	2, 0x2020
     7c8:	2320                	.insn	2, 0x2320
     7ca:	2020                	.insn	2, 0x2020
     7cc:	2020                	.insn	2, 0x2020
     7ce:	20202323          	sw	sp,518(zero) # 206 <init_text_ch+0xe>
     7d2:	2020                	.insn	2, 0x2020
     7d4:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     7d8:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     7dc:	2320                	.insn	2, 0x2320
     7de:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     7e2:	2020                	.insn	2, 0x2020
     7e4:	2020                	.insn	2, 0x2020
     7e6:	2020                	.insn	2, 0x2020
     7e8:	2020                	.insn	2, 0x2020
     7ea:	2320                	.insn	2, 0x2320
     7ec:	2320                	.insn	2, 0x2320
     7ee:	2320                	.insn	2, 0x2320
     7f0:	2320                	.insn	2, 0x2320
     7f2:	2020                	.insn	2, 0x2020
     7f4:	2020                	.insn	2, 0x2020
     7f6:	20202323          	sw	sp,518(zero) # 206 <init_text_ch+0xe>
     7fa:	2020                	.insn	2, 0x2020
     7fc:	23202323          	sw	s2,550(zero) # 226 <init_text_ch+0x2e>
     800:	2020                	.insn	2, 0x2020
     802:	2020                	.insn	2, 0x2020
     804:	20232323          	sw	sp,518(t1)
     808:	2020                	.insn	2, 0x2020
     80a:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     80e:	2020                	.insn	2, 0x2020
     810:	2020                	.insn	2, 0x2020
     812:	2020                	.insn	2, 0x2020
     814:	2320                	.insn	2, 0x2320
     816:	23232323          	sw	s2,550(t1)
     81a:	2020                	.insn	2, 0x2020
     81c:	2320                	.insn	2, 0x2320
     81e:	2020                	.insn	2, 0x2020
     820:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     824:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     828:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     82c:	23202023          	sw	s2,544(zero) # 220 <init_text_ch+0x28>
     830:	2020                	.insn	2, 0x2020
     832:	2020                	.insn	2, 0x2020
     834:	2020                	.insn	2, 0x2020
     836:	2020                	.insn	2, 0x2020
     838:	2020                	.insn	2, 0x2020
     83a:	2320                	.insn	2, 0x2320
     83c:	2320                	.insn	2, 0x2320
     83e:	2320                	.insn	2, 0x2320
     840:	2320                	.insn	2, 0x2320
     842:	2020                	.insn	2, 0x2020
     844:	2320                	.insn	2, 0x2320
     846:	2020                	.insn	2, 0x2020
     848:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     84c:	23202023          	sw	s2,544(zero) # 220 <init_text_ch+0x28>
     850:	2020                	.insn	2, 0x2020
     852:	2320                	.insn	2, 0x2320
     854:	2020                	.insn	2, 0x2020
     856:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     85a:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     85e:	2020                	.insn	2, 0x2020
     860:	2020                	.insn	2, 0x2020
     862:	2020                	.insn	2, 0x2020
     864:	2320                	.insn	2, 0x2320
     866:	2020                	.insn	2, 0x2020
     868:	2320                	.insn	2, 0x2320
     86a:	2020                	.insn	2, 0x2020
     86c:	2320                	.insn	2, 0x2320
     86e:	20232323          	sw	sp,518(t1)
     872:	2020                	.insn	2, 0x2020
     874:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     878:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     87c:	23202023          	sw	s2,544(zero) # 220 <init_text_ch+0x28>
     880:	2020                	.insn	2, 0x2020
     882:	2020                	.insn	2, 0x2020
     884:	2020                	.insn	2, 0x2020
     886:	2020                	.insn	2, 0x2020
     888:	2020                	.insn	2, 0x2020
     88a:	2320                	.insn	2, 0x2320
     88c:	2320                	.insn	2, 0x2320
     88e:	2320                	.insn	2, 0x2320
     890:	2320                	.insn	2, 0x2320
     892:	2020                	.insn	2, 0x2020
     894:	2320                	.insn	2, 0x2320
     896:	2020                	.insn	2, 0x2020
     898:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     89c:	23202023          	sw	s2,544(zero) # 220 <init_text_ch+0x28>
     8a0:	2020                	.insn	2, 0x2020
     8a2:	2320                	.insn	2, 0x2320
     8a4:	2020                	.insn	2, 0x2020
     8a6:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     8aa:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     8ae:	2020                	.insn	2, 0x2020
     8b0:	2020                	.insn	2, 0x2020
     8b2:	2020                	.insn	2, 0x2020
     8b4:	2320                	.insn	2, 0x2320
     8b6:	2020                	.insn	2, 0x2020
     8b8:	2320                	.insn	2, 0x2320
     8ba:	2020                	.insn	2, 0x2020
     8bc:	2320                	.insn	2, 0x2320
     8be:	2020                	.insn	2, 0x2020
     8c0:	2020                	.insn	2, 0x2020
     8c2:	2020                	.insn	2, 0x2020
     8c4:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     8c8:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     8cc:	23202023          	sw	s2,544(zero) # 220 <init_text_ch+0x28>
     8d0:	2020                	.insn	2, 0x2020
     8d2:	2020                	.insn	2, 0x2020
     8d4:	2020                	.insn	2, 0x2020
     8d6:	2020                	.insn	2, 0x2020
     8d8:	2020                	.insn	2, 0x2020
     8da:	2320                	.insn	2, 0x2320
     8dc:	2320                	.insn	2, 0x2320
     8de:	2320                	.insn	2, 0x2320
     8e0:	2320                	.insn	2, 0x2320
     8e2:	2020                	.insn	2, 0x2020
     8e4:	2320                	.insn	2, 0x2320
     8e6:	2020                	.insn	2, 0x2020
     8e8:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     8ec:	23202023          	sw	s2,544(zero) # 220 <init_text_ch+0x28>
     8f0:	2020                	.insn	2, 0x2020
     8f2:	2320                	.insn	2, 0x2320
     8f4:	2020                	.insn	2, 0x2020
     8f6:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     8fa:	2020                	.insn	2, 0x2020
     8fc:	2020                	.insn	2, 0x2020
     8fe:	2020                	.insn	2, 0x2020
     900:	2020                	.insn	2, 0x2020
     902:	2020                	.insn	2, 0x2020
     904:	2320                	.insn	2, 0x2320
     906:	2020                	.insn	2, 0x2020
     908:	2320                	.insn	2, 0x2320
     90a:	2020                	.insn	2, 0x2020
     90c:	2020                	.insn	2, 0x2020
     90e:	20232323          	sw	sp,518(t1)
     912:	2020                	.insn	2, 0x2020
     914:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     918:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     91c:	2320                	.insn	2, 0x2320
     91e:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     922:	2020                	.insn	2, 0x2020
     924:	2020                	.insn	2, 0x2020
     926:	2020                	.insn	2, 0x2020
     928:	2020                	.insn	2, 0x2020
     92a:	2020                	.insn	2, 0x2020
     92c:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     930:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     934:	2020                	.insn	2, 0x2020
     936:	20202323          	sw	sp,518(zero) # 206 <init_text_ch+0xe>
     93a:	2020                	.insn	2, 0x2020
     93c:	23202023          	sw	s2,544(zero) # 220 <init_text_ch+0x28>
     940:	2020                	.insn	2, 0x2020
     942:	2020                	.insn	2, 0x2020
     944:	20232323          	sw	sp,518(t1)
     948:	2020                	.insn	2, 0x2020
     94a:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     94e:	2020                	.insn	2, 0x2020
     950:	2020                	.insn	2, 0x2020
     952:	2020                	.insn	2, 0x2020
     954:	2020                	.insn	2, 0x2020
     956:	2020                	.insn	2, 0x2020
     958:	2020                	.insn	2, 0x2020
     95a:	2020                	.insn	2, 0x2020
     95c:	2020                	.insn	2, 0x2020
     95e:	2020                	.insn	2, 0x2020
     960:	2020                	.insn	2, 0x2020
     962:	2020                	.insn	2, 0x2020
     964:	2020                	.insn	2, 0x2020
     966:	2020                	.insn	2, 0x2020
     968:	2020                	.insn	2, 0x2020
     96a:	2020                	.insn	2, 0x2020
     96c:	2020                	.insn	2, 0x2020
     96e:	2020                	.insn	2, 0x2020
     970:	2020                	.insn	2, 0x2020
     972:	2020                	.insn	2, 0x2020
     974:	2020                	.insn	2, 0x2020
     976:	2020                	.insn	2, 0x2020
     978:	2020                	.insn	2, 0x2020
     97a:	2020                	.insn	2, 0x2020
     97c:	2020                	.insn	2, 0x2020
     97e:	2020                	.insn	2, 0x2020
     980:	2020                	.insn	2, 0x2020
     982:	2020                	.insn	2, 0x2020
     984:	2020                	.insn	2, 0x2020
     986:	2020                	.insn	2, 0x2020
     988:	2020                	.insn	2, 0x2020
     98a:	2020                	.insn	2, 0x2020
     98c:	2020                	.insn	2, 0x2020
     98e:	2020                	.insn	2, 0x2020
     990:	2020                	.insn	2, 0x2020
     992:	2020                	.insn	2, 0x2020
     994:	2020                	.insn	2, 0x2020
     996:	2020                	.insn	2, 0x2020
     998:	2020                	.insn	2, 0x2020
     99a:	2020                	.insn	2, 0x2020
     99c:	2020                	.insn	2, 0x2020
     99e:	2020                	.insn	2, 0x2020
     9a0:	2020                	.insn	2, 0x2020
     9a2:	2020                	.insn	2, 0x2020
     9a4:	2020                	.insn	2, 0x2020
     9a6:	2020                	.insn	2, 0x2020
     9a8:	2020                	.insn	2, 0x2020
     9aa:	2020                	.insn	2, 0x2020
     9ac:	2020                	.insn	2, 0x2020
     9ae:	2020                	.insn	2, 0x2020
     9b0:	2020                	.insn	2, 0x2020
     9b2:	2020                	.insn	2, 0x2020
     9b4:	2020                	.insn	2, 0x2020
     9b6:	2020                	.insn	2, 0x2020
     9b8:	2020                	.insn	2, 0x2020
     9ba:	2020                	.insn	2, 0x2020
     9bc:	2020                	.insn	2, 0x2020
     9be:	2020                	.insn	2, 0x2020
     9c0:	2020                	.insn	2, 0x2020
     9c2:	2020                	.insn	2, 0x2020
     9c4:	2020                	.insn	2, 0x2020
     9c6:	2020                	.insn	2, 0x2020
     9c8:	2020                	.insn	2, 0x2020
     9ca:	2020                	.insn	2, 0x2020
     9cc:	2020                	.insn	2, 0x2020
     9ce:	2020                	.insn	2, 0x2020
     9d0:	2020                	.insn	2, 0x2020
     9d2:	2020                	.insn	2, 0x2020
     9d4:	2020                	.insn	2, 0x2020
     9d6:	2020                	.insn	2, 0x2020
     9d8:	2020                	.insn	2, 0x2020
     9da:	2020                	.insn	2, 0x2020
     9dc:	2020                	.insn	2, 0x2020
     9de:	2020                	.insn	2, 0x2020
     9e0:	2020                	.insn	2, 0x2020
     9e2:	2020                	.insn	2, 0x2020
     9e4:	2020                	.insn	2, 0x2020
     9e6:	2020                	.insn	2, 0x2020
     9e8:	2020                	.insn	2, 0x2020
     9ea:	2020                	.insn	2, 0x2020
     9ec:	2020                	.insn	2, 0x2020
     9ee:	2020                	.insn	2, 0x2020
     9f0:	4141                	.insn	2, 0x4141
     9f2:	4141                	.insn	2, 0x4141
     9f4:	4141                	.insn	2, 0x4141
     9f6:	4141                	.insn	2, 0x4141
     9f8:	4141                	.insn	2, 0x4141
     9fa:	4141                	.insn	2, 0x4141
     9fc:	4141                	.insn	2, 0x4141
     9fe:	4141                	.insn	2, 0x4141
     a00:	4141                	.insn	2, 0x4141
     a02:	4141                	.insn	2, 0x4141
     a04:	4141                	.insn	2, 0x4141
     a06:	4141                	.insn	2, 0x4141
     a08:	4141                	.insn	2, 0x4141
     a0a:	4141                	.insn	2, 0x4141
     a0c:	4141                	.insn	2, 0x4141
     a0e:	4141                	.insn	2, 0x4141
     a10:	4141                	.insn	2, 0x4141
     a12:	4141                	.insn	2, 0x4141
     a14:	4141                	.insn	2, 0x4141
     a16:	4141                	.insn	2, 0x4141
     a18:	4141                	.insn	2, 0x4141
     a1a:	4141                	.insn	2, 0x4141
     a1c:	4141                	.insn	2, 0x4141
     a1e:	4141                	.insn	2, 0x4141
     a20:	4141                	.insn	2, 0x4141
     a22:	4141                	.insn	2, 0x4141
     a24:	4141                	.insn	2, 0x4141
     a26:	4141                	.insn	2, 0x4141
     a28:	4141                	.insn	2, 0x4141
     a2a:	4141                	.insn	2, 0x4141
     a2c:	4141                	.insn	2, 0x4141
     a2e:	4141                	.insn	2, 0x4141
     a30:	4141                	.insn	2, 0x4141
     a32:	4141                	.insn	2, 0x4141
     a34:	4141                	.insn	2, 0x4141
     a36:	4141                	.insn	2, 0x4141
     a38:	4141                	.insn	2, 0x4141
     a3a:	4141                	.insn	2, 0x4141
     a3c:	4141                	.insn	2, 0x4141
     a3e:	4141                	.insn	2, 0x4141
     a40:	4141                	.insn	2, 0x4141
     a42:	4141                	.insn	2, 0x4141
     a44:	4141                	.insn	2, 0x4141
     a46:	4141                	.insn	2, 0x4141
     a48:	4141                	.insn	2, 0x4141
     a4a:	4141                	.insn	2, 0x4141
     a4c:	4141                	.insn	2, 0x4141
     a4e:	4141                	.insn	2, 0x4141
     a50:	4141                	.insn	2, 0x4141
     a52:	4141                	.insn	2, 0x4141
     a54:	4141                	.insn	2, 0x4141
     a56:	4141                	.insn	2, 0x4141
     a58:	4141                	.insn	2, 0x4141
     a5a:	4141                	.insn	2, 0x4141
     a5c:	4141                	.insn	2, 0x4141
     a5e:	4141                	.insn	2, 0x4141
     a60:	4141                	.insn	2, 0x4141
     a62:	4141                	.insn	2, 0x4141
     a64:	4141                	.insn	2, 0x4141
     a66:	4141                	.insn	2, 0x4141
     a68:	4141                	.insn	2, 0x4141
     a6a:	4141                	.insn	2, 0x4141
     a6c:	4141                	.insn	2, 0x4141
     a6e:	4141                	.insn	2, 0x4141
     a70:	4141                	.insn	2, 0x4141
     a72:	4141                	.insn	2, 0x4141
     a74:	4141                	.insn	2, 0x4141
     a76:	4141                	.insn	2, 0x4141
     a78:	4141                	.insn	2, 0x4141
     a7a:	4141                	.insn	2, 0x4141
     a7c:	4141                	.insn	2, 0x4141
     a7e:	4141                	.insn	2, 0x4141
     a80:	4141                	.insn	2, 0x4141
     a82:	4141                	.insn	2, 0x4141
     a84:	4141                	.insn	2, 0x4141
     a86:	4141                	.insn	2, 0x4141
     a88:	4141                	.insn	2, 0x4141
     a8a:	4141                	.insn	2, 0x4141
     a8c:	4141                	.insn	2, 0x4141
     a8e:	4141                	.insn	2, 0x4141
     a90:	2020                	.insn	2, 0x2020
     a92:	2020                	.insn	2, 0x2020
     a94:	2020                	.insn	2, 0x2020
     a96:	2020                	.insn	2, 0x2020
     a98:	2020                	.insn	2, 0x2020
     a9a:	2020                	.insn	2, 0x2020
     a9c:	2020                	.insn	2, 0x2020
     a9e:	2020                	.insn	2, 0x2020
     aa0:	2020                	.insn	2, 0x2020
     aa2:	2020                	.insn	2, 0x2020
     aa4:	2020                	.insn	2, 0x2020
     aa6:	2020                	.insn	2, 0x2020
     aa8:	2020                	.insn	2, 0x2020
     aaa:	2020                	.insn	2, 0x2020
     aac:	2020                	.insn	2, 0x2020
     aae:	2020                	.insn	2, 0x2020
     ab0:	2020                	.insn	2, 0x2020
     ab2:	2020                	.insn	2, 0x2020
     ab4:	2020                	.insn	2, 0x2020
     ab6:	2020                	.insn	2, 0x2020
     ab8:	2020                	.insn	2, 0x2020
     aba:	2020                	.insn	2, 0x2020
     abc:	2020                	.insn	2, 0x2020
     abe:	2020                	.insn	2, 0x2020
     ac0:	2020                	.insn	2, 0x2020
     ac2:	2020                	.insn	2, 0x2020
     ac4:	2020                	.insn	2, 0x2020
     ac6:	2020                	.insn	2, 0x2020
     ac8:	2020                	.insn	2, 0x2020
     aca:	2020                	.insn	2, 0x2020
     acc:	2020                	.insn	2, 0x2020
     ace:	2020                	.insn	2, 0x2020
     ad0:	2020                	.insn	2, 0x2020
     ad2:	2020                	.insn	2, 0x2020
     ad4:	2020                	.insn	2, 0x2020
     ad6:	2020                	.insn	2, 0x2020
     ad8:	2020                	.insn	2, 0x2020
     ada:	2020                	.insn	2, 0x2020
     adc:	2020                	.insn	2, 0x2020
     ade:	2020                	.insn	2, 0x2020
     ae0:	2020                	.insn	2, 0x2020
     ae2:	2020                	.insn	2, 0x2020
     ae4:	2020                	.insn	2, 0x2020
     ae6:	2020                	.insn	2, 0x2020
     ae8:	2020                	.insn	2, 0x2020
     aea:	2020                	.insn	2, 0x2020
     aec:	2020                	.insn	2, 0x2020
     aee:	2020                	.insn	2, 0x2020
     af0:	2020                	.insn	2, 0x2020
     af2:	2020                	.insn	2, 0x2020
     af4:	2020                	.insn	2, 0x2020
     af6:	2020                	.insn	2, 0x2020
     af8:	2020                	.insn	2, 0x2020
     afa:	2020                	.insn	2, 0x2020
     afc:	2020                	.insn	2, 0x2020
     afe:	2020                	.insn	2, 0x2020
     b00:	2020                	.insn	2, 0x2020
     b02:	2020                	.insn	2, 0x2020
     b04:	2020                	.insn	2, 0x2020
     b06:	2020                	.insn	2, 0x2020
     b08:	2020                	.insn	2, 0x2020
     b0a:	2020                	.insn	2, 0x2020
     b0c:	2020                	.insn	2, 0x2020
     b0e:	2020                	.insn	2, 0x2020
     b10:	2020                	.insn	2, 0x2020
     b12:	2020                	.insn	2, 0x2020
     b14:	2020                	.insn	2, 0x2020
     b16:	2020                	.insn	2, 0x2020
     b18:	2020                	.insn	2, 0x2020
     b1a:	2020                	.insn	2, 0x2020
     b1c:	2020                	.insn	2, 0x2020
     b1e:	2020                	.insn	2, 0x2020
     b20:	2020                	.insn	2, 0x2020
     b22:	2020                	.insn	2, 0x2020
     b24:	2020                	.insn	2, 0x2020
     b26:	2020                	.insn	2, 0x2020
     b28:	2020                	.insn	2, 0x2020
     b2a:	2020                	.insn	2, 0x2020
     b2c:	2020                	.insn	2, 0x2020
     b2e:	2020                	.insn	2, 0x2020
     b30:	2020                	.insn	2, 0x2020
     b32:	2020                	.insn	2, 0x2020
     b34:	2020                	.insn	2, 0x2020
     b36:	2020                	.insn	2, 0x2020
     b38:	2020                	.insn	2, 0x2020
     b3a:	2020                	.insn	2, 0x2020
     b3c:	2020                	.insn	2, 0x2020
     b3e:	2020                	.insn	2, 0x2020
     b40:	2020                	.insn	2, 0x2020
     b42:	2020                	.insn	2, 0x2020
     b44:	2020                	.insn	2, 0x2020
     b46:	2020                	.insn	2, 0x2020
     b48:	2020                	.insn	2, 0x2020
     b4a:	2020                	.insn	2, 0x2020
     b4c:	2020                	.insn	2, 0x2020
     b4e:	2020                	.insn	2, 0x2020
     b50:	2020                	.insn	2, 0x2020
     b52:	2020                	.insn	2, 0x2020
     b54:	2020                	.insn	2, 0x2020
     b56:	2020                	.insn	2, 0x2020
     b58:	2020                	.insn	2, 0x2020
     b5a:	2020                	.insn	2, 0x2020
     b5c:	2020                	.insn	2, 0x2020
     b5e:	2020                	.insn	2, 0x2020
     b60:	2020                	.insn	2, 0x2020
     b62:	2020                	.insn	2, 0x2020
     b64:	2020                	.insn	2, 0x2020
     b66:	2020                	.insn	2, 0x2020
     b68:	2020                	.insn	2, 0x2020
     b6a:	2020                	.insn	2, 0x2020
     b6c:	2020                	.insn	2, 0x2020
     b6e:	2020                	.insn	2, 0x2020
     b70:	2020                	.insn	2, 0x2020
     b72:	2020                	.insn	2, 0x2020
     b74:	2020                	.insn	2, 0x2020
     b76:	2020                	.insn	2, 0x2020
     b78:	2020                	.insn	2, 0x2020
     b7a:	2020                	.insn	2, 0x2020
     b7c:	2020                	.insn	2, 0x2020
     b7e:	2020                	.insn	2, 0x2020
     b80:	2020                	.insn	2, 0x2020
     b82:	2020                	.insn	2, 0x2020
     b84:	2020                	.insn	2, 0x2020
     b86:	2020                	.insn	2, 0x2020
     b88:	2020                	.insn	2, 0x2020
     b8a:	2020                	.insn	2, 0x2020
     b8c:	2020                	.insn	2, 0x2020
     b8e:	2020                	.insn	2, 0x2020
     b90:	2020                	.insn	2, 0x2020
     b92:	2020                	.insn	2, 0x2020
     b94:	2020                	.insn	2, 0x2020
     b96:	2020                	.insn	2, 0x2020
     b98:	2020                	.insn	2, 0x2020
     b9a:	2020                	.insn	2, 0x2020
     b9c:	2020                	.insn	2, 0x2020
     b9e:	2020                	.insn	2, 0x2020
     ba0:	2020                	.insn	2, 0x2020
     ba2:	2020                	.insn	2, 0x2020
     ba4:	2020                	.insn	2, 0x2020
     ba6:	2020                	.insn	2, 0x2020
     ba8:	2020                	.insn	2, 0x2020
     baa:	2020                	.insn	2, 0x2020
     bac:	2020                	.insn	2, 0x2020
     bae:	2020                	.insn	2, 0x2020
     bb0:	2020                	.insn	2, 0x2020
     bb2:	2020                	.insn	2, 0x2020
     bb4:	2020                	.insn	2, 0x2020
     bb6:	2020                	.insn	2, 0x2020
     bb8:	2020                	.insn	2, 0x2020
     bba:	2020                	.insn	2, 0x2020
     bbc:	2020                	.insn	2, 0x2020
     bbe:	2020                	.insn	2, 0x2020
     bc0:	2020                	.insn	2, 0x2020
     bc2:	2020                	.insn	2, 0x2020
     bc4:	2020                	.insn	2, 0x2020
     bc6:	2020                	.insn	2, 0x2020
     bc8:	2020                	.insn	2, 0x2020
     bca:	2020                	.insn	2, 0x2020
     bcc:	2020                	.insn	2, 0x2020
     bce:	2020                	.insn	2, 0x2020
     bd0:	2020                	.insn	2, 0x2020
     bd2:	2020                	.insn	2, 0x2020
     bd4:	2020                	.insn	2, 0x2020
     bd6:	2020                	.insn	2, 0x2020
     bd8:	2020                	.insn	2, 0x2020
     bda:	2020                	.insn	2, 0x2020
     bdc:	2020                	.insn	2, 0x2020
     bde:	2020                	.insn	2, 0x2020
     be0:	2020                	.insn	2, 0x2020
     be2:	2020                	.insn	2, 0x2020
     be4:	2020                	.insn	2, 0x2020
     be6:	2020                	.insn	2, 0x2020
     be8:	2020                	.insn	2, 0x2020
     bea:	2020                	.insn	2, 0x2020
     bec:	2020                	.insn	2, 0x2020
     bee:	2020                	.insn	2, 0x2020
     bf0:	2020                	.insn	2, 0x2020
     bf2:	2020                	.insn	2, 0x2020
     bf4:	2020                	.insn	2, 0x2020
     bf6:	2020                	.insn	2, 0x2020
     bf8:	2020                	.insn	2, 0x2020
     bfa:	2020                	.insn	2, 0x2020
     bfc:	2020                	.insn	2, 0x2020
     bfe:	2020                	.insn	2, 0x2020
     c00:	2020                	.insn	2, 0x2020
     c02:	2020                	.insn	2, 0x2020
     c04:	2020                	.insn	2, 0x2020
     c06:	2020                	.insn	2, 0x2020
     c08:	2020                	.insn	2, 0x2020
     c0a:	2020                	.insn	2, 0x2020
     c0c:	2020                	.insn	2, 0x2020
     c0e:	2020                	.insn	2, 0x2020
     c10:	2020                	.insn	2, 0x2020
     c12:	2020                	.insn	2, 0x2020
     c14:	2020                	.insn	2, 0x2020
     c16:	2020                	.insn	2, 0x2020
     c18:	2020                	.insn	2, 0x2020
     c1a:	2020                	.insn	2, 0x2020
     c1c:	2020                	.insn	2, 0x2020
     c1e:	2020                	.insn	2, 0x2020
     c20:	2020                	.insn	2, 0x2020
     c22:	2020                	.insn	2, 0x2020
     c24:	2020                	.insn	2, 0x2020
     c26:	2020                	.insn	2, 0x2020
     c28:	2020                	.insn	2, 0x2020
     c2a:	2020                	.insn	2, 0x2020
     c2c:	2020                	.insn	2, 0x2020
     c2e:	2020                	.insn	2, 0x2020
     c30:	2020                	.insn	2, 0x2020
     c32:	2020                	.insn	2, 0x2020
     c34:	2020                	.insn	2, 0x2020
     c36:	2020                	.insn	2, 0x2020
     c38:	2020                	.insn	2, 0x2020
     c3a:	2020                	.insn	2, 0x2020
     c3c:	2020                	.insn	2, 0x2020
     c3e:	2020                	.insn	2, 0x2020
     c40:	2020                	.insn	2, 0x2020
     c42:	2020                	.insn	2, 0x2020
     c44:	2020                	.insn	2, 0x2020
     c46:	2020                	.insn	2, 0x2020
     c48:	2020                	.insn	2, 0x2020
     c4a:	2020                	.insn	2, 0x2020
     c4c:	2020                	.insn	2, 0x2020
     c4e:	2020                	.insn	2, 0x2020
     c50:	2020                	.insn	2, 0x2020
     c52:	2020                	.insn	2, 0x2020
     c54:	2020                	.insn	2, 0x2020
     c56:	2020                	.insn	2, 0x2020
     c58:	2020                	.insn	2, 0x2020
     c5a:	2020                	.insn	2, 0x2020
     c5c:	2020                	.insn	2, 0x2020
     c5e:	2020                	.insn	2, 0x2020
     c60:	2020                	.insn	2, 0x2020
     c62:	2020                	.insn	2, 0x2020
     c64:	2020                	.insn	2, 0x2020
     c66:	2020                	.insn	2, 0x2020
     c68:	2020                	.insn	2, 0x2020
     c6a:	2020                	.insn	2, 0x2020
     c6c:	2020                	.insn	2, 0x2020
     c6e:	2020                	.insn	2, 0x2020
     c70:	2020                	.insn	2, 0x2020
     c72:	2020                	.insn	2, 0x2020
     c74:	2020                	.insn	2, 0x2020
     c76:	2020                	.insn	2, 0x2020
     c78:	2020                	.insn	2, 0x2020
     c7a:	2020                	.insn	2, 0x2020
     c7c:	2020                	.insn	2, 0x2020
     c7e:	2020                	.insn	2, 0x2020
     c80:	2020                	.insn	2, 0x2020
     c82:	2020                	.insn	2, 0x2020
     c84:	2020                	.insn	2, 0x2020
     c86:	2020                	.insn	2, 0x2020
     c88:	2020                	.insn	2, 0x2020
     c8a:	2020                	.insn	2, 0x2020
     c8c:	2020                	.insn	2, 0x2020
     c8e:	2020                	.insn	2, 0x2020
     c90:	2020                	.insn	2, 0x2020
     c92:	2020                	.insn	2, 0x2020
     c94:	2020                	.insn	2, 0x2020
     c96:	2020                	.insn	2, 0x2020
     c98:	2020                	.insn	2, 0x2020
     c9a:	2020                	.insn	2, 0x2020
     c9c:	2020                	.insn	2, 0x2020
     c9e:	2020                	.insn	2, 0x2020
     ca0:	2020                	.insn	2, 0x2020
     ca2:	2020                	.insn	2, 0x2020
     ca4:	2020                	.insn	2, 0x2020
     ca6:	2020                	.insn	2, 0x2020
     ca8:	2020                	.insn	2, 0x2020
     caa:	2020                	.insn	2, 0x2020
     cac:	2020                	.insn	2, 0x2020
     cae:	2020                	.insn	2, 0x2020
     cb0:	2020                	.insn	2, 0x2020
     cb2:	2020                	.insn	2, 0x2020
     cb4:	2020                	.insn	2, 0x2020
     cb6:	2020                	.insn	2, 0x2020
     cb8:	2020                	.insn	2, 0x2020
     cba:	2020                	.insn	2, 0x2020
     cbc:	2020                	.insn	2, 0x2020
     cbe:	2020                	.insn	2, 0x2020
     cc0:	2020                	.insn	2, 0x2020
     cc2:	2020                	.insn	2, 0x2020
     cc4:	2020                	.insn	2, 0x2020
     cc6:	2020                	.insn	2, 0x2020
     cc8:	2020                	.insn	2, 0x2020
     cca:	2020                	.insn	2, 0x2020
     ccc:	2020                	.insn	2, 0x2020
     cce:	2020                	.insn	2, 0x2020
     cd0:	2020                	.insn	2, 0x2020
     cd2:	2020                	.insn	2, 0x2020
     cd4:	2020                	.insn	2, 0x2020
     cd6:	2020                	.insn	2, 0x2020
     cd8:	5020                	.insn	2, 0x5020
     cda:	6572                	.insn	2, 0x6572
     cdc:	61207373          	csrrc	t1,0x612,0
     ce0:	796e                	.insn	2, 0x796e
     ce2:	6b20                	.insn	2, 0x6b20
     ce4:	7965                	.insn	2, 0x7965
     ce6:	7420                	.insn	2, 0x7420
     ce8:	6173206f          	j	33afe <_data_end+0x316fe>
     cec:	2079                	.insn	2, 0x2079
     cee:	646f6f67          	.insn	4, 0x646f6f67
     cf2:	7962                	.insn	2, 0x7962
     cf4:	2065                	.insn	2, 0x2065
     cf6:	6f74                	.insn	2, 0x6f74
     cf8:	7420                	.insn	2, 0x7420
     cfa:	6968                	.insn	2, 0x6968
     cfc:	72632073          	csrs	mhpmevent6h,t1
     d00:	6575                	.insn	2, 0x6575
     d02:	206c                	.insn	2, 0x206c
     d04:	6c726f77          	.insn	4, 0x6c726f77
     d08:	2064                	.insn	2, 0x2064
     d0a:	283a                	.insn	2, 0x283a
     d0c:	2828                	.insn	2, 0x2828
     d0e:	2020                	.insn	2, 0x2020
     d10:	2020                	.insn	2, 0x2020
     d12:	2020                	.insn	2, 0x2020
     d14:	2020                	.insn	2, 0x2020
     d16:	2020                	.insn	2, 0x2020
     d18:	2020                	.insn	2, 0x2020
     d1a:	2020                	.insn	2, 0x2020
     d1c:	2020                	.insn	2, 0x2020
     d1e:	2020                	.insn	2, 0x2020
     d20:	2020                	.insn	2, 0x2020
     d22:	2020                	.insn	2, 0x2020
     d24:	2020                	.insn	2, 0x2020
     d26:	2020                	.insn	2, 0x2020
     d28:	2020                	.insn	2, 0x2020
     d2a:	2020                	.insn	2, 0x2020
     d2c:	2020                	.insn	2, 0x2020
     d2e:	2020                	.insn	2, 0x2020
     d30:	2020                	.insn	2, 0x2020
     d32:	2020                	.insn	2, 0x2020
     d34:	2020                	.insn	2, 0x2020
     d36:	2020                	.insn	2, 0x2020
     d38:	2020                	.insn	2, 0x2020
     d3a:	2020                	.insn	2, 0x2020
     d3c:	2020                	.insn	2, 0x2020
     d3e:	2020                	.insn	2, 0x2020
     d40:	2020                	.insn	2, 0x2020
     d42:	2020                	.insn	2, 0x2020
     d44:	2020                	.insn	2, 0x2020
     d46:	2020                	.insn	2, 0x2020
     d48:	2020                	.insn	2, 0x2020
     d4a:	2020                	.insn	2, 0x2020
     d4c:	2020                	.insn	2, 0x2020
     d4e:	2020                	.insn	2, 0x2020
     d50:	2020                	.insn	2, 0x2020
     d52:	2020                	.insn	2, 0x2020
     d54:	2020                	.insn	2, 0x2020
     d56:	2020                	.insn	2, 0x2020
     d58:	2020                	.insn	2, 0x2020
     d5a:	2020                	.insn	2, 0x2020
     d5c:	2020                	.insn	2, 0x2020
     d5e:	2020                	.insn	2, 0x2020
     d60:	0000                	.insn	2, 0x
	...

00000d64 <g_goodbye_str>:
     d64:	2020                	.insn	2, 0x2020
     d66:	2020                	.insn	2, 0x2020
     d68:	2020                	.insn	2, 0x2020
     d6a:	2020                	.insn	2, 0x2020
     d6c:	2020                	.insn	2, 0x2020
     d6e:	2020                	.insn	2, 0x2020
     d70:	2020                	.insn	2, 0x2020
     d72:	2020                	.insn	2, 0x2020
     d74:	2020                	.insn	2, 0x2020
     d76:	2020                	.insn	2, 0x2020
     d78:	2020                	.insn	2, 0x2020
     d7a:	2020                	.insn	2, 0x2020
     d7c:	2020                	.insn	2, 0x2020
     d7e:	2020                	.insn	2, 0x2020
     d80:	2020                	.insn	2, 0x2020
     d82:	2020                	.insn	2, 0x2020
     d84:	2020                	.insn	2, 0x2020
     d86:	2020                	.insn	2, 0x2020
     d88:	2020                	.insn	2, 0x2020
     d8a:	2020                	.insn	2, 0x2020
     d8c:	2020                	.insn	2, 0x2020
     d8e:	2020                	.insn	2, 0x2020
     d90:	2020                	.insn	2, 0x2020
     d92:	2020                	.insn	2, 0x2020
     d94:	2020                	.insn	2, 0x2020
     d96:	2020                	.insn	2, 0x2020
     d98:	2020                	.insn	2, 0x2020
     d9a:	2020                	.insn	2, 0x2020
     d9c:	2020                	.insn	2, 0x2020
     d9e:	2020                	.insn	2, 0x2020
     da0:	2020                	.insn	2, 0x2020
     da2:	2020                	.insn	2, 0x2020
     da4:	2020                	.insn	2, 0x2020
     da6:	2020                	.insn	2, 0x2020
     da8:	2020                	.insn	2, 0x2020
     daa:	2020                	.insn	2, 0x2020
     dac:	2020                	.insn	2, 0x2020
     dae:	2020                	.insn	2, 0x2020
     db0:	2020                	.insn	2, 0x2020
     db2:	2020                	.insn	2, 0x2020
     db4:	2020                	.insn	2, 0x2020
     db6:	2020                	.insn	2, 0x2020
     db8:	2020                	.insn	2, 0x2020
     dba:	2020                	.insn	2, 0x2020
     dbc:	2020                	.insn	2, 0x2020
     dbe:	2020                	.insn	2, 0x2020
     dc0:	2020                	.insn	2, 0x2020
     dc2:	2020                	.insn	2, 0x2020
     dc4:	2020                	.insn	2, 0x2020
     dc6:	2020                	.insn	2, 0x2020
     dc8:	2020                	.insn	2, 0x2020
     dca:	2020                	.insn	2, 0x2020
     dcc:	2020                	.insn	2, 0x2020
     dce:	2020                	.insn	2, 0x2020
     dd0:	2020                	.insn	2, 0x2020
     dd2:	2020                	.insn	2, 0x2020
     dd4:	2020                	.insn	2, 0x2020
     dd6:	2020                	.insn	2, 0x2020
     dd8:	2020                	.insn	2, 0x2020
     dda:	2020                	.insn	2, 0x2020
     ddc:	2020                	.insn	2, 0x2020
     dde:	2020                	.insn	2, 0x2020
     de0:	2020                	.insn	2, 0x2020
     de2:	2020                	.insn	2, 0x2020
     de4:	2020                	.insn	2, 0x2020
     de6:	2020                	.insn	2, 0x2020
     de8:	2020                	.insn	2, 0x2020
     dea:	2020                	.insn	2, 0x2020
     dec:	2020                	.insn	2, 0x2020
     dee:	2020                	.insn	2, 0x2020
     df0:	2020                	.insn	2, 0x2020
     df2:	2020                	.insn	2, 0x2020
     df4:	2020                	.insn	2, 0x2020
     df6:	2020                	.insn	2, 0x2020
     df8:	2020                	.insn	2, 0x2020
     dfa:	2020                	.insn	2, 0x2020
     dfc:	2020                	.insn	2, 0x2020
     dfe:	2020                	.insn	2, 0x2020
     e00:	2020                	.insn	2, 0x2020
     e02:	2020                	.insn	2, 0x2020
     e04:	2020                	.insn	2, 0x2020
     e06:	2020                	.insn	2, 0x2020
     e08:	2020                	.insn	2, 0x2020
     e0a:	2020                	.insn	2, 0x2020
     e0c:	2020                	.insn	2, 0x2020
     e0e:	2020                	.insn	2, 0x2020
     e10:	2020                	.insn	2, 0x2020
     e12:	2020                	.insn	2, 0x2020
     e14:	2020                	.insn	2, 0x2020
     e16:	2020                	.insn	2, 0x2020
     e18:	2020                	.insn	2, 0x2020
     e1a:	2020                	.insn	2, 0x2020
     e1c:	2020                	.insn	2, 0x2020
     e1e:	2020                	.insn	2, 0x2020
     e20:	2020                	.insn	2, 0x2020
     e22:	2020                	.insn	2, 0x2020
     e24:	2020                	.insn	2, 0x2020
     e26:	2020                	.insn	2, 0x2020
     e28:	2020                	.insn	2, 0x2020
     e2a:	2020                	.insn	2, 0x2020
     e2c:	2020                	.insn	2, 0x2020
     e2e:	2020                	.insn	2, 0x2020
     e30:	2020                	.insn	2, 0x2020
     e32:	2020                	.insn	2, 0x2020
     e34:	2020                	.insn	2, 0x2020
     e36:	2020                	.insn	2, 0x2020
     e38:	2020                	.insn	2, 0x2020
     e3a:	2020                	.insn	2, 0x2020
     e3c:	2020                	.insn	2, 0x2020
     e3e:	2020                	.insn	2, 0x2020
     e40:	2020                	.insn	2, 0x2020
     e42:	2020                	.insn	2, 0x2020
     e44:	2020                	.insn	2, 0x2020
     e46:	2020                	.insn	2, 0x2020
     e48:	2020                	.insn	2, 0x2020
     e4a:	2020                	.insn	2, 0x2020
     e4c:	2020                	.insn	2, 0x2020
     e4e:	2020                	.insn	2, 0x2020
     e50:	2020                	.insn	2, 0x2020
     e52:	2020                	.insn	2, 0x2020
     e54:	2020                	.insn	2, 0x2020
     e56:	2020                	.insn	2, 0x2020
     e58:	2020                	.insn	2, 0x2020
     e5a:	2020                	.insn	2, 0x2020
     e5c:	2020                	.insn	2, 0x2020
     e5e:	2020                	.insn	2, 0x2020
     e60:	2020                	.insn	2, 0x2020
     e62:	2020                	.insn	2, 0x2020
     e64:	2020                	.insn	2, 0x2020
     e66:	2020                	.insn	2, 0x2020
     e68:	2020                	.insn	2, 0x2020
     e6a:	2020                	.insn	2, 0x2020
     e6c:	2020                	.insn	2, 0x2020
     e6e:	2020                	.insn	2, 0x2020
     e70:	2020                	.insn	2, 0x2020
     e72:	2020                	.insn	2, 0x2020
     e74:	2020                	.insn	2, 0x2020
     e76:	2020                	.insn	2, 0x2020
     e78:	2020                	.insn	2, 0x2020
     e7a:	2020                	.insn	2, 0x2020
     e7c:	2020                	.insn	2, 0x2020
     e7e:	2020                	.insn	2, 0x2020
     e80:	2020                	.insn	2, 0x2020
     e82:	2020                	.insn	2, 0x2020
     e84:	2020                	.insn	2, 0x2020
     e86:	2020                	.insn	2, 0x2020
     e88:	2020                	.insn	2, 0x2020
     e8a:	2020                	.insn	2, 0x2020
     e8c:	2020                	.insn	2, 0x2020
     e8e:	2020                	.insn	2, 0x2020
     e90:	2020                	.insn	2, 0x2020
     e92:	2020                	.insn	2, 0x2020
     e94:	2020                	.insn	2, 0x2020
     e96:	2020                	.insn	2, 0x2020
     e98:	2020                	.insn	2, 0x2020
     e9a:	2020                	.insn	2, 0x2020
     e9c:	2020                	.insn	2, 0x2020
     e9e:	2020                	.insn	2, 0x2020
     ea0:	2020                	.insn	2, 0x2020
     ea2:	2020                	.insn	2, 0x2020
     ea4:	2020                	.insn	2, 0x2020
     ea6:	2020                	.insn	2, 0x2020
     ea8:	2020                	.insn	2, 0x2020
     eaa:	2020                	.insn	2, 0x2020
     eac:	2020                	.insn	2, 0x2020
     eae:	2020                	.insn	2, 0x2020
     eb0:	2020                	.insn	2, 0x2020
     eb2:	2020                	.insn	2, 0x2020
     eb4:	2020                	.insn	2, 0x2020
     eb6:	2020                	.insn	2, 0x2020
     eb8:	2020                	.insn	2, 0x2020
     eba:	2020                	.insn	2, 0x2020
     ebc:	2020                	.insn	2, 0x2020
     ebe:	2020                	.insn	2, 0x2020
     ec0:	2020                	.insn	2, 0x2020
     ec2:	2020                	.insn	2, 0x2020
     ec4:	2020                	.insn	2, 0x2020
     ec6:	2020                	.insn	2, 0x2020
     ec8:	2020                	.insn	2, 0x2020
     eca:	2020                	.insn	2, 0x2020
     ecc:	2020                	.insn	2, 0x2020
     ece:	2020                	.insn	2, 0x2020
     ed0:	2020                	.insn	2, 0x2020
     ed2:	2020                	.insn	2, 0x2020
     ed4:	2020                	.insn	2, 0x2020
     ed6:	2020                	.insn	2, 0x2020
     ed8:	2020                	.insn	2, 0x2020
     eda:	2020                	.insn	2, 0x2020
     edc:	2020                	.insn	2, 0x2020
     ede:	2020                	.insn	2, 0x2020
     ee0:	2020                	.insn	2, 0x2020
     ee2:	2020                	.insn	2, 0x2020
     ee4:	2020                	.insn	2, 0x2020
     ee6:	2020                	.insn	2, 0x2020
     ee8:	2020                	.insn	2, 0x2020
     eea:	2020                	.insn	2, 0x2020
     eec:	2020                	.insn	2, 0x2020
     eee:	2020                	.insn	2, 0x2020
     ef0:	2020                	.insn	2, 0x2020
     ef2:	2020                	.insn	2, 0x2020
     ef4:	2020                	.insn	2, 0x2020
     ef6:	2020                	.insn	2, 0x2020
     ef8:	2020                	.insn	2, 0x2020
     efa:	2020                	.insn	2, 0x2020
     efc:	2020                	.insn	2, 0x2020
     efe:	2020                	.insn	2, 0x2020
     f00:	2020                	.insn	2, 0x2020
     f02:	2020                	.insn	2, 0x2020
     f04:	2020                	.insn	2, 0x2020
     f06:	2020                	.insn	2, 0x2020
     f08:	2020                	.insn	2, 0x2020
     f0a:	2020                	.insn	2, 0x2020
     f0c:	2020                	.insn	2, 0x2020
     f0e:	2020                	.insn	2, 0x2020
     f10:	2020                	.insn	2, 0x2020
     f12:	2020                	.insn	2, 0x2020
     f14:	2020                	.insn	2, 0x2020
     f16:	2020                	.insn	2, 0x2020
     f18:	2020                	.insn	2, 0x2020
     f1a:	2020                	.insn	2, 0x2020
     f1c:	2020                	.insn	2, 0x2020
     f1e:	2020                	.insn	2, 0x2020
     f20:	2020                	.insn	2, 0x2020
     f22:	2020                	.insn	2, 0x2020
     f24:	2020                	.insn	2, 0x2020
     f26:	2020                	.insn	2, 0x2020
     f28:	2020                	.insn	2, 0x2020
     f2a:	2020                	.insn	2, 0x2020
     f2c:	2020                	.insn	2, 0x2020
     f2e:	2020                	.insn	2, 0x2020
     f30:	2020                	.insn	2, 0x2020
     f32:	2020                	.insn	2, 0x2020
     f34:	2020                	.insn	2, 0x2020
     f36:	2020                	.insn	2, 0x2020
     f38:	2020                	.insn	2, 0x2020
     f3a:	2020                	.insn	2, 0x2020
     f3c:	2020                	.insn	2, 0x2020
     f3e:	2020                	.insn	2, 0x2020
     f40:	2020                	.insn	2, 0x2020
     f42:	2020                	.insn	2, 0x2020
     f44:	2020                	.insn	2, 0x2020
     f46:	2020                	.insn	2, 0x2020
     f48:	2020                	.insn	2, 0x2020
     f4a:	2020                	.insn	2, 0x2020
     f4c:	2320                	.insn	2, 0x2320
     f4e:	20232323          	sw	sp,518(t1)
     f52:	2020                	.insn	2, 0x2020
     f54:	2020                	.insn	2, 0x2020
     f56:	2020                	.insn	2, 0x2020
     f58:	2020                	.insn	2, 0x2020
     f5a:	2020                	.insn	2, 0x2020
     f5c:	2020                	.insn	2, 0x2020
     f5e:	2020                	.insn	2, 0x2020
     f60:	2020                	.insn	2, 0x2020
     f62:	2020                	.insn	2, 0x2020
     f64:	2020                	.insn	2, 0x2020
     f66:	2020                	.insn	2, 0x2020
     f68:	2020                	.insn	2, 0x2020
     f6a:	2320                	.insn	2, 0x2320
     f6c:	2020                	.insn	2, 0x2020
     f6e:	2320                	.insn	2, 0x2320
     f70:	2020                	.insn	2, 0x2020
     f72:	2320                	.insn	2, 0x2320
     f74:	2020                	.insn	2, 0x2020
     f76:	2020                	.insn	2, 0x2020
     f78:	2020                	.insn	2, 0x2020
     f7a:	2020                	.insn	2, 0x2020
     f7c:	2020                	.insn	2, 0x2020
     f7e:	2020                	.insn	2, 0x2020
     f80:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     f84:	2020                	.insn	2, 0x2020
     f86:	2320                	.insn	2, 0x2320
     f88:	2020                	.insn	2, 0x2020
     f8a:	2320                	.insn	2, 0x2320
     f8c:	2020                	.insn	2, 0x2020
     f8e:	2020                	.insn	2, 0x2020
     f90:	2020                	.insn	2, 0x2020
     f92:	2020                	.insn	2, 0x2020
     f94:	2020                	.insn	2, 0x2020
     f96:	2020                	.insn	2, 0x2020
     f98:	2020                	.insn	2, 0x2020
     f9a:	2020                	.insn	2, 0x2020
     f9c:	2320                	.insn	2, 0x2320
     f9e:	2020                	.insn	2, 0x2020
     fa0:	2320                	.insn	2, 0x2320
     fa2:	2020                	.insn	2, 0x2020
     fa4:	2020                	.insn	2, 0x2020
     fa6:	2020                	.insn	2, 0x2020
     fa8:	2020                	.insn	2, 0x2020
     faa:	2020                	.insn	2, 0x2020
     fac:	2020                	.insn	2, 0x2020
     fae:	2020                	.insn	2, 0x2020
     fb0:	2020                	.insn	2, 0x2020
     fb2:	2020                	.insn	2, 0x2020
     fb4:	2020                	.insn	2, 0x2020
     fb6:	2020                	.insn	2, 0x2020
     fb8:	2020                	.insn	2, 0x2020
     fba:	2320                	.insn	2, 0x2320
     fbc:	2020                	.insn	2, 0x2020
     fbe:	20232023          	sw	sp,512(t1)
     fc2:	2320                	.insn	2, 0x2320
     fc4:	2020                	.insn	2, 0x2020
     fc6:	2020                	.insn	2, 0x2020
     fc8:	2020                	.insn	2, 0x2020
     fca:	2020                	.insn	2, 0x2020
     fcc:	2020                	.insn	2, 0x2020
     fce:	2020                	.insn	2, 0x2020
     fd0:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     fd4:	2020                	.insn	2, 0x2020
     fd6:	2320                	.insn	2, 0x2320
     fd8:	2020                	.insn	2, 0x2020
     fda:	2320                	.insn	2, 0x2320
     fdc:	2020                	.insn	2, 0x2020
     fde:	2020                	.insn	2, 0x2020
     fe0:	2020                	.insn	2, 0x2020
     fe2:	2020                	.insn	2, 0x2020
     fe4:	2020                	.insn	2, 0x2020
     fe6:	2020                	.insn	2, 0x2020
     fe8:	2020                	.insn	2, 0x2020
     fea:	2020                	.insn	2, 0x2020
     fec:	2320                	.insn	2, 0x2320
     fee:	2020                	.insn	2, 0x2020
     ff0:	2320                	.insn	2, 0x2320
     ff2:	2020                	.insn	2, 0x2020
     ff4:	2320                	.insn	2, 0x2320
     ff6:	2020                	.insn	2, 0x2020
     ff8:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
     ffc:	20202323          	sw	sp,518(zero) # 206 <init_text_ch+0xe>
    1000:	2020                	.insn	2, 0x2020
    1002:	2020                	.insn	2, 0x2020
    1004:	2020                	.insn	2, 0x2020
    1006:	2020                	.insn	2, 0x2020
    1008:	2020                	.insn	2, 0x2020
    100a:	2020                	.insn	2, 0x2020
    100c:	20232023          	sw	sp,512(t1)
    1010:	20232023          	sw	sp,512(t1)
    1014:	2020                	.insn	2, 0x2020
    1016:	2320                	.insn	2, 0x2320
    1018:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    101c:	2320                	.insn	2, 0x2320
    101e:	20232023          	sw	sp,512(t1)
    1022:	2020                	.insn	2, 0x2020
    1024:	2320                	.insn	2, 0x2320
    1026:	20202323          	sw	sp,518(zero) # 206 <init_text_ch+0xe>
    102a:	2320                	.insn	2, 0x2320
    102c:	2020                	.insn	2, 0x2020
    102e:	2020                	.insn	2, 0x2020
    1030:	2020                	.insn	2, 0x2020
    1032:	2020                	.insn	2, 0x2020
    1034:	2020                	.insn	2, 0x2020
    1036:	2020                	.insn	2, 0x2020
    1038:	2020                	.insn	2, 0x2020
    103a:	2020                	.insn	2, 0x2020
    103c:	2320                	.insn	2, 0x2320
    103e:	20232323          	sw	sp,518(t1)
    1042:	2020                	.insn	2, 0x2020
    1044:	2320                	.insn	2, 0x2320
    1046:	2020                	.insn	2, 0x2020
    1048:	23202023          	sw	s2,544(zero) # 220 <init_text_ch+0x28>
    104c:	2020                	.insn	2, 0x2020
    104e:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    1052:	2020                	.insn	2, 0x2020
    1054:	2020                	.insn	2, 0x2020
    1056:	2020                	.insn	2, 0x2020
    1058:	2020                	.insn	2, 0x2020
    105a:	2020                	.insn	2, 0x2020
    105c:	20232023          	sw	sp,512(t1)
    1060:	20232023          	sw	sp,512(t1)
    1064:	2020                	.insn	2, 0x2020
    1066:	23202023          	sw	s2,544(zero) # 220 <init_text_ch+0x28>
    106a:	2020                	.insn	2, 0x2020
    106c:	2320                	.insn	2, 0x2320
    106e:	2020                	.insn	2, 0x2020
    1070:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    1074:	23202023          	sw	s2,544(zero) # 220 <init_text_ch+0x28>
    1078:	2020                	.insn	2, 0x2020
    107a:	2320                	.insn	2, 0x2320
    107c:	2020                	.insn	2, 0x2020
    107e:	2020                	.insn	2, 0x2020
    1080:	2020                	.insn	2, 0x2020
    1082:	2020                	.insn	2, 0x2020
    1084:	2020                	.insn	2, 0x2020
    1086:	2020                	.insn	2, 0x2020
    1088:	2020                	.insn	2, 0x2020
    108a:	2020                	.insn	2, 0x2020
    108c:	2320                	.insn	2, 0x2320
    108e:	2020                	.insn	2, 0x2020
    1090:	2320                	.insn	2, 0x2320
    1092:	2020                	.insn	2, 0x2020
    1094:	2320                	.insn	2, 0x2320
    1096:	2020                	.insn	2, 0x2020
    1098:	23202023          	sw	s2,544(zero) # 220 <init_text_ch+0x28>
    109c:	20232323          	sw	sp,518(t1)
    10a0:	2020                	.insn	2, 0x2020
    10a2:	2020                	.insn	2, 0x2020
    10a4:	2020                	.insn	2, 0x2020
    10a6:	2020                	.insn	2, 0x2020
    10a8:	2020                	.insn	2, 0x2020
    10aa:	2020                	.insn	2, 0x2020
    10ac:	20232023          	sw	sp,512(t1)
    10b0:	20232023          	sw	sp,512(t1)
    10b4:	2020                	.insn	2, 0x2020
    10b6:	23202023          	sw	s2,544(zero) # 220 <init_text_ch+0x28>
    10ba:	2020                	.insn	2, 0x2020
    10bc:	2320                	.insn	2, 0x2320
    10be:	2020                	.insn	2, 0x2020
    10c0:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    10c4:	23202023          	sw	s2,544(zero) # 220 <init_text_ch+0x28>
    10c8:	2020                	.insn	2, 0x2020
    10ca:	2320                	.insn	2, 0x2320
    10cc:	2020                	.insn	2, 0x2020
    10ce:	2020                	.insn	2, 0x2020
    10d0:	2020                	.insn	2, 0x2020
    10d2:	2020                	.insn	2, 0x2020
    10d4:	2020                	.insn	2, 0x2020
    10d6:	2020                	.insn	2, 0x2020
    10d8:	2020                	.insn	2, 0x2020
    10da:	2020                	.insn	2, 0x2020
    10dc:	2320                	.insn	2, 0x2320
    10de:	2020                	.insn	2, 0x2020
    10e0:	2320                	.insn	2, 0x2320
    10e2:	2020                	.insn	2, 0x2020
    10e4:	2020                	.insn	2, 0x2020
    10e6:	20202323          	sw	sp,518(zero) # 206 <init_text_ch+0xe>
    10ea:	2320                	.insn	2, 0x2320
    10ec:	2020                	.insn	2, 0x2020
    10ee:	2020                	.insn	2, 0x2020
    10f0:	2020                	.insn	2, 0x2020
    10f2:	2020                	.insn	2, 0x2020
    10f4:	2020                	.insn	2, 0x2020
    10f6:	2020                	.insn	2, 0x2020
    10f8:	2020                	.insn	2, 0x2020
    10fa:	2020                	.insn	2, 0x2020
    10fc:	20232023          	sw	sp,512(t1)
    1100:	20232023          	sw	sp,512(t1)
    1104:	2020                	.insn	2, 0x2020
    1106:	23202023          	sw	s2,544(zero) # 220 <init_text_ch+0x28>
    110a:	2020                	.insn	2, 0x2020
    110c:	2320                	.insn	2, 0x2320
    110e:	2020                	.insn	2, 0x2020
    1110:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    1114:	23202023          	sw	s2,544(zero) # 220 <init_text_ch+0x28>
    1118:	2020                	.insn	2, 0x2020
    111a:	2020                	.insn	2, 0x2020
    111c:	2020                	.insn	2, 0x2020
    111e:	2020                	.insn	2, 0x2020
    1120:	2020                	.insn	2, 0x2020
    1122:	2020                	.insn	2, 0x2020
    1124:	2020                	.insn	2, 0x2020
    1126:	2020                	.insn	2, 0x2020
    1128:	2020                	.insn	2, 0x2020
    112a:	2020                	.insn	2, 0x2020
    112c:	2320                	.insn	2, 0x2320
    112e:	20232323          	sw	sp,518(t1)
    1132:	2020                	.insn	2, 0x2020
    1134:	2320                	.insn	2, 0x2320
    1136:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    113a:	2020                	.insn	2, 0x2020
    113c:	20232323          	sw	sp,518(t1)
    1140:	2020                	.insn	2, 0x2020
    1142:	2020                	.insn	2, 0x2020
    1144:	2020                	.insn	2, 0x2020
    1146:	2020                	.insn	2, 0x2020
    1148:	2020                	.insn	2, 0x2020
    114a:	2020                	.insn	2, 0x2020
    114c:	2320                	.insn	2, 0x2320
    114e:	2020                	.insn	2, 0x2020
    1150:	2320                	.insn	2, 0x2320
    1152:	2020                	.insn	2, 0x2020
    1154:	2020                	.insn	2, 0x2020
    1156:	2320                	.insn	2, 0x2320
    1158:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    115c:	2320                	.insn	2, 0x2320
    115e:	2020                	.insn	2, 0x2020
    1160:	20202023          	sw	sp,512(zero) # 200 <init_text_ch+0x8>
    1164:	2320                	.insn	2, 0x2320
    1166:	20202323          	sw	sp,518(zero) # 206 <init_text_ch+0xe>
    116a:	2320                	.insn	2, 0x2320
    116c:	2020                	.insn	2, 0x2020
    116e:	2020                	.insn	2, 0x2020
    1170:	2020                	.insn	2, 0x2020
    1172:	2020                	.insn	2, 0x2020
    1174:	2020                	.insn	2, 0x2020
    1176:	2020                	.insn	2, 0x2020
    1178:	2020                	.insn	2, 0x2020
    117a:	2020                	.insn	2, 0x2020
    117c:	2020                	.insn	2, 0x2020
    117e:	2020                	.insn	2, 0x2020
    1180:	2020                	.insn	2, 0x2020
    1182:	2020                	.insn	2, 0x2020
    1184:	2020                	.insn	2, 0x2020
    1186:	2020                	.insn	2, 0x2020
    1188:	2020                	.insn	2, 0x2020
    118a:	2020                	.insn	2, 0x2020
    118c:	2020                	.insn	2, 0x2020
    118e:	2020                	.insn	2, 0x2020
    1190:	2020                	.insn	2, 0x2020
    1192:	2020                	.insn	2, 0x2020
    1194:	2020                	.insn	2, 0x2020
    1196:	2020                	.insn	2, 0x2020
    1198:	2020                	.insn	2, 0x2020
    119a:	2020                	.insn	2, 0x2020
    119c:	2020                	.insn	2, 0x2020
    119e:	2020                	.insn	2, 0x2020
    11a0:	2020                	.insn	2, 0x2020
    11a2:	2020                	.insn	2, 0x2020
    11a4:	2020                	.insn	2, 0x2020
    11a6:	2020                	.insn	2, 0x2020
    11a8:	2020                	.insn	2, 0x2020
    11aa:	2020                	.insn	2, 0x2020
    11ac:	2020                	.insn	2, 0x2020
    11ae:	2020                	.insn	2, 0x2020
    11b0:	2020                	.insn	2, 0x2020
    11b2:	2020                	.insn	2, 0x2020
    11b4:	2020                	.insn	2, 0x2020
    11b6:	2020                	.insn	2, 0x2020
    11b8:	2020                	.insn	2, 0x2020
    11ba:	2020                	.insn	2, 0x2020
    11bc:	2020                	.insn	2, 0x2020
    11be:	2020                	.insn	2, 0x2020
    11c0:	2020                	.insn	2, 0x2020
    11c2:	2020                	.insn	2, 0x2020
    11c4:	2020                	.insn	2, 0x2020
    11c6:	2020                	.insn	2, 0x2020
    11c8:	2020                	.insn	2, 0x2020
    11ca:	2020                	.insn	2, 0x2020
    11cc:	2020                	.insn	2, 0x2020
    11ce:	2020                	.insn	2, 0x2020
    11d0:	2020                	.insn	2, 0x2020
    11d2:	2020                	.insn	2, 0x2020
    11d4:	2020                	.insn	2, 0x2020
    11d6:	2020                	.insn	2, 0x2020
    11d8:	2020                	.insn	2, 0x2020
    11da:	2020                	.insn	2, 0x2020
    11dc:	2020                	.insn	2, 0x2020
    11de:	2020                	.insn	2, 0x2020
    11e0:	2020                	.insn	2, 0x2020
    11e2:	2020                	.insn	2, 0x2020
    11e4:	2020                	.insn	2, 0x2020
    11e6:	2020                	.insn	2, 0x2020
    11e8:	2020                	.insn	2, 0x2020
    11ea:	2020                	.insn	2, 0x2020
    11ec:	2020                	.insn	2, 0x2020
    11ee:	2020                	.insn	2, 0x2020
    11f0:	2020                	.insn	2, 0x2020
    11f2:	2020                	.insn	2, 0x2020
    11f4:	2020                	.insn	2, 0x2020
    11f6:	2020                	.insn	2, 0x2020
    11f8:	2020                	.insn	2, 0x2020
    11fa:	2020                	.insn	2, 0x2020
    11fc:	2020                	.insn	2, 0x2020
    11fe:	2020                	.insn	2, 0x2020
    1200:	2020                	.insn	2, 0x2020
    1202:	2020                	.insn	2, 0x2020
    1204:	2020                	.insn	2, 0x2020
    1206:	2020                	.insn	2, 0x2020
    1208:	2020                	.insn	2, 0x2020
    120a:	2020                	.insn	2, 0x2020
    120c:	2020                	.insn	2, 0x2020
    120e:	2020                	.insn	2, 0x2020
    1210:	2020                	.insn	2, 0x2020
    1212:	2020                	.insn	2, 0x2020
    1214:	2020                	.insn	2, 0x2020
    1216:	2020                	.insn	2, 0x2020
    1218:	2020                	.insn	2, 0x2020
    121a:	2020                	.insn	2, 0x2020
    121c:	2020                	.insn	2, 0x2020
    121e:	2020                	.insn	2, 0x2020
    1220:	2020                	.insn	2, 0x2020
    1222:	2020                	.insn	2, 0x2020
    1224:	2020                	.insn	2, 0x2020
    1226:	2020                	.insn	2, 0x2020
    1228:	2020                	.insn	2, 0x2020
    122a:	2020                	.insn	2, 0x2020
    122c:	2020                	.insn	2, 0x2020
    122e:	2020                	.insn	2, 0x2020
    1230:	2020                	.insn	2, 0x2020
    1232:	2020                	.insn	2, 0x2020
    1234:	2020                	.insn	2, 0x2020
    1236:	2020                	.insn	2, 0x2020
    1238:	2020                	.insn	2, 0x2020
    123a:	2020                	.insn	2, 0x2020
    123c:	2020                	.insn	2, 0x2020
    123e:	2020                	.insn	2, 0x2020
    1240:	2020                	.insn	2, 0x2020
    1242:	2020                	.insn	2, 0x2020
    1244:	2020                	.insn	2, 0x2020
    1246:	2020                	.insn	2, 0x2020
    1248:	2020                	.insn	2, 0x2020
    124a:	2020                	.insn	2, 0x2020
    124c:	2020                	.insn	2, 0x2020
    124e:	2020                	.insn	2, 0x2020
    1250:	2020                	.insn	2, 0x2020
    1252:	2020                	.insn	2, 0x2020
    1254:	2020                	.insn	2, 0x2020
    1256:	2020                	.insn	2, 0x2020
    1258:	2020                	.insn	2, 0x2020
    125a:	2020                	.insn	2, 0x2020
    125c:	2020                	.insn	2, 0x2020
    125e:	2020                	.insn	2, 0x2020
    1260:	2020                	.insn	2, 0x2020
    1262:	2020                	.insn	2, 0x2020
    1264:	2020                	.insn	2, 0x2020
    1266:	2020                	.insn	2, 0x2020
    1268:	2020                	.insn	2, 0x2020
    126a:	2020                	.insn	2, 0x2020
    126c:	2020                	.insn	2, 0x2020
    126e:	2020                	.insn	2, 0x2020
    1270:	2020                	.insn	2, 0x2020
    1272:	2020                	.insn	2, 0x2020
    1274:	2020                	.insn	2, 0x2020
    1276:	2020                	.insn	2, 0x2020
    1278:	2020                	.insn	2, 0x2020
    127a:	2020                	.insn	2, 0x2020
    127c:	2020                	.insn	2, 0x2020
    127e:	2020                	.insn	2, 0x2020
    1280:	2020                	.insn	2, 0x2020
    1282:	2020                	.insn	2, 0x2020
    1284:	2020                	.insn	2, 0x2020
    1286:	2020                	.insn	2, 0x2020
    1288:	2020                	.insn	2, 0x2020
    128a:	2020                	.insn	2, 0x2020
    128c:	2020                	.insn	2, 0x2020
    128e:	2020                	.insn	2, 0x2020
    1290:	2020                	.insn	2, 0x2020
    1292:	2020                	.insn	2, 0x2020
    1294:	2020                	.insn	2, 0x2020
    1296:	2020                	.insn	2, 0x2020
    1298:	2020                	.insn	2, 0x2020
    129a:	2020                	.insn	2, 0x2020
    129c:	2020                	.insn	2, 0x2020
    129e:	2020                	.insn	2, 0x2020
    12a0:	2020                	.insn	2, 0x2020
    12a2:	2020                	.insn	2, 0x2020
    12a4:	2020                	.insn	2, 0x2020
    12a6:	2020                	.insn	2, 0x2020
    12a8:	2020                	.insn	2, 0x2020
    12aa:	2020                	.insn	2, 0x2020
    12ac:	2020                	.insn	2, 0x2020
    12ae:	2020                	.insn	2, 0x2020
    12b0:	2020                	.insn	2, 0x2020
    12b2:	2020                	.insn	2, 0x2020
    12b4:	2020                	.insn	2, 0x2020
    12b6:	2020                	.insn	2, 0x2020
    12b8:	2020                	.insn	2, 0x2020
    12ba:	2020                	.insn	2, 0x2020
    12bc:	2020                	.insn	2, 0x2020
    12be:	2020                	.insn	2, 0x2020
    12c0:	2020                	.insn	2, 0x2020
    12c2:	2020                	.insn	2, 0x2020
    12c4:	2020                	.insn	2, 0x2020
    12c6:	2020                	.insn	2, 0x2020
    12c8:	2020                	.insn	2, 0x2020
    12ca:	2020                	.insn	2, 0x2020
    12cc:	2020                	.insn	2, 0x2020
    12ce:	2020                	.insn	2, 0x2020
    12d0:	2020                	.insn	2, 0x2020
    12d2:	2020                	.insn	2, 0x2020
    12d4:	2020                	.insn	2, 0x2020
    12d6:	2020                	.insn	2, 0x2020
    12d8:	2020                	.insn	2, 0x2020
    12da:	2020                	.insn	2, 0x2020
    12dc:	2020                	.insn	2, 0x2020
    12de:	2020                	.insn	2, 0x2020
    12e0:	2020                	.insn	2, 0x2020
    12e2:	2020                	.insn	2, 0x2020
    12e4:	2020                	.insn	2, 0x2020
    12e6:	2020                	.insn	2, 0x2020
    12e8:	2020                	.insn	2, 0x2020
    12ea:	2020                	.insn	2, 0x2020
    12ec:	2020                	.insn	2, 0x2020
    12ee:	2020                	.insn	2, 0x2020
    12f0:	2020                	.insn	2, 0x2020
    12f2:	2020                	.insn	2, 0x2020
    12f4:	2020                	.insn	2, 0x2020
    12f6:	2020                	.insn	2, 0x2020
    12f8:	2020                	.insn	2, 0x2020
    12fa:	2020                	.insn	2, 0x2020
    12fc:	2020                	.insn	2, 0x2020
    12fe:	2020                	.insn	2, 0x2020
    1300:	2020                	.insn	2, 0x2020
    1302:	2020                	.insn	2, 0x2020
    1304:	2020                	.insn	2, 0x2020
    1306:	2020                	.insn	2, 0x2020
    1308:	2020                	.insn	2, 0x2020
    130a:	2020                	.insn	2, 0x2020
    130c:	2020                	.insn	2, 0x2020
    130e:	2020                	.insn	2, 0x2020
    1310:	2020                	.insn	2, 0x2020
    1312:	2020                	.insn	2, 0x2020
    1314:	2020                	.insn	2, 0x2020
    1316:	2020                	.insn	2, 0x2020
    1318:	2020                	.insn	2, 0x2020
    131a:	2020                	.insn	2, 0x2020
    131c:	2020                	.insn	2, 0x2020
    131e:	2020                	.insn	2, 0x2020
    1320:	2020                	.insn	2, 0x2020
    1322:	2020                	.insn	2, 0x2020
    1324:	2020                	.insn	2, 0x2020
    1326:	2020                	.insn	2, 0x2020
    1328:	2020                	.insn	2, 0x2020
    132a:	2020                	.insn	2, 0x2020
    132c:	2020                	.insn	2, 0x2020
    132e:	2020                	.insn	2, 0x2020
    1330:	2020                	.insn	2, 0x2020
    1332:	2020                	.insn	2, 0x2020
    1334:	2020                	.insn	2, 0x2020
    1336:	2020                	.insn	2, 0x2020
    1338:	2020                	.insn	2, 0x2020
    133a:	2020                	.insn	2, 0x2020
    133c:	2020                	.insn	2, 0x2020
    133e:	2020                	.insn	2, 0x2020
    1340:	2020                	.insn	2, 0x2020
    1342:	2020                	.insn	2, 0x2020
    1344:	2020                	.insn	2, 0x2020
    1346:	2020                	.insn	2, 0x2020
    1348:	2020                	.insn	2, 0x2020
    134a:	2020                	.insn	2, 0x2020
    134c:	2020                	.insn	2, 0x2020
    134e:	2020                	.insn	2, 0x2020
    1350:	2020                	.insn	2, 0x2020
    1352:	2020                	.insn	2, 0x2020
    1354:	4242                	.insn	2, 0x4242
    1356:	4242                	.insn	2, 0x4242
    1358:	4242                	.insn	2, 0x4242
    135a:	4242                	.insn	2, 0x4242
    135c:	4242                	.insn	2, 0x4242
    135e:	4242                	.insn	2, 0x4242
    1360:	4242                	.insn	2, 0x4242
    1362:	4242                	.insn	2, 0x4242
    1364:	4242                	.insn	2, 0x4242
    1366:	4242                	.insn	2, 0x4242
    1368:	4242                	.insn	2, 0x4242
    136a:	4242                	.insn	2, 0x4242
    136c:	4242                	.insn	2, 0x4242
    136e:	4242                	.insn	2, 0x4242
    1370:	4242                	.insn	2, 0x4242
    1372:	4242                	.insn	2, 0x4242
    1374:	4242                	.insn	2, 0x4242
    1376:	4242                	.insn	2, 0x4242
    1378:	4242                	.insn	2, 0x4242
    137a:	4242                	.insn	2, 0x4242
    137c:	4242                	.insn	2, 0x4242
    137e:	4242                	.insn	2, 0x4242
    1380:	4242                	.insn	2, 0x4242
    1382:	4242                	.insn	2, 0x4242
    1384:	4242                	.insn	2, 0x4242
    1386:	4242                	.insn	2, 0x4242
    1388:	4242                	.insn	2, 0x4242
    138a:	4242                	.insn	2, 0x4242
    138c:	4242                	.insn	2, 0x4242
    138e:	4242                	.insn	2, 0x4242
    1390:	4242                	.insn	2, 0x4242
    1392:	4242                	.insn	2, 0x4242
    1394:	4242                	.insn	2, 0x4242
    1396:	4242                	.insn	2, 0x4242
    1398:	4242                	.insn	2, 0x4242
    139a:	4242                	.insn	2, 0x4242
    139c:	4242                	.insn	2, 0x4242
    139e:	4242                	.insn	2, 0x4242
    13a0:	4242                	.insn	2, 0x4242
    13a2:	4242                	.insn	2, 0x4242
    13a4:	4242                	.insn	2, 0x4242
    13a6:	4242                	.insn	2, 0x4242
    13a8:	4242                	.insn	2, 0x4242
    13aa:	4242                	.insn	2, 0x4242
    13ac:	4242                	.insn	2, 0x4242
    13ae:	4242                	.insn	2, 0x4242
    13b0:	4242                	.insn	2, 0x4242
    13b2:	4242                	.insn	2, 0x4242
    13b4:	4242                	.insn	2, 0x4242
    13b6:	4242                	.insn	2, 0x4242
    13b8:	4242                	.insn	2, 0x4242
    13ba:	4242                	.insn	2, 0x4242
    13bc:	4242                	.insn	2, 0x4242
    13be:	4242                	.insn	2, 0x4242
    13c0:	4242                	.insn	2, 0x4242
    13c2:	4242                	.insn	2, 0x4242
    13c4:	4242                	.insn	2, 0x4242
    13c6:	4242                	.insn	2, 0x4242
    13c8:	4242                	.insn	2, 0x4242
    13ca:	4242                	.insn	2, 0x4242
    13cc:	4242                	.insn	2, 0x4242
    13ce:	4242                	.insn	2, 0x4242
    13d0:	4242                	.insn	2, 0x4242
    13d2:	4242                	.insn	2, 0x4242
    13d4:	4242                	.insn	2, 0x4242
    13d6:	4242                	.insn	2, 0x4242
    13d8:	4242                	.insn	2, 0x4242
    13da:	4242                	.insn	2, 0x4242
    13dc:	4242                	.insn	2, 0x4242
    13de:	4242                	.insn	2, 0x4242
    13e0:	4242                	.insn	2, 0x4242
    13e2:	4242                	.insn	2, 0x4242
    13e4:	4242                	.insn	2, 0x4242
    13e6:	4242                	.insn	2, 0x4242
    13e8:	4242                	.insn	2, 0x4242
    13ea:	4242                	.insn	2, 0x4242
    13ec:	4242                	.insn	2, 0x4242
    13ee:	4242                	.insn	2, 0x4242
    13f0:	4242                	.insn	2, 0x4242
    13f2:	4242                	.insn	2, 0x4242
    13f4:	2020                	.insn	2, 0x2020
    13f6:	2020                	.insn	2, 0x2020
    13f8:	2020                	.insn	2, 0x2020
    13fa:	2020                	.insn	2, 0x2020
    13fc:	2020                	.insn	2, 0x2020
    13fe:	2020                	.insn	2, 0x2020
    1400:	2020                	.insn	2, 0x2020
    1402:	2020                	.insn	2, 0x2020
    1404:	2020                	.insn	2, 0x2020
    1406:	2020                	.insn	2, 0x2020
    1408:	2020                	.insn	2, 0x2020
    140a:	2020                	.insn	2, 0x2020
    140c:	2020                	.insn	2, 0x2020
    140e:	2020                	.insn	2, 0x2020
    1410:	2020                	.insn	2, 0x2020
    1412:	2020                	.insn	2, 0x2020
    1414:	2020                	.insn	2, 0x2020
    1416:	2020                	.insn	2, 0x2020
    1418:	2020                	.insn	2, 0x2020
    141a:	2020                	.insn	2, 0x2020
    141c:	2020                	.insn	2, 0x2020
    141e:	2020                	.insn	2, 0x2020
    1420:	2020                	.insn	2, 0x2020
    1422:	2020                	.insn	2, 0x2020
    1424:	2020                	.insn	2, 0x2020
    1426:	2020                	.insn	2, 0x2020
    1428:	2020                	.insn	2, 0x2020
    142a:	2020                	.insn	2, 0x2020
    142c:	2020                	.insn	2, 0x2020
    142e:	2020                	.insn	2, 0x2020
    1430:	2020                	.insn	2, 0x2020
    1432:	2020                	.insn	2, 0x2020
    1434:	2020                	.insn	2, 0x2020
    1436:	2020                	.insn	2, 0x2020
    1438:	2020                	.insn	2, 0x2020
    143a:	2020                	.insn	2, 0x2020
    143c:	2020                	.insn	2, 0x2020
    143e:	2020                	.insn	2, 0x2020
    1440:	2020                	.insn	2, 0x2020
    1442:	2020                	.insn	2, 0x2020
    1444:	2020                	.insn	2, 0x2020
    1446:	2020                	.insn	2, 0x2020
    1448:	2020                	.insn	2, 0x2020
    144a:	2020                	.insn	2, 0x2020
    144c:	2020                	.insn	2, 0x2020
    144e:	2020                	.insn	2, 0x2020
    1450:	2020                	.insn	2, 0x2020
    1452:	2020                	.insn	2, 0x2020
    1454:	2020                	.insn	2, 0x2020
    1456:	2020                	.insn	2, 0x2020
    1458:	2020                	.insn	2, 0x2020
    145a:	2020                	.insn	2, 0x2020
    145c:	2020                	.insn	2, 0x2020
    145e:	2020                	.insn	2, 0x2020
    1460:	2020                	.insn	2, 0x2020
    1462:	2020                	.insn	2, 0x2020
    1464:	2020                	.insn	2, 0x2020
    1466:	2020                	.insn	2, 0x2020
    1468:	2020                	.insn	2, 0x2020
    146a:	2020                	.insn	2, 0x2020
    146c:	2020                	.insn	2, 0x2020
    146e:	2020                	.insn	2, 0x2020
    1470:	2020                	.insn	2, 0x2020
    1472:	2020                	.insn	2, 0x2020
    1474:	2020                	.insn	2, 0x2020
    1476:	2020                	.insn	2, 0x2020
    1478:	2020                	.insn	2, 0x2020
    147a:	2020                	.insn	2, 0x2020
    147c:	2020                	.insn	2, 0x2020
    147e:	2020                	.insn	2, 0x2020
    1480:	2020                	.insn	2, 0x2020
    1482:	2020                	.insn	2, 0x2020
    1484:	2020                	.insn	2, 0x2020
    1486:	2020                	.insn	2, 0x2020
    1488:	2020                	.insn	2, 0x2020
    148a:	2020                	.insn	2, 0x2020
    148c:	2020                	.insn	2, 0x2020
    148e:	2020                	.insn	2, 0x2020
    1490:	2020                	.insn	2, 0x2020
    1492:	2020                	.insn	2, 0x2020
    1494:	2020                	.insn	2, 0x2020
    1496:	2020                	.insn	2, 0x2020
    1498:	2020                	.insn	2, 0x2020
    149a:	2020                	.insn	2, 0x2020
    149c:	2020                	.insn	2, 0x2020
    149e:	2020                	.insn	2, 0x2020
    14a0:	2020                	.insn	2, 0x2020
    14a2:	2020                	.insn	2, 0x2020
    14a4:	2020                	.insn	2, 0x2020
    14a6:	2020                	.insn	2, 0x2020
    14a8:	2020                	.insn	2, 0x2020
    14aa:	2020                	.insn	2, 0x2020
    14ac:	2020                	.insn	2, 0x2020
    14ae:	2020                	.insn	2, 0x2020
    14b0:	2020                	.insn	2, 0x2020
    14b2:	2020                	.insn	2, 0x2020
    14b4:	2020                	.insn	2, 0x2020
    14b6:	2020                	.insn	2, 0x2020
    14b8:	2020                	.insn	2, 0x2020
    14ba:	2020                	.insn	2, 0x2020
    14bc:	2020                	.insn	2, 0x2020
    14be:	2020                	.insn	2, 0x2020
    14c0:	2020                	.insn	2, 0x2020
    14c2:	2020                	.insn	2, 0x2020
    14c4:	2020                	.insn	2, 0x2020
    14c6:	2020                	.insn	2, 0x2020
    14c8:	2020                	.insn	2, 0x2020
    14ca:	2020                	.insn	2, 0x2020
    14cc:	2020                	.insn	2, 0x2020
    14ce:	2020                	.insn	2, 0x2020
    14d0:	2020                	.insn	2, 0x2020
    14d2:	2020                	.insn	2, 0x2020
    14d4:	2020                	.insn	2, 0x2020
    14d6:	2020                	.insn	2, 0x2020
    14d8:	2020                	.insn	2, 0x2020
    14da:	2020                	.insn	2, 0x2020
    14dc:	2020                	.insn	2, 0x2020
    14de:	2020                	.insn	2, 0x2020
    14e0:	2020                	.insn	2, 0x2020
    14e2:	2020                	.insn	2, 0x2020
    14e4:	2020                	.insn	2, 0x2020
    14e6:	2020                	.insn	2, 0x2020
    14e8:	2020                	.insn	2, 0x2020
    14ea:	2020                	.insn	2, 0x2020
    14ec:	2020                	.insn	2, 0x2020
    14ee:	2020                	.insn	2, 0x2020
    14f0:	2020                	.insn	2, 0x2020
    14f2:	2020                	.insn	2, 0x2020
    14f4:	2020                	.insn	2, 0x2020
    14f6:	2020                	.insn	2, 0x2020
    14f8:	2020                	.insn	2, 0x2020
    14fa:	2020                	.insn	2, 0x2020
    14fc:	2020                	.insn	2, 0x2020
    14fe:	2020                	.insn	2, 0x2020
    1500:	2020                	.insn	2, 0x2020
    1502:	2020                	.insn	2, 0x2020
    1504:	2020                	.insn	2, 0x2020
    1506:	2020                	.insn	2, 0x2020
    1508:	2020                	.insn	2, 0x2020
    150a:	2020                	.insn	2, 0x2020
    150c:	2020                	.insn	2, 0x2020
    150e:	2020                	.insn	2, 0x2020
    1510:	2020                	.insn	2, 0x2020
    1512:	2020                	.insn	2, 0x2020
    1514:	2020                	.insn	2, 0x2020
    1516:	2020                	.insn	2, 0x2020
    1518:	2020                	.insn	2, 0x2020
    151a:	2020                	.insn	2, 0x2020
    151c:	2020                	.insn	2, 0x2020
    151e:	2020                	.insn	2, 0x2020
    1520:	2020                	.insn	2, 0x2020
    1522:	2020                	.insn	2, 0x2020
    1524:	2020                	.insn	2, 0x2020
    1526:	2020                	.insn	2, 0x2020
    1528:	2020                	.insn	2, 0x2020
    152a:	2020                	.insn	2, 0x2020
    152c:	2020                	.insn	2, 0x2020
    152e:	2020                	.insn	2, 0x2020
    1530:	2020                	.insn	2, 0x2020
    1532:	2020                	.insn	2, 0x2020
    1534:	2020                	.insn	2, 0x2020
    1536:	2020                	.insn	2, 0x2020
    1538:	2020                	.insn	2, 0x2020
    153a:	2020                	.insn	2, 0x2020
    153c:	2020                	.insn	2, 0x2020
    153e:	2020                	.insn	2, 0x2020
    1540:	2020                	.insn	2, 0x2020
    1542:	2020                	.insn	2, 0x2020
    1544:	2020                	.insn	2, 0x2020
    1546:	2020                	.insn	2, 0x2020
    1548:	2020                	.insn	2, 0x2020
    154a:	2020                	.insn	2, 0x2020
    154c:	2020                	.insn	2, 0x2020
    154e:	2020                	.insn	2, 0x2020
    1550:	2020                	.insn	2, 0x2020
    1552:	2020                	.insn	2, 0x2020
    1554:	2020                	.insn	2, 0x2020
    1556:	2020                	.insn	2, 0x2020
    1558:	2020                	.insn	2, 0x2020
    155a:	2020                	.insn	2, 0x2020
    155c:	2020                	.insn	2, 0x2020
    155e:	2020                	.insn	2, 0x2020
    1560:	2020                	.insn	2, 0x2020
    1562:	2020                	.insn	2, 0x2020
    1564:	2020                	.insn	2, 0x2020
    1566:	2020                	.insn	2, 0x2020
    1568:	2020                	.insn	2, 0x2020
    156a:	2020                	.insn	2, 0x2020
    156c:	2020                	.insn	2, 0x2020
    156e:	2020                	.insn	2, 0x2020
    1570:	2020                	.insn	2, 0x2020
    1572:	2020                	.insn	2, 0x2020
    1574:	2020                	.insn	2, 0x2020
    1576:	2020                	.insn	2, 0x2020
    1578:	2020                	.insn	2, 0x2020
    157a:	2020                	.insn	2, 0x2020
    157c:	2020                	.insn	2, 0x2020
    157e:	2020                	.insn	2, 0x2020
    1580:	2020                	.insn	2, 0x2020
    1582:	2020                	.insn	2, 0x2020
    1584:	2020                	.insn	2, 0x2020
    1586:	2020                	.insn	2, 0x2020
    1588:	2020                	.insn	2, 0x2020
    158a:	2020                	.insn	2, 0x2020
    158c:	2020                	.insn	2, 0x2020
    158e:	2020                	.insn	2, 0x2020
    1590:	2020                	.insn	2, 0x2020
    1592:	2020                	.insn	2, 0x2020
    1594:	2020                	.insn	2, 0x2020
    1596:	2020                	.insn	2, 0x2020
    1598:	2020                	.insn	2, 0x2020
    159a:	2020                	.insn	2, 0x2020
    159c:	2020                	.insn	2, 0x2020
    159e:	2020                	.insn	2, 0x2020
    15a0:	2020                	.insn	2, 0x2020
    15a2:	2020                	.insn	2, 0x2020
    15a4:	2020                	.insn	2, 0x2020
    15a6:	2020                	.insn	2, 0x2020
    15a8:	2020                	.insn	2, 0x2020
    15aa:	2020                	.insn	2, 0x2020
    15ac:	2020                	.insn	2, 0x2020
    15ae:	2020                	.insn	2, 0x2020
    15b0:	2020                	.insn	2, 0x2020
    15b2:	2020                	.insn	2, 0x2020
    15b4:	2020                	.insn	2, 0x2020
    15b6:	2020                	.insn	2, 0x2020
    15b8:	2020                	.insn	2, 0x2020
    15ba:	2020                	.insn	2, 0x2020
    15bc:	2020                	.insn	2, 0x2020
    15be:	2020                	.insn	2, 0x2020
    15c0:	2020                	.insn	2, 0x2020
    15c2:	2020                	.insn	2, 0x2020
    15c4:	2020                	.insn	2, 0x2020
    15c6:	2020                	.insn	2, 0x2020
    15c8:	2020                	.insn	2, 0x2020
    15ca:	2020                	.insn	2, 0x2020
    15cc:	2020                	.insn	2, 0x2020
    15ce:	2020                	.insn	2, 0x2020
    15d0:	2020                	.insn	2, 0x2020
    15d2:	2020                	.insn	2, 0x2020
    15d4:	2020                	.insn	2, 0x2020
    15d6:	2020                	.insn	2, 0x2020
    15d8:	2020                	.insn	2, 0x2020
    15da:	2020                	.insn	2, 0x2020
    15dc:	2020                	.insn	2, 0x2020
    15de:	2020                	.insn	2, 0x2020
    15e0:	2020                	.insn	2, 0x2020
    15e2:	2020                	.insn	2, 0x2020
    15e4:	2020                	.insn	2, 0x2020
    15e6:	2020                	.insn	2, 0x2020
    15e8:	2020                	.insn	2, 0x2020
    15ea:	2020                	.insn	2, 0x2020
    15ec:	2020                	.insn	2, 0x2020
    15ee:	2020                	.insn	2, 0x2020
    15f0:	2020                	.insn	2, 0x2020
    15f2:	2020                	.insn	2, 0x2020
    15f4:	2020                	.insn	2, 0x2020
    15f6:	2020                	.insn	2, 0x2020
    15f8:	2020                	.insn	2, 0x2020
    15fa:	2020                	.insn	2, 0x2020
    15fc:	2020                	.insn	2, 0x2020
    15fe:	2020                	.insn	2, 0x2020
    1600:	2020                	.insn	2, 0x2020
    1602:	2020                	.insn	2, 0x2020
    1604:	2020                	.insn	2, 0x2020
    1606:	2020                	.insn	2, 0x2020
    1608:	2020                	.insn	2, 0x2020
    160a:	2020                	.insn	2, 0x2020
    160c:	2020                	.insn	2, 0x2020
    160e:	2020                	.insn	2, 0x2020
    1610:	2020                	.insn	2, 0x2020
    1612:	2020                	.insn	2, 0x2020
    1614:	2020                	.insn	2, 0x2020
    1616:	2020                	.insn	2, 0x2020
    1618:	2020                	.insn	2, 0x2020
    161a:	2020                	.insn	2, 0x2020
    161c:	2020                	.insn	2, 0x2020
    161e:	2020                	.insn	2, 0x2020
    1620:	2020                	.insn	2, 0x2020
    1622:	2020                	.insn	2, 0x2020
    1624:	2020                	.insn	2, 0x2020
    1626:	2020                	.insn	2, 0x2020
    1628:	2020                	.insn	2, 0x2020
    162a:	2020                	.insn	2, 0x2020
    162c:	2020                	.insn	2, 0x2020
    162e:	2020                	.insn	2, 0x2020
    1630:	2020                	.insn	2, 0x2020
    1632:	2020                	.insn	2, 0x2020
    1634:	2020                	.insn	2, 0x2020
    1636:	2020                	.insn	2, 0x2020
    1638:	2020                	.insn	2, 0x2020
    163a:	2020                	.insn	2, 0x2020
    163c:	2020                	.insn	2, 0x2020
    163e:	2020                	.insn	2, 0x2020
    1640:	2020                	.insn	2, 0x2020
    1642:	2020                	.insn	2, 0x2020
    1644:	4920                	.insn	2, 0x4920
    1646:	74692073          	csrs	0x746,s2
    164a:	7320                	.insn	2, 0x7320
    164c:	7265                	.insn	2, 0x7265
    164e:	6f69                	.insn	2, 0x6f69
    1650:	7375                	.insn	2, 0x7375
    1652:	796c                	.insn	2, 0x796c
    1654:	7920                	.insn	2, 0x7920
    1656:	2072756f          	jal	a0,2905c <_data_end+0x26c5c>
    165a:	7270                	.insn	2, 0x7270
    165c:	6172676f          	jal	a4,28472 <_data_end+0x26072>
    1660:	3f6d                	.insn	2, 0x3f6d
    1662:	2820                	.insn	2, 0x2820
    1664:	44202943          	.insn	4, 0x44202943
    1668:	6c40                	.insn	2, 0x6c40
    166a:	233e4023          	.insn	4, 0x233e4023
    166e:	2020                	.insn	2, 0x2020
    1670:	2020                	.insn	2, 0x2020
    1672:	2020                	.insn	2, 0x2020
    1674:	2020                	.insn	2, 0x2020
    1676:	2020                	.insn	2, 0x2020
    1678:	2020                	.insn	2, 0x2020
    167a:	2020                	.insn	2, 0x2020
    167c:	2020                	.insn	2, 0x2020
    167e:	2020                	.insn	2, 0x2020
    1680:	2020                	.insn	2, 0x2020
    1682:	2020                	.insn	2, 0x2020
    1684:	2020                	.insn	2, 0x2020
    1686:	2020                	.insn	2, 0x2020
    1688:	2020                	.insn	2, 0x2020
    168a:	2020                	.insn	2, 0x2020
    168c:	2020                	.insn	2, 0x2020
    168e:	2020                	.insn	2, 0x2020
    1690:	2020                	.insn	2, 0x2020
    1692:	2020                	.insn	2, 0x2020
    1694:	2020                	.insn	2, 0x2020
    1696:	2020                	.insn	2, 0x2020
    1698:	2020                	.insn	2, 0x2020
    169a:	2020                	.insn	2, 0x2020
    169c:	2020                	.insn	2, 0x2020
    169e:	2020                	.insn	2, 0x2020
    16a0:	2020                	.insn	2, 0x2020
    16a2:	2020                	.insn	2, 0x2020
    16a4:	2020                	.insn	2, 0x2020
    16a6:	2020                	.insn	2, 0x2020
    16a8:	2020                	.insn	2, 0x2020
    16aa:	2020                	.insn	2, 0x2020
    16ac:	2020                	.insn	2, 0x2020
    16ae:	2020                	.insn	2, 0x2020
    16b0:	2020                	.insn	2, 0x2020
    16b2:	2020                	.insn	2, 0x2020
    16b4:	2020                	.insn	2, 0x2020
    16b6:	2020                	.insn	2, 0x2020
    16b8:	2020                	.insn	2, 0x2020
    16ba:	2020                	.insn	2, 0x2020
    16bc:	2020                	.insn	2, 0x2020
    16be:	2020                	.insn	2, 0x2020
    16c0:	2020                	.insn	2, 0x2020
    16c2:	2020                	.insn	2, 0x2020
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

