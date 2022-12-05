	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl512b1p0_zvl64b1p0"
	.file	"riscv_vspec_example_a2.c"
	.globl	example_a2
	.p2align	1
	.type	example_a2,@function
example_a2:
	beqz	a3, .LBB0_11
	li	a4, 128
	zext.w	a6, a3
	bltu	a3, a4, .LBB0_3
	sub	a3, a1, a0
	sltiu	a3, a3, 128
	sub	a4, a1, a2
	sltiu	a4, a4, 128
	or	a3, a3, a4
	beqz	a3, .LBB0_8
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
	andi	a7, a6, -128
	li	a3, 64
	vsetvli	zero, a3, e8, m1, ta, ma
	vmv.v.i	v10, 1
	mv	t0, a7
	mv	a4, a1
	mv	a3, a2
	mv	a5, a0
.LBB0_9:
	addi	t1, a5, 64
	vle8.v	v8, (a5)
	vle8.v	v9, (t1)
	vmsleu.vi	v8, v8, 4
	vmsleu.vi	v9, v9, 4
	vmv1r.v	v0, v8
	vle8.v	v11, (a3), v0.t
	addi	t1, a3, 64
	vmv1r.v	v0, v9
	vle8.v	v12, (t1), v0.t
	addi	t1, a4, 64
	vmv1r.v	v0, v8
	vmerge.vvm	v8, v10, v11, v0
	vmv1r.v	v0, v9
	vmerge.vvm	v9, v10, v12, v0
	vse8.v	v8, (a4)
	vse8.v	v9, (t1)
	addi	a5, a5, 128
	addi	a3, a3, 128
	addi	t0, t0, -128
	addi	a4, a4, 128
	bnez	t0, .LBB0_9
	bne	a7, a6, .LBB0_4
.LBB0_11:
	ret
.Lfunc_end0:
	.size	example_a2, .Lfunc_end0-example_a2

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git b77533306876fc807e58e355d95d848a0077131f)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
