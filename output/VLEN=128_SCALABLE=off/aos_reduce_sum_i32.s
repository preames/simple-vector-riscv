	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"aos_reduce_sum_i32.c"
	.globl	aos_reduce_sum_i32
	.p2align	1
	.type	aos_reduce_sum_i32,@function
aos_reduce_sum_i32:
	beqz	a0, .LBB0_8
	li	a3, 8
	zext.w	a6, a0
	bgeu	a0, a3, .LBB0_3
	li	a3, 0
	li	a0, 0
	j	.LBB0_6
.LBB0_3:
	andi	a3, a6, -8
	vsetivli	zero, 4, e32, m1, ta, ma
	vmv.v.i	v8, 0
	addi	a0, a1, 272
	li	a4, 56
	mv	a5, a3
	vmv.v.i	v9, 0
.LBB0_4:
	addi	a2, a0, -224
	vlse32.v	v10, (a2), a4
	vlse32.v	v11, (a0), a4
	vadd.vv	v8, v10, v8
	vadd.vv	v9, v11, v9
	addi	a5, a5, -8
	addi	a0, a0, 448
	bnez	a5, .LBB0_4
	vadd.vv	v8, v9, v8
	vmv.s.x	v9, zero
	vredsum.vs	v8, v8, v9
	vmv.x.s	a0, v8
	beq	a3, a6, .LBB0_8
.LBB0_6:
	li	a2, 56
	mul	a2, a3, a2
	add	a1, a1, a2
	addi	a1, a1, 48
	sub	a2, a6, a3
.LBB0_7:
	lw	a3, 0(a1)
	addw	a0, a0, a3
	addi	a2, a2, -1
	addi	a1, a1, 56
	bnez	a2, .LBB0_7
.LBB0_8:
	ret
.Lfunc_end0:
	.size	aos_reduce_sum_i32, .Lfunc_end0-aos_reduce_sum_i32

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 269bc684e7a0c3f727ea5e74270112585acaf55d)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
