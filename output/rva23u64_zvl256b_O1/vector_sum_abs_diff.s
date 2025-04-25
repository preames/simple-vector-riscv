	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zihintntl1p0_zihintpause2p0_zihpm2p0_zimop1p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zawrs1p0_zfa1p0_zfhmin1p0_zca1p0_zcb1p0_zcd1p0_zcmop1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0_zvbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfhmin1p0_zvkb1p0_zvkt1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0_supm1p0"
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
	srliw	a6, a3, 3
	beqz	a6, .LBB2_5
# %bb.1:                                # %for.cond1.preheader.preheader
	li	t0, 0
	mv	a7, a1
.LBB2_2:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_3 Depth 2
	li	t4, 0
	sh3add	t1, t0, a1
	addi	t1, t1, 8
	mv	a4, a2
	mv	a5, a7
.LBB2_3:                                # %for.body4
                                        #   Parent Loop BB2_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lbu	t2, 0(a5)
	lbu	t3, 0(a4)
	addi	a5, a5, 1
	sub	a3, t2, t3
	sext.b	t2, a3
	neg	a3, t2
	max	a3, t2, a3
	sext.b	a3, a3
	add	t4, t4, a3
	addi	a4, a4, 1
	bne	a5, t1, .LBB2_3
# %bb.4:                                # %for.cond.cleanup3
                                        #   in Loop: Header=BB2_2 Depth=1
	sh2add	a4, t0, a0
	addi	t0, t0, 1
	addi	a7, a7, 8
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
