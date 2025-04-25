	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zihintntl1p0_zihintpause2p0_zihpm2p0_zimop1p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zawrs1p0_zfa1p0_zfhmin1p0_zca1p0_zcb1p0_zcd1p0_zcmop1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0_zvbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfhmin1p0_zvkb1p0_zvkt1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl512b1p0_zvl64b1p0_supm1p0"
	.file	"lemire-20220714.c"
	.text
	.globl	remove_negatives_scalar         # -- Begin function remove_negatives_scalar
	.p2align	1
	.type	remove_negatives_scalar,@function
remove_negatives_scalar:                # @remove_negatives_scalar
	.cfi_startproc
# %bb.0:                                # %entry
	blez	a1, .LBB0_5
# %bb.1:                                # %for.body.preheader
	li	a3, 0
	sh2add	a1, a1, a0
	j	.LBB0_3
.LBB0_2:                                # %for.inc
                                        #   in Loop: Header=BB0_3 Depth=1
	addi	a0, a0, 4
	beq	a0, a1, .LBB0_5
.LBB0_3:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lw	a4, 0(a0)
	bltz	a4, .LBB0_2
# %bb.4:                                # %if.then
                                        #   in Loop: Header=BB0_3 Depth=1
	sh2add	a5, a3, a2
	addi	a3, a3, 1
	sw	a4, 0(a5)
	j	.LBB0_2
.LBB0_5:                                # %for.end
	ret
.Lfunc_end0:
	.size	remove_negatives_scalar, .Lfunc_end0-remove_negatives_scalar
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
