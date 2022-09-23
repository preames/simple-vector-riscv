	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_abs_diff_i8.c"
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

	.globl	vector_abs_diff
	.p2align	1
	.type	vector_abs_diff,@function
vector_abs_diff:
	beqz	a3, .LBB2_6
	li	a4, 8
	zext.w	a7, a3
	bltu	a3, a4, .LBB2_3
	sub	a4, a0, a1
	sltiu	a4, a4, 32
	sub	a5, a0, a2
	sltiu	a5, a5, 32
	or	a4, a4, a5
	beqz	a4, .LBB2_7
.LBB2_3:
	li	t0, 0
.LBB2_4:
	add	a1, a1, t0
	add	a2, a2, t0
	add	a0, a0, t0
	sub	a3, a7, t0
.LBB2_5:
	lb	a4, 0(a1)
	lb	a5, 0(a2)
	subw	a4, a4, a5
	sext.b	a4, a4
	neg	a5, a4
	max	a4, a4, a5
	sb	a4, 0(a0)
	addi	a1, a1, 1
	addi	a2, a2, 1
	addi	a3, a3, -1
	addi	a0, a0, 1
	bnez	a3, .LBB2_5
.LBB2_6:
	ret
.LBB2_7:
	li	a4, -32
	li	a5, 32
	zext.w	a6, a4
	bgeu	a3, a5, .LBB2_9
	li	t0, 0
	j	.LBB2_13
.LBB2_9:
	and	t0, a7, a6
	vsetivli	zero, 16, e8, m1, ta, mu
	mv	t1, t0
	mv	a4, a0
	mv	a5, a2
	mv	a3, a1
.LBB2_10:
	addi	t2, a5, 16
	addi	t3, a3, 16
	vle8.v	v8, (a3)
	vle8.v	v9, (t3)
	vle8.v	v10, (a5)
	vle8.v	v11, (t2)
	addi	t2, a4, 16
	vsub.vv	v8, v8, v10
	vsub.vv	v9, v9, v11
	vrsub.vi	v10, v8, 0
	vmax.vv	v8, v8, v10
	vrsub.vi	v10, v9, 0
	vmax.vv	v9, v9, v10
	vse8.v	v8, (a4)
	vse8.v	v9, (t2)
	addi	a3, a3, 32
	addi	a5, a5, 32
	addi	t1, t1, -32
	addi	a4, a4, 32
	bnez	t1, .LBB2_10
	beq	t0, a7, .LBB2_6
	andi	a3, a7, 24
	beqz	a3, .LBB2_4
.LBB2_13:
	mv	a3, t0
	addi	a4, a6, 24
	and	t0, a7, a4
	add	a6, a1, a3
	add	a4, a2, a3
	add	a5, a0, a3
	sub	a3, a3, t0
	vsetivli	zero, 8, e8, mf2, ta, mu
.LBB2_14:
	vle8.v	v8, (a6)
	vle8.v	v9, (a4)
	vsub.vv	v8, v8, v9
	vrsub.vi	v9, v8, 0
	vmax.vv	v8, v8, v9
	vse8.v	v8, (a5)
	addi	a6, a6, 8
	addi	a4, a4, 8
	addi	a3, a3, 8
	addi	a5, a5, 8
	bnez	a3, .LBB2_14
	beq	t0, a7, .LBB2_6
	j	.LBB2_4
.Lfunc_end2:
	.size	vector_abs_diff, .Lfunc_end2-vector_abs_diff

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 954c1ed009d423ca9593ee63479a9394a23864fd)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
