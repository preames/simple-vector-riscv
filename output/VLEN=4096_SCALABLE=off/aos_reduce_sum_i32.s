	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl1024b1p0_zvl128b1p0_zvl2048b1p0_zvl256b1p0_zvl32b1p0_zvl4096b1p0_zvl512b1p0_zvl64b1p0"
	.file	"aos_reduce_sum_i32.c"
	.globl	aos_reduce_sum_i32
	.p2align	1
	.type	aos_reduce_sum_i32,@function
aos_reduce_sum_i32:
	beqz	a0, .LBB0_8
	li	a2, 256
	zext.w	a6, a0
	bgeu	a0, a2, .LBB0_3
	li	a7, 0
	li	a0, 0
	j	.LBB0_6
.LBB0_3:
	andi	a7, a6, -256
	li	a0, 128
	vsetvli	zero, a0, e32, m1, ta, ma
	vmv.v.i	v8, 0
	li	t0, 1804
	li	a4, 56
	li	t1, 1792
	mv	a2, a1
	mv	a3, a7
	vmv.v.i	v9, 0
.LBB0_4:
	addi	a0, a2, 48
	sh2add	a5, t0, a2
	vlse32.v	v10, (a0), a4
	vlse32.v	v11, (a5), a4
	vadd.vv	v8, v10, v8
	vadd.vv	v9, v11, v9
	addi	a3, a3, -256
	sh3add	a2, t1, a2
	bnez	a3, .LBB0_4
	li	a0, 128
	vsetvli	zero, a0, e32, m1, ta, ma
	vadd.vv	v8, v9, v8
	vsetivli	zero, 1, e32, m1, ta, ma
	vmv.s.x	v9, zero
	vsetvli	zero, a0, e32, m1, ta, ma
	vredsum.vs	v8, v8, v9
	vmv.x.s	a0, v8
	beq	a7, a6, .LBB0_8
.LBB0_6:
	li	a2, 56
	mul	a2, a7, a2
	add	a1, a1, a2
	addi	a1, a1, 48
	sub	a2, a6, a7
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
