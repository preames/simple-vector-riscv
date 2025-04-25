	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
	.file	"aos_reduce_sum_i32.c"
	.text
	.globl	aos_reduce_sum_i32              # -- Begin function aos_reduce_sum_i32
	.p2align	1
	.type	aos_reduce_sum_i32,@function
aos_reduce_sum_i32:                     # @aos_reduce_sum_i32
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a0, .LBB0_4
# %bb.1:                                # %for.body.preheader
	andi	a6, a0, 7
	li	a2, 8
	bgeu	a0, a2, .LBB0_5
# %bb.2:
	li	a0, 0
	li	t0, 0
	bnez	a6, .LBB0_8
.LBB0_3:                                # %for.cond.cleanup
	sext.w	a0, t0
	ret
.LBB0_4:
	li	a0, 0
	ret
.LBB0_5:                                # %for.body.preheader.new
	zext.w	a0, a0
	li	a4, 0
	li	t0, 0
	andi	a0, a0, -8
	addi	a5, a1, 272
	neg	a7, a0
.LBB0_6:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lw	a3, -224(a5)
	lw	a0, -168(a5)
	lw	a2, -112(a5)
	lw	t1, -56(a5)
	addi	a4, a4, -8
	add	a3, a3, t0
	add	a0, a0, a2
	lw	t2, 0(a5)
	add	t0, a0, a3
	lw	a3, 56(a5)
	lw	a0, 112(a5)
	lw	a2, 168(a5)
	add	t1, t1, t2
	addi	a5, a5, 448
	add	a3, a3, t1
	add	a0, a0, a2
	add	a3, a3, t0
	add	t0, a0, a3
	bne	a7, a4, .LBB0_6
# %bb.7:                                # %for.cond.cleanup.loopexit.unr-lcssa.loopexit
	neg	a0, a4
	beqz	a6, .LBB0_3
.LBB0_8:                                # %for.body.epil
	slli	a4, a0, 3
	slli	a0, a0, 6
	sub	a0, a0, a4
	add	a1, a1, a0
	lw	a0, 48(a1)
	add	t0, t0, a0
	li	a0, 1
	beq	a6, a0, .LBB0_3
# %bb.9:                                # %for.body.epil.1
	lw	a0, 104(a1)
	add	t0, t0, a0
	li	a0, 2
	beq	a6, a0, .LBB0_3
# %bb.10:                               # %for.body.epil.2
	lw	a0, 160(a1)
	add	t0, t0, a0
	li	a0, 3
	beq	a6, a0, .LBB0_3
# %bb.11:                               # %for.body.epil.3
	lw	a0, 216(a1)
	add	t0, t0, a0
	li	a0, 4
	beq	a6, a0, .LBB0_3
# %bb.12:                               # %for.body.epil.4
	lw	a0, 272(a1)
	add	t0, t0, a0
	li	a0, 5
	beq	a6, a0, .LBB0_3
# %bb.13:                               # %for.body.epil.5
	lw	a0, 328(a1)
	add	t0, t0, a0
	li	a0, 6
	beq	a6, a0, .LBB0_3
# %bb.14:                               # %for.body.epil.6
	lw	a0, 384(a1)
	add	t0, t0, a0
	sext.w	a0, t0
	ret
.Lfunc_end0:
	.size	aos_reduce_sum_i32, .Lfunc_end0-aos_reduce_sum_i32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
