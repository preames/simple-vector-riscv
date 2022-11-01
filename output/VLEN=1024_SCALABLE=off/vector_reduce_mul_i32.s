	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl1024b1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl512b1p0_zvl64b1p0"
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
	j	.LBB0_7
.LBB0_3:
	li	a0, 1
	ret
.LBB0_4:
	andi	a3, a2, -64
	li	a1, 32
	vsetvli	zero, a1, e32, m1, ta, ma
	vmv.v.i	v8, 1
	mv	a1, a3
	mv	a4, a0
	vmv.v.i	v9, 1
.LBB0_5:
	addi	a5, a4, 128
	vle32.v	v10, (a4)
	vle32.v	v11, (a5)
	vmul.vv	v8, v10, v8
	vmul.vv	v9, v11, v9
	addi	a1, a1, -64
	addi	a4, a4, 256
	bnez	a1, .LBB0_5
	li	a1, 32
	vsetvli	zero, a1, e32, m1, ta, ma
	vmul.vv	v8, v9, v8
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
	beq	a3, a2, .LBB0_9
.LBB0_7:
	sh2add	a0, a3, a0
	sub	a2, a2, a3
.LBB0_8:
	lw	a3, 0(a0)
	mulw	a1, a3, a1
	addi	a2, a2, -1
	addi	a0, a0, 4
	bnez	a2, .LBB0_8
.LBB0_9:
	mv	a0, a1
	ret
.Lfunc_end0:
	.size	vector_reduce_mul_i32, .Lfunc_end0-vector_reduce_mul_i32

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 9472a810ed33bc9e655484f43047eed07d50bc16)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
