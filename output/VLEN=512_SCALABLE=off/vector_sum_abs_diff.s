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
	li	a4, 8
	bltu	a3, a4, .LBB2_9
	li	a4, 128
	srliw	a6, a3, 3
	bgeu	a3, a4, .LBB2_3
	li	a7, 0
	j	.LBB2_7
.LBB2_3:
	sh2add	a4, a6, a0
	sh3add	a5, a6, a1
	sh3add	a7, a6, a2
	sltu	t0, a0, a5
	sltu	a5, a1, a4
	and	t0, t0, a5
	sltu	a5, a0, a7
	sltu	a4, a2, a4
	and	a4, a4, a5
	or	a4, t0, a4
	li	a7, 0
	bnez	a4, .LBB2_7
	li	t3, 0
	andi	a7, a6, -16
	li	a5, -128
	zext.w	a5, a5
	and	t0, a3, a5
	li	t2, 8
	mv	t1, a0
.LBB2_5:
	add	a3, a1, t3
	vsetivli	zero, 16, e8, mf4, ta, mu
	vlse8.v	v8, (a3), t2
	add	a5, a2, t3
	vlse8.v	v9, (a5), t2
	addi	a4, a3, 1
	vlse8.v	v10, (a4), t2
	addi	a4, a5, 1
	vlse8.v	v11, (a4), t2
	vsub.vv	v8, v8, v9
	vrsub.vi	v9, v8, 0
	vmax.vv	v8, v8, v9
	vsub.vv	v9, v10, v11
	vrsub.vi	v10, v9, 0
	vmax.vv	v9, v9, v10
	vsetvli	zero, zero, e16, mf2, ta, mu
	vsext.vf2	v10, v8
	addi	a4, a3, 2
	vlse8.v	v8, (a4), t2
	addi	a4, a5, 2
	vlse8.v	v11, (a4), t2
	vsext.vf2	v12, v9
	vwadd.vv	v9, v10, v12
	vsetvli	zero, zero, e8, mf4, ta, mu
	vsub.vv	v8, v8, v11
	vrsub.vi	v10, v8, 0
	vmax.vv	v8, v8, v10
	vsetvli	zero, zero, e16, mf2, ta, mu
	addi	a4, a3, 3
	vlse8.v	v10, (a4), t2
	addi	a4, a5, 3
	vlse8.v	v11, (a4), t2
	vsext.vf2	v12, v8
	vwadd.wv	v8, v9, v12
	vsetvli	zero, zero, e8, mf4, ta, mu
	vsub.vv	v9, v10, v11
	vrsub.vi	v10, v9, 0
	vmax.vv	v9, v9, v10
	vsetvli	zero, zero, e16, mf2, ta, mu
	addi	a4, a3, 4
	vlse8.v	v10, (a4), t2
	addi	a4, a5, 4
	vlse8.v	v11, (a4), t2
	vsext.vf2	v12, v9
	vwadd.wv	v9, v8, v12
	vsetvli	zero, zero, e8, mf4, ta, mu
	vsub.vv	v8, v10, v11
	vrsub.vi	v10, v8, 0
	vmax.vv	v8, v8, v10
	vsetvli	zero, zero, e16, mf2, ta, mu
	addi	a4, a3, 5
	vlse8.v	v10, (a4), t2
	addi	a4, a5, 5
	vlse8.v	v11, (a4), t2
	vsext.vf2	v12, v8
	vwadd.wv	v8, v9, v12
	vsetvli	zero, zero, e8, mf4, ta, mu
	vsub.vv	v9, v10, v11
	vrsub.vi	v10, v9, 0
	vmax.vv	v9, v9, v10
	vsetvli	zero, zero, e16, mf2, ta, mu
	addi	a4, a3, 6
	vlse8.v	v10, (a4), t2
	addi	a4, a5, 6
	vlse8.v	v11, (a4), t2
	vsext.vf2	v12, v9
	vwadd.wv	v9, v8, v12
	vsetvli	zero, zero, e8, mf4, ta, mu
	vsub.vv	v8, v10, v11
	vrsub.vi	v10, v8, 0
	vmax.vv	v8, v8, v10
	vsetvli	zero, zero, e16, mf2, ta, mu
	addi	a3, a3, 7
	vlse8.v	v10, (a3), t2
	addi	a3, a5, 7
	vlse8.v	v11, (a3), t2
	vsext.vf2	v12, v8
	vwadd.wv	v8, v9, v12
	vsetvli	zero, zero, e8, mf4, ta, mu
	vsub.vv	v9, v10, v11
	vrsub.vi	v10, v9, 0
	vmax.vv	v9, v9, v10
	vsetvli	zero, zero, e16, mf2, ta, mu
	vsext.vf2	v10, v9
	vwadd.wv	v9, v8, v10
	vse32.v	v9, (t1)
	addi	t3, t3, 128
	addi	t1, t1, 64
	bne	t0, t3, .LBB2_5
	beq	a7, a6, .LBB2_9
.LBB2_7:
	sub	a6, a6, a7
	sh2add	t0, a7, a0
	slli	a4, a7, 3
	ori	a4, a4, 3
	add	a2, a2, a4
	add	a1, a1, a4
.LBB2_8:
	lb	a4, -3(a1)
	lb	a5, -3(a2)
	subw	a4, a4, a5
	sext.b	a4, a4
	lb	a5, -2(a1)
	lb	a3, -2(a2)
	neg	a0, a4
	max	a0, a4, a0
	sext.b	a7, a0
	subw	a3, a5, a3
	sext.b	a3, a3
	neg	a4, a3
	lb	a5, -1(a1)
	lb	a0, -1(a2)
	max	a3, a3, a4
	sext.b	a3, a3
	addw	a7, a7, a3
	subw	a0, a5, a0
	sext.b	a0, a0
	neg	a4, a0
	lb	a5, 0(a1)
	lb	a3, 0(a2)
	max	a0, a0, a4
	sext.b	a0, a0
	addw	a7, a7, a0
	subw	a3, a5, a3
	sext.b	a3, a3
	neg	a4, a3
	lb	a5, 1(a1)
	lb	a0, 1(a2)
	max	a3, a3, a4
	sext.b	a3, a3
	addw	a7, a7, a3
	subw	a0, a5, a0
	sext.b	a0, a0
	neg	a4, a0
	lb	a5, 2(a1)
	lb	a3, 2(a2)
	max	a0, a0, a4
	sext.b	a0, a0
	addw	a7, a7, a0
	subw	a3, a5, a3
	sext.b	a3, a3
	neg	a4, a3
	lb	a5, 3(a1)
	lb	a0, 3(a2)
	max	a3, a3, a4
	sext.b	a3, a3
	addw	a7, a7, a3
	subw	a0, a5, a0
	sext.b	a0, a0
	neg	a4, a0
	lb	a5, 4(a1)
	lb	a3, 4(a2)
	max	a0, a0, a4
	sext.b	a0, a0
	addw	a0, a7, a0
	subw	a3, a5, a3
	sext.b	a3, a3
	neg	a4, a3
	max	a3, a3, a4
	sext.b	a3, a3
	addw	a0, a0, a3
	sw	a0, 0(t0)
	addi	a6, a6, -1
	addi	t0, t0, 4
	addi	a2, a2, 8
	addi	a1, a1, 8
	bnez	a6, .LBB2_8
.LBB2_9:
	ret
.Lfunc_end2:
	.size	vector_sum_abs_diff, .Lfunc_end2-vector_sum_abs_diff

	.ident	"clang version 15.0.0 (https://github.com/llvm/llvm-project.git 1e451369d2017830d3dbddec24063170b7aca0de)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
