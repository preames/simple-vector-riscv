	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"sparsevec_reduce_add_i32.c"
	.globl	sparsevec_reduce_add_i32
	.p2align	1
	.type	sparsevec_reduce_add_i32,@function
sparsevec_reduce_add_i32:
	beqz	a0, .LBB0_8
	zext.w	t0, a0
	csrr	t1, vlenb
	srli	a5, t1, 1
	bgeu	t0, a5, .LBB0_3
	li	a7, 0
	li	a0, 0
	j	.LBB0_6
.LBB0_3:
	addi	a3, a5, -1
	and	a6, t0, a3
	sub	a7, t0, a6
	vsetvli	a3, zero, e32, m1, ta, ma
	vmv.v.i	v8, 0
	mv	a4, a7
	mv	a3, a2
	vmv.v.i	v9, 0
.LBB0_4:
	vle16.v	v10, (a3)
	add	a0, a3, a5
	vle16.v	v11, (a0)
	vsetvli	zero, zero, e64, m2, ta, ma
	vsext.vf4	v12, v10
	vsext.vf4	v14, v11
	vsll.vi	v10, v12, 2
	vsll.vi	v12, v14, 2
	vsetvli	zero, zero, e32, m1, ta, ma
	vluxei64.v	v14, (a1), v10
	vluxei64.v	v10, (a1), v12
	vadd.vv	v8, v14, v8
	vadd.vv	v9, v10, v9
	sub	a4, a4, a5
	add	a3, a3, t1
	bnez	a4, .LBB0_4
	vadd.vv	v8, v9, v8
	vmv.s.x	v9, zero
	vredsum.vs	v8, v8, v9
	vmv.x.s	a0, v8
	beqz	a6, .LBB0_8
.LBB0_6:
	sh1add	a2, a7, a2
	sub	a3, t0, a7
.LBB0_7:
	lh	a4, 0(a2)
	sh2add	a4, a4, a1
	lw	a4, 0(a4)
	addw	a0, a0, a4
	addi	a3, a3, -1
	addi	a2, a2, 2
	bnez	a3, .LBB0_7
.LBB0_8:
	ret
.Lfunc_end0:
	.size	sparsevec_reduce_add_i32, .Lfunc_end0-sparsevec_reduce_add_i32

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 6e4f504575fce7ce9a29c00697acb4043b19badf)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
