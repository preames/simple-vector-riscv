	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"sparsevec_add_i32.c"
	.globl	sparsevec_add_i32
	.p2align	1
	.type	sparsevec_add_i32,@function
sparsevec_add_i32:
	beqz	a0, .LBB0_3
	zext.w	a0, a0
.LBB0_2:
	lh	a6, 0(a4)
	lh	a7, 0(a2)
	sh2add	a5, a6, a3
	lw	a6, 0(a5)
	sh2add	a7, a7, a1
	lw	a5, 0(a7)
	addw	a5, a5, a6
	sw	a5, 0(a7)
	addi	a4, a4, 2
	addi	a0, a0, -1
	addi	a2, a2, 2
	bnez	a0, .LBB0_2
.LBB0_3:
	ret
.Lfunc_end0:
	.size	sparsevec_add_i32, .Lfunc_end0-sparsevec_add_i32

	.ident	"clang version 15.0.0 (https://github.com/llvm/llvm-project.git 875ee0ed1c5af58cb4909f239093e25a35d7a21a)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
