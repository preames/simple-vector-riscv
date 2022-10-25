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
	addi	sp, sp, -64
	sd	s0, 56(sp)
	sd	s1, 48(sp)
	sd	s2, 40(sp)
	sd	s3, 32(sp)
	sd	s4, 24(sp)
	sd	s5, 16(sp)
	sd	s6, 8(sp)
	li	a4, 8
	bltu	a3, a4, .LBB2_6
	srliw	a6, a3, 3
	csrr	t1, vlenb
	srli	a5, t1, 2
	li	a3, 4
	maxu	a3, a5, a3
	bltu	a6, a3, .LBB2_3
	sh2add	a3, a6, a0
	sh3add	a4, a6, a1
	sh3add	a7, a6, a2
	sltu	t0, a0, a4
	sltu	a4, a1, a3
	and	t0, t0, a4
	sltu	a4, a0, a7
	sltu	a3, a2, a3
	and	a3, a3, a4
	or	a3, t0, a3
	beqz	a3, .LBB2_7
.LBB2_3:
	li	t0, 0
.LBB2_4:
	sh3add	a1, t0, a1
	sh3add	a2, t0, a2
	sh2add	s5, t0, a0
	sub	s6, a6, t0
.LBB2_5:
	lb	a6, 3(a1)
	lb	a7, 7(a1)
	lb	t0, 1(a1)
	lb	t1, 5(a1)
	lb	t2, 2(a1)
	lb	t3, 6(a1)
	lb	s3, 0(a1)
	lb	s4, 4(a1)
	lb	t4, 3(a2)
	lb	t5, 7(a2)
	lb	t6, 1(a2)
	lb	s2, 5(a2)
	lb	s1, 4(a2)
	lb	s0, 2(a2)
	lb	a4, 0(a2)
	lb	a5, 6(a2)
	subw	s1, s4, s1
	sext.b	s4, s1
	subw	a4, s3, a4
	sext.b	s3, a4
	subw	a5, t3, a5
	sext.b	t3, a5
	subw	s0, t2, s0
	sext.b	s0, s0
	subw	s1, t1, s2
	sext.b	s1, s1
	subw	a4, t0, t6
	sext.b	a4, a4
	subw	a5, a7, t5
	sext.b	a5, a5
	subw	a0, a6, t4
	sext.b	a0, a0
	neg	a3, a0
	max	a6, a0, a3
	neg	a3, a5
	max	a7, a5, a3
	neg	a5, a4
	max	a4, a4, a5
	neg	a5, s1
	max	a5, s1, a5
	neg	s1, s0
	max	s1, s0, s1
	neg	s0, t3
	max	s0, t3, s0
	neg	a0, s3
	max	a0, s3, a0
	neg	a3, s4
	max	a3, s4, a3
	sext.b	t0, a3
	sext.b	t1, a0
	sext.b	s0, s0
	sext.b	s1, s1
	sext.b	a5, a5
	sext.b	a4, a4
	sext.b	a3, a7
	sext.b	a0, a6
	addw	a0, a0, a3
	addw	a3, a4, a5
	addw	a0, a0, a3
	addw	a3, s1, s0
	addw	a4, t1, t0
	addw	a3, a3, a4
	addw	a0, a0, a3
	sw	a0, 0(s5)
	addi	a1, a1, 8
	addi	a2, a2, 8
	addi	s6, s6, -1
	addi	s5, s5, 4
	bnez	s6, .LBB2_5
.LBB2_6:
	ld	s0, 56(sp)
	ld	s1, 48(sp)
	ld	s2, 40(sp)
	ld	s3, 32(sp)
	ld	s4, 24(sp)
	ld	s5, 16(sp)
	ld	s6, 8(sp)
	addi	sp, sp, 64
	ret
.LBB2_7:
	addi	a3, a5, -1
	and	a7, a6, a3
	sub	t0, a6, a7
	vsetvli	a3, zero, e64, m2, ta, ma
	vid.v	v8
	mv	a3, t0
	mv	a4, a0
.LBB2_8:
	vsll.vi	v10, v8, 3
	vsetvli	zero, zero, e8, mf4, ta, ma
	vluxei64.v	v12, (a1), v10
	vluxei64.v	v13, (a2), v10
	vsub.vv	v12, v12, v13
	vrsub.vi	v13, v12, 0
	vmax.vv	v12, v12, v13
	vsetvli	zero, zero, e32, m1, ta, ma
	vsext.vf4	v13, v12
	vsetvli	zero, zero, e64, m2, ta, ma
	vor.vi	v14, v10, 1
	vsetvli	zero, zero, e8, mf4, ta, ma
	vluxei64.v	v12, (a1), v14
	vluxei64.v	v16, (a2), v14
	vsub.vv	v12, v12, v16
	vrsub.vi	v14, v12, 0
	vmax.vv	v12, v12, v14
	vsetvli	zero, zero, e32, m1, ta, ma
	vsext.vf4	v14, v12
	vadd.vv	v12, v13, v14
	vsetvli	zero, zero, e64, m2, ta, ma
	vor.vi	v14, v10, 2
	vsetvli	zero, zero, e8, mf4, ta, ma
	vluxei64.v	v13, (a1), v14
	vluxei64.v	v16, (a2), v14
	vsub.vv	v13, v13, v16
	vrsub.vi	v14, v13, 0
	vmax.vv	v13, v13, v14
	vsetvli	zero, zero, e32, m1, ta, ma
	vsext.vf4	v14, v13
	vadd.vv	v12, v12, v14
	vsetvli	zero, zero, e64, m2, ta, ma
	vor.vi	v14, v10, 3
	vsetvli	zero, zero, e8, mf4, ta, ma
	vluxei64.v	v13, (a1), v14
	vluxei64.v	v16, (a2), v14
	vsub.vv	v13, v13, v16
	vrsub.vi	v14, v13, 0
	vmax.vv	v13, v13, v14
	vsetvli	zero, zero, e32, m1, ta, ma
	vsext.vf4	v14, v13
	vadd.vv	v12, v12, v14
	vsetvli	zero, zero, e64, m2, ta, ma
	vor.vi	v14, v10, 4
	vsetvli	zero, zero, e8, mf4, ta, ma
	vluxei64.v	v13, (a1), v14
	vluxei64.v	v16, (a2), v14
	vsub.vv	v13, v13, v16
	vrsub.vi	v14, v13, 0
	vmax.vv	v13, v13, v14
	vsetvli	zero, zero, e32, m1, ta, ma
	vsext.vf4	v14, v13
	vadd.vv	v12, v12, v14
	vsetvli	zero, zero, e64, m2, ta, ma
	vor.vi	v14, v10, 5
	vsetvli	zero, zero, e8, mf4, ta, ma
	vluxei64.v	v13, (a1), v14
	vluxei64.v	v16, (a2), v14
	vsub.vv	v13, v13, v16
	vrsub.vi	v14, v13, 0
	vmax.vv	v13, v13, v14
	vsetvli	zero, zero, e32, m1, ta, ma
	vsext.vf4	v14, v13
	vadd.vv	v12, v12, v14
	vsetvli	zero, zero, e64, m2, ta, ma
	vor.vi	v14, v10, 6
	vsetvli	zero, zero, e8, mf4, ta, ma
	vluxei64.v	v13, (a1), v14
	vluxei64.v	v16, (a2), v14
	vsub.vv	v13, v13, v16
	vrsub.vi	v14, v13, 0
	vmax.vv	v13, v13, v14
	vsetvli	zero, zero, e32, m1, ta, ma
	vsext.vf4	v14, v13
	vadd.vv	v12, v12, v14
	vsetvli	zero, zero, e64, m2, ta, ma
	vor.vi	v10, v10, 7
	vsetvli	zero, zero, e8, mf4, ta, ma
	vluxei64.v	v13, (a1), v10
	vluxei64.v	v14, (a2), v10
	vsub.vv	v10, v13, v14
	vrsub.vi	v11, v10, 0
	vmax.vv	v10, v10, v11
	vsetvli	zero, zero, e32, m1, ta, ma
	vsext.vf4	v11, v10
	vadd.vv	v10, v12, v11
	vs1r.v	v10, (a4)
	vsetvli	zero, zero, e64, m2, ta, ma
	vadd.vx	v8, v8, a5
	sub	a3, a3, a5
	add	a4, a4, t1
	bnez	a3, .LBB2_8
	bnez	a7, .LBB2_4
	j	.LBB2_6
.Lfunc_end2:
	.size	vector_sum_abs_diff, .Lfunc_end2-vector_sum_abs_diff

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 6d859266803e2a9060c4e8770f92cc2c7bd05a3b)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
