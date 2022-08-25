	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"memcpy_i8.c"
	.globl	my_memcpy
	.p2align	1
	.type	my_memcpy,@function
my_memcpy:
	beqz	a0, .LBB0_14
	sltiu	a3, a0, 256
	sub	a4, a1, a2
	sltiu	a4, a4, 1024
	or	a3, a3, a4
	zext.w	a6, a0
	beqz	a3, .LBB0_3
	li	a7, 0
	j	.LBB0_12
.LBB0_3:
	li	a3, -1024
	li	a5, 1024
	zext.w	t0, a3
	bgeu	a0, a5, .LBB0_5
	li	a7, 0
	j	.LBB0_9
.LBB0_5:
	and	a7, a6, t0
	mv	a0, a7
	mv	a3, a1
	mv	a4, a2
.LBB0_6:
	vsetvli	zero, a5, e8, m2, ta, mu
	vle8.v	v8, (a4)
	vse8.v	v8, (a3)
	addi	a4, a4, 1024
	addi	a0, a0, -1024
	addi	a3, a3, 1024
	bnez	a0, .LBB0_6
	beq	a7, a6, .LBB0_14
	andi	a0, a6, 768
	beqz	a0, .LBB0_12
.LBB0_9:
	mv	a0, a7
	addi	a3, t0, 768
	and	a7, a6, a3
	add	a4, a2, a0
	add	a5, a1, a0
	sub	a3, a0, a7
	li	a0, 256
.LBB0_10:
	vsetvli	zero, a0, e8, mf2, ta, mu
	vle8.v	v8, (a4)
	vse8.v	v8, (a5)
	addi	a4, a4, 256
	addi	a3, a3, 256
	addi	a5, a5, 256
	bnez	a3, .LBB0_10
	beq	a7, a6, .LBB0_14
.LBB0_12:
	add	a2, a2, a7
	add	a1, a1, a7
	sub	a0, a6, a7
.LBB0_13:
	lb	a3, 0(a2)
	sb	a3, 0(a1)
	addi	a2, a2, 1
	addi	a0, a0, -1
	addi	a1, a1, 1
	bnez	a0, .LBB0_13
.LBB0_14:
	ret
.Lfunc_end0:
	.size	my_memcpy, .Lfunc_end0-my_memcpy

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 86b67a310dedf4d0c6a5bc012d8bee7dbac1d2ad)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
