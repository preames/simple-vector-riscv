	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl1024b1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl512b1p0_zvl64b1p0"
	.file	"riscv_vspec_example_a2.c"
	.globl	example_a2
	.p2align	1
	.type	example_a2,@function
example_a2:
	beqz	a3, .LBB0_11
	zext.w	a7, a3
	csrr	a3, vlenb
	slli	t0, a3, 1
	li	a4, 128
	maxu	a4, t0, a4
	bltu	a7, a4, .LBB0_3
	sub	a4, a1, a0
	sub	a5, a1, a2
	minu	a4, a4, a5
	bgeu	a4, t0, .LBB0_8
.LBB0_3:
	li	a5, 0
.LBB0_4:
	add	a0, a0, a5
	add	a2, a2, a5
	add	a1, a1, a5
	sub	a3, a7, a5
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
	li	a4, 0
	addi	a5, t0, -1
	and	a6, a7, a5
	sub	a5, a7, a6
	add	t1, a0, a3
	add	t2, a2, a3
	add	t3, a1, a3
	vsetvli	a3, zero, e8, m1, ta, ma
	vmv.v.i	v10, 1
.LBB0_9:
	add	a3, a0, a4
	vl1r.v	v8, (a3)
	add	a3, t1, a4
	vl1r.v	v9, (a3)
	vmsleu.vi	v8, v8, 4
	vmsleu.vi	v9, v9, 4
	add	a3, a2, a4
	vmv1r.v	v0, v8
	vle8.v	v11, (a3), v0.t
	add	a3, t2, a4
	vmv1r.v	v0, v9
	vle8.v	v12, (a3), v0.t
	vmv1r.v	v0, v8
	vmerge.vvm	v8, v10, v11, v0
	vmv1r.v	v0, v9
	vmerge.vvm	v9, v10, v12, v0
	add	a3, a1, a4
	vs1r.v	v8, (a3)
	add	a3, t3, a4
	add	a4, a4, t0
	vs1r.v	v9, (a3)
	bne	a5, a4, .LBB0_9
	bnez	a6, .LBB0_4
.LBB0_11:
	ret
.Lfunc_end0:
	.size	example_a2, .Lfunc_end0-example_a2

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 49caf7012170422afa84868598063818f9344228)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
