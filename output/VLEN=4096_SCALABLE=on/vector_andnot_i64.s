	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_andnot_i64.c"
	.globl	vector_andnot_i64
	.p2align	1
	.type	vector_andnot_i64,@function
vector_andnot_i64:
	beqz	a2, .LBB0_6
	zext.w	a7, a2
	csrr	t1, vlenb
	srli	t2, t1, 3
	li	a2, 64
	maxu	a2, t2, a2
	bltu	a7, a2, .LBB0_3
	sh3add	a2, a7, a0
	sh3add	a5, a7, a1
	sltu	a5, a0, a5
	sltu	a2, a1, a2
	and	a2, a2, a5
	beqz	a2, .LBB0_7
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
	addi	a5, t2, -1
	and	a6, a7, a5
	sub	t0, a7, a6
	vsetvli	a5, zero, e64, m1, ta, mu
	mv	a5, t0
.LBB0_8:
	add	a3, a0, a2
	add	a4, a1, a2
	vl1re64.v	v8, (a4)
	vl1re64.v	v9, (a3)
	vnot.v	v8, v8
	vand.vv	v8, v9, v8
	vs1r.v	v8, (a3)
	sub	a5, a5, t2
	add	a2, a2, t1
	bnez	a5, .LBB0_8
	bnez	a6, .LBB0_4
	j	.LBB0_6
.Lfunc_end0:
	.size	vector_andnot_i64, .Lfunc_end0-vector_andnot_i64

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 954c1ed009d423ca9593ee63479a9394a23864fd)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
