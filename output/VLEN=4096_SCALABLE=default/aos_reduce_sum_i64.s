	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"aos_reduce_sum_i64.c"
	.globl	aos_reduce_sum_i64
	.p2align	1
	.type	aos_reduce_sum_i64,@function
aos_reduce_sum_i64:
	beqz	a0, .LBB0_10
	zext.w	a6, a0
	csrr	a2, vlenb
	srli	a0, a2, 2
	bgeu	a0, a6, .LBB0_7
	addi	a3, a0, -1
	and	a4, a6, a3
	mv	a3, a0
	beqz	a4, .LBB0_4
	mv	a3, a4
.LBB0_4:
	sub	a7, a6, a3
	addi	a4, a1, 48
	li	a3, 14
	mul	a5, a2, a3
	vsetvli	a2, zero, e64, m2, ta, ma
	vmv.v.i	v8, 0
	li	a2, 56
	mv	a3, a7
.LBB0_5:
	vlse64.v	v10, (a4), a2
	vadd.vv	v8, v10, v8
	sub	a3, a3, a0
	add	a4, a4, a5
	bnez	a3, .LBB0_5
	vmv.s.x	v10, zero
	vredsum.vs	v8, v8, v10
	vmv.x.s	a0, v8
	j	.LBB0_8
.LBB0_7:
	li	a7, 0
	li	a0, 0
.LBB0_8:
	li	a2, 56
	mul	a2, a7, a2
	add	a1, a1, a2
	addi	a1, a1, 48
	sub	a2, a6, a7
.LBB0_9:
	ld	a3, 0(a1)
	addw	a0, a0, a3
	addi	a2, a2, -1
	addi	a1, a1, 56
	bnez	a2, .LBB0_9
.LBB0_10:
	ret
.Lfunc_end0:
	.size	aos_reduce_sum_i64, .Lfunc_end0-aos_reduce_sum_i64

	.ident	"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 8c3a8d17c8a154894895c48a304a04df9ece4328)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
