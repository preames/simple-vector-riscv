	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl1024b1p0_zvl128b1p0_zvl2048b1p0_zvl256b1p0_zvl32b1p0_zvl4096b1p0_zvl512b1p0_zvl64b1p0"
	.file	"vector_overlap_i32.c"
	.globl	vector_overlap
	.p2align	1
	.type	vector_overlap,@function
vector_overlap:
	addi	sp, sp, -16
	sd	s0, 8(sp)
	sd	s1, 0(sp)
	li	a3, 2
	bltu	a2, a3, .LBB0_8
	zext.w	a6, a2
	lw	a5, 0(a0)
	lw	a4, 4(a0)
	addi	a7, a6, -1
	csrr	t3, vlenb
	srli	t2, t3, 1
	li	t1, 1
	bltu	a7, t2, .LBB0_6
	li	a2, 0
	addi	a3, t2, -1
	and	t0, a7, a3
	sub	a3, a7, t0
	addi	t1, a3, 1
	srli	s1, t3, 2
	addiw	a7, s1, -1
	vsetvli	s0, zero, e32, m1, ta, ma
	vmv.s.x	v9, a4
	zext.w	a7, a7
	addi	a4, a7, 1
	vsetvli	zero, a4, e32, m1, ta, ma
	vslideup.vx	v8, v9, a7
	vsetvli	s0, zero, e32, m1, ta, ma
	vmv.s.x	v10, a5
	vsetvli	zero, a4, e32, m1, ta, ma
	vslideup.vx	v9, v10, a7
	addi	t6, a0, 8
	slli	t4, t3, 1
	add	t5, t6, t3
	addi	a5, a1, 4
	add	t3, t3, a5
	addi	a4, s1, -1
.LBB0_3:
	vmv1r.v	v10, v9
	vmv1r.v	v9, v8
	add	s0, t6, a2
	vl1re32.v	v11, (s0)
	add	s0, t5, a2
	vl1re32.v	v8, (s0)
	vsetivli	zero, 1, e32, m1, ta, ma
	vslidedown.vx	v12, v9, a4
	vsetvli	s0, zero, e32, m1, tu, ma
	vslideup.vi	v12, v11, 1
	vsetivli	zero, 1, e32, m1, ta, ma
	vslidedown.vx	v9, v11, a4
	vsetvli	s0, zero, e32, m1, tu, ma
	vslideup.vi	v9, v8, 1
	vsetivli	zero, 1, e32, m1, ta, ma
	vslidedown.vx	v10, v10, a4
	vsetvli	s0, zero, e32, m1, tu, ma
	vslideup.vi	v10, v12, 1
	vsetivli	zero, 1, e32, m1, ta, ma
	vslidedown.vx	v13, v12, a4
	vsetvli	s0, zero, e32, m1, tu, ma
	vslideup.vi	v13, v9, 1
	vsetvli	zero, zero, e32, m1, ta, ma
	vadd.vv	v10, v12, v10
	vadd.vv	v12, v9, v13
	vadd.vv	v10, v10, v11
	vadd.vv	v11, v12, v8
	add	s0, a5, a2
	vs1r.v	v10, (s0)
	add	s0, t3, a2
	vs1r.v	v11, (s0)
	sub	a3, a3, t2
	add	a2, a2, t4
	bnez	a3, .LBB0_3
	beqz	t0, .LBB0_8
	vsetivli	zero, 1, e32, m1, ta, ma
	vslidedown.vx	v8, v8, a7
	vmv.x.s	a4, v8
	vslidedown.vx	v8, v9, a7
	vmv.x.s	a5, v8
.LBB0_6:
	sh2add	a1, t1, a1
	sub	a2, a6, t1
	sh2add	a0, t1, a0
	addi	a0, a0, 4
.LBB0_7:
	mv	a3, a4
	lw	a4, 0(a0)
	addw	s1, a3, a5
	mv	a5, a3
	addw	a3, s1, a4
	sw	a3, 0(a1)
	addi	a1, a1, 4
	addi	a2, a2, -1
	addi	a0, a0, 4
	bnez	a2, .LBB0_7
.LBB0_8:
	ld	s0, 8(sp)
	ld	s1, 0(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end0:
	.size	vector_overlap, .Lfunc_end0-vector_overlap

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 9472a810ed33bc9e655484f43047eed07d50bc16)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
