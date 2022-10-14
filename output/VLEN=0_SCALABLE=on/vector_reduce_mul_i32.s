	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_reduce_mul_i32.c"
	.globl	vector_reduce_mul_i32
	.p2align	1
	.type	vector_reduce_mul_i32,@function
vector_reduce_mul_i32:
	beqz	a1, .LBB0_4
	mv	a2, a0
	zext.w	a1, a1
	li	a0, 1
.LBB0_2:
	lw	a3, 0(a2)
	mulw	a0, a3, a0
	addi	a1, a1, -1
	addi	a2, a2, 4
	bnez	a1, .LBB0_2
	ret
.LBB0_4:
	li	a0, 1
	ret
.Lfunc_end0:
	.size	vector_reduce_mul_i32, .Lfunc_end0-vector_reduce_mul_i32

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 6e4f504575fce7ce9a29c00697acb4043b19badf)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
