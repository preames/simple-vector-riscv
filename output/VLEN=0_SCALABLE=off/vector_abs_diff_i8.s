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
	beqz	a3, .LBB2_3
	zext.w	a3, a3
.LBB2_2:
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
	bnez	a3, .LBB2_2
.LBB2_3:
	ret
.Lfunc_end2:
	.size	vector_abs_diff, .Lfunc_end2-vector_abs_diff

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 9452450ee564583afc43611f300d26d8c3edd95b)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
