	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"main.c"
	.globl	vector_add_i32
	.p2align	1
	.type	vector_add_i32,@function
vector_add_i32:
	li	a3, 1
	beq	a1, a3, .LBB0_3
	sh2add	a0, a1, a0
	addi	a0, a0, -4
	addiw	a1, a1, -2
.LBB0_2:
	lw	a3, 0(a0)
	mv	a4, a1
	addw	a1, a3, a2
	sw	a1, 0(a0)
	addi	a0, a0, -4
	addiw	a1, a4, -1
	bnez	a4, .LBB0_2
.LBB0_3:
	ret
.Lfunc_end0:
	.size	vector_add_i32, .Lfunc_end0-vector_add_i32

	.globl	vector_reduce_add_i32
	.p2align	1
	.type	vector_reduce_add_i32,@function
vector_reduce_add_i32:
	li	a2, 0
	blez	a1, .LBB1_2
.LBB1_1:
	lw	a3, 0(a0)
	addw	a2, a2, a3
	addi	a1, a1, -1
	addi	a0, a0, 4
	bnez	a1, .LBB1_1
.LBB1_2:
	mv	a0, a2
	ret
.Lfunc_end1:
	.size	vector_reduce_add_i32, .Lfunc_end1-vector_reduce_add_i32

	.globl	main
	.p2align	1
	.type	main,@function
main:
	addi	sp, sp, -2032
	sd	ra, 2024(sp)
	sd	s0, 2016(sp)
	lui	a0, 2
	addiw	a0, a0, -2000
	sub	sp, sp, a0
	addi	a0, sp, 16
	lui	a2, 2
	addi	s0, sp, 16
	li	a1, 0
	call	memset@plt
	li	a0, 2047
	sh2add	a0, a0, s0
	li	a1, 2046
.LBB2_1:
	lw	a2, 0(a0)
	mv	a3, a1
	addiw	a1, a2, 1
	sw	a1, 0(a0)
	addiw	a1, a3, -1
	addi	a0, a0, -4
	bnez	a3, .LBB2_1
	li	a0, 0
	li	a1, 0
	addi	a2, sp, 16
	lui	a3, 2
.LBB2_3:
	add	a4, a2, a0
	lw	a4, 0(a4)
	addi	a0, a0, 4
	addw	a1, a1, a4
	bne	a0, a3, .LBB2_3
	lui	a0, 1
	addiw	a2, a0, -2048
	li	a0, -1
	bne	a1, a2, .LBB2_9
	li	a0, 2047
	addi	a1, sp, 16
	sh2add	a0, a0, a1
	li	a1, 2046
.LBB2_6:
	lw	a2, 0(a0)
	mv	a3, a1
	addiw	a1, a2, -1
	sw	a1, 0(a0)
	addiw	a1, a3, -1
	addi	a0, a0, -4
	bnez	a3, .LBB2_6
	li	a0, 0
	addi	a1, sp, 16
	lui	a2, 1
	addiw	a2, a2, -2048
.LBB2_8:
	lw	a3, 0(a1)
	addw	a0, a0, a3
	addi	a2, a2, -1
	addi	a1, a1, 4
	bnez	a2, .LBB2_8
.LBB2_9:
	lui	a1, 2
	addiw	a1, a1, -2000
	add	sp, sp, a1
	ld	ra, 2024(sp)
	ld	s0, 2016(sp)
	addi	sp, sp, 2032
	ret
.Lfunc_end2:
	.size	main, .Lfunc_end2-main

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 9452450ee564583afc43611f300d26d8c3edd95b)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
