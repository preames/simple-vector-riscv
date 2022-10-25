	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_overlap_i32.c"
	.globl	vector_overlap
	.p2align	1
	.type	vector_overlap,@function
vector_overlap:
	li	a3, 2
	bltu	a2, a3, .LBB0_8
	lw	t2, 0(a0)
	lw	a3, 4(a0)
	zext.w	a6, a2
	li	a4, 9
	li	t1, 1
	bltu	a2, a4, .LBB0_6
	addi	a7, a6, -1
	andi	t0, a7, -8
	ori	t1, t0, 1
	vsetivli	zero, 8, e32, m1, ta, ma
	vmv.v.x	v8, a3
	vmv.v.x	v9, t2
	addi	a3, a0, 8
	addi	a5, a1, 4
	mv	a2, t0
.LBB0_3:
	vmv1r.v	v10, v8
	vle32.v	v8, (a3)
	vsetivli	zero, 1, e32, m1, ta, ma
	vslidedown.vi	v10, v10, 7
	vsetivli	zero, 8, e32, m1, tu, ma
	vslideup.vi	v10, v8, 1
	vsetivli	zero, 1, e32, m1, ta, ma
	vslidedown.vi	v9, v9, 7
	vsetivli	zero, 8, e32, m1, tu, ma
	vslideup.vi	v9, v10, 1
	vsetvli	zero, zero, e32, m1, ta, ma
	vadd.vv	v9, v10, v9
	vadd.vv	v9, v9, v8
	vse32.v	v9, (a5)
	addi	a3, a3, 32
	addi	a2, a2, -8
	addi	a5, a5, 32
	vmv1r.v	v9, v10
	bnez	a2, .LBB0_3
	beq	a7, t0, .LBB0_8
	vsetivli	zero, 1, e32, m1, ta, ma
	vslidedown.vi	v9, v8, 7
	vmv.x.s	a3, v9
	vslidedown.vi	v8, v8, 6
	vmv.x.s	t2, v8
.LBB0_6:
	sh2add	a1, t1, a1
	sub	a2, a6, t1
	sh2add	a0, t1, a0
	addi	a0, a0, 4
.LBB0_7:
	mv	a4, a3
	lw	a3, 0(a0)
	addw	a5, a4, t2
	mv	t2, a4
	addw	a4, a5, a3
	sw	a4, 0(a1)
	addi	a1, a1, 4
	addi	a2, a2, -1
	addi	a0, a0, 4
	bnez	a2, .LBB0_7
.LBB0_8:
	ret
.Lfunc_end0:
	.size	vector_overlap, .Lfunc_end0-vector_overlap

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 6d859266803e2a9060c4e8770f92cc2c7bd05a3b)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
