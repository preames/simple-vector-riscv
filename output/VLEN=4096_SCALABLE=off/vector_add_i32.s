	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_add_i32.c"
	.globl	vector_add_i32
	.p2align	1
	.type	vector_add_i32,@function
vector_add_i32:
	beqz	a1, .LBB0_14
	li	a3, 64
	zext.w	a7, a1
	bgeu	a1, a3, .LBB0_3
	li	t0, 0
	j	.LBB0_12
.LBB0_3:
	li	a3, -256
	li	a4, 256
	zext.w	a6, a3
	bgeu	a1, a4, .LBB0_5
	li	t0, 0
	j	.LBB0_9
.LBB0_5:
	and	t0, a7, a6
	li	a5, 128
	mv	a1, t0
	mv	a3, a0
.LBB0_6:
	addi	a4, a3, 512
	vsetvli	zero, a5, e32, m1, ta, mu
	vle32.v	v8, (a3)
	vle32.v	v9, (a4)
	vadd.vx	v8, v8, a2
	vadd.vx	v9, v9, a2
	vse32.v	v8, (a3)
	vse32.v	v9, (a4)
	addi	a1, a1, -256
	addi	a3, a3, 1024
	bnez	a1, .LBB0_6
	beq	t0, a7, .LBB0_14
	andi	a1, a7, 192
	beqz	a1, .LBB0_12
.LBB0_9:
	mv	a3, t0
	addi	a1, a6, 192
	and	t0, a7, a1
	sh2add	a1, a3, a0
	sub	a3, a3, t0
	li	a5, 64
.LBB0_10:
	vsetvli	zero, a5, e32, mf2, ta, mu
	vle32.v	v8, (a1)
	vadd.vx	v8, v8, a2
	vse32.v	v8, (a1)
	addi	a3, a3, 64
	addi	a1, a1, 256
	bnez	a3, .LBB0_10
	beq	t0, a7, .LBB0_14
.LBB0_12:
	sh2add	a0, t0, a0
	sub	a1, a7, t0
.LBB0_13:
	lw	a3, 0(a0)
	addw	a3, a3, a2
	sw	a3, 0(a0)
	addi	a1, a1, -1
	addi	a0, a0, 4
	bnez	a1, .LBB0_13
.LBB0_14:
	ret
.Lfunc_end0:
	.size	vector_add_i32, .Lfunc_end0-vector_add_i32

	.ident	"clang version 15.0.0 (https://github.com/llvm/llvm-project.git dde2a7fb6da46da2b2f765fa569d8fddb4270eb6)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
