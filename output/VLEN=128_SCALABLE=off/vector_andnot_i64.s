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
	zext.w	a6, a2
	bltu	a2, a3, .LBB0_3
	sh3add	a2, a6, a0
	sh3add	a3, a6, a1
	sltu	a3, a0, a3
	sltu	a2, a1, a2
	and	a2, a2, a3
	beqz	a2, .LBB0_7
.LBB0_3:
	li	a7, 0
.LBB0_4:
	sh3add	a0, a7, a0
	sh3add	a1, a7, a1
	sub	a2, a6, a7
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
	andi	a7, a6, -4
	vsetivli	zero, 2, e64, m1, ta, ma
	mv	a4, a7
	mv	a5, a1
	mv	a3, a0
.LBB0_8:
	addi	t0, a5, 16
	addi	a2, a3, 16
	vle64.v	v8, (a5)
	vle64.v	v9, (t0)
	vle64.v	v10, (a3)
	vle64.v	v11, (a2)
	vnot.v	v8, v8
	vnot.v	v9, v9
	vand.vv	v8, v10, v8
	vand.vv	v9, v11, v9
	vse64.v	v8, (a3)
	vse64.v	v9, (a2)
	addi	a3, a3, 32
	addi	a4, a4, -4
	addi	a5, a5, 32
	bnez	a4, .LBB0_8
	beq	a7, a6, .LBB0_6
	j	.LBB0_4
.Lfunc_end0:
	.size	vector_andnot_i64, .Lfunc_end0-vector_andnot_i64

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 9472a810ed33bc9e655484f43047eed07d50bc16)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
