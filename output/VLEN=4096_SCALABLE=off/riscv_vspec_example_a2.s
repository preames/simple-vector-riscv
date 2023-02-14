	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"riscv_vspec_example_a2.c"
	.globl	example_a2
	.p2align	1
	.type	example_a2,@function
example_a2:
	beqz	a3, .LBB0_11
	li	a4, 64
	zext.w	a6, a3
	bltu	a3, a4, .LBB0_3
	sub	a3, a1, a0
	sub	a5, a1, a2
	minu	a3, a3, a5
	bgeu	a3, a4, .LBB0_8
.LBB0_3:
	li	a7, 0
.LBB0_4:
	add	a0, a0, a7
	add	a2, a2, a7
	add	a1, a1, a7
	sub	a3, a6, a7
	li	a6, 4
	j	.LBB0_6
.LBB0_5:
	sb	a5, 0(a1)
	addi	a0, a0, 1
	addi	a2, a2, 1
	addi	a3, a3, -1
	addi	a1, a1, 1
	beqz	a3, .LBB0_11
.LBB0_6:
	lbu	a4, 0(a0)
	li	a5, 1
	bltu	a6, a4, .LBB0_5
	lbu	a5, 0(a2)
	j	.LBB0_5
.LBB0_8:
	andi	a7, a6, -64
	li	a3, 32
	vsetvli	zero, a3, e8, m2, ta, ma
	vmv.v.i	v10, 1
	mv	t0, a7
	mv	a4, a1
	mv	a3, a2
	mv	a5, a0
.LBB0_9:
	addi	t1, a5, 32
	vle8.v	v12, (a5)
	vle8.v	v14, (t1)
	vmsleu.vi	v8, v12, 4
	vmsleu.vi	v9, v14, 4
	vmv1r.v	v0, v8
	vle8.v	v12, (a3), v0.t
	addi	t1, a3, 32
	vmv1r.v	v0, v9
	vle8.v	v14, (t1), v0.t
	addi	t1, a4, 32
	vmv1r.v	v0, v8
	vmerge.vvm	v12, v10, v12, v0
	vmv1r.v	v0, v9
	vmerge.vvm	v8, v10, v14, v0
	vse8.v	v12, (a4)
	vse8.v	v8, (t1)
	addi	a5, a5, 64
	addi	a3, a3, 64
	addi	t0, t0, -64
	addi	a4, a4, 64
	bnez	t0, .LBB0_9
	bne	a7, a6, .LBB0_4
.LBB0_11:
	ret
.Lfunc_end0:
	.size	example_a2, .Lfunc_end0-example_a2

	.ident	"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 8c3a8d17c8a154894895c48a304a04df9ece4328)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
