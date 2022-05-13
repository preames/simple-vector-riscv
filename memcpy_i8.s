	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"memcpy_i8.c"
	.globl	my_memcpy
	.p2align	1
	.type	my_memcpy,@function
my_memcpy:
	beqz	a0, .LBB0_15
	li	a3, 8
	zext.w	a7, a0
	bgeu	a0, a3, .LBB0_3
	li	a4, 0
	j	.LBB0_13
.LBB0_3:
	add	a3, a1, a7
	add	a4, a2, a7
	sltu	a4, a1, a4
	sltu	a3, a2, a3
	and	a3, a3, a4
	li	a4, 0
	bnez	a3, .LBB0_13
	li	a3, -32
	li	t0, 32
	zext.w	a6, a3
	bgeu	a0, t0, .LBB0_6
	li	a4, 0
	j	.LBB0_10
.LBB0_6:
	and	a4, a7, a6
	mv	a0, a4
	mv	a3, a1
	mv	a5, a2
.LBB0_7:
	vsetvli	zero, t0, e8, m2, ta, mu
	vle8.v	v8, (a5)
	vse8.v	v8, (a3)
	addi	a5, a5, 32
	addi	a0, a0, -32
	addi	a3, a3, 32
	bnez	a0, .LBB0_7
	beq	a4, a7, .LBB0_15
	andi	a0, a7, 24
	beqz	a0, .LBB0_13
.LBB0_10:
	mv	a3, a4
	addi	a0, a6, 24
	and	a4, a7, a0
	add	a0, a2, a3
	add	a5, a1, a3
	sub	a3, a3, a4
.LBB0_11:
	vsetivli	zero, 8, e8, mf2, ta, mu
	vle8.v	v8, (a0)
	vse8.v	v8, (a5)
	addi	a0, a0, 8
	addi	a3, a3, 8
	addi	a5, a5, 8
	bnez	a3, .LBB0_11
	beq	a4, a7, .LBB0_15
.LBB0_13:
	add	a0, a2, a4
	add	a1, a1, a4
	sub	a2, a7, a4
.LBB0_14:
	lb	a3, 0(a0)
	sb	a3, 0(a1)
	addi	a0, a0, 1
	addi	a2, a2, -1
	addi	a1, a1, 1
	bnez	a2, .LBB0_14
.LBB0_15:
	ret
.Lfunc_end0:
	.size	my_memcpy, .Lfunc_end0-my_memcpy

	.ident	"clang version 15.0.0 (https://github.com/llvm/llvm-project.git 98d4547be003bbbf8581939e86bf2f4d9fdb7234)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
