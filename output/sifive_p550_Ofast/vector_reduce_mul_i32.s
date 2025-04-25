	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
	.file	"vector_reduce_mul_i32.c"
	.text
	.globl	vector_reduce_mul_i32           # -- Begin function vector_reduce_mul_i32
	.p2align	1
	.type	vector_reduce_mul_i32,@function
vector_reduce_mul_i32:                  # @vector_reduce_mul_i32
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a1, .LBB0_4
# %bb.1:                                # %for.body.preheader
	andi	a6, a1, 7
	li	a3, 8
	bgeu	a1, a3, .LBB0_5
# %bb.2:
	li	a3, 0
	li	t0, 1
	bnez	a6, .LBB0_8
.LBB0_3:                                # %for.cond.cleanup
	sext.w	a0, t0
	ret
.LBB0_4:
	li	t0, 1
	sext.w	a0, t0
	ret
.LBB0_5:                                # %for.body.preheader.new
	zext.w	a1, a1
	li	a3, 0
	addi	a4, a0, 16
	andi	a1, a1, -8
	li	t0, 1
	neg	a7, a1
.LBB0_6:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lw	a2, -16(a4)
	lw	a5, -12(a4)
	lw	a1, -8(a4)
	lw	t1, -4(a4)
	addi	a3, a3, -8
	mul	a2, a2, t0
	lw	t2, 0(a4)
	lw	t3, 4(a4)
	mul	a1, a1, a5
	mul	t0, a1, a2
	lw	a1, 8(a4)
	lw	a2, 12(a4)
	mul	a5, t2, t1
	addi	a4, a4, 32
	mul	a5, t3, a5
	mul	a1, a2, a1
	mul	a5, a5, t0
	mul	t0, a1, a5
	bne	a7, a3, .LBB0_6
# %bb.7:                                # %for.cond.cleanup.loopexit.unr-lcssa.loopexit
	neg	a3, a3
	beqz	a6, .LBB0_3
.LBB0_8:                                # %for.body.epil
	sh2add	a0, a3, a0
	lw	a3, 0(a0)
	mul	t0, a3, t0
	li	a3, 1
	beq	a6, a3, .LBB0_3
# %bb.9:                                # %for.body.epil.1
	lw	a3, 4(a0)
	mul	t0, a3, t0
	li	a3, 2
	beq	a6, a3, .LBB0_3
# %bb.10:                               # %for.body.epil.2
	lw	a3, 8(a0)
	mul	t0, a3, t0
	li	a3, 3
	beq	a6, a3, .LBB0_3
# %bb.11:                               # %for.body.epil.3
	lw	a3, 12(a0)
	mul	t0, a3, t0
	li	a3, 4
	beq	a6, a3, .LBB0_3
# %bb.12:                               # %for.body.epil.4
	lw	a3, 16(a0)
	mul	t0, a3, t0
	li	a3, 5
	beq	a6, a3, .LBB0_3
# %bb.13:                               # %for.body.epil.5
	lw	a3, 20(a0)
	mul	t0, a3, t0
	li	a3, 6
	beq	a6, a3, .LBB0_3
# %bb.14:                               # %for.body.epil.6
	lw	a0, 24(a0)
	mul	t0, a0, t0
	sext.w	a0, t0
	ret
.Lfunc_end0:
	.size	vector_reduce_mul_i32, .Lfunc_end0-vector_reduce_mul_i32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
