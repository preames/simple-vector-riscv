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
	srliw	a6, a3, 3
	csrr	t1, vlenb
	srli	a5, t1, 2
	li	a3, 16
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
	sh2add	a0, t0, a0
	sub	a3, a6, t0
.LBB2_5:
	vsetivli	zero, 8, e8, mf8, ta, mu
	vle8.v	v8, (a1)
	vle8.v	v9, (a2)
	vsub.vv	v8, v8, v9
	vrsub.vi	v9, v8, 0
	vmax.vv	v8, v8, v9
	vsetvli	zero, zero, e32, mf2, ta, mu
	vsext.vf4	v9, v8
	vmv.s.x	v8, zero
	vredsum.vs	v8, v9, v8
	vsetivli	zero, 1, e32, m1, ta, mu
	vse32.v	v8, (a0)
	addi	a1, a1, 8
	addi	a2, a2, 8
	addi	a3, a3, -1
	addi	a0, a0, 4
	bnez	a3, .LBB2_5
.LBB2_6:
	ret
.LBB2_7:
	addi	a3, a5, -1
	and	a7, a6, a3
	sub	t0, a6, a7
	vsetvli	a3, zero, e64, m2, ta, mu
	vid.v	v8
	mv	a3, t0
	mv	a4, a0
.LBB2_8:
	vsll.vi	v10, v8, 3
	vsetvli	zero, zero, e8, mf4, ta, mu
	vluxei64.v	v12, (a1), v10
	vluxei64.v	v13, (a2), v10
	vsub.vv	v12, v12, v13
	vrsub.vi	v13, v12, 0
	vmax.vv	v12, v12, v13
	vsetvli	zero, zero, e32, m1, ta, mu
	vsext.vf4	v13, v12
	vsetvli	zero, zero, e64, m2, ta, mu
	vor.vi	v14, v10, 1
	vsetvli	zero, zero, e8, mf4, ta, mu
	vluxei64.v	v12, (a1), v14
	vluxei64.v	v16, (a2), v14
	vsub.vv	v12, v12, v16
	vrsub.vi	v14, v12, 0
	vmax.vv	v12, v12, v14
	vsetvli	zero, zero, e32, m1, ta, mu
	vsext.vf4	v14, v12
	vadd.vv	v12, v13, v14
	vsetvli	zero, zero, e64, m2, ta, mu
	vor.vi	v14, v10, 2
	vsetvli	zero, zero, e8, mf4, ta, mu
	vluxei64.v	v13, (a1), v14
	vluxei64.v	v16, (a2), v14
	vsub.vv	v13, v13, v16
	vrsub.vi	v14, v13, 0
	vmax.vv	v13, v13, v14
	vsetvli	zero, zero, e32, m1, ta, mu
	vsext.vf4	v14, v13
	vadd.vv	v12, v12, v14
	vsetvli	zero, zero, e64, m2, ta, mu
	vor.vi	v14, v10, 3
	vsetvli	zero, zero, e8, mf4, ta, mu
	vluxei64.v	v13, (a1), v14
	vluxei64.v	v16, (a2), v14
	vsub.vv	v13, v13, v16
	vrsub.vi	v14, v13, 0
	vmax.vv	v13, v13, v14
	vsetvli	zero, zero, e32, m1, ta, mu
	vsext.vf4	v14, v13
	vadd.vv	v12, v12, v14
	vsetvli	zero, zero, e64, m2, ta, mu
	vor.vi	v14, v10, 4
	vsetvli	zero, zero, e8, mf4, ta, mu
	vluxei64.v	v13, (a1), v14
	vluxei64.v	v16, (a2), v14
	vsub.vv	v13, v13, v16
	vrsub.vi	v14, v13, 0
	vmax.vv	v13, v13, v14
	vsetvli	zero, zero, e32, m1, ta, mu
	vsext.vf4	v14, v13
	vadd.vv	v12, v12, v14
	vsetvli	zero, zero, e64, m2, ta, mu
	vor.vi	v14, v10, 5
	vsetvli	zero, zero, e8, mf4, ta, mu
	vluxei64.v	v13, (a1), v14
	vluxei64.v	v16, (a2), v14
	vsub.vv	v13, v13, v16
	vrsub.vi	v14, v13, 0
	vmax.vv	v13, v13, v14
	vsetvli	zero, zero, e32, m1, ta, mu
	vsext.vf4	v14, v13
	vadd.vv	v12, v12, v14
	vsetvli	zero, zero, e64, m2, ta, mu
	vor.vi	v14, v10, 6
	vsetvli	zero, zero, e8, mf4, ta, mu
	vluxei64.v	v13, (a1), v14
	vluxei64.v	v16, (a2), v14
	vsub.vv	v13, v13, v16
	vrsub.vi	v14, v13, 0
	vmax.vv	v13, v13, v14
	vsetvli	zero, zero, e32, m1, ta, mu
	vsext.vf4	v14, v13
	vadd.vv	v12, v12, v14
	vsetvli	zero, zero, e64, m2, ta, mu
	vor.vi	v10, v10, 7
	vsetvli	zero, zero, e8, mf4, ta, mu
	vluxei64.v	v13, (a1), v10
	vluxei64.v	v14, (a2), v10
	vsub.vv	v10, v13, v14
	vrsub.vi	v11, v10, 0
	vmax.vv	v10, v10, v11
	vsetvli	zero, zero, e32, m1, ta, mu
	vsext.vf4	v11, v10
	vadd.vv	v10, v12, v11
	vs1r.v	v10, (a4)
	vsetvli	zero, zero, e64, m2, ta, mu
	vadd.vx	v8, v8, a5
	sub	a3, a3, a5
	add	a4, a4, t1
	bnez	a3, .LBB2_8
	bnez	a7, .LBB2_4
	j	.LBB2_6
.Lfunc_end2:
	.size	vector_sum_abs_diff, .Lfunc_end2-vector_sum_abs_diff

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 954c1ed009d423ca9593ee63479a9394a23864fd)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
