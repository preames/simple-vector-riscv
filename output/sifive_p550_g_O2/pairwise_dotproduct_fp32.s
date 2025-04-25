	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
	.file	"pairwise_dotproduct_fp32.c"
	.text
	.globl	pairwise_dotproduct_fp32        # -- Begin function pairwise_dotproduct_fp32
	.p2align	1
	.type	pairwise_dotproduct_fp32,@function
pairwise_dotproduct_fp32:               # @pairwise_dotproduct_fp32
.Lfunc_begin0:
	.file	0 "/home/preames/benchmarking/simple-vector-riscv" "pairwise_dotproduct_fp32.c" md5 0x157f68deef6870fe3a4a394dad819d71
	.loc	0 3 0                           # pairwise_dotproduct_fp32.c:3:0
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: pairwise_dotproduct_fp32:len <- $x10
	#DEBUG_VALUE: pairwise_dotproduct_fp32:a <- $x11
	#DEBUG_VALUE: pairwise_dotproduct_fp32:b <- $x12
	#DEBUG_VALUE: pairwise_dotproduct_fp32:c <- $x13
	#DEBUG_VALUE: i <- 0
	andi	a0, a0, -2
.Ltmp0:
	.loc	0 4 3 prologue_end              # pairwise_dotproduct_fp32.c:4:3
	beqz	a0, .LBB0_13
.Ltmp1:
# %bb.1:                                # %for.body.preheader
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: pairwise_dotproduct_fp32:c <- $x13
	#DEBUG_VALUE: pairwise_dotproduct_fp32:b <- $x12
	#DEBUG_VALUE: pairwise_dotproduct_fp32:a <- $x11
	zext.w	a4, a0
	li	a5, 15
	addi	a4, a4, -1
	srli	a4, a4, 1
	addi	a4, a4, 1
	andi	a6, a4, 7
	bgeu	a0, a5, .LBB0_3
.Ltmp2:
# %bb.2:
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: pairwise_dotproduct_fp32:c <- $x13
	#DEBUG_VALUE: pairwise_dotproduct_fp32:b <- $x12
	#DEBUG_VALUE: pairwise_dotproduct_fp32:a <- $x11
	.loc	0 0 3 is_stmt 0                 # pairwise_dotproduct_fp32.c:0:3
	li	a7, 0
	j	.LBB0_5
.Ltmp3:
.LBB0_3:                                # %for.body.preheader.new
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: pairwise_dotproduct_fp32:c <- $x13
	#DEBUG_VALUE: pairwise_dotproduct_fp32:b <- $x12
	#DEBUG_VALUE: pairwise_dotproduct_fp32:a <- $x11
	.loc	0 4 3                           # pairwise_dotproduct_fp32.c:4:3
	andi	a7, a4, -8
	addi	a5, a3, 32
	addi	a0, a2, 32
	addi	a7, a7, -8
	addi	a4, a1, 16
	srli	t0, a7, 3
	slli	a7, t0, 4
	slli	t0, t0, 6
	add	t0, t0, a3
	addi	a7, a7, 16
	addi	t0, t0, 96
.Ltmp4:
.LBB0_4:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: pairwise_dotproduct_fp32:c <- $x13
	#DEBUG_VALUE: pairwise_dotproduct_fp32:b <- $x12
	#DEBUG_VALUE: pairwise_dotproduct_fp32:a <- $x11
	#DEBUG_VALUE: i <- undef
	.loc	0 5 15 is_stmt 1                # pairwise_dotproduct_fp32.c:5:15
	flw	fa5, -32(a0)
	.loc	0 5 31 is_stmt 0                # pairwise_dotproduct_fp32.c:5:31
	flw	fa4, -28(a0)
	.loc	0 5 22                          # pairwise_dotproduct_fp32.c:5:22
	flw	fa3, -32(a5)
	.loc	0 5 40                          # pairwise_dotproduct_fp32.c:5:40
	flw	fa2, -28(a5)
	.loc	0 5 38                          # pairwise_dotproduct_fp32.c:5:38
	fmul.s	fa4, fa4, fa2
	.loc	0 5 28                          # pairwise_dotproduct_fp32.c:5:28
	fmadd.s	fa5, fa5, fa3, fa4
	.loc	0 5 12                          # pairwise_dotproduct_fp32.c:5:12
	fsw	fa5, -16(a4)
	.loc	0 5 15                          # pairwise_dotproduct_fp32.c:5:15
	flw	fa5, -24(a0)
	.loc	0 5 31                          # pairwise_dotproduct_fp32.c:5:31
	flw	fa4, -20(a0)
	.loc	0 5 22                          # pairwise_dotproduct_fp32.c:5:22
	flw	fa3, -24(a5)
	.loc	0 5 40                          # pairwise_dotproduct_fp32.c:5:40
	flw	fa2, -20(a5)
	.loc	0 5 38                          # pairwise_dotproduct_fp32.c:5:38
	fmul.s	fa4, fa4, fa2
	.loc	0 5 28                          # pairwise_dotproduct_fp32.c:5:28
	fmadd.s	fa5, fa5, fa3, fa4
	.loc	0 5 12                          # pairwise_dotproduct_fp32.c:5:12
	fsw	fa5, -12(a4)
	.loc	0 5 15                          # pairwise_dotproduct_fp32.c:5:15
	flw	fa5, -16(a0)
	.loc	0 5 31                          # pairwise_dotproduct_fp32.c:5:31
	flw	fa4, -12(a0)
	.loc	0 5 22                          # pairwise_dotproduct_fp32.c:5:22
	flw	fa3, -16(a5)
	.loc	0 5 40                          # pairwise_dotproduct_fp32.c:5:40
	flw	fa2, -12(a5)
	.loc	0 5 38                          # pairwise_dotproduct_fp32.c:5:38
	fmul.s	fa4, fa4, fa2
	.loc	0 5 28                          # pairwise_dotproduct_fp32.c:5:28
	fmadd.s	fa5, fa5, fa3, fa4
	.loc	0 5 12                          # pairwise_dotproduct_fp32.c:5:12
	fsw	fa5, -8(a4)
	.loc	0 5 15                          # pairwise_dotproduct_fp32.c:5:15
	flw	fa5, -8(a0)
	.loc	0 5 31                          # pairwise_dotproduct_fp32.c:5:31
	flw	fa4, -4(a0)
	.loc	0 5 22                          # pairwise_dotproduct_fp32.c:5:22
	flw	fa3, -8(a5)
	.loc	0 5 40                          # pairwise_dotproduct_fp32.c:5:40
	flw	fa2, -4(a5)
	.loc	0 5 38                          # pairwise_dotproduct_fp32.c:5:38
	fmul.s	fa4, fa4, fa2
	.loc	0 5 28                          # pairwise_dotproduct_fp32.c:5:28
	fmadd.s	fa5, fa5, fa3, fa4
	.loc	0 5 12                          # pairwise_dotproduct_fp32.c:5:12
	fsw	fa5, -4(a4)
	.loc	0 5 15                          # pairwise_dotproduct_fp32.c:5:15
	flw	fa5, 0(a0)
	.loc	0 5 31                          # pairwise_dotproduct_fp32.c:5:31
	flw	fa4, 4(a0)
	.loc	0 5 22                          # pairwise_dotproduct_fp32.c:5:22
	flw	fa3, 0(a5)
	.loc	0 5 40                          # pairwise_dotproduct_fp32.c:5:40
	flw	fa2, 4(a5)
	.loc	0 5 38                          # pairwise_dotproduct_fp32.c:5:38
	fmul.s	fa4, fa4, fa2
	.loc	0 5 28                          # pairwise_dotproduct_fp32.c:5:28
	fmadd.s	fa5, fa5, fa3, fa4
	.loc	0 5 12                          # pairwise_dotproduct_fp32.c:5:12
	fsw	fa5, 0(a4)
	.loc	0 5 15                          # pairwise_dotproduct_fp32.c:5:15
	flw	fa5, 8(a0)
	.loc	0 5 31                          # pairwise_dotproduct_fp32.c:5:31
	flw	fa4, 12(a0)
	.loc	0 5 22                          # pairwise_dotproduct_fp32.c:5:22
	flw	fa3, 8(a5)
	.loc	0 5 40                          # pairwise_dotproduct_fp32.c:5:40
	flw	fa2, 12(a5)
	.loc	0 5 38                          # pairwise_dotproduct_fp32.c:5:38
	fmul.s	fa4, fa4, fa2
	.loc	0 5 28                          # pairwise_dotproduct_fp32.c:5:28
	fmadd.s	fa5, fa5, fa3, fa4
	.loc	0 5 12                          # pairwise_dotproduct_fp32.c:5:12
	fsw	fa5, 4(a4)
	.loc	0 5 15                          # pairwise_dotproduct_fp32.c:5:15
	flw	fa5, 16(a0)
	.loc	0 5 31                          # pairwise_dotproduct_fp32.c:5:31
	flw	fa4, 20(a0)
	.loc	0 5 22                          # pairwise_dotproduct_fp32.c:5:22
	flw	fa3, 16(a5)
	.loc	0 5 40                          # pairwise_dotproduct_fp32.c:5:40
	flw	fa2, 20(a5)
	.loc	0 5 38                          # pairwise_dotproduct_fp32.c:5:38
	fmul.s	fa4, fa4, fa2
	.loc	0 5 28                          # pairwise_dotproduct_fp32.c:5:28
	fmadd.s	fa5, fa5, fa3, fa4
	.loc	0 5 12                          # pairwise_dotproduct_fp32.c:5:12
	fsw	fa5, 8(a4)
	.loc	0 5 15                          # pairwise_dotproduct_fp32.c:5:15
	flw	fa5, 24(a0)
	.loc	0 5 31                          # pairwise_dotproduct_fp32.c:5:31
	flw	fa4, 28(a0)
	.loc	0 5 22                          # pairwise_dotproduct_fp32.c:5:22
	flw	fa3, 24(a5)
	.loc	0 5 40                          # pairwise_dotproduct_fp32.c:5:40
	flw	fa2, 28(a5)
.Ltmp5:
	.loc	0 4 3 is_stmt 1                 # pairwise_dotproduct_fp32.c:4:3
	addi	a5, a5, 64
	addi	a0, a0, 64
.Ltmp6:
	.loc	0 5 38                          # pairwise_dotproduct_fp32.c:5:38
	fmul.s	fa4, fa4, fa2
	.loc	0 5 28 is_stmt 0                # pairwise_dotproduct_fp32.c:5:28
	fmadd.s	fa5, fa5, fa3, fa4
	.loc	0 5 12                          # pairwise_dotproduct_fp32.c:5:12
	fsw	fa5, 12(a4)
.Ltmp7:
	.loc	0 4 3 is_stmt 1                 # pairwise_dotproduct_fp32.c:4:3
	addi	a4, a4, 32
	bne	a5, t0, .LBB0_4
.Ltmp8:
.LBB0_5:                                # %for.cond.cleanup.loopexit.unr-lcssa
	#DEBUG_VALUE: pairwise_dotproduct_fp32:c <- $x13
	#DEBUG_VALUE: pairwise_dotproduct_fp32:b <- $x12
	#DEBUG_VALUE: pairwise_dotproduct_fp32:a <- $x11
	.loc	0 4 3                           # pairwise_dotproduct_fp32.c:4:3
	beqz	a6, .LBB0_13
.Ltmp9:
# %bb.6:                                # %for.body.epil
	#DEBUG_VALUE: pairwise_dotproduct_fp32:c <- $x13
	#DEBUG_VALUE: pairwise_dotproduct_fp32:b <- $x12
	#DEBUG_VALUE: pairwise_dotproduct_fp32:a <- $x11
	#DEBUG_VALUE: i <- $x17
	.loc	0 5 15                          # pairwise_dotproduct_fp32.c:5:15
	sh2add	a0, a7, a2
	slli	a4, a7, 2
	flw	fa5, 0(a0)
	.loc	0 5 22 is_stmt 0                # pairwise_dotproduct_fp32.c:5:22
	sh2add	a0, a7, a3
	flw	fa4, 0(a0)
	.loc	0 5 31                          # pairwise_dotproduct_fp32.c:5:31
	add	a0, a2, a4
	.loc	0 5 40                          # pairwise_dotproduct_fp32.c:5:40
	add	a4, a4, a3
	.loc	0 5 31                          # pairwise_dotproduct_fp32.c:5:31
	flw	fa3, 4(a0)
	.loc	0 5 40                          # pairwise_dotproduct_fp32.c:5:40
	flw	fa2, 4(a4)
	.loc	0 5 5                           # pairwise_dotproduct_fp32.c:5:5
	sh1add	a0, a7, a1
	.loc	0 5 38                          # pairwise_dotproduct_fp32.c:5:38
	fmul.s	fa3, fa3, fa2
	.loc	0 5 28                          # pairwise_dotproduct_fp32.c:5:28
	fmadd.s	fa5, fa5, fa4, fa3
	.loc	0 5 12                          # pairwise_dotproduct_fp32.c:5:12
	fsw	fa5, 0(a0)
	li	a0, 1
.Ltmp10:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 2, DW_OP_stack_value] $x17
	.loc	0 4 3 is_stmt 1                 # pairwise_dotproduct_fp32.c:4:3
	beq	a6, a0, .LBB0_13
.Ltmp11:
# %bb.7:                                # %for.body.epil.1
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 2, DW_OP_stack_value] $x17
	#DEBUG_VALUE: pairwise_dotproduct_fp32:c <- $x13
	#DEBUG_VALUE: pairwise_dotproduct_fp32:b <- $x12
	#DEBUG_VALUE: pairwise_dotproduct_fp32:a <- $x11
	.loc	0 4 41 is_stmt 0                # pairwise_dotproduct_fp32.c:4:41
	addi	a0, a7, 2
.Ltmp12:
	#DEBUG_VALUE: i <- $x10
	.loc	0 5 15 is_stmt 1                # pairwise_dotproduct_fp32.c:5:15
	sh2add	a4, a0, a2
	slli	a5, a0, 2
	flw	fa5, 0(a4)
	.loc	0 5 22 is_stmt 0                # pairwise_dotproduct_fp32.c:5:22
	sh2add	a4, a0, a3
	.loc	0 5 5                           # pairwise_dotproduct_fp32.c:5:5
	sh1add	a0, a0, a1
.Ltmp13:
	.loc	0 5 22                          # pairwise_dotproduct_fp32.c:5:22
	flw	fa4, 0(a4)
	.loc	0 5 31                          # pairwise_dotproduct_fp32.c:5:31
	add	a4, a2, a5
	.loc	0 5 40                          # pairwise_dotproduct_fp32.c:5:40
	add	a5, a5, a3
	.loc	0 5 31                          # pairwise_dotproduct_fp32.c:5:31
	flw	fa3, 4(a4)
	.loc	0 5 40                          # pairwise_dotproduct_fp32.c:5:40
	flw	fa2, 4(a5)
	.loc	0 5 38                          # pairwise_dotproduct_fp32.c:5:38
	fmul.s	fa3, fa3, fa2
	.loc	0 5 28                          # pairwise_dotproduct_fp32.c:5:28
	fmadd.s	fa5, fa5, fa4, fa3
	.loc	0 5 12                          # pairwise_dotproduct_fp32.c:5:12
	fsw	fa5, 0(a0)
	li	a0, 2
.Ltmp14:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 4, DW_OP_stack_value] $x17
	.loc	0 4 3 is_stmt 1                 # pairwise_dotproduct_fp32.c:4:3
	beq	a6, a0, .LBB0_13
.Ltmp15:
# %bb.8:                                # %for.body.epil.2
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 4, DW_OP_stack_value] $x17
	#DEBUG_VALUE: pairwise_dotproduct_fp32:c <- $x13
	#DEBUG_VALUE: pairwise_dotproduct_fp32:b <- $x12
	#DEBUG_VALUE: pairwise_dotproduct_fp32:a <- $x11
	.loc	0 4 41 is_stmt 0                # pairwise_dotproduct_fp32.c:4:41
	addi	a0, a7, 4
.Ltmp16:
	#DEBUG_VALUE: i <- $x10
	.loc	0 5 15 is_stmt 1                # pairwise_dotproduct_fp32.c:5:15
	sh2add	a4, a0, a2
	slli	a5, a0, 2
	flw	fa5, 0(a4)
	.loc	0 5 22 is_stmt 0                # pairwise_dotproduct_fp32.c:5:22
	sh2add	a4, a0, a3
	.loc	0 5 5                           # pairwise_dotproduct_fp32.c:5:5
	sh1add	a0, a0, a1
.Ltmp17:
	.loc	0 5 22                          # pairwise_dotproduct_fp32.c:5:22
	flw	fa4, 0(a4)
	.loc	0 5 31                          # pairwise_dotproduct_fp32.c:5:31
	add	a4, a2, a5
	.loc	0 5 40                          # pairwise_dotproduct_fp32.c:5:40
	add	a5, a5, a3
	.loc	0 5 31                          # pairwise_dotproduct_fp32.c:5:31
	flw	fa3, 4(a4)
	.loc	0 5 40                          # pairwise_dotproduct_fp32.c:5:40
	flw	fa2, 4(a5)
	.loc	0 5 38                          # pairwise_dotproduct_fp32.c:5:38
	fmul.s	fa3, fa3, fa2
	.loc	0 5 28                          # pairwise_dotproduct_fp32.c:5:28
	fmadd.s	fa5, fa5, fa4, fa3
	.loc	0 5 12                          # pairwise_dotproduct_fp32.c:5:12
	fsw	fa5, 0(a0)
	li	a0, 3
.Ltmp18:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 6, DW_OP_stack_value] $x17
	.loc	0 4 3 is_stmt 1                 # pairwise_dotproduct_fp32.c:4:3
	beq	a6, a0, .LBB0_13
.Ltmp19:
# %bb.9:                                # %for.body.epil.3
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 6, DW_OP_stack_value] $x17
	#DEBUG_VALUE: pairwise_dotproduct_fp32:c <- $x13
	#DEBUG_VALUE: pairwise_dotproduct_fp32:b <- $x12
	#DEBUG_VALUE: pairwise_dotproduct_fp32:a <- $x11
	.loc	0 4 41 is_stmt 0                # pairwise_dotproduct_fp32.c:4:41
	addi	a0, a7, 6
.Ltmp20:
	#DEBUG_VALUE: i <- $x10
	.loc	0 5 15 is_stmt 1                # pairwise_dotproduct_fp32.c:5:15
	sh2add	a4, a0, a2
	slli	a5, a0, 2
	flw	fa5, 0(a4)
	.loc	0 5 22 is_stmt 0                # pairwise_dotproduct_fp32.c:5:22
	sh2add	a4, a0, a3
	.loc	0 5 5                           # pairwise_dotproduct_fp32.c:5:5
	sh1add	a0, a0, a1
.Ltmp21:
	.loc	0 5 22                          # pairwise_dotproduct_fp32.c:5:22
	flw	fa4, 0(a4)
	.loc	0 5 31                          # pairwise_dotproduct_fp32.c:5:31
	add	a4, a2, a5
	.loc	0 5 40                          # pairwise_dotproduct_fp32.c:5:40
	add	a5, a5, a3
	.loc	0 5 31                          # pairwise_dotproduct_fp32.c:5:31
	flw	fa3, 4(a4)
	.loc	0 5 40                          # pairwise_dotproduct_fp32.c:5:40
	flw	fa2, 4(a5)
	.loc	0 5 38                          # pairwise_dotproduct_fp32.c:5:38
	fmul.s	fa3, fa3, fa2
	.loc	0 5 28                          # pairwise_dotproduct_fp32.c:5:28
	fmadd.s	fa5, fa5, fa4, fa3
	.loc	0 5 12                          # pairwise_dotproduct_fp32.c:5:12
	fsw	fa5, 0(a0)
	li	a0, 4
.Ltmp22:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 8, DW_OP_stack_value] $x17
	.loc	0 4 3 is_stmt 1                 # pairwise_dotproduct_fp32.c:4:3
	beq	a6, a0, .LBB0_13
.Ltmp23:
# %bb.10:                               # %for.body.epil.4
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 8, DW_OP_stack_value] $x17
	#DEBUG_VALUE: pairwise_dotproduct_fp32:c <- $x13
	#DEBUG_VALUE: pairwise_dotproduct_fp32:b <- $x12
	#DEBUG_VALUE: pairwise_dotproduct_fp32:a <- $x11
	.loc	0 4 41 is_stmt 0                # pairwise_dotproduct_fp32.c:4:41
	addi	a0, a7, 8
.Ltmp24:
	#DEBUG_VALUE: i <- $x10
	.loc	0 5 15 is_stmt 1                # pairwise_dotproduct_fp32.c:5:15
	sh2add	a4, a0, a2
	slli	a5, a0, 2
	flw	fa5, 0(a4)
	.loc	0 5 22 is_stmt 0                # pairwise_dotproduct_fp32.c:5:22
	sh2add	a4, a0, a3
	.loc	0 5 5                           # pairwise_dotproduct_fp32.c:5:5
	sh1add	a0, a0, a1
.Ltmp25:
	.loc	0 5 22                          # pairwise_dotproduct_fp32.c:5:22
	flw	fa4, 0(a4)
	.loc	0 5 31                          # pairwise_dotproduct_fp32.c:5:31
	add	a4, a2, a5
	.loc	0 5 40                          # pairwise_dotproduct_fp32.c:5:40
	add	a5, a5, a3
	.loc	0 5 31                          # pairwise_dotproduct_fp32.c:5:31
	flw	fa3, 4(a4)
	.loc	0 5 40                          # pairwise_dotproduct_fp32.c:5:40
	flw	fa2, 4(a5)
	.loc	0 5 38                          # pairwise_dotproduct_fp32.c:5:38
	fmul.s	fa3, fa3, fa2
	.loc	0 5 28                          # pairwise_dotproduct_fp32.c:5:28
	fmadd.s	fa5, fa5, fa4, fa3
	.loc	0 5 12                          # pairwise_dotproduct_fp32.c:5:12
	fsw	fa5, 0(a0)
	li	a0, 5
.Ltmp26:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 10, DW_OP_stack_value] $x17
	.loc	0 4 3 is_stmt 1                 # pairwise_dotproduct_fp32.c:4:3
	beq	a6, a0, .LBB0_13
.Ltmp27:
# %bb.11:                               # %for.body.epil.5
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 10, DW_OP_stack_value] $x17
	#DEBUG_VALUE: pairwise_dotproduct_fp32:c <- $x13
	#DEBUG_VALUE: pairwise_dotproduct_fp32:b <- $x12
	#DEBUG_VALUE: pairwise_dotproduct_fp32:a <- $x11
	.loc	0 4 41 is_stmt 0                # pairwise_dotproduct_fp32.c:4:41
	addi	a0, a7, 10
.Ltmp28:
	#DEBUG_VALUE: i <- $x10
	.loc	0 5 15 is_stmt 1                # pairwise_dotproduct_fp32.c:5:15
	sh2add	a4, a0, a2
	slli	a5, a0, 2
	flw	fa5, 0(a4)
	.loc	0 5 22 is_stmt 0                # pairwise_dotproduct_fp32.c:5:22
	sh2add	a4, a0, a3
	.loc	0 5 5                           # pairwise_dotproduct_fp32.c:5:5
	sh1add	a0, a0, a1
.Ltmp29:
	.loc	0 5 22                          # pairwise_dotproduct_fp32.c:5:22
	flw	fa4, 0(a4)
	.loc	0 5 31                          # pairwise_dotproduct_fp32.c:5:31
	add	a4, a2, a5
	.loc	0 5 40                          # pairwise_dotproduct_fp32.c:5:40
	add	a5, a5, a3
	.loc	0 5 31                          # pairwise_dotproduct_fp32.c:5:31
	flw	fa3, 4(a4)
	.loc	0 5 40                          # pairwise_dotproduct_fp32.c:5:40
	flw	fa2, 4(a5)
	.loc	0 5 38                          # pairwise_dotproduct_fp32.c:5:38
	fmul.s	fa3, fa3, fa2
	.loc	0 5 28                          # pairwise_dotproduct_fp32.c:5:28
	fmadd.s	fa5, fa5, fa4, fa3
	.loc	0 5 12                          # pairwise_dotproduct_fp32.c:5:12
	fsw	fa5, 0(a0)
	li	a0, 6
.Ltmp30:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 12, DW_OP_stack_value] $x17
	.loc	0 4 3 is_stmt 1                 # pairwise_dotproduct_fp32.c:4:3
	beq	a6, a0, .LBB0_13
.Ltmp31:
# %bb.12:                               # %for.body.epil.6
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 12, DW_OP_stack_value] $x17
	#DEBUG_VALUE: pairwise_dotproduct_fp32:c <- $x13
	#DEBUG_VALUE: pairwise_dotproduct_fp32:b <- $x12
	#DEBUG_VALUE: pairwise_dotproduct_fp32:a <- $x11
	.loc	0 4 41 is_stmt 0                # pairwise_dotproduct_fp32.c:4:41
	addi	a7, a7, 12
.Ltmp32:
	#DEBUG_VALUE: i <- $x17
	.loc	0 5 15 is_stmt 1                # pairwise_dotproduct_fp32.c:5:15
	slli	a4, a7, 2
	sh2add	a0, a7, a2
	.loc	0 5 31 is_stmt 0                # pairwise_dotproduct_fp32.c:5:31
	add	a2, a2, a4
.Ltmp33:
	.loc	0 5 15                          # pairwise_dotproduct_fp32.c:5:15
	flw	fa5, 0(a0)
	.loc	0 5 31                          # pairwise_dotproduct_fp32.c:5:31
	flw	fa3, 4(a2)
	.loc	0 5 22                          # pairwise_dotproduct_fp32.c:5:22
	sh2add	a0, a7, a3
	.loc	0 5 40                          # pairwise_dotproduct_fp32.c:5:40
	add	a3, a3, a4
.Ltmp34:
	.loc	0 5 22                          # pairwise_dotproduct_fp32.c:5:22
	flw	fa4, 0(a0)
	.loc	0 5 40                          # pairwise_dotproduct_fp32.c:5:40
	flw	fa2, 4(a3)
	.loc	0 5 5                           # pairwise_dotproduct_fp32.c:5:5
	sh1add	a0, a7, a1
	.loc	0 5 38                          # pairwise_dotproduct_fp32.c:5:38
	fmul.s	fa3, fa3, fa2
	.loc	0 5 28                          # pairwise_dotproduct_fp32.c:5:28
	fmadd.s	fa5, fa5, fa4, fa3
	.loc	0 5 12                          # pairwise_dotproduct_fp32.c:5:12
	fsw	fa5, 0(a0)
.Ltmp35:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 14, DW_OP_stack_value] undef
.LBB0_13:                               # %for.cond.cleanup
	#DEBUG_VALUE: pairwise_dotproduct_fp32:a <- $x11
	.loc	0 6 1 is_stmt 1                 # pairwise_dotproduct_fp32.c:6:1
	ret
.Ltmp36:
.Lfunc_end0:
	.size	pairwise_dotproduct_fp32, .Lfunc_end0-pairwise_dotproduct_fp32
	.cfi_endproc
                                        # -- End function
	.section	.debug_loclists,"",@progbits
	.word	.Ldebug_list_header_end0-.Ldebug_list_header_start0 # Length
.Ldebug_list_header_start0:
	.half	5                               # Version
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
	.word	4                               # Offset entry count
.Lloclists_table_base0:
	.word	.Ldebug_loc0-.Lloclists_table_base0
	.word	.Ldebug_loc1-.Lloclists_table_base0
	.word	.Ldebug_loc2-.Lloclists_table_base0
	.word	.Ldebug_loc3-.Lloclists_table_base0
.Ldebug_loc0:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp0-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc1:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp33-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	92                              # DW_OP_reg12
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc2:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp34-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	93                              # DW_OP_reg13
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc3:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp4-.Lfunc_begin0           #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp9-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp10-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	97                              # DW_OP_reg17
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp10-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp12-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	129                             # DW_OP_breg17
	.byte	2                               # 2
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp12-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp13-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp14-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp16-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	129                             # DW_OP_breg17
	.byte	4                               # 4
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp16-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp17-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp18-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp20-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	129                             # DW_OP_breg17
	.byte	6                               # 6
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp20-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp21-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp22-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp24-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	129                             # DW_OP_breg17
	.byte	8                               # 8
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp24-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp25-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp26-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp28-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	129                             # DW_OP_breg17
	.byte	10                              # 10
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp28-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp29-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp30-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp32-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	129                             # DW_OP_breg17
	.byte	12                              # 12
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp32-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp35-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	97                              # DW_OP_reg17
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
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
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
	.byte	5                               # Abbreviation Code
	.byte	11                              # DW_TAG_lexical_block
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	6                               # Abbreviation Code
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
	.byte	8                               # Abbreviation Code
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
	.byte	1                               # Abbrev [1] 0xc:0x6a DW_TAG_compile_unit
	.byte	0                               # DW_AT_producer
	.half	29                              # DW_AT_language
	.byte	1                               # DW_AT_name
	.word	.Lstr_offsets_base0             # DW_AT_str_offsets_base
	.word	.Lline_table_start0             # DW_AT_stmt_list
	.byte	2                               # DW_AT_comp_dir
	.byte	0                               # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.word	.Laddr_table_base0              # DW_AT_addr_base
	.word	.Lloclists_table_base0          # DW_AT_loclists_base
	.byte	2                               # Abbrev [2] 0x27:0x41 DW_TAG_subprogram
	.byte	0                               # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	82
                                        # DW_AT_call_all_calls
	.byte	3                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	3                               # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	3                               # Abbrev [3] 0x32:0x9 DW_TAG_formal_parameter
	.byte	0                               # DW_AT_location
	.byte	4                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	3                               # DW_AT_decl_line
	.word	104                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x3b:0xa DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	91
	.byte	6                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	3                               # DW_AT_decl_line
	.word	108                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x45:0x9 DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	8                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	3                               # DW_AT_decl_line
	.word	108                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x4e:0x9 DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	9                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	3                               # DW_AT_decl_line
	.word	108                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0x57:0x10 DW_TAG_lexical_block
	.byte	1                               # DW_AT_low_pc
	.word	.Ltmp35-.Ltmp0                  # DW_AT_high_pc
	.byte	6                               # Abbrev [6] 0x5d:0x9 DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	10                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.word	104                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	7                               # Abbrev [7] 0x68:0x4 DW_TAG_base_type
	.byte	5                               # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	8                               # Abbrev [8] 0x6c:0x5 DW_TAG_pointer_type
	.word	113                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x71:0x4 DW_TAG_base_type
	.byte	7                               # DW_AT_name
	.byte	4                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	0                               # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_str_offsets,"",@progbits
	.word	48                              # Length of String Offsets Set
	.half	5
	.half	0
.Lstr_offsets_base0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)" # string offset=0
.Linfo_string1:
	.asciz	"pairwise_dotproduct_fp32.c"    # string offset=108
.Linfo_string2:
	.asciz	"/home/preames/benchmarking/simple-vector-riscv" # string offset=135
.Linfo_string3:
	.asciz	"pairwise_dotproduct_fp32"      # string offset=182
.Linfo_string4:
	.asciz	"len"                           # string offset=207
.Linfo_string5:
	.asciz	"unsigned int"                  # string offset=211
.Linfo_string6:
	.asciz	"a"                             # string offset=224
.Linfo_string7:
	.asciz	"float"                         # string offset=226
.Linfo_string8:
	.asciz	"b"                             # string offset=232
.Linfo_string9:
	.asciz	"c"                             # string offset=234
.Linfo_string10:
	.asciz	"i"                             # string offset=236
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
	.quad	.Ltmp0
.Ldebug_addr_end0:
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.section	.debug_line,"",@progbits
.Lline_table_start0:
