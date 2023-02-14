	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_overlap_i32.c"
	.globl	vector_overlap
	.p2align	1
	.type	vector_overlap,@function
vector_overlap:
	li	a3, 2
	bltu	a2, a3, .LBB0_8
	zext.w	a7, a2
	lw	t5, 0(a0)
	lw	a5, 4(a0)
	addi	a3, a7, -1
	csrr	t3, vlenb
	srli	t1, t3, 1
	li	t0, 1
	bltu	a3, t1, .LBB0_6
	addi	t2, t1, -1
	and	a6, a3, t2
	sub	a3, a3, a6
	addi	t0, a3, 1
	vsetvli	a4, zero, e32, m1, ta, ma
	vmv.s.x	v10, a5
	zext.w	a4, t2
	addi	t4, a4, 1
	vsetvli	zero, t4, e32, m2, ta, ma
	vslideup.vx	v8, v10, a4
	vsetvli	a5, zero, e32, m1, ta, ma
	vmv.s.x	v12, t5
	vsetvli	zero, t4, e32, m2, ta, ma
	vslideup.vx	v10, v12, a4
	addi	a2, a0, 8
	slli	t3, t3, 1
	addi	a5, a1, 4
.LBB0_3:
	vmv2r.v	v12, v10
	vmv2r.v	v10, v8
	vl2re32.v	v8, (a2)
	vsetivli	zero, 1, e32, m2, ta, ma
	vslidedown.vx	v10, v10, t2
	vsetvli	a4, zero, e32, m2, ta, ma
	vslideup.vi	v10, v8, 1
	vsetivli	zero, 1, e32, m2, ta, ma
	vslidedown.vx	v12, v12, t2
	vsetvli	a4, zero, e32, m2, ta, ma
	vslideup.vi	v12, v10, 1
	vadd.vv	v12, v10, v12
	vadd.vv	v12, v12, v8
	vs2r.v	v12, (a5)
	add	a2, a2, t3
	sub	a3, a3, t1
	add	a5, a5, t3
	bnez	a3, .LBB0_3
	beqz	a6, .LBB0_8
	addiw	t1, t1, -1
	zext.w	a2, t1
	vsetivli	zero, 1, e32, m2, ta, ma
	vslidedown.vx	v8, v8, a2
	vmv.x.s	a5, v8
	vslidedown.vx	v8, v10, a2
	vmv.x.s	t5, v8
.LBB0_6:
	sh2add	a1, t0, a1
	sub	a3, a7, t0
	sh2add	a0, t0, a0
	addi	a0, a0, 4
.LBB0_7:
	mv	a4, a5
	lw	a5, 0(a0)
	add	a2, a4, t5
	mv	t5, a4
	add	a2, a2, a5
	sw	a2, 0(a1)
	addi	a1, a1, 4
	addi	a3, a3, -1
	addi	a0, a0, 4
	bnez	a3, .LBB0_7
.LBB0_8:
	ret
.Lfunc_end0:
	.size	vector_overlap, .Lfunc_end0-vector_overlap

	.ident	"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 8c3a8d17c8a154894895c48a304a04df9ece4328)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
