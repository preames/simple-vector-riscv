	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"dotproduct_fp32.c"
	.globl	dotproduct_fp32
	.p2align	1
	.type	dotproduct_fp32,@function
dotproduct_fp32:
	beqz	a0, .LBB0_4
	zext.w	a0, a0
	fmv.w.x	ft0, zero
.LBB0_2:
	flw	ft1, 0(a1)
	flw	ft2, 0(a2)
	fmadd.s	ft0, ft1, ft2, ft0
	addi	a1, a1, 4
	addi	a0, a0, -1
	addi	a2, a2, 4
	bnez	a0, .LBB0_2
	fmv.x.w	a0, ft0
	ret
.LBB0_4:
	fmv.w.x	ft0, zero
	fmv.x.w	a0, ft0
	ret
.Lfunc_end0:
	.size	dotproduct_fp32, .Lfunc_end0-dotproduct_fp32

	.ident	"clang version 15.0.0 (https://github.com/llvm/llvm-project.git c7fd7512a5c5b133665bfecbe2e9748c0607286e)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
