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
	beqz	a3, .LBB2_9
	li	a4, 128
	zext.w	a7, a3
	bgeu	a3, a4, .LBB2_3
	li	a5, 0
	j	.LBB2_7
.LBB2_3:
	csrr	t0, vlenb
	slli	t1, t0, 1
	sub	a3, a0, a1
	sltu	a3, a3, t1
	sub	a4, a0, a2
	sltu	a4, a4, t1
	or	a3, a3, a4
	li	a5, 0
	bnez	a3, .LBB2_7
	li	a4, 0
	addi	a3, t1, -1
	and	a6, a7, a3
	sub	a5, a7, a6
	add	t2, a1, t0
	add	t3, a2, t0
	add	t0, t0, a0
	vsetvli	a3, zero, e8, m1, ta, mu
.LBB2_5:
	add	a3, a1, a4
	vl1r.v	v8, (a3)
	add	a3, t2, a4
	vl1r.v	v9, (a3)
	add	a3, a2, a4
	vl1r.v	v10, (a3)
	add	a3, t3, a4
	vl1r.v	v11, (a3)
	vsub.vv	v8, v8, v10
	vsub.vv	v9, v9, v11
	vrsub.vi	v10, v8, 0
	vmax.vv	v8, v8, v10
	vrsub.vi	v10, v9, 0
	vmax.vv	v9, v9, v10
	add	a3, a0, a4
	vs1r.v	v8, (a3)
	add	a3, t0, a4
	add	a4, a4, t1
	vs1r.v	v9, (a3)
	bne	a4, a5, .LBB2_5
	beqz	a6, .LBB2_9
.LBB2_7:
	add	a1, a1, a5
	add	a2, a2, a5
	add	a0, a0, a5
	sub	a3, a7, a5
.LBB2_8:
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
	bnez	a3, .LBB2_8
.LBB2_9:
	ret
.Lfunc_end2:
	.size	vector_abs_diff, .Lfunc_end2-vector_abs_diff

	.ident	"clang version 15.0.0 (https://github.com/llvm/llvm-project.git dde2a7fb6da46da2b2f765fa569d8fddb4270eb6)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
