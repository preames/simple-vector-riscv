	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_reduce_max_i32.c"
	.globl	vector_reduce_max_i32
	.p2align	1
	.type	vector_reduce_max_i32,@function
vector_reduce_max_i32:
	lui	a3, 807449
	beqz	a1, .LBB0_5
	zext.w	a2, a1
	addiw	a3, a3, 1871
	j	.LBB0_3
.LBB0_2:
	addi	a2, a2, -1
	addi	a0, a0, 4
	mv	a3, a1
	beqz	a2, .LBB0_6
.LBB0_3:
	lw	a1, 0(a0)
	blt	a3, a1, .LBB0_2
	mv	a1, a3
	j	.LBB0_2
.LBB0_5:
	addiw	a1, a3, 1871
.LBB0_6:
	mv	a0, a1
	ret
.Lfunc_end0:
	.size	vector_reduce_max_i32, .Lfunc_end0-vector_reduce_max_i32

	.ident	"clang version 15.0.0 (https://github.com/llvm/llvm-project.git 93dc8b18e7594c7c3b48744b9fa4034e13aac46f)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
