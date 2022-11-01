	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl1024b1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl512b1p0_zvl64b1p0"
	.file	"strnlen.c"
	.globl	my_strnlne
	.p2align	1
	.type	my_strnlne,@function
my_strnlne:
	li	a2, 0
	beqz	a0, .LBB0_5
	zext.w	a3, a0
.LBB0_2:
	lbu	a4, 0(a1)
	beqz	a4, .LBB0_5
	addiw	a2, a2, 1
	addi	a3, a3, -1
	addi	a1, a1, 1
	bnez	a3, .LBB0_2
	mv	a2, a0
.LBB0_5:
	minu	a0, a2, a0
	ret
.Lfunc_end0:
	.size	my_strnlne, .Lfunc_end0-my_strnlne

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 9472a810ed33bc9e655484f43047eed07d50bc16)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
