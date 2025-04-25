	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
	.file	"vector_abs_diff_i8.c"
	.text
	.globl	sub                             # -- Begin function sub
	.p2align	1
	.type	sub,@function
sub:                                    # @sub
	.cfi_startproc
# %bb.0:                                # %entry
	subw	a0, a0, a1
	sext.b	a0, a0
	ret
.Lfunc_end0:
	.size	sub, .Lfunc_end0-sub
	.cfi_endproc
                                        # -- End function
	.globl	myabs                           # -- Begin function myabs
	.p2align	1
	.type	myabs,@function
myabs:                                  # @myabs
	.cfi_startproc
# %bb.0:                                # %entry
	neg	a1, a0
	max	a0, a0, a1
	sext.b	a0, a0
	ret
.Lfunc_end1:
	.size	myabs, .Lfunc_end1-myabs
	.cfi_endproc
                                        # -- End function
	.globl	vector_abs_diff                 # -- Begin function vector_abs_diff
	.p2align	1
	.type	vector_abs_diff,@function
vector_abs_diff:                        # @vector_abs_diff
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a3, .LBB2_3
# %bb.1:                                # %for.body.preheader
	andi	a6, a3, 7
	li	a4, 8
	bgeu	a3, a4, .LBB2_4
# %bb.2:
	li	a3, 0
	bnez	a6, .LBB2_7
.LBB2_3:                                # %for.cond.cleanup
	ret
.LBB2_4:                                # %for.body.preheader.new
	zext.w	a3, a3
	li	t0, 0
	addi	t2, a0, 3
	andi	a3, a3, -8
	addi	a5, a1, 3
	neg	a7, a3
	addi	a3, a2, 3
.LBB2_5:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lbu	t1, -3(a5)
	addi	t0, t0, -8
	lbu	a4, -3(a3)
	sub	a4, t1, a4
	sext.b	t1, a4
	neg	a4, t1
	max	a4, t1, a4
	sb	a4, -3(t2)
	lbu	t1, -2(a5)
	lbu	a4, -2(a3)
	sub	a4, t1, a4
	sext.b	t1, a4
	neg	a4, t1
	max	a4, t1, a4
	sb	a4, -2(t2)
	lbu	t1, -1(a5)
	lbu	a4, -1(a3)
	sub	a4, t1, a4
	sext.b	t1, a4
	neg	a4, t1
	max	a4, t1, a4
	sb	a4, -1(t2)
	lbu	t1, 0(a5)
	lbu	a4, 0(a3)
	sub	a4, t1, a4
	sext.b	t1, a4
	neg	a4, t1
	max	a4, t1, a4
	sb	a4, 0(t2)
	lbu	t1, 1(a5)
	lbu	a4, 1(a3)
	sub	a4, t1, a4
	sext.b	t1, a4
	neg	a4, t1
	max	a4, t1, a4
	sb	a4, 1(t2)
	lbu	t1, 2(a5)
	lbu	a4, 2(a3)
	sub	a4, t1, a4
	sext.b	t1, a4
	neg	a4, t1
	max	a4, t1, a4
	sb	a4, 2(t2)
	lbu	t1, 3(a5)
	lbu	a4, 3(a3)
	sub	a4, t1, a4
	sext.b	t1, a4
	neg	a4, t1
	max	a4, t1, a4
	sb	a4, 3(t2)
	lbu	t1, 4(a5)
	lbu	a4, 4(a3)
	addi	a3, a3, 8
	addi	a5, a5, 8
	sub	a4, t1, a4
	sext.b	a4, a4
	neg	t1, a4
	max	a4, a4, t1
	sb	a4, 4(t2)
	addi	t2, t2, 8
	bne	a7, t0, .LBB2_5
# %bb.6:                                # %for.cond.cleanup.loopexit.unr-lcssa.loopexit
	neg	a3, t0
	beqz	a6, .LBB2_3
.LBB2_7:                                # %for.body.epil
	add	a1, a1, a3
	add	a2, a2, a3
	add	a0, a0, a3
	lbu	a4, 0(a1)
	lbu	a5, 0(a2)
	li	a3, 1
	sub	a4, a4, a5
	sext.b	a4, a4
	neg	a5, a4
	max	a4, a4, a5
	sb	a4, 0(a0)
	beq	a6, a3, .LBB2_3
# %bb.8:                                # %for.body.epil.1
	lbu	a3, 1(a1)
	lbu	a4, 1(a2)
	sub	a3, a3, a4
	sext.b	a3, a3
	neg	a4, a3
	max	a3, a3, a4
	sb	a3, 1(a0)
	li	a3, 2
	beq	a6, a3, .LBB2_3
# %bb.9:                                # %for.body.epil.2
	lbu	a3, 2(a1)
	lbu	a4, 2(a2)
	sub	a3, a3, a4
	sext.b	a3, a3
	neg	a4, a3
	max	a3, a3, a4
	sb	a3, 2(a0)
	li	a3, 3
	beq	a6, a3, .LBB2_3
# %bb.10:                               # %for.body.epil.3
	lbu	a3, 3(a1)
	lbu	a4, 3(a2)
	sub	a3, a3, a4
	sext.b	a3, a3
	neg	a4, a3
	max	a3, a3, a4
	sb	a3, 3(a0)
	li	a3, 4
	beq	a6, a3, .LBB2_3
# %bb.11:                               # %for.body.epil.4
	lbu	a3, 4(a1)
	lbu	a4, 4(a2)
	sub	a3, a3, a4
	sext.b	a3, a3
	neg	a4, a3
	max	a3, a3, a4
	sb	a3, 4(a0)
	li	a3, 5
	beq	a6, a3, .LBB2_3
# %bb.12:                               # %for.body.epil.5
	lbu	a3, 5(a1)
	lbu	a4, 5(a2)
	sub	a3, a3, a4
	sext.b	a3, a3
	neg	a4, a3
	max	a3, a3, a4
	sb	a3, 5(a0)
	li	a3, 6
	beq	a6, a3, .LBB2_3
# %bb.13:                               # %for.body.epil.6
	lbu	a1, 6(a1)
	lbu	a2, 6(a2)
	sub	a1, a1, a2
	sext.b	a1, a1
	neg	a2, a1
	max	a1, a1, a2
	sb	a1, 6(a0)
	ret
.Lfunc_end2:
	.size	vector_abs_diff, .Lfunc_end2-vector_abs_diff
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
