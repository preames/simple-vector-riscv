	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_sum_abs_diff.c"
	.globl	sub
	.p2align	1
	.type	sub,@function
sub:
	subw	a0, a0, a1
	slli	a0, a0, 56
	srai	a0, a0, 56
	ret
.Lfunc_end0:
	.size	sub, .Lfunc_end0-sub

	.globl	myabs
	.p2align	1
	.type	myabs,@function
myabs:
	slli	a1, a0, 56
	srai	a1, a1, 63
	xor	a0, a0, a1
	subw	a0, a0, a1
	slli	a0, a0, 56
	srai	a0, a0, 56
	ret
.Lfunc_end1:
	.size	myabs, .Lfunc_end1-myabs

	.globl	vector_sum_abs_diff
	.p2align	1
	.type	vector_sum_abs_diff,@function
vector_sum_abs_diff:
	li	a4, 8
	bltu	a3, a4, .LBB2_3
	srliw	a6, a3, 3
	addi	a2, a2, 3
	addi	a1, a1, 3
.LBB2_2:
	lb	a4, -3(a1)
	lb	a5, -3(a2)
	sub	a4, a4, a5
	slli	a5, a4, 56
	srai	a5, a5, 63
	xor	a7, a4, a5
	lb	a3, -2(a1)
	lb	a4, -2(a2)
	subw	a5, a7, a5
	slli	a5, a5, 56
	srai	a7, a5, 56
	sub	a3, a3, a4
	slli	a4, a3, 56
	srai	a4, a4, 63
	xor	a3, a3, a4
	subw	a3, a3, a4
	lb	a4, -1(a1)
	lb	a5, -1(a2)
	slli	a3, a3, 56
	srai	a3, a3, 56
	addw	a7, a7, a3
	sub	a4, a4, a5
	slli	a5, a4, 56
	srai	a5, a5, 63
	xor	a4, a4, a5
	subw	a4, a4, a5
	lb	a5, 0(a1)
	lb	a3, 0(a2)
	slli	a4, a4, 56
	srai	a4, a4, 56
	addw	a7, a7, a4
	sub	a3, a5, a3
	slli	a5, a3, 56
	srai	a5, a5, 63
	xor	a3, a3, a5
	subw	a3, a3, a5
	lb	a5, 1(a1)
	lb	a4, 1(a2)
	slli	a3, a3, 56
	srai	a3, a3, 56
	addw	a7, a7, a3
	sub	a4, a5, a4
	slli	a5, a4, 56
	srai	a5, a5, 63
	xor	a4, a4, a5
	subw	a4, a4, a5
	lb	a5, 2(a1)
	lb	a3, 2(a2)
	slli	a4, a4, 56
	srai	a4, a4, 56
	addw	a7, a7, a4
	sub	a3, a5, a3
	slli	a5, a3, 56
	srai	a5, a5, 63
	xor	a3, a3, a5
	subw	a3, a3, a5
	lb	a5, 3(a1)
	lb	a4, 3(a2)
	slli	a3, a3, 56
	srai	a3, a3, 56
	addw	a7, a7, a3
	sub	a4, a5, a4
	slli	a5, a4, 56
	srai	a5, a5, 63
	xor	a4, a4, a5
	subw	a4, a4, a5
	lb	a5, 4(a1)
	lb	a3, 4(a2)
	slli	a4, a4, 56
	srai	a4, a4, 56
	addw	a4, a7, a4
	sub	a3, a5, a3
	slli	a5, a3, 56
	srai	a5, a5, 63
	xor	a3, a3, a5
	subw	a3, a3, a5
	slli	a3, a3, 56
	srai	a3, a3, 56
	addw	a3, a3, a4
	sw	a3, 0(a0)
	addi	a6, a6, -1
	addi	a0, a0, 4
	addi	a2, a2, 8
	addi	a1, a1, 8
	bnez	a6, .LBB2_2
.LBB2_3:
	ret
.Lfunc_end2:
	.size	vector_sum_abs_diff, .Lfunc_end2-vector_sum_abs_diff

	.ident	"clang version 15.0.0 (https://github.com/llvm/llvm-project.git c7fd7512a5c5b133665bfecbe2e9748c0607286e)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
