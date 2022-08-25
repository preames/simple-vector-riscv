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
	lw	t1, 0(a0)
	lw	a2, 4(a0)
	addi	t0, a6, -1
	li	a4, 16
	li	a3, 1
	bltu	t0, a4, .LBB0_6
	andi	a7, t0, -16
	ori	a3, a7, 1
	vsetivli	zero, 16, e32, m1, ta, mu
	vmv.v.x	v8, a2
	vmv.v.x	v9, t1
	addi	a2, a0, 8
	addi	a5, a1, 4
	mv	a4, a7
.LBB0_3:
	vmv1r.v	v10, v8
	vle32.v	v8, (a2)
	vsetivli	zero, 1, e32, m1, ta, mu
	vslidedown.vi	v10, v10, 15
	vsetivli	zero, 16, e32, m1, tu, mu
	vslideup.vi	v10, v8, 1
	vsetivli	zero, 1, e32, m1, ta, mu
	vslidedown.vi	v9, v9, 15
	vsetivli	zero, 16, e32, m1, tu, mu
	vslideup.vi	v9, v10, 1
	vsetvli	zero, zero, e32, m1, ta, mu
	vadd.vv	v9, v10, v9
	vadd.vv	v9, v9, v8
	vse32.v	v9, (a5)
	addi	a2, a2, 64
	addi	a4, a4, -16
	addi	a5, a5, 64
	vmv1r.v	v9, v10
	bnez	a4, .LBB0_3
	beq	t0, a7, .LBB0_8
	vsetivli	zero, 1, e32, m1, ta, mu
	vslidedown.vi	v9, v8, 15
	vmv.x.s	a2, v9
	vslidedown.vi	v8, v8, 14
	vmv.x.s	t1, v8
.LBB0_6:
	sh2add	a1, a3, a1
	sub	a4, a6, a3
	sh2add	a0, a3, a0
	addi	a0, a0, 4
.LBB0_7:
	mv	a3, a2
	lw	a2, 0(a0)
	addw	a5, a3, t1
	mv	t1, a3
	addw	a3, a5, a2
	sw	a3, 0(a1)
	addi	a1, a1, 4
	addi	a4, a4, -1
	addi	a0, a0, 4
	bnez	a4, .LBB0_7
.LBB0_8:
	ret
.Lfunc_end0:
	.size	vector_overlap, .Lfunc_end0-vector_overlap

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 86b67a310dedf4d0c6a5bc012d8bee7dbac1d2ad)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
