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
	addi	sp, sp, -48
	sd	s0, 40(sp)
	sd	s1, 32(sp)
	sd	s2, 24(sp)
	sd	s3, 16(sp)
	sd	s4, 8(sp)
	sd	s5, 0(sp)
	li	a4, 8
	bltu	a3, a4, .LBB2_3
	srliw	s5, a3, 3
.LBB2_2:
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
	sext.b	t2, s0
	subw	s1, t1, s2
	sext.b	s1, s1
	subw	a4, t0, t6
	sext.b	a4, a4
	subw	a5, a7, t5
	sext.b	a5, a5
	subw	a3, a6, t4
	sext.b	a3, a3
	neg	s0, a3
	max	a6, a3, s0
	neg	s0, a5
	max	a7, a5, s0
	neg	s0, a4
	max	t0, a4, s0
	neg	s0, s1
	max	s1, s1, s0
	neg	s0, t2
	max	s0, t2, s0
	neg	a3, t3
	max	a3, t3, a3
	neg	a5, s3
	max	a5, s3, a5
	neg	a4, s4
	max	a4, s4, a4
	sext.b	t1, a4
	sext.b	t2, a5
	sext.b	t3, a3
	sext.b	s0, s0
	sext.b	s1, s1
	sext.b	a4, t0
	sext.b	a5, a7
	sext.b	a3, a6
	addw	a3, a3, a5
	addw	a4, a4, s1
	addw	a3, a3, a4
	addw	a4, s0, t3
	addw	a5, t2, t1
	addw	a4, a4, a5
	addw	a3, a3, a4
	sw	a3, 0(a0)
	addi	a1, a1, 8
	addi	a2, a2, 8
	addi	s5, s5, -1
	addi	a0, a0, 4
	bnez	s5, .LBB2_2
.LBB2_3:
	ld	s0, 40(sp)
	ld	s1, 32(sp)
	ld	s2, 24(sp)
	ld	s3, 16(sp)
	ld	s4, 8(sp)
	ld	s5, 0(sp)
	addi	sp, sp, 48
	ret
.Lfunc_end2:
	.size	vector_sum_abs_diff, .Lfunc_end2-vector_sum_abs_diff

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 6d859266803e2a9060c4e8770f92cc2c7bd05a3b)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
