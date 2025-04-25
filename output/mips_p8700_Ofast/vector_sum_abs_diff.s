	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_xmipscmov1p0_xmipslsp1p0"
	.file	"vector_sum_abs_diff.c"
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
	.globl	vector_sum_abs_diff             # -- Begin function vector_sum_abs_diff
	.p2align	1
	.type	vector_sum_abs_diff,@function
vector_sum_abs_diff:                    # @vector_sum_abs_diff
	.cfi_startproc
# %bb.0:                                # %entry
	srliw	a3, a3, 3
	beqz	a3, .LBB2_3
# %bb.1:                                # %for.cond1.preheader.preheader
	addi	a2, a2, 3
	addi	a1, a1, 3
	sh2add	a6, a3, a0
.LBB2_2:                                # %for.cond1.preheader
                                        # =>This Inner Loop Header: Depth=1
	lbu	a7, -3(a1)
	lbu	t0, -2(a1)
	lbu	t1, -1(a1)
	lbu	t2, 0(a1)
	lbu	a5, -3(a2)
	lbu	a3, -2(a2)
	lbu	a4, -1(a2)
	lbu	t3, 0(a2)
	sub	a5, a7, a5
	sext.b	a7, a5
	sub	a3, t0, a3
	sext.b	a3, a3
	sub	a4, t1, a4
	sext.b	a4, a4
	sub	a5, t2, t3
	sext.b	a5, a5
	neg	t0, a7
	neg	t1, a3
	neg	t2, a4
	neg	t3, a5
	max	a7, a7, t0
	max	a3, a3, t1
	max	a4, a4, t2
	max	a5, a5, t3
	sext.b	a7, a7
	sext.b	a3, a3
	sext.b	a4, a4
	sext.b	a5, a5
	add	a3, a3, a7
	add	a4, a4, a5
	add	a7, a3, a4
	lbu	t0, 1(a1)
	lbu	t1, 2(a1)
	lbu	t2, 3(a1)
	lbu	t3, 4(a1)
	lbu	a5, 1(a2)
	lbu	a3, 2(a2)
	lbu	t5, 3(a2)
	lbu	t4, 4(a2)
	sub	a5, t0, a5
	sext.b	a5, a5
	neg	a4, a5
	max	a4, a5, a4
	sub	a3, t1, a3
	sext.b	a3, a3
	neg	a5, a3
	max	a3, a3, a5
	sext.b	a4, a4
	sext.b	a3, a3
	add	a3, a3, a4
	sub	a4, t2, t5
	sext.b	a4, a4
	neg	a5, a4
	max	a4, a4, a5
	sext.b	a4, a4
	add	a3, a3, a4
	add	a3, a3, a7
	sub	a4, t3, t4
	sext.b	a4, a4
	neg	a5, a4
	max	a4, a4, a5
	sext.b	a4, a4
	add	a3, a3, a4
	sw	a3, 0(a0)
	addi	a0, a0, 4
	addi	a2, a2, 8
	addi	a1, a1, 8
	bne	a0, a6, .LBB2_2
.LBB2_3:                                # %for.cond.cleanup
	ret
.Lfunc_end2:
	.size	vector_sum_abs_diff, .Lfunc_end2-vector_sum_abs_diff
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
