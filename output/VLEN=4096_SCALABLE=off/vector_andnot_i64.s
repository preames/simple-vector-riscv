	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_andnot_i64.c"
	.globl	vector_andnot_i64
	.p2align	1
	.type	vector_andnot_i64,@function
vector_andnot_i64:
	beqz	a2, .LBB0_6
	li	a3, 32
	zext.w	a7, a2
	bltu	a2, a3, .LBB0_3
	sh3add	a3, a7, a0
	sh3add	a4, a7, a1
	sltu	a4, a0, a4
	sltu	a3, a1, a3
	and	a3, a3, a4
	beqz	a3, .LBB0_7
.LBB0_3:
	li	t1, 0
.LBB0_4:
	sh3add	a0, t1, a0
	sh3add	a1, t1, a1
	sub	a2, a7, t1
.LBB0_5:
	ld	a3, 0(a0)
	ld	a4, 0(a1)
	andn	a3, a3, a4
	sd	a3, 0(a0)
	addi	a0, a0, 8
	addi	a2, a2, -1
	addi	a1, a1, 8
	bnez	a2, .LBB0_5
.LBB0_6:
	ret
.LBB0_7:
	li	a3, -128
	li	a4, 128
	zext.w	a6, a3
	bgeu	a2, a4, .LBB0_9
	li	t1, 0
	j	.LBB0_13
.LBB0_9:
	and	t1, a7, a6
	li	t0, 64
	mv	a2, t1
	mv	a3, a1
	mv	a5, a0
.LBB0_10:
	addi	t2, a3, 512
	addi	a4, a5, 512
	vsetvli	zero, t0, e64, m1, ta, mu
	vle64.v	v8, (a3)
	vle64.v	v9, (t2)
	vle64.v	v10, (a5)
	vle64.v	v11, (a4)
	vnot.v	v8, v8
	vnot.v	v9, v9
	vand.vv	v8, v10, v8
	vand.vv	v9, v11, v9
	vse64.v	v8, (a5)
	vse64.v	v9, (a4)
	addi	a5, a5, 1024
	addi	a2, a2, -128
	addi	a3, a3, 1024
	bnez	a2, .LBB0_10
	beq	t1, a7, .LBB0_6
	andi	a2, a7, 96
	beqz	a2, .LBB0_4
.LBB0_13:
	mv	a4, t1
	addi	a2, a6, 96
	and	t1, a7, a2
	sh3add	a2, a4, a0
	sh3add	a3, a4, a1
	sub	a5, a4, t1
	li	a4, 32
.LBB0_14:
	vsetvli	zero, a4, e64, m1, ta, mu
	vle64.v	v8, (a3)
	vle64.v	v9, (a2)
	vnot.v	v8, v8
	vand.vv	v8, v9, v8
	vse64.v	v8, (a2)
	addi	a2, a2, 256
	addi	a5, a5, 32
	addi	a3, a3, 256
	bnez	a5, .LBB0_14
	beq	t1, a7, .LBB0_6
	j	.LBB0_4
.Lfunc_end0:
	.size	vector_andnot_i64, .Lfunc_end0-vector_andnot_i64

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 86b67a310dedf4d0c6a5bc012d8bee7dbac1d2ad)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
