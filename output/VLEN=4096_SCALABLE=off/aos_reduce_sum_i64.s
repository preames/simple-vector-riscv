	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl1024b1p0_zvl128b1p0_zvl2048b1p0_zvl256b1p0_zvl32b1p0_zvl4096b1p0_zvl512b1p0_zvl64b1p0"
	.file	"aos_reduce_sum_i64.c"
	.globl	aos_reduce_sum_i64
	.p2align	1
	.type	aos_reduce_sum_i64,@function
aos_reduce_sum_i64:
	beqz	a0, .LBB0_3
	li	a2, 128
	zext.w	a6, a0
	bgeu	a0, a2, .LBB0_4
	li	a7, 0
	li	a3, 0
	j	.LBB0_7
.LBB0_3:
	li	a3, 0
	j	.LBB0_9
.LBB0_4:
	andi	a7, a6, -128
	li	a0, 64
	vsetvli	zero, a0, e64, m1, ta, ma
	vmv.v.i	v8, 0
	li	a3, 56
	li	t0, 1792
	mv	a5, a1
	mv	a0, a7
	vmv.v.i	v9, 0
.LBB0_5:
	addi	a2, a5, 48
	addi	a4, a5, 2047
	addi	a4, a4, 1585
	vlse64.v	v10, (a2), a3
	vlse64.v	v11, (a4), a3
	vadd.vv	v8, v10, v8
	vadd.vv	v9, v11, v9
	addi	a0, a0, -128
	sh2add	a5, t0, a5
	bnez	a0, .LBB0_5
	li	a0, 64
	vsetvli	zero, a0, e64, m1, ta, ma
	vadd.vv	v8, v9, v8
	vsetivli	zero, 1, e64, m1, ta, ma
	vmv.s.x	v9, zero
	vsetvli	zero, a0, e64, m1, ta, ma
	vredsum.vs	v8, v8, v9
	vmv.x.s	a3, v8
	beq	a7, a6, .LBB0_9
.LBB0_7:
	li	a0, 56
	mul	a0, a7, a0
	add	a0, a0, a1
	addi	a0, a0, 48
	sub	a1, a6, a7
.LBB0_8:
	ld	a2, 0(a0)
	add	a3, a3, a2
	addi	a1, a1, -1
	addi	a0, a0, 56
	bnez	a1, .LBB0_8
.LBB0_9:
	sext.w	a0, a3
	ret
.Lfunc_end0:
	.size	aos_reduce_sum_i64, .Lfunc_end0-aos_reduce_sum_i64

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 9472a810ed33bc9e655484f43047eed07d50bc16)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
