	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0"
	.file	"memcpy_i8.c"
	.globl	my_memcpy
	.p2align	1
	.type	my_memcpy,@function
my_memcpy:
	beqz	a0, .LBB0_8
	sltiu	a3, a0, 64
	sub	a4, a1, a2
	sltiu	a4, a4, 64
	or	a3, a3, a4
	zext.w	a6, a0
	beqz	a3, .LBB0_3
	li	a7, 0
	j	.LBB0_6
.LBB0_3:
	andi	a7, a6, -64
	li	a4, 64
	mv	a5, a7
	mv	a0, a1
	mv	a3, a2
.LBB0_4:
	vsetvli	zero, a4, e8, m2, ta, ma
	vle8.v	v8, (a3)
	vse8.v	v8, (a0)
	addi	a3, a3, 64
	addi	a5, a5, -64
	addi	a0, a0, 64
	bnez	a5, .LBB0_4
	beq	a7, a6, .LBB0_8
.LBB0_6:
	add	a2, a2, a7
	add	a1, a1, a7
	sub	a0, a6, a7
.LBB0_7:
	lb	a3, 0(a2)
	sb	a3, 0(a1)
	addi	a2, a2, 1
	addi	a0, a0, -1
	addi	a1, a1, 1
	bnez	a0, .LBB0_7
.LBB0_8:
	ret
.Lfunc_end0:
	.size	my_memcpy, .Lfunc_end0-my_memcpy

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 9472a810ed33bc9e655484f43047eed07d50bc16)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
