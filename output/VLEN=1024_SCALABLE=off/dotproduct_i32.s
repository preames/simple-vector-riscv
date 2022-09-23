	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"dotproduct_i32.c"
	.globl	dotproduct_i32
	.p2align	1
	.type	dotproduct_i32,@function
dotproduct_i32:
	beqz	a0, .LBB0_14
	li	a3, 16
	zext.w	a7, a0
	bgeu	a0, a3, .LBB0_3
	li	t0, 0
	li	a0, 0
	j	.LBB0_12
.LBB0_3:
	li	a3, -64
	li	a4, 64
	zext.w	a6, a3
	bgeu	a0, a4, .LBB0_5
	li	a0, 0
	li	t0, 0
	j	.LBB0_9
.LBB0_5:
	and	t0, a7, a6
	li	a0, 32
	vsetvli	zero, a0, e32, m1, ta, mu
	vmv.v.i	v8, 0
	mv	a0, t0
	mv	a5, a2
	mv	a3, a1
	vmv.v.i	v9, 0
.LBB0_6:
	addi	t1, a5, 128
	addi	a4, a3, 128
	vle32.v	v10, (a3)
	vle32.v	v11, (a4)
	vle32.v	v12, (a5)
	vle32.v	v13, (t1)
	vmacc.vv	v8, v12, v10
	vmacc.vv	v9, v13, v11
	addi	a3, a3, 256
	addi	a0, a0, -64
	addi	a5, a5, 256
	bnez	a0, .LBB0_6
	li	a0, 32
	vsetvli	zero, a0, e32, m1, ta, mu
	vadd.vv	v8, v9, v8
	vsetivli	zero, 1, e32, m1, ta, mu
	vmv.s.x	v9, zero
	vsetvli	zero, a0, e32, m1, ta, mu
	vredsum.vs	v8, v8, v9
	vmv.x.s	a0, v8
	beq	t0, a7, .LBB0_14
	andi	a3, a7, 48
	beqz	a3, .LBB0_12
.LBB0_9:
	mv	a4, t0
	addi	a3, a6, 48
	and	t0, a7, a3
	vsetivli	zero, 16, e32, mf2, ta, mu
	vmv.v.i	v8, 0
	vsetvli	zero, zero, e32, mf2, tu, mu
	vmv.s.x	v8, a0
	sh2add	a0, a4, a1
	sh2add	a3, a4, a2
	sub	a5, a4, t0
.LBB0_10:
	vsetvli	zero, zero, e32, mf2, ta, mu
	vle32.v	v9, (a0)
	vle32.v	v10, (a3)
	vmacc.vv	v8, v10, v9
	addi	a0, a0, 64
	addi	a5, a5, 16
	addi	a3, a3, 64
	bnez	a5, .LBB0_10
	vmv.s.x	v9, zero
	vredsum.vs	v8, v8, v9
	vmv.x.s	a0, v8
	beq	t0, a7, .LBB0_14
.LBB0_12:
	sh2add	a1, t0, a1
	sh2add	a2, t0, a2
	sub	a3, a7, t0
.LBB0_13:
	lw	a4, 0(a1)
	lw	a5, 0(a2)
	mulw	a4, a5, a4
	addw	a0, a0, a4
	addi	a1, a1, 4
	addi	a3, a3, -1
	addi	a2, a2, 4
	bnez	a3, .LBB0_13
.LBB0_14:
	ret
.Lfunc_end0:
	.size	dotproduct_i32, .Lfunc_end0-dotproduct_i32

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 954c1ed009d423ca9593ee63479a9394a23864fd)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
