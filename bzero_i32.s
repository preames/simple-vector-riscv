	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"bzero_i32.c"
	.globl	my_bzero
	.p2align	1
	.type	my_bzero,@function
my_bzero:
	addi	sp, sp, -16
	sd	ra, 8(sp)
	beqz	a1, .LBB0_2
	slli.uw	a2, a1, 2
	li	a1, 0
	call	memset@plt
.LBB0_2:
	ld	ra, 8(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end0:
	.size	my_bzero, .Lfunc_end0-my_bzero

	.ident	"clang version 15.0.0 (https://github.com/llvm/llvm-project.git 98d4547be003bbbf8581939e86bf2f4d9fdb7234)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
