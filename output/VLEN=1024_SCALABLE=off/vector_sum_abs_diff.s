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
	bltu	a3, a4, .LBB2_6
	li	a4, 256
	srliw	a6, a3, 3
	bltu	a3, a4, .LBB2_3
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
	beqz	a4, .LBB2_7
.LBB2_3:
	li	t0, 0
.LBB2_4:
	sh3add	a1, t0, a1
	sh3add	a2, t0, a2
	sh2add	a0, t0, a0
	sub	a3, a6, t0
.LBB2_5:
	vsetivli	zero, 8, e8, mf8, ta, ma
	vle8.v	v8, (a1)
	vle8.v	v9, (a2)
	vsub.vv	v8, v8, v9
	vrsub.vi	v9, v8, 0
	vmax.vv	v8, v8, v9
	vsetvli	zero, zero, e32, mf2, ta, ma
	vsext.vf4	v9, v8
	vmv.s.x	v8, zero
	vredsum.vs	v8, v9, v8
	vsetivli	zero, 1, e32, m1, ta, ma
	vse32.v	v8, (a0)
	addi	a1, a1, 8
	addi	a2, a2, 8
	addi	a3, a3, -1
	addi	a0, a0, 4
	bnez	a3, .LBB2_5
.LBB2_6:
	ret
.LBB2_7:
	li	t4, 0
	andi	t0, a6, -32
	srliw	a3, a3, 8
	slli	t1, a3, 8
	li	a7, 32
	li	t3, 8
	mv	t2, a0
.LBB2_8:
	add	a3, a1, t4
	vsetvli	zero, a7, e8, mf4, ta, ma
	vlse8.v	v8, (a3), t3
	add	a5, a2, t4
	vlse8.v	v9, (a5), t3
	addi	a4, a3, 1
	vlse8.v	v10, (a4), t3
	addi	a4, a5, 1
	vlse8.v	v11, (a4), t3
	vsub.vv	v8, v8, v9
	vrsub.vi	v9, v8, 0
	vmax.vv	v8, v8, v9
	vsub.vv	v9, v10, v11
	vrsub.vi	v10, v9, 0
	vmax.vv	v9, v9, v10
	vsetvli	zero, zero, e16, mf2, ta, ma
	vsext.vf2	v10, v8
	addi	a4, a3, 2
	vlse8.v	v11, (a4), t3
	addi	a4, a5, 2
	vlse8.v	v12, (a4), t3
	vsext.vf2	v13, v9
	vwadd.vv	v8, v10, v13
	vsetvli	zero, zero, e8, mf4, ta, ma
	vsub.vv	v9, v11, v12
	vrsub.vi	v10, v9, 0
	vmax.vv	v9, v9, v10
	vsetvli	zero, zero, e16, mf2, ta, ma
	addi	a4, a3, 3
	vlse8.v	v10, (a4), t3
	addi	a4, a5, 3
	vlse8.v	v11, (a4), t3
	vsext.vf2	v12, v9
	vwadd.wv	v8, v8, v12
	vsetvli	zero, zero, e8, mf4, ta, ma
	vsub.vv	v9, v10, v11
	vrsub.vi	v10, v9, 0
	vmax.vv	v9, v9, v10
	vsetvli	zero, zero, e16, mf2, ta, ma
	addi	a4, a3, 4
	vlse8.v	v10, (a4), t3
	addi	a4, a5, 4
	vlse8.v	v11, (a4), t3
	vsext.vf2	v12, v9
	vwadd.wv	v8, v8, v12
	vsetvli	zero, zero, e8, mf4, ta, ma
	vsub.vv	v9, v10, v11
	vrsub.vi	v10, v9, 0
	vmax.vv	v9, v9, v10
	vsetvli	zero, zero, e16, mf2, ta, ma
	addi	a4, a3, 5
	vlse8.v	v10, (a4), t3
	addi	a4, a5, 5
	vlse8.v	v11, (a4), t3
	vsext.vf2	v12, v9
	vwadd.wv	v8, v8, v12
	vsetvli	zero, zero, e8, mf4, ta, ma
	vsub.vv	v9, v10, v11
	vrsub.vi	v10, v9, 0
	vmax.vv	v9, v9, v10
	vsetvli	zero, zero, e16, mf2, ta, ma
	addi	a4, a3, 6
	vlse8.v	v10, (a4), t3
	addi	a4, a5, 6
	vlse8.v	v11, (a4), t3
	vsext.vf2	v12, v9
	vwadd.wv	v8, v8, v12
	vsetvli	zero, zero, e8, mf4, ta, ma
	vsub.vv	v9, v10, v11
	vrsub.vi	v10, v9, 0
	vmax.vv	v9, v9, v10
	vsetvli	zero, zero, e16, mf2, ta, ma
	addi	a3, a3, 7
	vlse8.v	v10, (a3), t3
	addi	a3, a5, 7
	vlse8.v	v11, (a3), t3
	vsext.vf2	v12, v9
	vwadd.wv	v8, v8, v12
	vsetvli	zero, zero, e8, mf4, ta, ma
	vsub.vv	v9, v10, v11
	vrsub.vi	v10, v9, 0
	vmax.vv	v9, v9, v10
	vsetvli	zero, zero, e16, mf2, ta, ma
	vsext.vf2	v10, v9
	vwadd.wv	v8, v8, v10
	vse32.v	v8, (t2)
	addi	t4, t4, 256
	addi	t2, t2, 128
	bne	t1, t4, .LBB2_8
	beq	t0, a6, .LBB2_6
	j	.LBB2_4
.Lfunc_end2:
	.size	vector_sum_abs_diff, .Lfunc_end2-vector_sum_abs_diff

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 6d859266803e2a9060c4e8770f92cc2c7bd05a3b)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
