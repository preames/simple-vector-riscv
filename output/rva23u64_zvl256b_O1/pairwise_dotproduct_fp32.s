	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zihintntl1p0_zihintpause2p0_zihpm2p0_zimop1p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zawrs1p0_zfa1p0_zfhmin1p0_zca1p0_zcb1p0_zcd1p0_zcmop1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0_zvbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfhmin1p0_zvkb1p0_zvkt1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0_supm1p0"
	.file	"pairwise_dotproduct_fp32.c"
	.text
	.globl	pairwise_dotproduct_fp32        # -- Begin function pairwise_dotproduct_fp32
	.p2align	1
	.type	pairwise_dotproduct_fp32,@function
pairwise_dotproduct_fp32:               # @pairwise_dotproduct_fp32
	.cfi_startproc
# %bb.0:                                # %entry
	andi	a4, a0, -2
	beqz	a4, .LBB0_3
# %bb.1:                                # %for.body.preheader
	addi	a0, a2, 4
	addi	a3, a3, 4
	slli.uw	a4, a4, 2
	addi	a4, a4, -4
	andi	a4, a4, -8
	add	a2, a2, a4
	addi	a2, a2, 12
.LBB0_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	flw	fa5, -4(a0)
	flw	fa4, 0(a0)
	flw	fa3, 0(a3)
	flw	fa2, -4(a3)
	addi	a0, a0, 8
	addi	a3, a3, 8
	fmul.s	fa4, fa4, fa3
	fmadd.s	fa5, fa5, fa2, fa4
	fsw	fa5, 0(a1)
	addi	a1, a1, 4
	bne	a0, a2, .LBB0_2
.LBB0_3:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	pairwise_dotproduct_fp32, .Lfunc_end0-pairwise_dotproduct_fp32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
