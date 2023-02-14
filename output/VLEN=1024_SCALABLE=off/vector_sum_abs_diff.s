	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
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
	srliw	a6, a3, 3
	beqz	a6, .LBB2_6
	li	a4, 64
	bltu	a3, a4, .LBB2_3
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
	li	a7, 0
.LBB2_4:
	sh3add	a1, a7, a1
	sh3add	a2, a7, a2
	sh2add	a0, a7, a0
	sub	a3, a6, a7
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
	ret
.LBB2_7:
	andi	a7, a6, -8
	mv	t0, a7
	mv	a4, a0
	mv	a3, a1
	mv	a5, a2
.LBB2_8:
	vsetivli	zero, 8, e8, mf2, ta, ma
	vlseg8e8.v	v8, (a3)
	vlseg8e8.v	v16, (a5)
	vsub.vv	v8, v8, v16
	vrsub.vi	v16, v8, 0
	vmax.vv	v8, v8, v16
	vsub.vv	v9, v9, v17
	vrsub.vi	v16, v9, 0
	vmax.vv	v9, v9, v16
	vsetvli	zero, zero, e16, m1, ta, ma
	vsext.vf2	v16, v9
	vsext.vf2	v17, v8
	vwadd.vv	v8, v17, v16
	vsetvli	zero, zero, e8, mf2, ta, ma
	vsub.vv	v10, v10, v18
	vrsub.vi	v16, v10, 0
	vmax.vv	v10, v10, v16
	vsetvli	zero, zero, e16, m1, ta, ma
	vsext.vf2	v16, v10
	vwadd.wv	v8, v8, v16
	vsetvli	zero, zero, e8, mf2, ta, ma
	vsub.vv	v10, v11, v19
	vrsub.vi	v11, v10, 0
	vmax.vv	v10, v10, v11
	vsetvli	zero, zero, e16, m1, ta, ma
	vsext.vf2	v11, v10
	vwadd.wv	v8, v8, v11
	vsetvli	zero, zero, e8, mf2, ta, ma
	vsub.vv	v10, v12, v20
	vrsub.vi	v11, v10, 0
	vmax.vv	v10, v10, v11
	vsetvli	zero, zero, e16, m1, ta, ma
	vsext.vf2	v11, v10
	vwadd.wv	v8, v8, v11
	vsetvli	zero, zero, e8, mf2, ta, ma
	vsub.vv	v10, v13, v21
	vrsub.vi	v11, v10, 0
	vmax.vv	v10, v10, v11
	vsetvli	zero, zero, e16, m1, ta, ma
	vsext.vf2	v11, v10
	vwadd.wv	v8, v8, v11
	vsetvli	zero, zero, e8, mf2, ta, ma
	vsub.vv	v10, v14, v22
	vrsub.vi	v11, v10, 0
	vmax.vv	v10, v10, v11
	vsetvli	zero, zero, e16, m1, ta, ma
	vsext.vf2	v11, v10
	vwadd.wv	v8, v8, v11
	vsetvli	zero, zero, e8, mf2, ta, ma
	vsub.vv	v10, v15, v23
	vrsub.vi	v11, v10, 0
	vmax.vv	v10, v10, v11
	vsetvli	zero, zero, e16, m1, ta, ma
	vsext.vf2	v11, v10
	vwadd.wv	v8, v8, v11
	vse32.v	v8, (a4)
	addi	a5, a5, 64
	addi	a3, a3, 64
	addi	t0, t0, -8
	addi	a4, a4, 32
	bnez	t0, .LBB2_8
	beq	a7, a6, .LBB2_6
	j	.LBB2_4
.Lfunc_end2:
	.size	vector_sum_abs_diff, .Lfunc_end2-vector_sum_abs_diff

	.ident	"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 8c3a8d17c8a154894895c48a304a04df9ece4328)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
