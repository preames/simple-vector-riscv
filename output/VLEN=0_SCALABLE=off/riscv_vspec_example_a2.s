	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"riscv_vspec_example_a2.c"
	.globl	example_a2
	.p2align	1
	.type	example_a2,@function
example_a2:
	beqz	a3, .LBB0_5
	zext.w	a3, a3
	li	a6, 4
	j	.LBB0_3
.LBB0_2:
	sb	a5, 0(a1)
	addi	a0, a0, 1
	addi	a2, a2, 1
	addi	a3, a3, -1
	addi	a1, a1, 1
	beqz	a3, .LBB0_5
.LBB0_3:
	lbu	a4, 0(a0)
	li	a5, 1
	bltu	a6, a4, .LBB0_2
	lbu	a5, 0(a2)
	j	.LBB0_2
.LBB0_5:
	ret
.Lfunc_end0:
	.size	example_a2, .Lfunc_end0-example_a2

	.ident	"clang version 15.0.0 (https://github.com/llvm/llvm-project.git 20dd3297b1c08ce08cbefa4fa41041e68c8e81a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
