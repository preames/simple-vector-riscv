	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_andnot_i64.c"
	.globl	vector_andnot_i64
	.p2align	1
	.type	vector_andnot_i64,@function
vector_andnot_i64:
	beqz	a2, .LBB0_6
	zext.w	a7, a2
	csrr	a3, vlenb
	srli	t1, a3, 2
	li	a2, 8
	maxu	a2, t1, a2
	bltu	a7, a2, .LBB0_3
	sh3add	a2, a7, a0
	sh3add	a4, a7, a1
	sltu	a4, a0, a4
	sltu	a2, a1, a2
	and	a2, a2, a4
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
	addi	a2, t1, -1
	and	a6, a7, a2
	sub	t0, a7, a6
	slli	a3, a3, 1
	vsetvli	a2, zero, e64, m2, ta, ma
	mv	a4, t0
	mv	a5, a1
	mv	a2, a0
.LBB0_8:
	vl2re64.v	v8, (a5)
	vl2re64.v	v10, (a2)
	vnot.v	v8, v8
	vand.vv	v8, v10, v8
	vs2r.v	v8, (a2)
	add	a2, a2, a3
	sub	a4, a4, t1
	add	a5, a5, a3
	bnez	a4, .LBB0_8
	bnez	a6, .LBB0_4
	j	.LBB0_6
.Lfunc_end0:
	.size	vector_andnot_i64, .Lfunc_end0-vector_andnot_i64

	.ident	"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 8c3a8d17c8a154894895c48a304a04df9ece4328)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
