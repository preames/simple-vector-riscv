	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl512b1p0_zvl64b1p0"
	.file	"aos_reduce_sum_i32.c"
	.globl	aos_reduce_sum_i32
	.p2align	1
	.type	aos_reduce_sum_i32,@function
aos_reduce_sum_i32:
	beqz	a0, .LBB0_8
	zext.w	t0, a0
	csrr	a2, vlenb
	srli	a0, a2, 1
	bgeu	t0, a0, .LBB0_3
	li	a7, 0
	li	a0, 0
	j	.LBB0_6
.LBB0_3:
	addi	a3, a0, -1
	and	a6, t0, a3
	sub	a7, t0, a6
	vsetvli	a3, zero, e64, m2, ta, ma
	vid.v	v10
	srli	a5, a2, 2
	vsetvli	zero, zero, e32, m1, ta, ma
	vmv.v.i	v8, 0
	li	a4, 56
	addi	a3, a1, 48
	mv	a2, a7
	vmv.v.i	v9, 0
.LBB0_4:
	vsetvli	zero, zero, e64, m2, ta, ma
	vadd.vx	v12, v10, a5
	vmul.vx	v10, v10, a4
	vmul.vx	v14, v12, a4
	vsetvli	zero, zero, e32, m1, ta, ma
	vluxei64.v	v16, (a3), v10
	vluxei64.v	v10, (a3), v14
	vadd.vv	v8, v16, v8
	vadd.vv	v9, v10, v9
	vsetvli	zero, zero, e64, m2, ta, ma
	sub	a2, a2, a0
	vadd.vx	v10, v12, a5
	bnez	a2, .LBB0_4
	vsetvli	zero, zero, e32, m1, ta, ma
	vadd.vv	v8, v9, v8
	vmv.s.x	v9, zero
	vredsum.vs	v8, v8, v9
	vmv.x.s	a0, v8
	beqz	a6, .LBB0_8
.LBB0_6:
	li	a2, 56
	mul	a2, a7, a2
	add	a1, a1, a2
	addi	a1, a1, 48
	sub	a2, t0, a7
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

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 6d859266803e2a9060c4e8770f92cc2c7bd05a3b)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
