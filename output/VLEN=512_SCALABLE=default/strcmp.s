	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl512b1p0_zvl64b1p0"
	.file	"strcmp.c"
	.globl	my_strcmp
	.p2align	1
	.type	my_strcmp,@function
my_strcmp:
	lbu	a2, 0(a0)
	lbu	a3, 0(a1)
	bne	a2, a3, .LBB0_4
	addi	a1, a1, 1
	addi	a0, a0, 1
.LBB0_2:
	andi	a2, a2, 255
	beqz	a2, .LBB0_5
	lbu	a2, 0(a0)
	lbu	a3, 0(a1)
	addi	a1, a1, 1
	addi	a0, a0, 1
	beq	a2, a3, .LBB0_2
.LBB0_4:
	sltu	a0, a2, a3
	neg	a0, a0
	ori	a0, a0, 1
	ret
.LBB0_5:
	li	a0, 0
	ret
.Lfunc_end0:
	.size	my_strcmp, .Lfunc_end0-my_strcmp

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 49caf7012170422afa84868598063818f9344228)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
