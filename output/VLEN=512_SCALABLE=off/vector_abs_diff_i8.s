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
	beqz	a3, .LBB2_15
	li	a4, 32
	zext.w	a7, a3
	bgeu	a3, a4, .LBB2_3
	li	t1, 0
	j	.LBB2_13
.LBB2_3:
	sub	a4, a0, a1
	sltiu	a4, a4, 128
	sub	a5, a0, a2
	sltiu	a5, a5, 128
	or	a4, a4, a5
	li	t1, 0
	bnez	a4, .LBB2_13
	li	a4, -128
	li	a5, 128
	zext.w	a6, a4
	bgeu	a3, a5, .LBB2_6
	li	t1, 0
	j	.LBB2_10
.LBB2_6:
	and	t1, a7, a6
	li	t0, 64
	mv	t2, t1
	mv	a3, a0
	mv	a4, a2
	mv	a5, a1
.LBB2_7:
	addi	t3, a4, 64
	addi	t4, a5, 64
	vsetvli	zero, t0, e8, m1, ta, mu
	vle8.v	v8, (a5)
	vle8.v	v9, (t4)
	vle8.v	v10, (a4)
	vle8.v	v11, (t3)
	addi	t3, a3, 64
	vsub.vv	v8, v8, v10
	vsub.vv	v9, v9, v11
	vrsub.vi	v10, v8, 0
	vmax.vv	v8, v8, v10
	vrsub.vi	v10, v9, 0
	vmax.vv	v9, v9, v10
	vse8.v	v8, (a3)
	vse8.v	v9, (t3)
	addi	a5, a5, 128
	addi	a4, a4, 128
	addi	t2, t2, -128
	addi	a3, a3, 128
	bnez	t2, .LBB2_7
	beq	t1, a7, .LBB2_15
	andi	a3, a7, 96
	beqz	a3, .LBB2_13
.LBB2_10:
	mv	a3, t1
	addi	a4, a6, 96
	and	t1, a7, a4
	add	a6, a1, a3
	add	a4, a2, a3
	add	a5, a0, a3
	sub	a3, a3, t1
	li	t0, 32
.LBB2_11:
	vsetvli	zero, t0, e8, mf2, ta, mu
	vle8.v	v8, (a6)
	vle8.v	v9, (a4)
	vsub.vv	v8, v8, v9
	vrsub.vi	v9, v8, 0
	vmax.vv	v8, v8, v9
	vse8.v	v8, (a5)
	addi	a6, a6, 32
	addi	a4, a4, 32
	addi	a3, a3, 32
	addi	a5, a5, 32
	bnez	a3, .LBB2_11
	beq	t1, a7, .LBB2_15
.LBB2_13:
	add	a1, a1, t1
	add	a2, a2, t1
	add	a0, a0, t1
	sub	a3, a7, t1
.LBB2_14:
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
	bnez	a3, .LBB2_14
.LBB2_15:
	ret
.Lfunc_end2:
	.size	vector_abs_diff, .Lfunc_end2-vector_abs_diff

	.ident	"clang version 15.0.0 (https://github.com/llvm/llvm-project.git 9153515a7bea9fb9dd4c76f70053a170bf825f35)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
