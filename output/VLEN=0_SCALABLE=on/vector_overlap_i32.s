	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_overlap_i32.c"
	.globl	vector_overlap
	.p2align	1
	.type	vector_overlap,@function
vector_overlap:
	li	a3, 2
	bltu	a2, a3, .LBB0_3
	zext.w	a2, a2
	lw	a4, 0(a0)
	lw	a3, 4(a0)
	addi	a1, a1, 4
	addi	a2, a2, -1
	addi	a0, a0, 8
.LBB0_2:
	mv	a5, a3
	lw	a3, 0(a0)
	addw	a6, a5, a4
	mv	a4, a5
	addw	a5, a6, a3
	sw	a5, 0(a1)
	addi	a1, a1, 4
	addi	a2, a2, -1
	addi	a0, a0, 4
	bnez	a2, .LBB0_2
.LBB0_3:
	ret
.Lfunc_end0:
	.size	vector_overlap, .Lfunc_end0-vector_overlap

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 9452450ee564583afc43611f300d26d8c3edd95b)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
