	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"riscv_vspec_example_a2.c"
	.globl	example_a2
	.p2align	1
	.type	example_a2,@function
example_a2:
	beqz	a3, .LBB0_13
	li	a4, 32
	zext.w	a7, a3
	bgeu	a3, a4, .LBB0_3
	li	t0, 0
	j	.LBB0_14
.LBB0_3:
	sub	a4, a1, a0
	sltiu	a4, a4, 64
	sub	a5, a1, a2
	sltiu	a5, a5, 64
	or	a4, a4, a5
	li	t0, 0
	bnez	a4, .LBB0_14
	li	a5, -64
	li	a4, 64
	zext.w	a6, a5
	bgeu	a3, a4, .LBB0_6
	li	t0, 0
	j	.LBB0_10
.LBB0_6:
	and	t0, a7, a6
	vsetvli	zero, a4, e8, m1, ta, mu
	vmv.v.i	v8, 1
	mv	t1, t0
	mv	a4, a1
	mv	a5, a2
	mv	a3, a0
.LBB0_7:
	vle8.v	v9, (a3)
	vmsleu.vi	v0, v9, 4
	vle8.v	v9, (a5), v0.t
	vmerge.vvm	v9, v8, v9, v0
	vse8.v	v9, (a4)
	addi	a3, a3, 64
	addi	a5, a5, 64
	addi	t1, t1, -64
	addi	a4, a4, 64
	bnez	t1, .LBB0_7
	beq	t0, a7, .LBB0_13
	andi	a3, a7, 32
	beqz	a3, .LBB0_14
.LBB0_10:
	mv	a3, t0
	addi	a4, a6, 32
	and	t0, a7, a4
	add	a6, a0, a3
	add	t1, a2, a3
	add	a5, a1, a3
	sub	a3, a3, t0
	li	a4, 32
	vsetvli	zero, a4, e8, mf2, ta, mu
	vmv.v.i	v8, 1
.LBB0_11:
	vle8.v	v9, (a6)
	vmsleu.vi	v0, v9, 4
	vle8.v	v9, (t1), v0.t
	vmerge.vvm	v9, v8, v9, v0
	vse8.v	v9, (a5)
	addi	a6, a6, 32
	addi	t1, t1, 32
	addi	a3, a3, 32
	addi	a5, a5, 32
	bnez	a3, .LBB0_11
	bne	t0, a7, .LBB0_14
.LBB0_13:
	ret
.LBB0_14:
	add	a0, a0, t0
	add	a2, a2, t0
	add	a1, a1, t0
	sub	a3, a7, t0
	li	a6, 4
	j	.LBB0_16
.LBB0_15:
	sb	a5, 0(a1)
	addi	a0, a0, 1
	addi	a2, a2, 1
	addi	a3, a3, -1
	addi	a1, a1, 1
	beqz	a3, .LBB0_13
.LBB0_16:
	lbu	a4, 0(a0)
	li	a5, 1
	bltu	a6, a4, .LBB0_15
	lbu	a5, 0(a2)
	j	.LBB0_15
.Lfunc_end0:
	.size	example_a2, .Lfunc_end0-example_a2

	.ident	"clang version 15.0.0 (https://github.com/llvm/llvm-project.git 93dc8b18e7594c7c3b48744b9fa4034e13aac46f)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
