	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"riscv_vspec_example_a5.c"
	.globl	saxpy
	.p2align	1
	.type	saxpy,@function
saxpy:
	blez	a0, .LBB0_6
	li	a4, 16
	fmv.w.x	ft0, a1
	bltu	a0, a4, .LBB0_3
	sh2add	a1, a0, a3
	sh2add	a4, a0, a2
	sltu	a4, a3, a4
	sltu	a1, a2, a1
	and	a1, a1, a4
	beqz	a1, .LBB0_7
.LBB0_3:
	li	a6, 0
.LBB0_4:
	sub	a0, a0, a6
	sh2add	a1, a6, a3
	sh2add	a2, a6, a2
.LBB0_5:
	flw	ft1, 0(a2)
	flw	ft2, 0(a1)
	fmadd.s	ft1, ft0, ft1, ft2
	fsw	ft1, 0(a1)
	addi	a0, a0, -1
	addi	a1, a1, 4
	addi	a2, a2, 4
	bnez	a0, .LBB0_5
.LBB0_6:
	ret
.LBB0_7:
	li	a1, 64
	bgeu	a0, a1, .LBB0_9
	li	a6, 0
	j	.LBB0_13
.LBB0_9:
	andi	a6, a0, -64
	li	a1, 32
	vsetvli	zero, a1, e32, m1, ta, mu
	vfmv.v.f	v8, ft0
	mv	a4, a6
	mv	a5, a3
	mv	a1, a2
.LBB0_10:
	addi	a7, a5, 128
	addi	t0, a1, 128
	vle32.v	v9, (a1)
	vle32.v	v10, (t0)
	vle32.v	v11, (a5)
	vle32.v	v12, (a7)
	vfmacc.vv	v11, v8, v9
	vfmacc.vv	v12, v8, v10
	vse32.v	v11, (a5)
	vse32.v	v12, (a7)
	addi	a1, a1, 256
	addi	a4, a4, -64
	addi	a5, a5, 256
	bnez	a4, .LBB0_10
	beq	a6, a0, .LBB0_6
	andi	a1, a0, 48
	beqz	a1, .LBB0_4
.LBB0_13:
	mv	a5, a6
	andi	a6, a0, -16
	vsetivli	zero, 16, e32, mf2, ta, mu
	vfmv.v.f	v8, ft0
	sh2add	a1, a5, a2
	sh2add	a4, a5, a3
	sub	a5, a5, a6
.LBB0_14:
	vle32.v	v9, (a1)
	vle32.v	v10, (a4)
	vfmacc.vv	v10, v8, v9
	vse32.v	v10, (a4)
	addi	a1, a1, 64
	addi	a5, a5, 16
	addi	a4, a4, 64
	bnez	a5, .LBB0_14
	beq	a6, a0, .LBB0_6
	j	.LBB0_4
.Lfunc_end0:
	.size	saxpy, .Lfunc_end0-saxpy

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 954c1ed009d423ca9593ee63479a9394a23864fd)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
