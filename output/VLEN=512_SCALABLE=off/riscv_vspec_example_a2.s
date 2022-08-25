	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"riscv_vspec_example_a2.c"
	.globl	example_a2
	.p2align	1
	.type	example_a2,@function
example_a2:
	beqz	a3, .LBB0_17
	li	a4, 32
	zext.w	a6, a3
	bltu	a3, a4, .LBB0_3
	sub	a4, a1, a0
	sltiu	a4, a4, 64
	sub	a5, a1, a2
	sltiu	a5, a5, 64
	or	a4, a4, a5
	beqz	a4, .LBB0_8
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
	beqz	a3, .LBB0_17
.LBB0_6:
	lbu	a4, 0(a0)
	li	a5, 1
	bltu	a6, a4, .LBB0_5
	lbu	a5, 0(a2)
	j	.LBB0_5
.LBB0_8:
	li	a5, -64
	li	a4, 64
	zext.w	t0, a5
	bgeu	a3, a4, .LBB0_10
	li	a7, 0
	j	.LBB0_14
.LBB0_10:
	and	a7, a6, t0
	vsetvli	zero, a4, e8, m1, ta, mu
	vmv.v.i	v8, 1
	mv	t1, a7
	mv	a4, a1
	mv	a5, a2
	mv	a3, a0
.LBB0_11:
	vle8.v	v9, (a3)
	vmsleu.vi	v0, v9, 4
	vle8.v	v9, (a5), v0.t
	vmerge.vvm	v9, v8, v9, v0
	vse8.v	v9, (a4)
	addi	a3, a3, 64
	addi	a5, a5, 64
	addi	t1, t1, -64
	addi	a4, a4, 64
	bnez	t1, .LBB0_11
	beq	a7, a6, .LBB0_17
	andi	a3, a6, 32
	beqz	a3, .LBB0_4
.LBB0_14:
	mv	a5, a7
	addi	a3, t0, 32
	and	a7, a6, a3
	add	t0, a0, a5
	add	t1, a2, a5
	add	a3, a1, a5
	sub	a5, a5, a7
	li	a4, 32
	vsetvli	zero, a4, e8, mf2, ta, mu
	vmv.v.i	v8, 1
.LBB0_15:
	vle8.v	v9, (t0)
	vmsleu.vi	v0, v9, 4
	vle8.v	v9, (t1), v0.t
	vmerge.vvm	v9, v8, v9, v0
	vse8.v	v9, (a3)
	addi	t0, t0, 32
	addi	t1, t1, 32
	addi	a5, a5, 32
	addi	a3, a3, 32
	bnez	a5, .LBB0_15
	bne	a7, a6, .LBB0_4
.LBB0_17:
	ret
.Lfunc_end0:
	.size	example_a2, .Lfunc_end0-example_a2

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 86b67a310dedf4d0c6a5bc012d8bee7dbac1d2ad)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
