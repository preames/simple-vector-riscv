	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_reduce_add_i32.c"
	.globl	vector_reduce_add_i32
	.p2align	1
	.type	vector_reduce_add_i32,@function
vector_reduce_add_i32:
	beqz	a1, .LBB0_8
	zext.w	a7, a1
	csrr	t1, vlenb
	srli	a4, t1, 1
	bgeu	a7, a4, .LBB0_3
	li	t0, 0
	li	a1, 0
	j	.LBB0_6
.LBB0_3:
	li	a5, 0
	remu	a6, a7, a4
	sub	t0, a7, a6
	vsetvli	a2, zero, e32, m1, ta, mu
	vmv.v.i	v8, 0
	slli	a2, t1, 1
	mv	a3, a0
	vmv.v.i	v9, 0
.LBB0_4:
	vl1re32.v	v10, (a3)
	add	a1, a3, t1
	vl1re32.v	v11, (a1)
	vadd.vv	v8, v10, v8
	vadd.vv	v9, v11, v9
	add	a5, a5, a4
	add	a3, a3, a2
	bne	a5, t0, .LBB0_4
	vadd.vv	v8, v9, v8
	vmv.s.x	v9, zero
	vredsum.vs	v8, v8, v9
	vmv.x.s	a1, v8
	beqz	a6, .LBB0_8
.LBB0_6:
	sh2add	a0, t0, a0
	sub	a2, a7, t0
.LBB0_7:
	lw	a3, 0(a0)
	addw	a1, a1, a3
	addi	a2, a2, -1
	addi	a0, a0, 4
	bnez	a2, .LBB0_7
.LBB0_8:
	mv	a0, a1
	ret
.Lfunc_end0:
	.size	vector_reduce_add_i32, .Lfunc_end0-vector_reduce_add_i32

	.ident	"clang version 15.0.0 (https://github.com/llvm/llvm-project.git 9803b0d1e7b3cbcce33c1c91d4e1cd1f20eea3d4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig