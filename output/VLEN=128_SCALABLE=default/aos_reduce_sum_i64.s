	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"aos_reduce_sum_i64.c"
	.globl	aos_reduce_sum_i64
	.p2align	1
	.type	aos_reduce_sum_i64,@function
aos_reduce_sum_i64:
	beqz	a0, .LBB0_3
	zext.w	t0, a0
	csrr	a0, vlenb
	srli	a3, a0, 3
	bgeu	t0, a3, .LBB0_4
	li	a7, 0
	li	a3, 0
	j	.LBB0_7
.LBB0_3:
	li	a3, 0
	j	.LBB0_9
.LBB0_4:
	addi	a2, a3, -1
	and	a6, t0, a2
	sub	a7, t0, a6
	addi	a5, a1, 48
	slli	a2, a0, 3
	sub	a4, a2, a0
	vsetvli	a0, zero, e64, m1, ta, ma
	vmv.v.i	v8, 0
	li	a2, 56
	mv	a0, a7
.LBB0_5:
	vlse64.v	v9, (a5), a2
	vadd.vv	v8, v9, v8
	sub	a0, a0, a3
	add	a5, a5, a4
	bnez	a0, .LBB0_5
	vmv.s.x	v9, zero
	vredsum.vs	v8, v8, v9
	vmv.x.s	a3, v8
	beqz	a6, .LBB0_9
.LBB0_7:
	li	a0, 56
	mul	a0, a7, a0
	add	a0, a0, a1
	addi	a1, a0, 48
	sub	a0, t0, a7
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

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git a819f6c8d1f4909a1ac3a2eff390236e4e31dba3)"
	.section	".note.GNU-stack","",@progbits
	.addrsig