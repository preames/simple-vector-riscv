	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"aos_reduce_sum_i64.c"
	.globl	aos_reduce_sum_i64
	.p2align	1
	.type	aos_reduce_sum_i64,@function
aos_reduce_sum_i64:
	beqz	a0, .LBB0_3
	li	a3, 16
	zext.w	a6, a0
	bgeu	a0, a3, .LBB0_4
	li	a0, 0
	li	a3, 0
	j	.LBB0_7
.LBB0_3:
	li	a3, 0
	j	.LBB0_9
.LBB0_4:
	andi	a0, a6, -16
	vsetivli	zero, 8, e64, m1, ta, ma
	vmv.v.i	v8, 0
	addi	a3, a1, 496
	li	a4, 56
	mv	a5, a0
	vmv.v.i	v9, 0
.LBB0_5:
	addi	a2, a3, -448
	vlse64.v	v10, (a2), a4
	vlse64.v	v11, (a3), a4
	vadd.vv	v8, v10, v8
	vadd.vv	v9, v11, v9
	addi	a5, a5, -16
	addi	a3, a3, 896
	bnez	a5, .LBB0_5
	vadd.vv	v8, v9, v8
	vmv.s.x	v9, zero
	vredsum.vs	v8, v8, v9
	vmv.x.s	a3, v8
	beq	a0, a6, .LBB0_9
.LBB0_7:
	li	a2, 56
	mul	a2, a0, a2
	add	a1, a1, a2
	addi	a1, a1, 48
	sub	a0, a6, a0
.LBB0_8:
	ld	a2, 0(a1)
	add	a3, a3, a2
	addi	a0, a0, -1
	addi	a1, a1, 56
	bnez	a0, .LBB0_8
.LBB0_9:
	sext.w	a0, a3
	ret
.Lfunc_end0:
	.size	aos_reduce_sum_i64, .Lfunc_end0-aos_reduce_sum_i64

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 6e4f504575fce7ce9a29c00697acb4043b19badf)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
