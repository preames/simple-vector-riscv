	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"memcpy_i8.c"
	.globl	my_memcpy
	.p2align	1
	.type	my_memcpy,@function
my_memcpy:
	beqz	a0, .LBB0_13
	li	t0, 0
	sltiu	a3, a0, 32
	sub	a4, a1, a2
	sltiu	a4, a4, 128
	or	a3, a3, a4
	zext.w	a7, a0
	bnez	a3, .LBB0_11
	li	a3, -128
	li	a5, 128
	zext.w	a6, a3
	bgeu	a0, a5, .LBB0_4
	li	t0, 0
	j	.LBB0_8
.LBB0_4:
	and	t0, a7, a6
	mv	a0, t0
	mv	a3, a1
	mv	a4, a2
.LBB0_5:
	vsetvli	zero, a5, e8, m2, ta, mu
	vle8.v	v8, (a4)
	vse8.v	v8, (a3)
	addi	a4, a4, 128
	addi	a0, a0, -128
	addi	a3, a3, 128
	bnez	a0, .LBB0_5
	beq	t0, a7, .LBB0_13
	andi	a0, a7, 96
	beqz	a0, .LBB0_11
.LBB0_8:
	mv	a3, t0
	addi	a0, a6, 96
	and	t0, a7, a0
	add	a0, a2, a3
	add	a5, a1, a3
	sub	a3, a3, t0
	li	a4, 32
.LBB0_9:
	vsetvli	zero, a4, e8, mf2, ta, mu
	vle8.v	v8, (a0)
	vse8.v	v8, (a5)
	addi	a0, a0, 32
	addi	a3, a3, 32
	addi	a5, a5, 32
	bnez	a3, .LBB0_9
	beq	t0, a7, .LBB0_13
.LBB0_11:
	add	a0, a2, t0
	add	a1, a1, t0
	sub	a2, a7, t0
.LBB0_12:
	lb	a3, 0(a0)
	sb	a3, 0(a1)
	addi	a0, a0, 1
	addi	a2, a2, -1
	addi	a1, a1, 1
	bnez	a2, .LBB0_12
.LBB0_13:
	ret
.Lfunc_end0:
	.size	my_memcpy, .Lfunc_end0-my_memcpy

	.ident	"clang version 15.0.0 (https://github.com/llvm/llvm-project.git 875ee0ed1c5af58cb4909f239093e25a35d7a21a)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
