	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"strlen.c"
	.globl	my_strlne
	.p2align	1
	.type	my_strlne,@function
my_strlne:
	mv	a1, a0
	li	a0, -1
.LBB0_1:
	lbu	a2, 0(a1)
	addi	a1, a1, 1
	addiw	a0, a0, 1
	bnez	a2, .LBB0_1
	ret
.Lfunc_end0:
	.size	my_strlne, .Lfunc_end0-my_strlne

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 9472a810ed33bc9e655484f43047eed07d50bc16)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
