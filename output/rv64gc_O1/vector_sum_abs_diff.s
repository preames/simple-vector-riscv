	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0"
	.file	"vector_sum_abs_diff.c"
	.text
	.globl	sub                             # -- Begin function sub
	.p2align	1
	.type	sub,@function
sub:                                    # @sub
	.cfi_startproc
# %bb.0:                                # %entry
	subw	a0, a0, a1
	slli	a0, a0, 56
	srai	a0, a0, 56
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
	slli	a1, a0, 56
	srai	a1, a1, 63
	xor	a0, a0, a1
	subw	a0, a0, a1
	slli	a0, a0, 56
	srai	a0, a0, 56
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
	srliw	a6, a3, 3
	beqz	a6, .LBB2_5
# %bb.1:                                # %for.cond1.preheader.preheader
	li	t0, 0
	mv	a7, a1
.LBB2_2:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_3 Depth 2
	li	t4, 0
	slli	a4, t0, 3
	add	a4, a4, a1
	addi	t1, a4, 8
	mv	a4, a2
	mv	a5, a7
.LBB2_3:                                # %for.body4
                                        #   Parent Loop BB2_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lbu	t2, 0(a5)
	lbu	t3, 0(a4)
	addi	a5, a5, 1
	sub	t2, t2, t3
	slli	a3, t2, 56
	srai	t3, a3, 63
	xor	a3, t2, t3
	subw	a3, a3, t3
	slli	a3, a3, 56
	srai	a3, a3, 56
	add	t4, t4, a3
	addi	a4, a4, 1
	bne	a5, t1, .LBB2_3
# %bb.4:                                # %for.cond.cleanup3
                                        #   in Loop: Header=BB2_2 Depth=1
	slli	a4, t0, 2
	addi	t0, t0, 1
	addi	a7, a7, 8
	add	a4, a4, a0
	sw	t4, 0(a4)
	addi	a2, a2, 8
	bne	t0, a6, .LBB2_2
.LBB2_5:                                # %for.cond.cleanup
	ret
.Lfunc_end2:
	.size	vector_sum_abs_diff, .Lfunc_end2-vector_sum_abs_diff
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
