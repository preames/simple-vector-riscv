	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicsr2p0_zihintpause2p0_zihpm2p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zfhmin1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"dotproduct_fp32.c"
	.text
	.globl	dotproduct_fp32                 # -- Begin function dotproduct_fp32
	.p2align	1
	.type	dotproduct_fp32,@function
dotproduct_fp32:                        # @dotproduct_fp32
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a0, .LBB0_4
# %bb.1:                                # %for.body.preheader
	sh2add.uw	a0, a0, a1
	fmv.w.x	fa0, zero
.LBB0_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	flw	fa5, 0(a1)
	flw	fa4, 0(a2)
	addi	a1, a1, 4
	fmadd.s	fa0, fa5, fa4, fa0
	addi	a2, a2, 4
	bne	a1, a0, .LBB0_2
# %bb.3:                                # %for.cond.cleanup
	ret
.LBB0_4:
	fmv.w.x	fa0, zero
	ret
.Lfunc_end0:
	.size	dotproduct_fp32, .Lfunc_end0-dotproduct_fp32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
