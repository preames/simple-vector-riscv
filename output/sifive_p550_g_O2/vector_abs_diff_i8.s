	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
	.file	"vector_abs_diff_i8.c"
	.file	0 "/home/preames/benchmarking/simple-vector-riscv" "vector_abs_diff_i8.c" md5 0xe035d42647c44ff713e93eff9bb27637
	.text
	.globl	sub                             # -- Begin function sub
	.p2align	1
	.type	sub,@function
sub:                                    # @sub
.Lfunc_begin0:
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: sub:a <- $x10
	#DEBUG_VALUE: sub:b <- $x11
	.loc	0 6 26 prologue_end             # vector_abs_diff_i8.c:6:26
	subw	a0, a0, a1
.Ltmp0:
	.loc	0 6 3 is_stmt 0                 # vector_abs_diff_i8.c:6:3
	sext.b	a0, a0
	ret
.Ltmp1:
.Lfunc_end0:
	.size	sub, .Lfunc_end0-sub
	.cfi_endproc
                                        # -- End function
	.globl	myabs                           # -- Begin function myabs
	.p2align	1
	.type	myabs,@function
myabs:                                  # @myabs
.Lfunc_begin1:
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: myabs:c <- $x10
	.loc	0 11 10 prologue_end is_stmt 1  # vector_abs_diff_i8.c:11:10
	neg	a1, a0
	max	a0, a0, a1
.Ltmp2:
	.loc	0 11 3 is_stmt 0                # vector_abs_diff_i8.c:11:3
	sext.b	a0, a0
	ret
.Ltmp3:
.Lfunc_end1:
	.size	myabs, .Lfunc_end1-myabs
	.cfi_endproc
                                        # -- End function
	.globl	vector_abs_diff                 # -- Begin function vector_abs_diff
	.p2align	1
	.type	vector_abs_diff,@function
vector_abs_diff:                        # @vector_abs_diff
.Lfunc_begin2:
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: vector_abs_diff:c <- $x10
	#DEBUG_VALUE: vector_abs_diff:a <- $x11
	#DEBUG_VALUE: vector_abs_diff:b <- $x12
	#DEBUG_VALUE: vector_abs_diff:N <- $x13
	#DEBUG_VALUE: i <- 0
	.loc	0 15 3 prologue_end is_stmt 1   # vector_abs_diff_i8.c:15:3
	beqz	a3, .LBB2_3
.Ltmp4:
# %bb.1:                                # %for.body.preheader
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: vector_abs_diff:N <- $x13
	#DEBUG_VALUE: vector_abs_diff:b <- $x12
	#DEBUG_VALUE: vector_abs_diff:a <- $x11
	#DEBUG_VALUE: vector_abs_diff:c <- $x10
	andi	a6, a3, 7
	li	a4, 8
	bgeu	a3, a4, .LBB2_4
.Ltmp5:
# %bb.2:
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: vector_abs_diff:N <- $x13
	#DEBUG_VALUE: vector_abs_diff:b <- $x12
	#DEBUG_VALUE: vector_abs_diff:a <- $x11
	#DEBUG_VALUE: vector_abs_diff:c <- $x10
	.loc	0 0 3 is_stmt 0                 # vector_abs_diff_i8.c:0:3
	li	a3, 0
.Ltmp6:
	.loc	0 15 3                          # vector_abs_diff_i8.c:15:3
	bnez	a6, .LBB2_7
.Ltmp7:
.LBB2_3:                                # %for.cond.cleanup
	.loc	0 18 1 is_stmt 1                # vector_abs_diff_i8.c:18:1
	ret
.LBB2_4:                                # %for.body.preheader.new
.Ltmp8:
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: vector_abs_diff:N <- $x13
	#DEBUG_VALUE: vector_abs_diff:b <- $x12
	#DEBUG_VALUE: vector_abs_diff:a <- $x11
	#DEBUG_VALUE: vector_abs_diff:c <- $x10
	.loc	0 15 0                          # vector_abs_diff_i8.c:15
	zext.w	a3, a3
.Ltmp9:
	.loc	0 0 0 is_stmt 0                 # vector_abs_diff_i8.c:0:0
	li	t0, 0
	.loc	0 15 3                          # vector_abs_diff_i8.c:15:3
	addi	t2, a0, 3
	andi	a3, a3, -8
	addi	a5, a1, 3
	neg	a7, a3
	addi	a3, a2, 3
.Ltmp10:
.LBB2_5:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: vector_abs_diff:b <- $x12
	#DEBUG_VALUE: vector_abs_diff:a <- $x11
	#DEBUG_VALUE: vector_abs_diff:c <- $x10
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_stack_value] $x5
	.loc	0 16 22 is_stmt 1               # vector_abs_diff_i8.c:16:22
	lbu	t1, -3(a5)
.Ltmp11:
	.loc	0 15 3                          # vector_abs_diff_i8.c:15:3
	addi	t0, t0, -8
.Ltmp12:
	.loc	0 16 28                         # vector_abs_diff_i8.c:16:28
	lbu	a4, -3(a3)
.Ltmp13:
	#DEBUG_VALUE: sub:b <- $x14
	#DEBUG_VALUE: sub:a <- $x6
	.loc	0 6 26                          # vector_abs_diff_i8.c:6:26 @[ vector_abs_diff_i8.c:16:18 ]
	sub	a4, t1, a4
.Ltmp14:
	#DEBUG_VALUE: myabs:c <- $x14
	sext.b	t1, a4
.Ltmp15:
	.loc	0 11 10                         # vector_abs_diff_i8.c:11:10 @[ vector_abs_diff_i8.c:16:12 ]
	neg	a4, t1
.Ltmp16:
	max	a4, t1, a4
.Ltmp17:
	.loc	0 16 10                         # vector_abs_diff_i8.c:16:10
	sb	a4, -3(t2)
.Ltmp18:
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 1, DW_OP_plus, DW_OP_stack_value] $x5
	.loc	0 16 22 is_stmt 0               # vector_abs_diff_i8.c:16:22
	lbu	t1, -2(a5)
	.loc	0 16 28                         # vector_abs_diff_i8.c:16:28
	lbu	a4, -2(a3)
.Ltmp19:
	#DEBUG_VALUE: sub:b <- $x14
	#DEBUG_VALUE: sub:a <- $x6
	.loc	0 6 26 is_stmt 1                # vector_abs_diff_i8.c:6:26 @[ vector_abs_diff_i8.c:16:18 ]
	sub	a4, t1, a4
.Ltmp20:
	#DEBUG_VALUE: myabs:c <- $x14
	sext.b	t1, a4
.Ltmp21:
	.loc	0 11 10                         # vector_abs_diff_i8.c:11:10 @[ vector_abs_diff_i8.c:16:12 ]
	neg	a4, t1
.Ltmp22:
	max	a4, t1, a4
.Ltmp23:
	.loc	0 16 10                         # vector_abs_diff_i8.c:16:10
	sb	a4, -2(t2)
.Ltmp24:
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 2, DW_OP_plus, DW_OP_stack_value] $x5
	.loc	0 16 22 is_stmt 0               # vector_abs_diff_i8.c:16:22
	lbu	t1, -1(a5)
	.loc	0 16 28                         # vector_abs_diff_i8.c:16:28
	lbu	a4, -1(a3)
.Ltmp25:
	#DEBUG_VALUE: sub:b <- $x14
	#DEBUG_VALUE: sub:a <- $x6
	.loc	0 6 26 is_stmt 1                # vector_abs_diff_i8.c:6:26 @[ vector_abs_diff_i8.c:16:18 ]
	sub	a4, t1, a4
.Ltmp26:
	#DEBUG_VALUE: myabs:c <- $x14
	sext.b	t1, a4
.Ltmp27:
	.loc	0 11 10                         # vector_abs_diff_i8.c:11:10 @[ vector_abs_diff_i8.c:16:12 ]
	neg	a4, t1
.Ltmp28:
	max	a4, t1, a4
.Ltmp29:
	.loc	0 16 10                         # vector_abs_diff_i8.c:16:10
	sb	a4, -1(t2)
.Ltmp30:
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 3, DW_OP_plus, DW_OP_stack_value] $x5
	.loc	0 16 22 is_stmt 0               # vector_abs_diff_i8.c:16:22
	lbu	t1, 0(a5)
	.loc	0 16 28                         # vector_abs_diff_i8.c:16:28
	lbu	a4, 0(a3)
.Ltmp31:
	#DEBUG_VALUE: sub:b <- $x14
	#DEBUG_VALUE: sub:a <- $x6
	.loc	0 6 26 is_stmt 1                # vector_abs_diff_i8.c:6:26 @[ vector_abs_diff_i8.c:16:18 ]
	sub	a4, t1, a4
.Ltmp32:
	#DEBUG_VALUE: myabs:c <- $x14
	sext.b	t1, a4
.Ltmp33:
	.loc	0 11 10                         # vector_abs_diff_i8.c:11:10 @[ vector_abs_diff_i8.c:16:12 ]
	neg	a4, t1
.Ltmp34:
	max	a4, t1, a4
.Ltmp35:
	.loc	0 16 10                         # vector_abs_diff_i8.c:16:10
	sb	a4, 0(t2)
.Ltmp36:
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 4, DW_OP_plus, DW_OP_stack_value] $x5
	.loc	0 16 22 is_stmt 0               # vector_abs_diff_i8.c:16:22
	lbu	t1, 1(a5)
	.loc	0 16 28                         # vector_abs_diff_i8.c:16:28
	lbu	a4, 1(a3)
.Ltmp37:
	#DEBUG_VALUE: sub:b <- $x14
	#DEBUG_VALUE: sub:a <- $x6
	.loc	0 6 26 is_stmt 1                # vector_abs_diff_i8.c:6:26 @[ vector_abs_diff_i8.c:16:18 ]
	sub	a4, t1, a4
.Ltmp38:
	#DEBUG_VALUE: myabs:c <- $x14
	sext.b	t1, a4
.Ltmp39:
	.loc	0 11 10                         # vector_abs_diff_i8.c:11:10 @[ vector_abs_diff_i8.c:16:12 ]
	neg	a4, t1
.Ltmp40:
	max	a4, t1, a4
.Ltmp41:
	.loc	0 16 10                         # vector_abs_diff_i8.c:16:10
	sb	a4, 1(t2)
.Ltmp42:
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 5, DW_OP_plus, DW_OP_stack_value] $x5
	.loc	0 16 22 is_stmt 0               # vector_abs_diff_i8.c:16:22
	lbu	t1, 2(a5)
	.loc	0 16 28                         # vector_abs_diff_i8.c:16:28
	lbu	a4, 2(a3)
.Ltmp43:
	#DEBUG_VALUE: sub:b <- $x14
	#DEBUG_VALUE: sub:a <- $x6
	.loc	0 6 26 is_stmt 1                # vector_abs_diff_i8.c:6:26 @[ vector_abs_diff_i8.c:16:18 ]
	sub	a4, t1, a4
.Ltmp44:
	#DEBUG_VALUE: myabs:c <- $x14
	sext.b	t1, a4
.Ltmp45:
	.loc	0 11 10                         # vector_abs_diff_i8.c:11:10 @[ vector_abs_diff_i8.c:16:12 ]
	neg	a4, t1
.Ltmp46:
	max	a4, t1, a4
.Ltmp47:
	.loc	0 16 10                         # vector_abs_diff_i8.c:16:10
	sb	a4, 2(t2)
.Ltmp48:
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 6, DW_OP_plus, DW_OP_stack_value] $x5
	.loc	0 16 22 is_stmt 0               # vector_abs_diff_i8.c:16:22
	lbu	t1, 3(a5)
	.loc	0 16 28                         # vector_abs_diff_i8.c:16:28
	lbu	a4, 3(a3)
.Ltmp49:
	#DEBUG_VALUE: sub:b <- $x14
	#DEBUG_VALUE: sub:a <- $x6
	.loc	0 6 26 is_stmt 1                # vector_abs_diff_i8.c:6:26 @[ vector_abs_diff_i8.c:16:18 ]
	sub	a4, t1, a4
.Ltmp50:
	#DEBUG_VALUE: myabs:c <- $x14
	sext.b	t1, a4
.Ltmp51:
	.loc	0 11 10                         # vector_abs_diff_i8.c:11:10 @[ vector_abs_diff_i8.c:16:12 ]
	neg	a4, t1
.Ltmp52:
	max	a4, t1, a4
.Ltmp53:
	.loc	0 16 10                         # vector_abs_diff_i8.c:16:10
	sb	a4, 3(t2)
.Ltmp54:
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 7, DW_OP_plus, DW_OP_stack_value] $x5
	.loc	0 16 22 is_stmt 0               # vector_abs_diff_i8.c:16:22
	lbu	t1, 4(a5)
	.loc	0 16 28                         # vector_abs_diff_i8.c:16:28
	lbu	a4, 4(a3)
.Ltmp55:
	#DEBUG_VALUE: sub:b <- $x14
	#DEBUG_VALUE: sub:a <- $x6
	.loc	0 15 3 is_stmt 1                # vector_abs_diff_i8.c:15:3
	addi	a3, a3, 8
	addi	a5, a5, 8
.Ltmp56:
	.loc	0 6 26                          # vector_abs_diff_i8.c:6:26 @[ vector_abs_diff_i8.c:16:18 ]
	sub	a4, t1, a4
.Ltmp57:
	#DEBUG_VALUE: myabs:c <- $x14
	sext.b	a4, a4
.Ltmp58:
	.loc	0 11 10                         # vector_abs_diff_i8.c:11:10 @[ vector_abs_diff_i8.c:16:12 ]
	neg	t1, a4
.Ltmp59:
	max	a4, a4, t1
.Ltmp60:
	.loc	0 16 10                         # vector_abs_diff_i8.c:16:10
	sb	a4, 4(t2)
.Ltmp61:
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 8, DW_OP_plus, DW_OP_stack_value] $x5
	.loc	0 15 3                          # vector_abs_diff_i8.c:15:3
	addi	t2, t2, 8
	bne	a7, t0, .LBB2_5
.Ltmp62:
# %bb.6:                                # %for.cond.cleanup.loopexit.unr-lcssa.loopexit
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 8, DW_OP_plus, DW_OP_stack_value] $x5
	#DEBUG_VALUE: vector_abs_diff:b <- $x12
	#DEBUG_VALUE: vector_abs_diff:a <- $x11
	#DEBUG_VALUE: vector_abs_diff:c <- $x10
	neg	a3, t0
	beqz	a6, .LBB2_3
.Ltmp63:
.LBB2_7:                                # %for.body.epil
	#DEBUG_VALUE: vector_abs_diff:b <- $x12
	#DEBUG_VALUE: vector_abs_diff:a <- $x11
	#DEBUG_VALUE: vector_abs_diff:c <- $x10
	#DEBUG_VALUE: i <- $x13
	.loc	0 16 22                         # vector_abs_diff_i8.c:16:22
	add	a1, a1, a3
.Ltmp64:
	.loc	0 16 28 is_stmt 0               # vector_abs_diff_i8.c:16:28
	add	a2, a2, a3
.Ltmp65:
	.loc	0 16 5                          # vector_abs_diff_i8.c:16:5
	add	a0, a0, a3
.Ltmp66:
	.loc	0 16 22                         # vector_abs_diff_i8.c:16:22
	lbu	a4, 0(a1)
	.loc	0 16 28                         # vector_abs_diff_i8.c:16:28
	lbu	a5, 0(a2)
.Ltmp67:
	#DEBUG_VALUE: sub:b <- $x15
	#DEBUG_VALUE: sub:a <- $x14
	.loc	0 0 28                          # vector_abs_diff_i8.c:0:28
	li	a3, 1
.Ltmp68:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 1, DW_OP_stack_value] undef
	.loc	0 6 26 is_stmt 1                # vector_abs_diff_i8.c:6:26 @[ vector_abs_diff_i8.c:16:18 ]
	sub	a4, a4, a5
.Ltmp69:
	#DEBUG_VALUE: myabs:c <- $x14
	sext.b	a4, a4
.Ltmp70:
	.loc	0 11 10                         # vector_abs_diff_i8.c:11:10 @[ vector_abs_diff_i8.c:16:12 ]
	neg	a5, a4
.Ltmp71:
	max	a4, a4, a5
.Ltmp72:
	.loc	0 16 10                         # vector_abs_diff_i8.c:16:10
	sb	a4, 0(a0)
.Ltmp73:
	.loc	0 15 3                          # vector_abs_diff_i8.c:15:3
	beq	a6, a3, .LBB2_3
.Ltmp74:
# %bb.8:                                # %for.body.epil.1
	#DEBUG_VALUE: i <- undef
	.loc	0 16 22                         # vector_abs_diff_i8.c:16:22
	lbu	a3, 1(a1)
	.loc	0 16 28 is_stmt 0               # vector_abs_diff_i8.c:16:28
	lbu	a4, 1(a2)
.Ltmp75:
	#DEBUG_VALUE: sub:b <- $x14
	#DEBUG_VALUE: sub:a <- $x13
	.loc	0 6 26 is_stmt 1                # vector_abs_diff_i8.c:6:26 @[ vector_abs_diff_i8.c:16:18 ]
	sub	a3, a3, a4
.Ltmp76:
	#DEBUG_VALUE: myabs:c <- $x13
	sext.b	a3, a3
.Ltmp77:
	.loc	0 11 10                         # vector_abs_diff_i8.c:11:10 @[ vector_abs_diff_i8.c:16:12 ]
	neg	a4, a3
.Ltmp78:
	max	a3, a3, a4
.Ltmp79:
	.loc	0 16 10                         # vector_abs_diff_i8.c:16:10
	sb	a3, 1(a0)
	li	a3, 2
.Ltmp80:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 2, DW_OP_stack_value] undef
	.loc	0 15 3                          # vector_abs_diff_i8.c:15:3
	beq	a6, a3, .LBB2_3
.Ltmp81:
# %bb.9:                                # %for.body.epil.2
	#DEBUG_VALUE: i <- undef
	.loc	0 16 22                         # vector_abs_diff_i8.c:16:22
	lbu	a3, 2(a1)
	.loc	0 16 28 is_stmt 0               # vector_abs_diff_i8.c:16:28
	lbu	a4, 2(a2)
.Ltmp82:
	#DEBUG_VALUE: sub:b <- $x14
	#DEBUG_VALUE: sub:a <- $x13
	.loc	0 6 26 is_stmt 1                # vector_abs_diff_i8.c:6:26 @[ vector_abs_diff_i8.c:16:18 ]
	sub	a3, a3, a4
.Ltmp83:
	#DEBUG_VALUE: myabs:c <- $x13
	sext.b	a3, a3
.Ltmp84:
	.loc	0 11 10                         # vector_abs_diff_i8.c:11:10 @[ vector_abs_diff_i8.c:16:12 ]
	neg	a4, a3
.Ltmp85:
	max	a3, a3, a4
.Ltmp86:
	.loc	0 16 10                         # vector_abs_diff_i8.c:16:10
	sb	a3, 2(a0)
	li	a3, 3
.Ltmp87:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 3, DW_OP_stack_value] undef
	.loc	0 15 3                          # vector_abs_diff_i8.c:15:3
	beq	a6, a3, .LBB2_3
.Ltmp88:
# %bb.10:                               # %for.body.epil.3
	#DEBUG_VALUE: i <- undef
	.loc	0 16 22                         # vector_abs_diff_i8.c:16:22
	lbu	a3, 3(a1)
	.loc	0 16 28 is_stmt 0               # vector_abs_diff_i8.c:16:28
	lbu	a4, 3(a2)
.Ltmp89:
	#DEBUG_VALUE: sub:b <- $x14
	#DEBUG_VALUE: sub:a <- $x13
	.loc	0 6 26 is_stmt 1                # vector_abs_diff_i8.c:6:26 @[ vector_abs_diff_i8.c:16:18 ]
	sub	a3, a3, a4
.Ltmp90:
	#DEBUG_VALUE: myabs:c <- $x13
	sext.b	a3, a3
.Ltmp91:
	.loc	0 11 10                         # vector_abs_diff_i8.c:11:10 @[ vector_abs_diff_i8.c:16:12 ]
	neg	a4, a3
.Ltmp92:
	max	a3, a3, a4
.Ltmp93:
	.loc	0 16 10                         # vector_abs_diff_i8.c:16:10
	sb	a3, 3(a0)
	li	a3, 4
.Ltmp94:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 4, DW_OP_stack_value] undef
	.loc	0 15 3                          # vector_abs_diff_i8.c:15:3
	beq	a6, a3, .LBB2_3
.Ltmp95:
# %bb.11:                               # %for.body.epil.4
	#DEBUG_VALUE: i <- undef
	.loc	0 16 22                         # vector_abs_diff_i8.c:16:22
	lbu	a3, 4(a1)
	.loc	0 16 28 is_stmt 0               # vector_abs_diff_i8.c:16:28
	lbu	a4, 4(a2)
.Ltmp96:
	#DEBUG_VALUE: sub:b <- $x14
	#DEBUG_VALUE: sub:a <- $x13
	.loc	0 6 26 is_stmt 1                # vector_abs_diff_i8.c:6:26 @[ vector_abs_diff_i8.c:16:18 ]
	sub	a3, a3, a4
.Ltmp97:
	#DEBUG_VALUE: myabs:c <- $x13
	sext.b	a3, a3
.Ltmp98:
	.loc	0 11 10                         # vector_abs_diff_i8.c:11:10 @[ vector_abs_diff_i8.c:16:12 ]
	neg	a4, a3
.Ltmp99:
	max	a3, a3, a4
.Ltmp100:
	.loc	0 16 10                         # vector_abs_diff_i8.c:16:10
	sb	a3, 4(a0)
	li	a3, 5
.Ltmp101:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 5, DW_OP_stack_value] undef
	.loc	0 15 3                          # vector_abs_diff_i8.c:15:3
	beq	a6, a3, .LBB2_3
.Ltmp102:
# %bb.12:                               # %for.body.epil.5
	#DEBUG_VALUE: i <- undef
	.loc	0 16 22                         # vector_abs_diff_i8.c:16:22
	lbu	a3, 5(a1)
	.loc	0 16 28 is_stmt 0               # vector_abs_diff_i8.c:16:28
	lbu	a4, 5(a2)
.Ltmp103:
	#DEBUG_VALUE: sub:b <- $x14
	#DEBUG_VALUE: sub:a <- $x13
	.loc	0 6 26 is_stmt 1                # vector_abs_diff_i8.c:6:26 @[ vector_abs_diff_i8.c:16:18 ]
	sub	a3, a3, a4
.Ltmp104:
	#DEBUG_VALUE: myabs:c <- $x13
	sext.b	a3, a3
.Ltmp105:
	.loc	0 11 10                         # vector_abs_diff_i8.c:11:10 @[ vector_abs_diff_i8.c:16:12 ]
	neg	a4, a3
.Ltmp106:
	max	a3, a3, a4
.Ltmp107:
	.loc	0 16 10                         # vector_abs_diff_i8.c:16:10
	sb	a3, 5(a0)
	li	a3, 6
.Ltmp108:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 6, DW_OP_stack_value] undef
	.loc	0 15 3                          # vector_abs_diff_i8.c:15:3
	beq	a6, a3, .LBB2_3
.Ltmp109:
# %bb.13:                               # %for.body.epil.6
	#DEBUG_VALUE: i <- undef
	.loc	0 16 22                         # vector_abs_diff_i8.c:16:22
	lbu	a1, 6(a1)
	.loc	0 16 28 is_stmt 0               # vector_abs_diff_i8.c:16:28
	lbu	a2, 6(a2)
.Ltmp110:
	#DEBUG_VALUE: sub:b <- $x12
	#DEBUG_VALUE: sub:a <- $x11
	.loc	0 6 26 is_stmt 1                # vector_abs_diff_i8.c:6:26 @[ vector_abs_diff_i8.c:16:18 ]
	sub	a1, a1, a2
.Ltmp111:
	#DEBUG_VALUE: myabs:c <- $x11
	sext.b	a1, a1
.Ltmp112:
	.loc	0 11 10                         # vector_abs_diff_i8.c:11:10 @[ vector_abs_diff_i8.c:16:12 ]
	neg	a2, a1
.Ltmp113:
	max	a1, a1, a2
.Ltmp114:
	.loc	0 16 10                         # vector_abs_diff_i8.c:16:10
	sb	a1, 6(a0)
.Ltmp115:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 7, DW_OP_stack_value] undef
	.loc	0 18 1                          # vector_abs_diff_i8.c:18:1
	ret
.Ltmp116:
.Lfunc_end2:
	.size	vector_abs_diff, .Lfunc_end2-vector_abs_diff
	.cfi_endproc
                                        # -- End function
	.section	.debug_loclists,"",@progbits
	.word	.Ldebug_list_header_end0-.Ldebug_list_header_start0 # Length
.Ldebug_list_header_start0:
	.half	5                               # Version
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
	.word	10                              # Offset entry count
.Lloclists_table_base0:
	.word	.Ldebug_loc0-.Lloclists_table_base0
	.word	.Ldebug_loc1-.Lloclists_table_base0
	.word	.Ldebug_loc2-.Lloclists_table_base0
	.word	.Ldebug_loc3-.Lloclists_table_base0
	.word	.Ldebug_loc4-.Lloclists_table_base0
	.word	.Ldebug_loc5-.Lloclists_table_base0
	.word	.Ldebug_loc6-.Lloclists_table_base0
	.word	.Ldebug_loc7-.Lloclists_table_base0
	.word	.Ldebug_loc8-.Lloclists_table_base0
	.word	.Ldebug_loc9-.Lloclists_table_base0
.Ldebug_loc0:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp0-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc1:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin1-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp2-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc2:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin2-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp7-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp8-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp66-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc3:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin2-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp7-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	91                              # DW_OP_reg11
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp8-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp64-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	91                              # DW_OP_reg11
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc4:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin2-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp7-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	92                              # DW_OP_reg12
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp8-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp65-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	92                              # DW_OP_reg12
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc5:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin2-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp6-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	93                              # DW_OP_reg13
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp8-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp9-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	93                              # DW_OP_reg13
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc6:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin2-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp7-.Lfunc_begin0           #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp8-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp10-.Lfunc_begin0          #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp10-.Lfunc_begin0          #   starting offset
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
	.uleb128 .Ltmp18-.Lfunc_begin0          #   starting offset
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
	.byte	1                               # 1
	.byte	34                              # DW_OP_plus
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp24-.Lfunc_begin0          #   starting offset
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
	.byte	2                               # 2
	.byte	34                              # DW_OP_plus
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp30-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp36-.Lfunc_begin0          #   ending offset
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
	.uleb128 .Ltmp36-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp42-.Lfunc_begin0          #   ending offset
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
	.uleb128 .Ltmp42-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp48-.Lfunc_begin0          #   ending offset
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
	.uleb128 .Ltmp48-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp54-.Lfunc_begin0          #   ending offset
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
	.uleb128 .Ltmp54-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp61-.Lfunc_begin0          #   ending offset
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
	.uleb128 .Ltmp61-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp63-.Lfunc_begin0          #   ending offset
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
	.uleb128 .Ltmp63-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp68-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	93                              # DW_OP_reg13
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc7:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp13-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp14-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	94                              # DW_OP_reg14
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp19-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp20-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	94                              # DW_OP_reg14
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp25-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp26-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	94                              # DW_OP_reg14
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp31-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp32-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	94                              # DW_OP_reg14
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp37-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp38-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	94                              # DW_OP_reg14
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp43-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp44-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	94                              # DW_OP_reg14
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp49-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp50-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	94                              # DW_OP_reg14
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp55-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp57-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	94                              # DW_OP_reg14
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp67-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp71-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	95                              # DW_OP_reg15
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp75-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp78-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	94                              # DW_OP_reg14
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp82-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp85-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	94                              # DW_OP_reg14
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp89-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp92-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	94                              # DW_OP_reg14
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp96-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp99-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	94                              # DW_OP_reg14
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp103-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp106-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	94                              # DW_OP_reg14
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp110-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp113-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	92                              # DW_OP_reg12
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc8:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp13-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp15-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	86                              # DW_OP_reg6
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp19-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp21-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	86                              # DW_OP_reg6
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp25-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp27-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	86                              # DW_OP_reg6
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp31-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp33-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	86                              # DW_OP_reg6
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp37-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp39-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	86                              # DW_OP_reg6
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp43-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp45-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	86                              # DW_OP_reg6
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp49-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp51-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	86                              # DW_OP_reg6
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp55-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp59-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	86                              # DW_OP_reg6
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp67-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp69-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	94                              # DW_OP_reg14
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp75-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp76-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	93                              # DW_OP_reg13
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp82-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp83-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	93                              # DW_OP_reg13
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp89-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp90-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	93                              # DW_OP_reg13
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp96-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp97-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	93                              # DW_OP_reg13
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp103-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp104-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	93                              # DW_OP_reg13
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp110-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp111-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	91                              # DW_OP_reg11
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc9:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp14-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp16-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	94                              # DW_OP_reg14
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp20-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp22-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	94                              # DW_OP_reg14
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp26-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp28-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	94                              # DW_OP_reg14
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp32-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp34-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	94                              # DW_OP_reg14
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp38-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp40-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	94                              # DW_OP_reg14
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp44-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp46-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	94                              # DW_OP_reg14
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp50-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp52-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	94                              # DW_OP_reg14
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
	.byte	22                              # DW_TAG_typedef
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	3                               # Abbreviation Code
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
	.byte	4                               # Abbreviation Code
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
	.byte	49                              # DW_AT_abstract_origin
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	5                               # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	34                              # DW_FORM_loclistx
	.byte	49                              # DW_AT_abstract_origin
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	6                               # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.byte	49                              # DW_AT_abstract_origin
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	7                               # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	39                              # DW_AT_prototyped
	.byte	25                              # DW_FORM_flag_present
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	32                              # DW_AT_inline
	.byte	33                              # DW_FORM_implicit_const
	.byte	1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	8                               # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
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
	.byte	9                               # Abbreviation Code
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
	.byte	10                              # Abbreviation Code
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
	.byte	11                              # Abbreviation Code
	.byte	11                              # DW_TAG_lexical_block
	.byte	1                               # DW_CHILDREN_yes
	.byte	85                              # DW_AT_ranges
	.byte	35                              # DW_FORM_rnglistx
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	12                              # Abbreviation Code
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
	.byte	13                              # Abbreviation Code
	.byte	29                              # DW_TAG_inlined_subroutine
	.byte	1                               # DW_CHILDREN_yes
	.byte	49                              # DW_AT_abstract_origin
	.byte	19                              # DW_FORM_ref4
	.byte	85                              # DW_AT_ranges
	.byte	35                              # DW_FORM_rnglistx
	.byte	88                              # DW_AT_call_file
	.byte	11                              # DW_FORM_data1
	.byte	89                              # DW_AT_call_line
	.byte	11                              # DW_FORM_data1
	.byte	87                              # DW_AT_call_column
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	14                              # Abbreviation Code
	.byte	15                              # DW_TAG_pointer_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
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
	.byte	1                               # Abbrev [1] 0xc:0xf2 DW_TAG_compile_unit
	.byte	0                               # DW_AT_producer
	.half	29                              # DW_AT_language
	.byte	1                               # DW_AT_name
	.word	.Lstr_offsets_base0             # DW_AT_str_offsets_base
	.word	.Lline_table_start0             # DW_AT_stmt_list
	.byte	2                               # DW_AT_comp_dir
	.byte	0                               # DW_AT_low_pc
	.word	.Lfunc_end2-.Lfunc_begin0       # DW_AT_high_pc
	.word	.Laddr_table_base0              # DW_AT_addr_base
	.word	.Lrnglists_table_base0          # DW_AT_rnglists_base
	.word	.Lloclists_table_base0          # DW_AT_loclists_base
	.byte	2                               # Abbrev [2] 0x2b:0x8 DW_TAG_typedef
	.word	51                              # DW_AT_type
	.byte	4                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	2                               # DW_AT_decl_line
	.byte	3                               # Abbrev [3] 0x33:0x4 DW_TAG_base_type
	.byte	3                               # DW_AT_name
	.byte	6                               # DW_AT_encoding
	.byte	1                               # DW_AT_byte_size
	.byte	3                               # Abbrev [3] 0x37:0x4 DW_TAG_base_type
	.byte	5                               # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	4                               # Abbrev [4] 0x3b:0x1a DW_TAG_subprogram
	.byte	0                               # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	82
                                        # DW_AT_call_all_calls
	.word	104                             # DW_AT_abstract_origin
	.byte	5                               # Abbrev [5] 0x47:0x6 DW_TAG_formal_parameter
	.byte	0                               # DW_AT_location
	.word	112                             # DW_AT_abstract_origin
	.byte	6                               # Abbrev [6] 0x4d:0x7 DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	91
	.word	120                             # DW_AT_abstract_origin
	.byte	0                               # End Of Children Mark
	.byte	4                               # Abbrev [4] 0x55:0x13 DW_TAG_subprogram
	.byte	1                               # DW_AT_low_pc
	.word	.Lfunc_end1-.Lfunc_begin1       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	82
                                        # DW_AT_call_all_calls
	.word	129                             # DW_AT_abstract_origin
	.byte	5                               # Abbrev [5] 0x61:0x6 DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.word	137                             # DW_AT_abstract_origin
	.byte	0                               # End Of Children Mark
	.byte	7                               # Abbrev [7] 0x68:0x19 DW_TAG_subprogram
	.byte	6                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
                                        # DW_AT_prototyped
	.word	43                              # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_inline
	.byte	8                               # Abbrev [8] 0x70:0x8 DW_TAG_formal_parameter
	.byte	7                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
	.word	43                              # DW_AT_type
	.byte	8                               # Abbrev [8] 0x78:0x8 DW_TAG_formal_parameter
	.byte	8                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
	.word	43                              # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	7                               # Abbrev [7] 0x81:0x11 DW_TAG_subprogram
	.byte	9                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	9                               # DW_AT_decl_line
                                        # DW_AT_prototyped
	.word	43                              # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_inline
	.byte	8                               # Abbrev [8] 0x89:0x8 DW_TAG_formal_parameter
	.byte	10                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	9                               # DW_AT_decl_line
	.word	43                              # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	9                               # Abbrev [9] 0x92:0x62 DW_TAG_subprogram
	.byte	2                               # DW_AT_low_pc
	.word	.Lfunc_end2-.Lfunc_begin2       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	82
                                        # DW_AT_call_all_calls
	.byte	11                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	14                              # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	10                              # Abbrev [10] 0x9d:0x9 DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	10                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	14                              # DW_AT_decl_line
	.word	244                             # DW_AT_type
	.byte	10                              # Abbrev [10] 0xa6:0x9 DW_TAG_formal_parameter
	.byte	3                               # DW_AT_location
	.byte	7                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	14                              # DW_AT_decl_line
	.word	244                             # DW_AT_type
	.byte	10                              # Abbrev [10] 0xaf:0x9 DW_TAG_formal_parameter
	.byte	4                               # DW_AT_location
	.byte	8                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	14                              # DW_AT_decl_line
	.word	244                             # DW_AT_type
	.byte	10                              # Abbrev [10] 0xb8:0x9 DW_TAG_formal_parameter
	.byte	5                               # DW_AT_location
	.byte	12                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	14                              # DW_AT_decl_line
	.word	249                             # DW_AT_type
	.byte	11                              # Abbrev [11] 0xc1:0x32 DW_TAG_lexical_block
	.byte	0                               # DW_AT_ranges
	.byte	12                              # Abbrev [12] 0xc3:0x9 DW_TAG_variable
	.byte	6                               # DW_AT_location
	.byte	14                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	15                              # DW_AT_decl_line
	.word	249                             # DW_AT_type
	.byte	13                              # Abbrev [13] 0xcc:0x16 DW_TAG_inlined_subroutine
	.word	104                             # DW_AT_abstract_origin
	.byte	1                               # DW_AT_ranges
	.byte	0                               # DW_AT_call_file
	.byte	16                              # DW_AT_call_line
	.byte	18                              # DW_AT_call_column
	.byte	5                               # Abbrev [5] 0xd5:0x6 DW_TAG_formal_parameter
	.byte	8                               # DW_AT_location
	.word	112                             # DW_AT_abstract_origin
	.byte	5                               # Abbrev [5] 0xdb:0x6 DW_TAG_formal_parameter
	.byte	7                               # DW_AT_location
	.word	120                             # DW_AT_abstract_origin
	.byte	0                               # End Of Children Mark
	.byte	13                              # Abbrev [13] 0xe2:0x10 DW_TAG_inlined_subroutine
	.word	129                             # DW_AT_abstract_origin
	.byte	2                               # DW_AT_ranges
	.byte	0                               # DW_AT_call_file
	.byte	16                              # DW_AT_call_line
	.byte	12                              # DW_AT_call_column
	.byte	5                               # Abbrev [5] 0xeb:0x6 DW_TAG_formal_parameter
	.byte	9                               # DW_AT_location
	.word	137                             # DW_AT_abstract_origin
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	14                              # Abbrev [14] 0xf4:0x5 DW_TAG_pointer_type
	.word	43                              # DW_AT_type
	.byte	3                               # Abbrev [3] 0xf9:0x4 DW_TAG_base_type
	.byte	13                              # DW_AT_name
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
	.word	3                               # Offset entry count
.Lrnglists_table_base0:
	.word	.Ldebug_ranges0-.Lrnglists_table_base0
	.word	.Ldebug_ranges1-.Lrnglists_table_base0
	.word	.Ldebug_ranges2-.Lrnglists_table_base0
.Ldebug_ranges0:
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Lfunc_begin2-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp7-.Lfunc_begin0           #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp8-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp115-.Lfunc_begin0         #   ending offset
	.byte	0                               # DW_RLE_end_of_list
.Ldebug_ranges1:
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp13-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp15-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp19-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp21-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp25-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp27-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp31-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp33-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp37-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp39-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp43-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp45-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp49-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp51-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp56-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp58-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp68-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp70-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp75-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp77-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp82-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp84-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp89-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp91-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp96-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp98-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp103-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp105-.Lfunc_begin0         #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp110-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp112-.Lfunc_begin0         #   ending offset
	.byte	0                               # DW_RLE_end_of_list
.Ldebug_ranges2:
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp15-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp17-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp21-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp23-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp27-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp29-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp33-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp35-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp39-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp41-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp45-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp47-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp51-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp53-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp58-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp60-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp70-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp72-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp77-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp79-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp84-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp86-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp91-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp93-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp98-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp100-.Lfunc_begin0         #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp105-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp107-.Lfunc_begin0         #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp112-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp114-.Lfunc_begin0         #   ending offset
	.byte	0                               # DW_RLE_end_of_list
.Ldebug_list_header_end1:
	.section	.debug_str_offsets,"",@progbits
	.word	64                              # Length of String Offsets Set
	.half	5
	.half	0
.Lstr_offsets_base0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)" # string offset=0
.Linfo_string1:
	.asciz	"vector_abs_diff_i8.c"          # string offset=108
.Linfo_string2:
	.asciz	"/home/preames/benchmarking/simple-vector-riscv" # string offset=129
.Linfo_string3:
	.asciz	"signed char"                   # string offset=176
.Linfo_string4:
	.asciz	"int8_t"                        # string offset=188
.Linfo_string5:
	.asciz	"int"                           # string offset=195
.Linfo_string6:
	.asciz	"sub"                           # string offset=199
.Linfo_string7:
	.asciz	"a"                             # string offset=203
.Linfo_string8:
	.asciz	"b"                             # string offset=205
.Linfo_string9:
	.asciz	"myabs"                         # string offset=207
.Linfo_string10:
	.asciz	"c"                             # string offset=213
.Linfo_string11:
	.asciz	"vector_abs_diff"               # string offset=215
.Linfo_string12:
	.asciz	"N"                             # string offset=231
.Linfo_string13:
	.asciz	"unsigned int"                  # string offset=233
.Linfo_string14:
	.asciz	"i"                             # string offset=246
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
	.word	.Linfo_string11
	.word	.Linfo_string12
	.word	.Linfo_string13
	.word	.Linfo_string14
	.section	.debug_addr,"",@progbits
	.word	.Ldebug_addr_end0-.Ldebug_addr_start0 # Length of contribution
.Ldebug_addr_start0:
	.half	5                               # DWARF version number
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
.Laddr_table_base0:
	.quad	.Lfunc_begin0
	.quad	.Lfunc_begin1
	.quad	.Lfunc_begin2
.Ldebug_addr_end0:
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.section	.debug_line,"",@progbits
.Lline_table_start0:
