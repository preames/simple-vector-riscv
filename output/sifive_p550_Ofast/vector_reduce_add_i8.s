	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
	.file	"vector_reduce_add_i8.c"
	.text
	.globl	vector_reduce_add_i32           # -- Begin function vector_reduce_add_i32
	.p2align	1
	.type	vector_reduce_add_i32,@function
vector_reduce_add_i32:                  # @vector_reduce_add_i32
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a1, .LBB0_4
# %bb.1:                                # %for.body.preheader
	andi	a6, a1, 7
	li	a2, 8
	bgeu	a1, a2, .LBB0_5
# %bb.2:
	li	a1, 0
	li	t0, 0
	bnez	a6, .LBB0_8
.LBB0_3:                                # %for.cond.cleanup
	sext.w	a0, t0
	ret
.LBB0_4:
	li	a0, 0
	ret
.LBB0_5:                                # %for.body.preheader.new
	zext.w	a5, a1
	li	a4, 0
	li	t0, 0
	andi	a5, a5, -8
	addi	a1, a0, 3
	neg	a7, a5
.LBB0_6:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lbu	a3, -3(a1)
	lbu	a5, -2(a1)
	lbu	a2, -1(a1)
	lbu	t1, 0(a1)
	addi	a4, a4, -8
	add	a3, a3, t0
	lbu	t2, 1(a1)
	add	a2, a2, a5
	lbu	a5, 2(a1)
	add	t0, a3, a2
	lbu	a2, 3(a1)
	lbu	a3, 4(a1)
	add	t1, t1, t2
	addi	a1, a1, 8
	add	a5, a5, t1
	add	a5, a5, t0
	add	a2, a2, a3
	add	t0, a5, a2
	bne	a7, a4, .LBB0_6
# %bb.7:                                # %for.cond.cleanup.loopexit.unr-lcssa.loopexit
	neg	a1, a4
	beqz	a6, .LBB0_3
.LBB0_8:                                # %for.body.epil
	add	a0, a0, a1
	lbu	a1, 0(a0)
	add	t0, t0, a1
	li	a1, 1
	beq	a6, a1, .LBB0_3
# %bb.9:                                # %for.body.epil.1
	lbu	a1, 1(a0)
	add	t0, t0, a1
	li	a1, 2
	beq	a6, a1, .LBB0_3
# %bb.10:                               # %for.body.epil.2
	lbu	a1, 2(a0)
	add	t0, t0, a1
	li	a1, 3
	beq	a6, a1, .LBB0_3
# %bb.11:                               # %for.body.epil.3
	lbu	a1, 3(a0)
	add	t0, t0, a1
	li	a1, 4
	beq	a6, a1, .LBB0_3
# %bb.12:                               # %for.body.epil.4
	lbu	a1, 4(a0)
	add	t0, t0, a1
	li	a1, 5
	beq	a6, a1, .LBB0_3
# %bb.13:                               # %for.body.epil.5
	lbu	a1, 5(a0)
	add	t0, t0, a1
	li	a1, 6
	beq	a6, a1, .LBB0_3
# %bb.14:                               # %for.body.epil.6
	lbu	a0, 6(a0)
	add	t0, t0, a0
	sext.w	a0, t0
	ret
.Lfunc_end0:
	.size	vector_reduce_add_i32, .Lfunc_end0-vector_reduce_add_i32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
