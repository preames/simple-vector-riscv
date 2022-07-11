	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_reduce_add_i8.c"
	.globl	vector_reduce_add_i32
	.p2align	1
	.type	vector_reduce_add_i32,@function
vector_reduce_add_i32:
	beqz	a1, .LBB0_8
	zext.w	t0, a1
	csrr	a4, vlenb
	srli	a1, a4, 1
	bgeu	t0, a1, .LBB0_3
	li	a3, 0
	li	a1, 0
	j	.LBB0_6
.LBB0_3:
	li	a5, 0
	remu	a6, t0, a1
	sub	a3, t0, a6
	srli	a7, a4, 2
	vsetvli	a4, zero, e32, m1, ta, mu
	vmv.v.i	v8, 0
	add	a4, a0, a7
	vmv.v.i	v9, 0
.LBB0_4:
	add	a2, a0, a5
	vle8.v	v10, (a2)
	add	a2, a4, a5
	vle8.v	v11, (a2)
	vzext.vf4	v12, v10
	vzext.vf4	v10, v11
	vadd.vv	v8, v8, v12
	add	a5, a5, a1
	vadd.vv	v9, v9, v10
	bne	a5, a3, .LBB0_4
	vadd.vv	v8, v9, v8
	vmv.s.x	v9, zero
	vredsum.vs	v8, v8, v9
	vmv.x.s	a1, v8
	beqz	a6, .LBB0_8
.LBB0_6:
	add	a0, a0, a3
	sub	a2, t0, a3
.LBB0_7:
	lbu	a3, 0(a0)
	addw	a1, a1, a3
	addi	a2, a2, -1
	addi	a0, a0, 1
	bnez	a2, .LBB0_7
.LBB0_8:
	mv	a0, a1
	ret
.Lfunc_end0:
	.size	vector_reduce_add_i32, .Lfunc_end0-vector_reduce_add_i32

	.ident	"clang version 15.0.0 (https://github.com/llvm/llvm-project.git c7fd7512a5c5b133665bfecbe2e9748c0607286e)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
