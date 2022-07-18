	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"memcpy_i8.c"
	.globl	my_memcpy
	.p2align	1
	.type	my_memcpy,@function
my_memcpy:
	beqz	a0, .LBB0_3
	zext.w	a0, a0
.LBB0_2:
	lb	a3, 0(a2)
	sb	a3, 0(a1)
	addi	a2, a2, 1
	addi	a0, a0, -1
	addi	a1, a1, 1
	bnez	a0, .LBB0_2
.LBB0_3:
	ret
.Lfunc_end0:
	.size	my_memcpy, .Lfunc_end0-my_memcpy

	.ident	"clang version 15.0.0 (https://github.com/llvm/llvm-project.git 1e451369d2017830d3dbddec24063170b7aca0de)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
