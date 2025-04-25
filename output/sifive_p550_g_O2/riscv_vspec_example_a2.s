	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
	.file	"riscv_vspec_example_a2.c"
	.text
	.globl	example_a2                      # -- Begin function example_a2
	.p2align	1
	.type	example_a2,@function
example_a2:                             # @example_a2
.Lfunc_begin0:
	.file	0 "/home/preames/benchmarking/simple-vector-riscv" "riscv_vspec_example_a2.c" md5 0x9b02bf33947894ea8d46575568f36cee
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: example_a2:a <- $x10
	#DEBUG_VALUE: example_a2:b <- $x11
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: example_a2:n <- $x13
	#DEBUG_VALUE: i <- 0
	.loc	0 6 3 prologue_end              # riscv_vspec_example_a2.c:6:3
	beqz	a3, .LBB0_3
.Ltmp0:
# %bb.1:                                # %for.body.preheader
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: example_a2:n <- $x13
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: example_a2:b <- $x11
	#DEBUG_VALUE: example_a2:a <- $x10
	andi	a6, a3, 7
	li	a4, 8
	bgeu	a3, a4, .LBB0_4
.Ltmp1:
# %bb.2:
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: example_a2:n <- $x13
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: example_a2:b <- $x11
	#DEBUG_VALUE: example_a2:a <- $x10
	.loc	0 0 3 is_stmt 0                 # riscv_vspec_example_a2.c:0:3
	li	a3, 0
.Ltmp2:
	.loc	0 7 12 is_stmt 1                # riscv_vspec_example_a2.c:7:12
	bnez	a6, .LBB0_23
.Ltmp3:
.LBB0_3:                                # %for.cond.cleanup
	#DEBUG_VALUE: example_a2:c <- $x12
	.loc	0 9 1                           # riscv_vspec_example_a2.c:9:1
	ret
.Ltmp4:
.LBB0_4:                                # %for.body.preheader.new
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: example_a2:n <- $x13
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: example_a2:b <- $x11
	#DEBUG_VALUE: example_a2:a <- $x10
	.loc	0 6 0                           # riscv_vspec_example_a2.c:6
	zext.w	a4, a3
	li	t0, 0
	.loc	0 6 3 is_stmt 0                 # riscv_vspec_example_a2.c:6:3
	addi	a3, a1, 3
.Ltmp5:
	andi	a4, a4, -8
	addi	t3, a2, 3
	addi	a5, a0, 3
	neg	a7, a4
	li	t1, 4
	j	.LBB0_6
.Ltmp6:
.LBB0_5:                                # %cond.end.7
                                        #   in Loop: Header=BB0_6 Depth=1
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 7, DW_OP_plus, DW_OP_stack_value] $x5
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: example_a2:b <- $x11
	#DEBUG_VALUE: example_a2:a <- $x10
	.loc	0 7 10 is_stmt 1                # riscv_vspec_example_a2.c:7:10
	sb	t2, 4(a3)
.Ltmp7:
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 8, DW_OP_plus, DW_OP_stack_value] $x5
	.loc	0 6 3                           # riscv_vspec_example_a2.c:6:3
	addi	t0, t0, -8
.Ltmp8:
	addi	a3, a3, 8
	addi	t3, t3, 8
	addi	a5, a5, 8
	beq	a7, t0, .LBB0_22
.Ltmp9:
.LBB0_6:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: example_a2:b <- $x11
	#DEBUG_VALUE: example_a2:a <- $x10
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_stack_value] $x5
	.loc	0 7 13                          # riscv_vspec_example_a2.c:7:13
	lbu	t4, -3(a5)
	li	t2, 1
	li	a4, 1
	.loc	0 7 12 is_stmt 0                # riscv_vspec_example_a2.c:7:12
	bltu	t1, t4, .LBB0_8
.Ltmp10:
# %bb.7:                                # %cond.true
                                        #   in Loop: Header=BB0_6 Depth=1
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_stack_value] $x5
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: example_a2:b <- $x11
	#DEBUG_VALUE: example_a2:a <- $x10
	.loc	0 7 25                          # riscv_vspec_example_a2.c:7:25
	lbu	a4, -3(t3)
.Ltmp11:
.LBB0_8:                                # %cond.end
                                        #   in Loop: Header=BB0_6 Depth=1
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_stack_value] $x5
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: example_a2:b <- $x11
	#DEBUG_VALUE: example_a2:a <- $x10
	.loc	0 7 10                          # riscv_vspec_example_a2.c:7:10
	sb	a4, -3(a3)
.Ltmp12:
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 1, DW_OP_plus, DW_OP_stack_value] $x5
	.loc	0 7 13                          # riscv_vspec_example_a2.c:7:13
	lbu	a4, -2(a5)
	.loc	0 7 12                          # riscv_vspec_example_a2.c:7:12
	bltu	t1, a4, .LBB0_10
.Ltmp13:
# %bb.9:                                # %cond.true.1
                                        #   in Loop: Header=BB0_6 Depth=1
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 1, DW_OP_plus, DW_OP_stack_value] $x5
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: example_a2:b <- $x11
	#DEBUG_VALUE: example_a2:a <- $x10
	.loc	0 7 25                          # riscv_vspec_example_a2.c:7:25
	lbu	t2, -2(t3)
.Ltmp14:
.LBB0_10:                               # %cond.end.1
                                        #   in Loop: Header=BB0_6 Depth=1
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 1, DW_OP_plus, DW_OP_stack_value] $x5
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: example_a2:b <- $x11
	#DEBUG_VALUE: example_a2:a <- $x10
	.loc	0 7 10                          # riscv_vspec_example_a2.c:7:10
	sb	t2, -2(a3)
.Ltmp15:
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 2, DW_OP_plus, DW_OP_stack_value] $x5
	.loc	0 0 10                          # riscv_vspec_example_a2.c:0:10
	li	t2, 1
	li	a4, 1
	.loc	0 7 13                          # riscv_vspec_example_a2.c:7:13
	lbu	t4, -1(a5)
	.loc	0 7 12                          # riscv_vspec_example_a2.c:7:12
	bltu	t1, t4, .LBB0_12
.Ltmp16:
# %bb.11:                               # %cond.true.2
                                        #   in Loop: Header=BB0_6 Depth=1
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 2, DW_OP_plus, DW_OP_stack_value] $x5
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: example_a2:b <- $x11
	#DEBUG_VALUE: example_a2:a <- $x10
	.loc	0 7 25                          # riscv_vspec_example_a2.c:7:25
	lbu	a4, -1(t3)
.Ltmp17:
.LBB0_12:                               # %cond.end.2
                                        #   in Loop: Header=BB0_6 Depth=1
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 2, DW_OP_plus, DW_OP_stack_value] $x5
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: example_a2:b <- $x11
	#DEBUG_VALUE: example_a2:a <- $x10
	.loc	0 7 10                          # riscv_vspec_example_a2.c:7:10
	sb	a4, -1(a3)
.Ltmp18:
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 3, DW_OP_plus, DW_OP_stack_value] $x5
	.loc	0 7 13                          # riscv_vspec_example_a2.c:7:13
	lbu	a4, 0(a5)
	.loc	0 7 12                          # riscv_vspec_example_a2.c:7:12
	bltu	t1, a4, .LBB0_14
.Ltmp19:
# %bb.13:                               # %cond.true.3
                                        #   in Loop: Header=BB0_6 Depth=1
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 3, DW_OP_plus, DW_OP_stack_value] $x5
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: example_a2:b <- $x11
	#DEBUG_VALUE: example_a2:a <- $x10
	.loc	0 7 25                          # riscv_vspec_example_a2.c:7:25
	lbu	t2, 0(t3)
.Ltmp20:
.LBB0_14:                               # %cond.end.3
                                        #   in Loop: Header=BB0_6 Depth=1
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 3, DW_OP_plus, DW_OP_stack_value] $x5
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: example_a2:b <- $x11
	#DEBUG_VALUE: example_a2:a <- $x10
	.loc	0 7 10                          # riscv_vspec_example_a2.c:7:10
	sb	t2, 0(a3)
.Ltmp21:
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 4, DW_OP_plus, DW_OP_stack_value] $x5
	.loc	0 0 10                          # riscv_vspec_example_a2.c:0:10
	li	t2, 1
	li	a4, 1
	.loc	0 7 13                          # riscv_vspec_example_a2.c:7:13
	lbu	t4, 1(a5)
	.loc	0 7 12                          # riscv_vspec_example_a2.c:7:12
	bltu	t1, t4, .LBB0_16
.Ltmp22:
# %bb.15:                               # %cond.true.4
                                        #   in Loop: Header=BB0_6 Depth=1
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 4, DW_OP_plus, DW_OP_stack_value] $x5
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: example_a2:b <- $x11
	#DEBUG_VALUE: example_a2:a <- $x10
	.loc	0 7 25                          # riscv_vspec_example_a2.c:7:25
	lbu	a4, 1(t3)
.Ltmp23:
.LBB0_16:                               # %cond.end.4
                                        #   in Loop: Header=BB0_6 Depth=1
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 4, DW_OP_plus, DW_OP_stack_value] $x5
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: example_a2:b <- $x11
	#DEBUG_VALUE: example_a2:a <- $x10
	.loc	0 7 10                          # riscv_vspec_example_a2.c:7:10
	sb	a4, 1(a3)
.Ltmp24:
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 5, DW_OP_plus, DW_OP_stack_value] $x5
	.loc	0 7 13                          # riscv_vspec_example_a2.c:7:13
	lbu	a4, 2(a5)
	.loc	0 7 12                          # riscv_vspec_example_a2.c:7:12
	bltu	t1, a4, .LBB0_18
.Ltmp25:
# %bb.17:                               # %cond.true.5
                                        #   in Loop: Header=BB0_6 Depth=1
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 5, DW_OP_plus, DW_OP_stack_value] $x5
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: example_a2:b <- $x11
	#DEBUG_VALUE: example_a2:a <- $x10
	.loc	0 7 25                          # riscv_vspec_example_a2.c:7:25
	lbu	t2, 2(t3)
.Ltmp26:
.LBB0_18:                               # %cond.end.5
                                        #   in Loop: Header=BB0_6 Depth=1
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 5, DW_OP_plus, DW_OP_stack_value] $x5
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: example_a2:b <- $x11
	#DEBUG_VALUE: example_a2:a <- $x10
	.loc	0 7 10                          # riscv_vspec_example_a2.c:7:10
	sb	t2, 2(a3)
.Ltmp27:
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 6, DW_OP_plus, DW_OP_stack_value] $x5
	.loc	0 0 10                          # riscv_vspec_example_a2.c:0:10
	li	t2, 1
	li	a4, 1
	.loc	0 7 13                          # riscv_vspec_example_a2.c:7:13
	lbu	t4, 3(a5)
	.loc	0 7 12                          # riscv_vspec_example_a2.c:7:12
	bltu	t1, t4, .LBB0_20
.Ltmp28:
# %bb.19:                               # %cond.true.6
                                        #   in Loop: Header=BB0_6 Depth=1
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 6, DW_OP_plus, DW_OP_stack_value] $x5
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: example_a2:b <- $x11
	#DEBUG_VALUE: example_a2:a <- $x10
	.loc	0 7 25                          # riscv_vspec_example_a2.c:7:25
	lbu	a4, 3(t3)
.Ltmp29:
.LBB0_20:                               # %cond.end.6
                                        #   in Loop: Header=BB0_6 Depth=1
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 6, DW_OP_plus, DW_OP_stack_value] $x5
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: example_a2:b <- $x11
	#DEBUG_VALUE: example_a2:a <- $x10
	.loc	0 7 10                          # riscv_vspec_example_a2.c:7:10
	sb	a4, 3(a3)
.Ltmp30:
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 7, DW_OP_plus, DW_OP_stack_value] $x5
	.loc	0 7 13                          # riscv_vspec_example_a2.c:7:13
	lbu	a4, 4(a5)
	.loc	0 7 12                          # riscv_vspec_example_a2.c:7:12
	bltu	t1, a4, .LBB0_5
.Ltmp31:
# %bb.21:                               # %cond.true.7
                                        #   in Loop: Header=BB0_6 Depth=1
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 7, DW_OP_plus, DW_OP_stack_value] $x5
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: example_a2:b <- $x11
	#DEBUG_VALUE: example_a2:a <- $x10
	.loc	0 7 25                          # riscv_vspec_example_a2.c:7:25
	lbu	t2, 4(t3)
	j	.LBB0_5
.Ltmp32:
.LBB0_22:                               # %for.cond.cleanup.loopexit.unr-lcssa.loopexit
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: example_a2:b <- $x11
	#DEBUG_VALUE: example_a2:a <- $x10
	.loc	0 7 12 is_stmt 1                # riscv_vspec_example_a2.c:7:12
	neg	a3, t0
	beqz	a6, .LBB0_3
.Ltmp33:
.LBB0_23:                               # %for.body.epil
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: example_a2:b <- $x11
	#DEBUG_VALUE: example_a2:a <- $x10
	#DEBUG_VALUE: i <- $x13
	.loc	0 7 13 is_stmt 0                # riscv_vspec_example_a2.c:7:13
	add	a7, a0, a3
	li	t0, 1
	li	a4, 4
	lbu	a0, 0(a7)
.Ltmp34:
	.loc	0 0 13                          # riscv_vspec_example_a2.c:0:13
	li	a5, 1
	.loc	0 7 12                          # riscv_vspec_example_a2.c:7:12
	bltu	a4, a0, .LBB0_25
.Ltmp35:
# %bb.24:                               # %cond.true.epil
	#DEBUG_VALUE: i <- $x13
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: example_a2:b <- $x11
	.loc	0 7 25                          # riscv_vspec_example_a2.c:7:25
	add	a0, a2, a3
	lbu	a5, 0(a0)
.Ltmp36:
.LBB0_25:                               # %cond.end.epil
	#DEBUG_VALUE: i <- $x13
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: example_a2:b <- $x11
	.loc	0 7 5                           # riscv_vspec_example_a2.c:7:5
	add	a1, a1, a3
.Ltmp37:
	.loc	0 7 10                          # riscv_vspec_example_a2.c:7:10
	sb	a5, 0(a1)
.Ltmp38:
	#DEBUG_VALUE: i <- $x13
	.loc	0 6 3 is_stmt 1                 # riscv_vspec_example_a2.c:6:3
	beq	a6, t0, .LBB0_3
.Ltmp39:
# %bb.26:                               # %for.body.epil.1
	#DEBUG_VALUE: i <- $x13
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: i <- $x13
	.loc	0 7 13                          # riscv_vspec_example_a2.c:7:13
	lbu	a0, 1(a7)
	li	a4, 4
	.loc	0 7 12 is_stmt 0                # riscv_vspec_example_a2.c:7:12
	bltu	a4, a0, .LBB0_28
.Ltmp40:
# %bb.27:                               # %cond.true.epil.1
	#DEBUG_VALUE: i <- $x13
	#DEBUG_VALUE: example_a2:c <- $x12
	.loc	0 7 25                          # riscv_vspec_example_a2.c:7:25
	add	a0, a2, a3
	lbu	a4, 1(a0)
	j	.LBB0_29
.Ltmp41:
.LBB0_28:
	#DEBUG_VALUE: i <- $x13
	#DEBUG_VALUE: example_a2:c <- $x12
	.loc	0 0 25                          # riscv_vspec_example_a2.c:0:25
	li	a4, 1
.Ltmp42:
.LBB0_29:                               # %cond.end.epil.1
	#DEBUG_VALUE: i <- $x13
	#DEBUG_VALUE: example_a2:c <- $x12
	li	a0, 2
	.loc	0 7 10 is_stmt 1                # riscv_vspec_example_a2.c:7:10
	sb	a4, 1(a1)
.Ltmp43:
	#DEBUG_VALUE: i <- $x13
	.loc	0 6 3                           # riscv_vspec_example_a2.c:6:3
	beq	a6, a0, .LBB0_3
.Ltmp44:
# %bb.30:                               # %for.body.epil.2
	#DEBUG_VALUE: i <- $x13
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: i <- $x13
	.loc	0 7 13                          # riscv_vspec_example_a2.c:7:13
	lbu	a0, 2(a7)
	li	a4, 4
	.loc	0 7 12 is_stmt 0                # riscv_vspec_example_a2.c:7:12
	bltu	a4, a0, .LBB0_32
.Ltmp45:
# %bb.31:                               # %cond.true.epil.2
	#DEBUG_VALUE: i <- $x13
	#DEBUG_VALUE: example_a2:c <- $x12
	.loc	0 7 25                          # riscv_vspec_example_a2.c:7:25
	add	a0, a2, a3
	lbu	a4, 2(a0)
	j	.LBB0_33
.Ltmp46:
.LBB0_32:
	#DEBUG_VALUE: i <- $x13
	#DEBUG_VALUE: example_a2:c <- $x12
	.loc	0 0 25                          # riscv_vspec_example_a2.c:0:25
	li	a4, 1
.Ltmp47:
.LBB0_33:                               # %cond.end.epil.2
	#DEBUG_VALUE: i <- $x13
	#DEBUG_VALUE: example_a2:c <- $x12
	li	a0, 3
	.loc	0 7 10 is_stmt 1                # riscv_vspec_example_a2.c:7:10
	sb	a4, 2(a1)
.Ltmp48:
	#DEBUG_VALUE: i <- $x13
	.loc	0 6 3                           # riscv_vspec_example_a2.c:6:3
	beq	a6, a0, .LBB0_3
.Ltmp49:
# %bb.34:                               # %for.body.epil.3
	#DEBUG_VALUE: i <- $x13
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: i <- $x13
	.loc	0 7 13                          # riscv_vspec_example_a2.c:7:13
	lbu	a0, 3(a7)
	li	a4, 4
	.loc	0 7 12 is_stmt 0                # riscv_vspec_example_a2.c:7:12
	bltu	a4, a0, .LBB0_36
.Ltmp50:
# %bb.35:                               # %cond.true.epil.3
	#DEBUG_VALUE: i <- $x13
	#DEBUG_VALUE: example_a2:c <- $x12
	.loc	0 7 25                          # riscv_vspec_example_a2.c:7:25
	add	a0, a2, a3
	lbu	a5, 3(a0)
	j	.LBB0_37
.Ltmp51:
.LBB0_36:
	#DEBUG_VALUE: i <- $x13
	#DEBUG_VALUE: example_a2:c <- $x12
	.loc	0 0 25                          # riscv_vspec_example_a2.c:0:25
	li	a5, 1
.Ltmp52:
.LBB0_37:                               # %cond.end.epil.3
	#DEBUG_VALUE: i <- $x13
	#DEBUG_VALUE: example_a2:c <- $x12
	.loc	0 7 10 is_stmt 1                # riscv_vspec_example_a2.c:7:10
	sb	a5, 3(a1)
.Ltmp53:
	#DEBUG_VALUE: i <- $x13
	.loc	0 6 3                           # riscv_vspec_example_a2.c:6:3
	beq	a6, a4, .LBB0_3
.Ltmp54:
# %bb.38:                               # %for.body.epil.4
	#DEBUG_VALUE: i <- $x13
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: i <- $x13
	.loc	0 7 13                          # riscv_vspec_example_a2.c:7:13
	lbu	a0, 4(a7)
	li	a4, 4
	.loc	0 7 12 is_stmt 0                # riscv_vspec_example_a2.c:7:12
	bltu	a4, a0, .LBB0_40
.Ltmp55:
# %bb.39:                               # %cond.true.epil.4
	#DEBUG_VALUE: i <- $x13
	#DEBUG_VALUE: example_a2:c <- $x12
	.loc	0 7 25                          # riscv_vspec_example_a2.c:7:25
	add	a0, a2, a3
	lbu	a4, 4(a0)
	j	.LBB0_41
.Ltmp56:
.LBB0_40:
	#DEBUG_VALUE: i <- $x13
	#DEBUG_VALUE: example_a2:c <- $x12
	.loc	0 0 25                          # riscv_vspec_example_a2.c:0:25
	li	a4, 1
.Ltmp57:
.LBB0_41:                               # %cond.end.epil.4
	#DEBUG_VALUE: i <- $x13
	#DEBUG_VALUE: example_a2:c <- $x12
	li	a0, 5
	.loc	0 7 10 is_stmt 1                # riscv_vspec_example_a2.c:7:10
	sb	a4, 4(a1)
.Ltmp58:
	#DEBUG_VALUE: i <- $x13
	.loc	0 6 3                           # riscv_vspec_example_a2.c:6:3
	beq	a6, a0, .LBB0_3
.Ltmp59:
# %bb.42:                               # %for.body.epil.5
	#DEBUG_VALUE: i <- $x13
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: i <- $x13
	.loc	0 7 13                          # riscv_vspec_example_a2.c:7:13
	lbu	a0, 5(a7)
	li	a4, 4
	.loc	0 7 12 is_stmt 0                # riscv_vspec_example_a2.c:7:12
	bltu	a4, a0, .LBB0_44
.Ltmp60:
# %bb.43:                               # %cond.true.epil.5
	#DEBUG_VALUE: i <- $x13
	#DEBUG_VALUE: example_a2:c <- $x12
	.loc	0 7 25                          # riscv_vspec_example_a2.c:7:25
	add	a0, a2, a3
	lbu	a4, 5(a0)
	j	.LBB0_45
.Ltmp61:
.LBB0_44:
	#DEBUG_VALUE: i <- $x13
	#DEBUG_VALUE: example_a2:c <- $x12
	.loc	0 0 25                          # riscv_vspec_example_a2.c:0:25
	li	a4, 1
.Ltmp62:
.LBB0_45:                               # %cond.end.epil.5
	#DEBUG_VALUE: i <- $x13
	#DEBUG_VALUE: example_a2:c <- $x12
	li	a0, 6
	.loc	0 7 10 is_stmt 1                # riscv_vspec_example_a2.c:7:10
	sb	a4, 5(a1)
.Ltmp63:
	#DEBUG_VALUE: i <- $x13
	.loc	0 6 3                           # riscv_vspec_example_a2.c:6:3
	beq	a6, a0, .LBB0_3
.Ltmp64:
# %bb.46:                               # %for.body.epil.6
	#DEBUG_VALUE: i <- $x13
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: i <- $x13
	.loc	0 7 13                          # riscv_vspec_example_a2.c:7:13
	lbu	a0, 6(a7)
	li	a4, 4
	.loc	0 7 12 is_stmt 0                # riscv_vspec_example_a2.c:7:12
	bltu	a4, a0, .LBB0_48
.Ltmp65:
# %bb.47:                               # %cond.true.epil.6
	#DEBUG_VALUE: i <- $x13
	#DEBUG_VALUE: example_a2:c <- $x12
	.loc	0 7 25                          # riscv_vspec_example_a2.c:7:25
	add	a2, a2, a3
.Ltmp66:
	lbu	a0, 6(a2)
	.loc	0 7 10                          # riscv_vspec_example_a2.c:7:10
	sb	a0, 6(a1)
.Ltmp67:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 7, DW_OP_stack_value] undef
	.loc	0 9 1 is_stmt 1                 # riscv_vspec_example_a2.c:9:1
	ret
.Ltmp68:
.LBB0_48:
	#DEBUG_VALUE: i <- $x13
	#DEBUG_VALUE: example_a2:c <- $x12
	.loc	0 0 1 is_stmt 0                 # riscv_vspec_example_a2.c:0:1
	li	a0, 1
.Ltmp69:
	.loc	0 7 10 is_stmt 1                # riscv_vspec_example_a2.c:7:10
	sb	a0, 6(a1)
.Ltmp70:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 7, DW_OP_stack_value] undef
	.loc	0 9 1                           # riscv_vspec_example_a2.c:9:1
	ret
.Ltmp71:
.Lfunc_end0:
	.size	example_a2, .Lfunc_end0-example_a2
	.cfi_endproc
                                        # -- End function
	.section	.debug_loclists,"",@progbits
	.word	.Ldebug_list_header_end0-.Ldebug_list_header_start0 # Length
.Ldebug_list_header_start0:
	.half	5                               # Version
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
	.word	5                               # Offset entry count
.Lloclists_table_base0:
	.word	.Ldebug_loc0-.Lloclists_table_base0
	.word	.Ldebug_loc1-.Lloclists_table_base0
	.word	.Ldebug_loc2-.Lloclists_table_base0
	.word	.Ldebug_loc3-.Lloclists_table_base0
	.word	.Ldebug_loc4-.Lloclists_table_base0
.Ldebug_loc0:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp3-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp4-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp34-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc1:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp3-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	91                              # DW_OP_reg11
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp4-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp37-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	91                              # DW_OP_reg11
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc2:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp66-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	92                              # DW_OP_reg12
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp68-.Lfunc_begin0          #   starting offset
	.uleb128 .Lfunc_end0-.Lfunc_begin0      #   ending offset
	.byte	1                               # Loc expr size
	.byte	92                              # DW_OP_reg12
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc3:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp2-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	93                              # DW_OP_reg13
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp4-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp5-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	93                              # DW_OP_reg13
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc4:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp3-.Lfunc_begin0           #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp4-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp6-.Lfunc_begin0           #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp6-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp7-.Lfunc_begin0           #   ending offset
	.byte	12                              # Loc expr size
	.byte	117                             # DW_OP_breg5
	.byte	0                               # 0
	.byte	17                              # DW_OP_consts
	.byte	120                             # -8
	.byte	27                              # DW_OP_div
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	30                              # DW_OP_mul
	.byte	17                              # DW_OP_consts
	.byte	7                               # 7
	.byte	34                              # DW_OP_plus
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp7-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp8-.Lfunc_begin0           #   ending offset
	.byte	12                              # Loc expr size
	.byte	117                             # DW_OP_breg5
	.byte	0                               # 0
	.byte	17                              # DW_OP_consts
	.byte	120                             # -8
	.byte	27                              # DW_OP_div
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	30                              # DW_OP_mul
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	34                              # DW_OP_plus
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp9-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp12-.Lfunc_begin0          #   ending offset
	.byte	9                               # Loc expr size
	.byte	117                             # DW_OP_breg5
	.byte	0                               # 0
	.byte	17                              # DW_OP_consts
	.byte	120                             # -8
	.byte	27                              # DW_OP_div
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	30                              # DW_OP_mul
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp12-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp15-.Lfunc_begin0          #   ending offset
	.byte	12                              # Loc expr size
	.byte	117                             # DW_OP_breg5
	.byte	0                               # 0
	.byte	17                              # DW_OP_consts
	.byte	120                             # -8
	.byte	27                              # DW_OP_div
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	30                              # DW_OP_mul
	.byte	17                              # DW_OP_consts
	.byte	1                               # 1
	.byte	34                              # DW_OP_plus
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp15-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp18-.Lfunc_begin0          #   ending offset
	.byte	12                              # Loc expr size
	.byte	117                             # DW_OP_breg5
	.byte	0                               # 0
	.byte	17                              # DW_OP_consts
	.byte	120                             # -8
	.byte	27                              # DW_OP_div
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	30                              # DW_OP_mul
	.byte	17                              # DW_OP_consts
	.byte	2                               # 2
	.byte	34                              # DW_OP_plus
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp18-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp21-.Lfunc_begin0          #   ending offset
	.byte	12                              # Loc expr size
	.byte	117                             # DW_OP_breg5
	.byte	0                               # 0
	.byte	17                              # DW_OP_consts
	.byte	120                             # -8
	.byte	27                              # DW_OP_div
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	30                              # DW_OP_mul
	.byte	17                              # DW_OP_consts
	.byte	3                               # 3
	.byte	34                              # DW_OP_plus
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp21-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp24-.Lfunc_begin0          #   ending offset
	.byte	12                              # Loc expr size
	.byte	117                             # DW_OP_breg5
	.byte	0                               # 0
	.byte	17                              # DW_OP_consts
	.byte	120                             # -8
	.byte	27                              # DW_OP_div
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	30                              # DW_OP_mul
	.byte	17                              # DW_OP_consts
	.byte	4                               # 4
	.byte	34                              # DW_OP_plus
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp24-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp27-.Lfunc_begin0          #   ending offset
	.byte	12                              # Loc expr size
	.byte	117                             # DW_OP_breg5
	.byte	0                               # 0
	.byte	17                              # DW_OP_consts
	.byte	120                             # -8
	.byte	27                              # DW_OP_div
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	30                              # DW_OP_mul
	.byte	17                              # DW_OP_consts
	.byte	5                               # 5
	.byte	34                              # DW_OP_plus
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp27-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp30-.Lfunc_begin0          #   ending offset
	.byte	12                              # Loc expr size
	.byte	117                             # DW_OP_breg5
	.byte	0                               # 0
	.byte	17                              # DW_OP_consts
	.byte	120                             # -8
	.byte	27                              # DW_OP_div
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	30                              # DW_OP_mul
	.byte	17                              # DW_OP_consts
	.byte	6                               # 6
	.byte	34                              # DW_OP_plus
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp30-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp32-.Lfunc_begin0          #   ending offset
	.byte	12                              # Loc expr size
	.byte	117                             # DW_OP_breg5
	.byte	0                               # 0
	.byte	17                              # DW_OP_consts
	.byte	120                             # -8
	.byte	27                              # DW_OP_div
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	30                              # DW_OP_mul
	.byte	17                              # DW_OP_consts
	.byte	7                               # 7
	.byte	34                              # DW_OP_plus
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp33-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp67-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	93                              # DW_OP_reg13
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp68-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp70-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	93                              # DW_OP_reg13
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_list_header_end0:
	.section	.debug_abbrev,"",@progbits
	.byte	1                               # Abbreviation Code
	.byte	17                              # DW_TAG_compile_unit
	.byte	1                               # DW_CHILDREN_yes
	.byte	37                              # DW_AT_producer
	.byte	37                              # DW_FORM_strx1
	.byte	19                              # DW_AT_language
	.byte	5                               # DW_FORM_data2
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	114                             # DW_AT_str_offsets_base
	.byte	23                              # DW_FORM_sec_offset
	.byte	16                              # DW_AT_stmt_list
	.byte	23                              # DW_FORM_sec_offset
	.byte	27                              # DW_AT_comp_dir
	.byte	37                              # DW_FORM_strx1
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	115                             # DW_AT_addr_base
	.byte	23                              # DW_FORM_sec_offset
	.byte	116                             # DW_AT_rnglists_base
	.byte	23                              # DW_FORM_sec_offset
	.ascii	"\214\001"                      # DW_AT_loclists_base
	.byte	23                              # DW_FORM_sec_offset
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	2                               # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	64                              # DW_AT_frame_base
	.byte	24                              # DW_FORM_exprloc
	.byte	122                             # DW_AT_call_all_calls
	.byte	25                              # DW_FORM_flag_present
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	39                              # DW_AT_prototyped
	.byte	25                              # DW_FORM_flag_present
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	3                               # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	34                              # DW_FORM_loclistx
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	4                               # Abbreviation Code
	.byte	11                              # DW_TAG_lexical_block
	.byte	1                               # DW_CHILDREN_yes
	.byte	85                              # DW_AT_ranges
	.byte	35                              # DW_FORM_rnglistx
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	5                               # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	34                              # DW_FORM_loclistx
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	6                               # Abbreviation Code
	.byte	15                              # DW_TAG_pointer_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	7                               # Abbreviation Code
	.byte	36                              # DW_TAG_base_type
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	62                              # DW_AT_encoding
	.byte	11                              # DW_FORM_data1
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	0                               # EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.word	.Ldebug_info_end0-.Ldebug_info_start0 # Length of Unit
.Ldebug_info_start0:
	.half	5                               # DWARF version number
	.byte	1                               # DWARF Unit Type
	.byte	8                               # Address Size (in bytes)
	.word	.debug_abbrev                   # Offset Into Abbrev. Section
	.byte	1                               # Abbrev [1] 0xc:0x69 DW_TAG_compile_unit
	.byte	0                               # DW_AT_producer
	.half	29                              # DW_AT_language
	.byte	1                               # DW_AT_name
	.word	.Lstr_offsets_base0             # DW_AT_str_offsets_base
	.word	.Lline_table_start0             # DW_AT_stmt_list
	.byte	2                               # DW_AT_comp_dir
	.byte	0                               # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.word	.Laddr_table_base0              # DW_AT_addr_base
	.word	.Lrnglists_table_base0          # DW_AT_rnglists_base
	.word	.Lloclists_table_base0          # DW_AT_loclists_base
	.byte	2                               # Abbrev [2] 0x2b:0x3c DW_TAG_subprogram
	.byte	0                               # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	82
                                        # DW_AT_call_all_calls
	.byte	3                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	3                               # Abbrev [3] 0x36:0x9 DW_TAG_formal_parameter
	.byte	0                               # DW_AT_location
	.byte	4                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
	.word	103                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x3f:0x9 DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	6                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
	.word	103                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x48:0x9 DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	7                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
	.word	103                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x51:0x9 DW_TAG_formal_parameter
	.byte	3                               # DW_AT_location
	.byte	8                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
	.word	112                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x5a:0xc DW_TAG_lexical_block
	.byte	0                               # DW_AT_ranges
	.byte	5                               # Abbrev [5] 0x5c:0x9 DW_TAG_variable
	.byte	4                               # DW_AT_location
	.byte	10                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	6                               # DW_AT_decl_line
	.word	112                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	6                               # Abbrev [6] 0x67:0x5 DW_TAG_pointer_type
	.word	108                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x6c:0x4 DW_TAG_base_type
	.byte	5                               # DW_AT_name
	.byte	8                               # DW_AT_encoding
	.byte	1                               # DW_AT_byte_size
	.byte	7                               # Abbrev [7] 0x70:0x4 DW_TAG_base_type
	.byte	9                               # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	0                               # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_rnglists,"",@progbits
	.word	.Ldebug_list_header_end1-.Ldebug_list_header_start1 # Length
.Ldebug_list_header_start1:
	.half	5                               # Version
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
	.word	1                               # Offset entry count
.Lrnglists_table_base0:
	.word	.Ldebug_ranges0-.Lrnglists_table_base0
.Ldebug_ranges0:
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp3-.Lfunc_begin0           #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp4-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp67-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp69-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp70-.Lfunc_begin0          #   ending offset
	.byte	0                               # DW_RLE_end_of_list
.Ldebug_list_header_end1:
	.section	.debug_str_offsets,"",@progbits
	.word	48                              # Length of String Offsets Set
	.half	5
	.half	0
.Lstr_offsets_base0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)" # string offset=0
.Linfo_string1:
	.asciz	"riscv_vspec_example_a2.c"      # string offset=108
.Linfo_string2:
	.asciz	"/home/preames/benchmarking/simple-vector-riscv" # string offset=133
.Linfo_string3:
	.asciz	"example_a2"                    # string offset=180
.Linfo_string4:
	.asciz	"a"                             # string offset=191
.Linfo_string5:
	.asciz	"char"                          # string offset=193
.Linfo_string6:
	.asciz	"b"                             # string offset=198
.Linfo_string7:
	.asciz	"c"                             # string offset=200
.Linfo_string8:
	.asciz	"n"                             # string offset=202
.Linfo_string9:
	.asciz	"unsigned int"                  # string offset=204
.Linfo_string10:
	.asciz	"i"                             # string offset=217
	.section	.debug_str_offsets,"",@progbits
	.word	.Linfo_string0
	.word	.Linfo_string1
	.word	.Linfo_string2
	.word	.Linfo_string3
	.word	.Linfo_string4
	.word	.Linfo_string5
	.word	.Linfo_string6
	.word	.Linfo_string7
	.word	.Linfo_string8
	.word	.Linfo_string9
	.word	.Linfo_string10
	.section	.debug_addr,"",@progbits
	.word	.Ldebug_addr_end0-.Ldebug_addr_start0 # Length of contribution
.Ldebug_addr_start0:
	.half	5                               # DWARF version number
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
.Laddr_table_base0:
	.quad	.Lfunc_begin0
.Ldebug_addr_end0:
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.section	.debug_line,"",@progbits
.Lline_table_start0:
