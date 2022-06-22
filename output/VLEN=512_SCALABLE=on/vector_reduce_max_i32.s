	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_reduce_max_i32.c"
	.globl	vector_reduce_max_i32
	.p2align	1
	.type	vector_reduce_max_i32,@function
vector_reduce_max_i32:
	lui	a4, 807449
	beqz	a1, .LBB0_3
	li	a3, 8
	zext.w	a2, a1
	bgeu	a1, a3, .LBB0_4
	li	a3, 0
	addiw	a1, a4, 1871
	j	.LBB0_14
.LBB0_3:
	addiw	a0, a4, 1871
	ret
.LBB0_4:
	li	a3, -32
	zext.w	a6, a3
	li	a3, 32
	lui	a5, 807449
	bgeu	a1, a3, .LBB0_6
	li	a3, 0
	addiw	a1, a5, 1871
	j	.LBB0_10
.LBB0_6:
	and	a3, a2, a6
	addiw	a1, a5, 1871
	vsetivli	zero, 16, e32, m1, ta, mu
	vmv.v.x	v8, a1
	mv	a1, a3
	mv	a5, a0
	vmv.v.v	v9, v8
.LBB0_7:
	addi	a4, a5, 64
	vle32.v	v10, (a5)
	vle32.v	v11, (a4)
	vmax.vv	v8, v10, v8
	vmax.vv	v9, v11, v9
	addi	a1, a1, -32
	addi	a5, a5, 128
	bnez	a1, .LBB0_7
	vmax.vv	v8, v8, v9
	lui	a1, 524288
	vmv.s.x	v9, a1
	vredmax.vs	v8, v8, v9
	vmv.x.s	a1, v8
	beq	a3, a2, .LBB0_13
	andi	a4, a2, 24
	beqz	a4, .LBB0_14
.LBB0_10:
	mv	a4, a3
	addi	a3, a6, 24
	and	a3, a3, a2
	vsetivli	zero, 8, e32, mf2, ta, mu
	vmv.v.x	v8, a1
	sh2add	a1, a4, a0
	sub	a4, a4, a3
.LBB0_11:
	vle32.v	v9, (a1)
	vmax.vv	v8, v9, v8
	addi	a4, a4, 8
	addi	a1, a1, 32
	bnez	a4, .LBB0_11
	lui	a1, 524288
	vmv.s.x	v9, a1
	vredmax.vs	v8, v8, v9
	vmv.x.s	a1, v8
	bne	a3, a2, .LBB0_14
.LBB0_13:
	mv	a0, a1
	ret
.LBB0_14:
	sh2add	a0, a3, a0
	sub	a2, a2, a3
	mv	a3, a1
	j	.LBB0_16
.LBB0_15:
	addi	a2, a2, -1
	addi	a0, a0, 4
	mv	a3, a1
	beqz	a2, .LBB0_13
.LBB0_16:
	lw	a1, 0(a0)
	sext.w	a3, a3
	blt	a3, a1, .LBB0_15
	mv	a1, a3
	j	.LBB0_15
.Lfunc_end0:
	.size	vector_reduce_max_i32, .Lfunc_end0-vector_reduce_max_i32

	.ident	"clang version 15.0.0 (https://github.com/llvm/llvm-project.git 93dc8b18e7594c7c3b48744b9fa4034e13aac46f)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
