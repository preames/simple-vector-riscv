	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_andnot_i64.c"
	.globl	vector_andnot_i64
	.p2align	1
	.type	vector_andnot_i64,@function
vector_andnot_i64:
	beqz	a2, .LBB0_6
	li	a3, 8
	zext.w	a7, a2
	bltu	a2, a3, .LBB0_3
	sh3add	a3, a7, a0
	sh3add	a4, a7, a1
	sltu	a4, a0, a4
	sltu	a3, a1, a3
	and	a3, a3, a4
	beqz	a3, .LBB0_7
.LBB0_3:
	li	t0, 0
.LBB0_4:
	sh3add	a0, t0, a0
	sh3add	a1, t0, a1
	sub	a2, a7, t0
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
	li	a3, -32
	li	a4, 32
	zext.w	a6, a3
	bgeu	a2, a4, .LBB0_9
	li	t0, 0
	j	.LBB0_13
.LBB0_9:
	and	t0, a7, a6
	vsetivli	zero, 16, e64, m1, ta, mu
	mv	a5, t0
	mv	a4, a1
	mv	a3, a0
.LBB0_10:
	addi	t1, a4, 128
	addi	a2, a3, 128
	vle64.v	v8, (a4)
	vle64.v	v9, (t1)
	vle64.v	v10, (a3)
	vle64.v	v11, (a2)
	vnot.v	v8, v8
	vnot.v	v9, v9
	vand.vv	v8, v10, v8
	vand.vv	v9, v11, v9
	vse64.v	v8, (a3)
	vse64.v	v9, (a2)
	addi	a3, a3, 256
	addi	a5, a5, -32
	addi	a4, a4, 256
	bnez	a5, .LBB0_10
	beq	t0, a7, .LBB0_6
	andi	a2, a7, 24
	beqz	a2, .LBB0_4
.LBB0_13:
	mv	a2, t0
	addi	a3, a6, 24
	and	t0, a7, a3
	sh3add	a3, a2, a0
	sh3add	a4, a2, a1
	sub	a5, a2, t0
	vsetivli	zero, 8, e64, m1, ta, mu
.LBB0_14:
	vle64.v	v8, (a4)
	vle64.v	v9, (a3)
	vnot.v	v8, v8
	vand.vv	v8, v9, v8
	vse64.v	v8, (a3)
	addi	a3, a3, 64
	addi	a5, a5, 8
	addi	a4, a4, 64
	bnez	a5, .LBB0_14
	beq	t0, a7, .LBB0_6
	j	.LBB0_4
.Lfunc_end0:
	.size	vector_andnot_i64, .Lfunc_end0-vector_andnot_i64

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 954c1ed009d423ca9593ee63479a9394a23864fd)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
