	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"pairwise_dotproduct_fp32.c"
	.globl	pairwise_dotproduct_fp32
	.p2align	1
	.type	pairwise_dotproduct_fp32,@function
pairwise_dotproduct_fp32:
	andi	a4, a0, -2
	beqz	a4, .LBB0_3
	li	a0, 0
	zext.w	a4, a4
	addi	a2, a2, 4
	addi	a3, a3, 4
.LBB0_2:
	flw	ft0, -4(a2)
	flw	ft1, 0(a2)
	flw	ft2, 0(a3)
	flw	ft3, -4(a3)
	fmul.s	ft1, ft1, ft2
	fmadd.s	ft0, ft0, ft3, ft1
	fsw	ft0, 0(a1)
	addi	a0, a0, 2
	addi	a2, a2, 8
	addi	a3, a3, 8
	addi	a1, a1, 4
	bltu	a0, a4, .LBB0_2
.LBB0_3:
	ret
.Lfunc_end0:
	.size	pairwise_dotproduct_fp32, .Lfunc_end0-pairwise_dotproduct_fp32

	.ident	"clang version 15.0.0 (https://github.com/llvm/llvm-project.git dde2a7fb6da46da2b2f765fa569d8fddb4270eb6)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
