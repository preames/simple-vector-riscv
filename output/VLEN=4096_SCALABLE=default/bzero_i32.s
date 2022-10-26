	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl1024b1p0_zvl128b1p0_zvl2048b1p0_zvl256b1p0_zvl32b1p0_zvl4096b1p0_zvl512b1p0_zvl64b1p0"
	.file	"bzero_i32.c"
	.globl	my_bzero
	.p2align	1
	.type	my_bzero,@function
my_bzero:
	beqz	a1, .LBB0_2
	slli.uw	a2, a1, 2
	li	a1, 0
	tail	memset@plt
.LBB0_2:
	ret
.Lfunc_end0:
	.size	my_bzero, .Lfunc_end0-my_bzero

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 269bc684e7a0c3f727ea5e74270112585acaf55d)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
