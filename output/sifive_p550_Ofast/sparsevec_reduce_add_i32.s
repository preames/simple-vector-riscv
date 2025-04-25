	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
	.file	"sparsevec_reduce_add_i32.c"
	.text
	.globl	sparsevec_reduce_add_i32        # -- Begin function sparsevec_reduce_add_i32
	.p2align	1
	.type	sparsevec_reduce_add_i32,@function
sparsevec_reduce_add_i32:               # @sparsevec_reduce_add_i32
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a0, .LBB0_4
# %bb.1:                                # %for.body.preheader
	andi	a6, a0, 7
	li	a3, 8
	bgeu	a0, a3, .LBB0_5
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
	zext.w	a3, a0
	li	a5, 0
	li	t0, 0
	andi	a3, a3, -8
	addi	a0, a2, 8
	neg	a7, a3
.LBB0_6:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lh	t1, -8(a0)
	lh	t2, -6(a0)
	lh	t3, -4(a0)
	lh	a4, -2(a0)
	addi	a5, a5, -8
	sh2add	a3, t1, a1
	sh2add	t1, t2, a1
	sh2add	t2, t3, a1
	sh2add	a4, a4, a1
	lw	t3, 0(a3)
	lw	t1, 0(t1)
	lw	a3, 0(t2)
	add	t0, t0, t3
	add	a3, a3, t1
	lh	t1, 0(a0)
	lh	t3, 2(a0)
	lh	t4, 4(a0)
	add	t0, t0, a3
	lh	a3, 6(a0)
	addi	a0, a0, 16
	sh2add	a3, a3, a1
	lw	t2, 0(a4)
	sh2add	a4, t1, a1
	lw	a3, 0(a3)
	sh2add	t1, t3, a1
	sh2add	t3, t4, a1
	lw	a4, 0(a4)
	lw	t3, 0(t3)
	lw	t1, 0(t1)
	add	a4, a4, t2
	add	a3, a3, t3
	add	a4, a4, t1
	add	a4, a4, t0
	add	t0, a3, a4
	bne	a7, a5, .LBB0_6
# %bb.7:                                # %for.cond.cleanup.loopexit.unr-lcssa.loopexit
	neg	a0, a5
	beqz	a6, .LBB0_3
.LBB0_8:                                # %for.body.epil
	sh1add	a0, a0, a2
	lh	a2, 0(a0)
	sh2add	a2, a2, a1
	lw	a2, 0(a2)
	add	t0, t0, a2
	li	a2, 1
	beq	a6, a2, .LBB0_3
# %bb.9:                                # %for.body.epil.1
	lh	a2, 2(a0)
	sh2add	a2, a2, a1
	lw	a2, 0(a2)
	add	t0, t0, a2
	li	a2, 2
	beq	a6, a2, .LBB0_3
# %bb.10:                               # %for.body.epil.2
	lh	a2, 4(a0)
	sh2add	a2, a2, a1
	lw	a2, 0(a2)
	add	t0, t0, a2
	li	a2, 3
	beq	a6, a2, .LBB0_3
# %bb.11:                               # %for.body.epil.3
	lh	a2, 6(a0)
	sh2add	a2, a2, a1
	lw	a2, 0(a2)
	add	t0, t0, a2
	li	a2, 4
	beq	a6, a2, .LBB0_3
# %bb.12:                               # %for.body.epil.4
	lh	a2, 8(a0)
	sh2add	a2, a2, a1
	lw	a2, 0(a2)
	add	t0, t0, a2
	li	a2, 5
	beq	a6, a2, .LBB0_3
# %bb.13:                               # %for.body.epil.5
	lh	a2, 10(a0)
	sh2add	a2, a2, a1
	lw	a2, 0(a2)
	add	t0, t0, a2
	li	a2, 6
	beq	a6, a2, .LBB0_3
# %bb.14:                               # %for.body.epil.6
	lh	a0, 12(a0)
	sh2add	a0, a0, a1
	lw	a0, 0(a0)
	add	t0, t0, a0
	sext.w	a0, t0
	ret
.Lfunc_end0:
	.size	sparsevec_reduce_add_i32, .Lfunc_end0-sparsevec_reduce_add_i32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
