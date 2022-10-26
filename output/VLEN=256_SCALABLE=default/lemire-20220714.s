	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0"
	.file	"lemire-20220714.c"
	.globl	remove_negatives_scalar
	.p2align	1
	.type	remove_negatives_scalar,@function
remove_negatives_scalar:
	blez	a1, .LBB0_5
	li	a3, 0
	j	.LBB0_3
.LBB0_2:
	addi	a1, a1, -1
	addi	a0, a0, 4
	beqz	a1, .LBB0_5
.LBB0_3:
	lw	a4, 0(a0)
	bltz	a4, .LBB0_2
	sh2add	a5, a3, a2
	addi	a3, a3, 1
	sw	a4, 0(a5)
	j	.LBB0_2
.LBB0_5:
	ret
.Lfunc_end0:
	.size	remove_negatives_scalar, .Lfunc_end0-remove_negatives_scalar

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 269bc684e7a0c3f727ea5e74270112585acaf55d)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
