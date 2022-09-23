	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_reduce_mul_i32.c"
	.globl	vector_reduce_mul_i32
	.p2align	1
	.type	vector_reduce_mul_i32,@function
vector_reduce_mul_i32:
	beqz	a1, .LBB0_3
	li	a3, 64
	zext.w	a2, a1
	bgeu	a1, a3, .LBB0_4
	li	a3, 0
	li	a1, 1
	j	.LBB0_13
.LBB0_3:
	li	a0, 1
	ret
.LBB0_4:
	li	a3, -256
	li	a5, 256
	zext.w	a6, a3
	bgeu	a1, a5, .LBB0_6
	li	a3, 0
	li	a1, 1
	j	.LBB0_10
.LBB0_6:
	and	a3, a2, a6
	li	a1, 128
	vsetvli	zero, a1, e32, m1, ta, mu
	vmv.v.i	v8, 1
	mv	a1, a3
	mv	a5, a0
	vmv.v.i	v9, 1
.LBB0_7:
	addi	a4, a5, 512
	vle32.v	v10, (a5)
	vle32.v	v11, (a4)
	vmul.vv	v8, v10, v8
	vmul.vv	v9, v11, v9
	addi	a1, a1, -256
	addi	a5, a5, 1024
	bnez	a1, .LBB0_7
	li	a1, 128
	vsetvli	zero, a1, e32, m1, ta, mu
	vmul.vv	v8, v9, v8
	li	a1, 64
	vslidedown.vx	v9, v8, a1
	vmul.vv	v8, v8, v9
	li	a1, 32
	vslidedown.vx	v9, v8, a1
	vmul.vv	v8, v8, v9
	vslidedown.vi	v9, v8, 16
	vmul.vv	v8, v8, v9
	vslidedown.vi	v9, v8, 8
	vmul.vv	v8, v8, v9
	vslidedown.vi	v9, v8, 4
	vmul.vv	v8, v8, v9
	vslidedown.vi	v9, v8, 2
	vmul.vv	v8, v8, v9
	vrgather.vi	v9, v8, 1
	vmul.vv	v8, v8, v9
	vmv.x.s	a1, v8
	beq	a3, a2, .LBB0_15
	andi	a4, a2, 192
	beqz	a4, .LBB0_13
.LBB0_10:
	mv	a4, a3
	addi	a3, a6, 192
	and	a3, a3, a2
	li	a5, 64
	vsetvli	zero, a5, e32, mf2, ta, mu
	vmv.v.i	v8, 1
	vsetvli	zero, zero, e32, mf2, tu, mu
	vmv.s.x	v8, a1
	sh2add	a1, a4, a0
	sub	a4, a4, a3
.LBB0_11:
	vsetvli	zero, zero, e32, mf2, ta, mu
	vle32.v	v9, (a1)
	vmul.vv	v8, v9, v8
	addi	a4, a4, 64
	addi	a1, a1, 256
	bnez	a4, .LBB0_11
	li	a1, 64
	li	a4, 32
	vsetvli	zero, a1, e32, mf2, ta, mu
	vslidedown.vx	v9, v8, a4
	vmul.vv	v8, v8, v9
	vslidedown.vi	v9, v8, 16
	vmul.vv	v8, v8, v9
	vslidedown.vi	v9, v8, 8
	vmul.vv	v8, v8, v9
	vslidedown.vi	v9, v8, 4
	vmul.vv	v8, v8, v9
	vslidedown.vi	v9, v8, 2
	vmul.vv	v8, v8, v9
	vrgather.vi	v9, v8, 1
	vmul.vv	v8, v8, v9
	vmv.x.s	a1, v8
	beq	a3, a2, .LBB0_15
.LBB0_13:
	sh2add	a0, a3, a0
	sub	a2, a2, a3
.LBB0_14:
	lw	a3, 0(a0)
	mulw	a1, a3, a1
	addi	a2, a2, -1
	addi	a0, a0, 4
	bnez	a2, .LBB0_14
.LBB0_15:
	mv	a0, a1
	ret
.Lfunc_end0:
	.size	vector_reduce_mul_i32, .Lfunc_end0-vector_reduce_mul_i32

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 954c1ed009d423ca9593ee63479a9394a23864fd)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
