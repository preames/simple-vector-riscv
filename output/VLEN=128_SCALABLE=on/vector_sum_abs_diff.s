	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_sum_abs_diff.c"
	.globl	sub
	.p2align	1
	.type	sub,@function
sub:
	subw	a0, a0, a1
	sext.b	a0, a0
	ret
.Lfunc_end0:
	.size	sub, .Lfunc_end0-sub

	.globl	myabs
	.p2align	1
	.type	myabs,@function
myabs:
	neg	a1, a0
	max	a0, a0, a1
	sext.b	a0, a0
	ret
.Lfunc_end1:
	.size	myabs, .Lfunc_end1-myabs

	.globl	vector_sum_abs_diff
	.p2align	1
	.type	vector_sum_abs_diff,@function
vector_sum_abs_diff:
	addi	sp, sp, -16
	sd	s0, 8(sp)
	li	a4, 8
	bltu	a3, a4, .LBB2_6
	srliw	a6, a3, 3
	csrr	t2, vlenb
	srli	t3, t2, 2
	li	a3, 4
	maxu	a3, t3, a3
	bltu	a6, a3, .LBB2_3
	sh2add	a3, a6, a0
	sh3add	a4, a6, a1
	sh3add	a7, a6, a2
	sltu	a4, a0, a4
	sltu	a5, a1, a3
	and	a4, a4, a5
	sltu	a5, a0, a7
	sltu	a3, a2, a3
	and	a3, a3, a5
	or	a3, a3, a4
	beqz	a3, .LBB2_7
.LBB2_3:
	li	t0, 0
.LBB2_4:
	sh3add	a1, t0, a1
	sh3add	a2, t0, a2
	sh2add	a0, t0, a0
	sub	a3, a6, t0
.LBB2_5:
	vsetivli	zero, 8, e8, mf2, ta, ma
	vle8.v	v8, (a1)
	vle8.v	v9, (a2)
	vsub.vv	v8, v8, v9
	vrsub.vi	v9, v8, 0
	vmax.vv	v8, v8, v9
	vsetvli	zero, zero, e32, m2, ta, ma
	vsext.vf4	v10, v8
	vmv.s.x	v8, zero
	vredsum.vs	v8, v10, v8
	vsetivli	zero, 1, e32, m1, ta, ma
	vse32.v	v8, (a0)
	addi	a1, a1, 8
	addi	a2, a2, 8
	addi	a3, a3, -1
	addi	a0, a0, 4
	bnez	a3, .LBB2_5
.LBB2_6:
	ld	s0, 8(sp)
	addi	sp, sp, 16
	ret
.LBB2_7:
	li	t6, 0
	addi	a3, t3, -1
	and	a7, a6, a3
	sub	t0, a6, a7
	slli	t1, t2, 1
	li	a4, 8
	mv	t4, t0
	mv	t5, a0
.LBB2_8:
	add	a5, a1, t6
	vsetvli	a3, zero, e8, mf4, ta, ma
	vlse8.v	v8, (a5), a4
	add	a3, a2, t6
	vlse8.v	v9, (a3), a4
	vsub.vv	v8, v8, v9
	vrsub.vi	v9, v8, 0
	vmax.vv	v8, v8, v9
	vsetvli	zero, zero, e32, m1, ta, ma
	addi	s0, a5, 1
	vlse8.v	v9, (s0), a4
	addi	s0, a3, 1
	vlse8.v	v10, (s0), a4
	vsext.vf4	v11, v8
	vsetvli	zero, zero, e8, mf4, ta, ma
	vsub.vv	v8, v9, v10
	vrsub.vi	v9, v8, 0
	vmax.vv	v8, v8, v9
	vsetvli	zero, zero, e32, m1, ta, ma
	addi	s0, a5, 2
	vlse8.v	v9, (s0), a4
	addi	s0, a3, 2
	vlse8.v	v10, (s0), a4
	vsext.vf4	v12, v8
	vadd.vv	v8, v11, v12
	vsetvli	zero, zero, e8, mf4, ta, ma
	vsub.vv	v9, v9, v10
	vrsub.vi	v10, v9, 0
	vmax.vv	v9, v9, v10
	vsetvli	zero, zero, e32, m1, ta, ma
	addi	s0, a5, 3
	vlse8.v	v10, (s0), a4
	addi	s0, a3, 3
	vlse8.v	v11, (s0), a4
	vsext.vf4	v12, v9
	vadd.vv	v8, v8, v12
	vsetvli	zero, zero, e8, mf4, ta, ma
	vsub.vv	v9, v10, v11
	vrsub.vi	v10, v9, 0
	vmax.vv	v9, v9, v10
	vsetvli	zero, zero, e32, m1, ta, ma
	addi	s0, a5, 4
	vlse8.v	v10, (s0), a4
	addi	s0, a3, 4
	vlse8.v	v11, (s0), a4
	vsext.vf4	v12, v9
	vadd.vv	v8, v8, v12
	vsetvli	zero, zero, e8, mf4, ta, ma
	vsub.vv	v9, v10, v11
	vrsub.vi	v10, v9, 0
	vmax.vv	v9, v9, v10
	vsetvli	zero, zero, e32, m1, ta, ma
	addi	s0, a5, 5
	vlse8.v	v10, (s0), a4
	addi	s0, a3, 5
	vlse8.v	v11, (s0), a4
	vsext.vf4	v12, v9
	vadd.vv	v8, v8, v12
	vsetvli	zero, zero, e8, mf4, ta, ma
	vsub.vv	v9, v10, v11
	vrsub.vi	v10, v9, 0
	vmax.vv	v9, v9, v10
	vsetvli	zero, zero, e32, m1, ta, ma
	addi	s0, a5, 6
	vlse8.v	v10, (s0), a4
	addi	s0, a3, 6
	vlse8.v	v11, (s0), a4
	vsext.vf4	v12, v9
	vadd.vv	v8, v8, v12
	vsetvli	zero, zero, e8, mf4, ta, ma
	vsub.vv	v9, v10, v11
	vrsub.vi	v10, v9, 0
	vmax.vv	v9, v9, v10
	vsetvli	zero, zero, e32, m1, ta, ma
	addi	a5, a5, 7
	vlse8.v	v10, (a5), a4
	addi	a3, a3, 7
	vlse8.v	v11, (a3), a4
	vsext.vf4	v12, v9
	vadd.vv	v8, v8, v12
	vsetvli	zero, zero, e8, mf4, ta, ma
	vsub.vv	v9, v10, v11
	vrsub.vi	v10, v9, 0
	vmax.vv	v9, v9, v10
	vsetvli	zero, zero, e32, m1, ta, ma
	vsext.vf4	v10, v9
	vadd.vv	v8, v8, v10
	vs1r.v	v8, (t5)
	add	t6, t6, t1
	sub	t4, t4, t3
	add	t5, t5, t2
	bnez	t4, .LBB2_8
	bnez	a7, .LBB2_4
	j	.LBB2_6
.Lfunc_end2:
	.size	vector_sum_abs_diff, .Lfunc_end2-vector_sum_abs_diff

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git a819f6c8d1f4909a1ac3a2eff390236e4e31dba3)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
