	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_reduce_add_i8.c"
	.globl	vector_reduce_add_i32
	.p2align	1
	.type	vector_reduce_add_i32,@function
vector_reduce_add_i32:
	beqz	a1, .LBB0_14
	li	a3, 64
	zext.w	a2, a1
	bgeu	a1, a3, .LBB0_3
	li	a3, 0
	li	a1, 0
	j	.LBB0_12
.LBB0_3:
	li	a3, -256
	li	a5, 256
	zext.w	a6, a3
	bgeu	a1, a5, .LBB0_5
	li	a1, 0
	li	a3, 0
	j	.LBB0_9
.LBB0_5:
	and	a3, a2, a6
	li	a1, 128
	vsetvli	zero, a1, e32, m1, ta, mu
	vmv.v.i	v8, 0
	mv	a1, a3
	mv	a5, a0
	vmv.v.i	v9, 0
.LBB0_6:
	vsetvli	zero, zero, e16, mf2, ta, mu
	vle8.v	v10, (a5)
	addi	a4, a5, 128
	vle8.v	v11, (a4)
	vmv1r.v	v12, v9
	vmv1r.v	v9, v8
	vzext.vf2	v13, v10
	vwaddu.wv	v8, v9, v13
	vzext.vf2	v10, v11
	vwaddu.wv	v9, v12, v10
	addi	a1, a1, -256
	addi	a5, a5, 256
	bnez	a1, .LBB0_6
	li	a1, 128
	vsetvli	zero, a1, e32, m1, ta, mu
	vadd.vv	v8, v9, v8
	vsetivli	zero, 1, e32, m1, ta, mu
	vmv.s.x	v9, zero
	vsetvli	zero, a1, e32, m1, ta, mu
	vredsum.vs	v8, v8, v9
	vmv.x.s	a1, v8
	beq	a3, a2, .LBB0_14
	andi	a4, a2, 192
	beqz	a4, .LBB0_12
.LBB0_9:
	mv	a4, a3
	addi	a3, a6, 192
	and	a3, a3, a2
	li	a5, 64
	vsetvli	zero, a5, e32, mf2, ta, mu
	vmv.v.i	v8, 0
	vsetvli	zero, zero, e32, mf2, tu, mu
	vmv.s.x	v8, a1
	add	a1, a0, a4
	sub	a4, a4, a3
.LBB0_10:
	vsetvli	zero, zero, e16, mf4, ta, mu
	vle8.v	v9, (a1)
	vmv1r.v	v10, v8
	vzext.vf2	v11, v9
	vwaddu.wv	v8, v10, v11
	addi	a4, a4, 64
	addi	a1, a1, 64
	bnez	a4, .LBB0_10
	vsetivli	zero, 1, e32, m1, ta, mu
	vmv.s.x	v9, zero
	li	a1, 64
	vsetvli	zero, a1, e32, mf2, ta, mu
	vredsum.vs	v8, v8, v9
	vmv.x.s	a1, v8
	beq	a3, a2, .LBB0_14
.LBB0_12:
	add	a0, a0, a3
	sub	a2, a2, a3
.LBB0_13:
	lbu	a3, 0(a0)
	addw	a1, a1, a3
	addi	a2, a2, -1
	addi	a0, a0, 1
	bnez	a2, .LBB0_13
.LBB0_14:
	mv	a0, a1
	ret
.Lfunc_end0:
	.size	vector_reduce_add_i32, .Lfunc_end0-vector_reduce_add_i32

	.ident	"clang version 15.0.0 (https://github.com/llvm/llvm-project.git 1e451369d2017830d3dbddec24063170b7aca0de)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
