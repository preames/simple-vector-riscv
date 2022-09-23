	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_overlap_i32.c"
	.globl	vector_overlap
	.p2align	1
	.type	vector_overlap,@function
vector_overlap:
	li	a3, 2
	bltu	a2, a3, .LBB0_8
	zext.w	a6, a2
	lw	t4, 0(a0)
	lw	a4, 4(a0)
	addi	t2, a6, -1
	csrr	t6, vlenb
	srli	t1, t6, 1
	li	a7, 1
	bltu	t2, t1, .LBB0_6
	li	a3, 0
	addi	a5, t1, -1
	and	t0, t2, a5
	sub	a5, t2, t0
	addi	a7, a5, 1
	srli	t3, t6, 2
	addi	t2, t3, -1
	vsetvli	a2, zero, e32, m1, ta, mu
	vmv.s.x	v9, a4
	vsetvli	zero, t3, e32, m1, tu, mu
	vslideup.vx	v8, v9, t2
	vsetvli	a2, zero, e32, m1, ta, mu
	vmv.s.x	v10, t4
	vsetvli	zero, t3, e32, m1, tu, mu
	vslideup.vx	v9, v10, t2
	addi	t5, a0, 8
	slli	t3, t6, 1
	add	t4, t5, t6
	addi	a4, a1, 4
	add	t6, t6, a4
.LBB0_3:
	vmv1r.v	v10, v9
	vmv1r.v	v9, v8
	add	a2, t5, a3
	vl1re32.v	v11, (a2)
	add	a2, t4, a3
	vl1re32.v	v8, (a2)
	vsetivli	zero, 1, e32, m1, ta, mu
	vslidedown.vx	v12, v9, t2
	vsetvli	a2, zero, e32, m1, tu, mu
	vslideup.vi	v12, v11, 1
	vsetivli	zero, 1, e32, m1, ta, mu
	vslidedown.vx	v9, v11, t2
	vsetvli	a2, zero, e32, m1, tu, mu
	vslideup.vi	v9, v8, 1
	vsetivli	zero, 1, e32, m1, ta, mu
	vslidedown.vx	v10, v10, t2
	vsetvli	a2, zero, e32, m1, tu, mu
	vslideup.vi	v10, v12, 1
	vsetivli	zero, 1, e32, m1, ta, mu
	vslidedown.vx	v13, v12, t2
	vsetvli	a2, zero, e32, m1, tu, mu
	vslideup.vi	v13, v9, 1
	vsetvli	zero, zero, e32, m1, ta, mu
	vadd.vv	v10, v12, v10
	vadd.vv	v12, v9, v13
	vadd.vv	v10, v10, v11
	vadd.vv	v11, v12, v8
	add	a2, a4, a3
	vs1r.v	v10, (a2)
	add	a2, t6, a3
	vs1r.v	v11, (a2)
	sub	a5, a5, t1
	add	a3, a3, t3
	bnez	a5, .LBB0_3
	beqz	t0, .LBB0_8
	vsetivli	zero, 1, e32, m1, ta, mu
	vslidedown.vx	v8, v8, t2
	vmv.x.s	a4, v8
	vslidedown.vx	v8, v9, t2
	vmv.x.s	t4, v8
.LBB0_6:
	sh2add	a1, a7, a1
	sub	a3, a6, a7
	sh2add	a0, a7, a0
	addi	a0, a0, 4
.LBB0_7:
	mv	a2, a4
	lw	a4, 0(a0)
	addw	a5, a2, t4
	mv	t4, a2
	addw	a2, a5, a4
	sw	a2, 0(a1)
	addi	a1, a1, 4
	addi	a3, a3, -1
	addi	a0, a0, 4
	bnez	a3, .LBB0_7
.LBB0_8:
	ret
.Lfunc_end0:
	.size	vector_overlap, .Lfunc_end0-vector_overlap

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 954c1ed009d423ca9593ee63479a9394a23864fd)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
