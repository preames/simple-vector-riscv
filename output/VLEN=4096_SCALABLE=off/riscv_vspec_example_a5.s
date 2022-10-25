	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl1024b1p0_zvl128b1p0_zvl2048b1p0_zvl256b1p0_zvl32b1p0_zvl4096b1p0_zvl512b1p0_zvl64b1p0"
	.file	"riscv_vspec_example_a5.c"
	.globl	saxpy
	.p2align	1
	.type	saxpy,@function
saxpy:
	blez	a0, .LBB0_6
	li	a3, 64
	bltu	a0, a3, .LBB0_3
	sh2add	a3, a0, a2
	sh2add	a4, a0, a1
	sltu	a4, a2, a4
	sltu	a3, a1, a3
	and	a3, a3, a4
	beqz	a3, .LBB0_7
.LBB0_3:
	li	a6, 0
.LBB0_4:
	sub	a0, a0, a6
	sh2add	a2, a6, a2
	sh2add	a1, a6, a1
.LBB0_5:
	flw	ft0, 0(a1)
	flw	ft1, 0(a2)
	fmadd.s	ft0, fa0, ft0, ft1
	fsw	ft0, 0(a2)
	addi	a0, a0, -1
	addi	a2, a2, 4
	addi	a1, a1, 4
	bnez	a0, .LBB0_5
.LBB0_6:
	ret
.LBB0_7:
	li	a3, 256
	bgeu	a0, a3, .LBB0_9
	li	a6, 0
	j	.LBB0_13
.LBB0_9:
	andi	a6, a0, -256
	li	a3, 128
	vsetvli	zero, a3, e32, m1, ta, ma
	vfmv.v.f	v8, fa0
	mv	a4, a6
	mv	a5, a2
	mv	a3, a1
.LBB0_10:
	addi	a7, a5, 512
	addi	t0, a3, 512
	vle32.v	v9, (a3)
	vle32.v	v10, (t0)
	vle32.v	v11, (a5)
	vle32.v	v12, (a7)
	vfmacc.vv	v11, v8, v9
	vfmacc.vv	v12, v8, v10
	vse32.v	v11, (a5)
	vse32.v	v12, (a7)
	addi	a3, a3, 1024
	addi	a4, a4, -256
	addi	a5, a5, 1024
	bnez	a4, .LBB0_10
	beq	a6, a0, .LBB0_6
	andi	a3, a0, 192
	beqz	a3, .LBB0_4
.LBB0_13:
	mv	a5, a6
	andi	a6, a0, -64
	li	a3, 64
	vsetvli	zero, a3, e32, mf2, ta, ma
	vfmv.v.f	v8, fa0
	sh2add	a3, a5, a1
	sh2add	a4, a5, a2
	sub	a5, a5, a6
.LBB0_14:
	vle32.v	v9, (a3)
	vle32.v	v10, (a4)
	vfmacc.vv	v10, v8, v9
	vse32.v	v10, (a4)
	addi	a3, a3, 256
	addi	a5, a5, 64
	addi	a4, a4, 256
	bnez	a5, .LBB0_14
	beq	a6, a0, .LBB0_6
	j	.LBB0_4
.Lfunc_end0:
	.size	saxpy, .Lfunc_end0-saxpy

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 6d859266803e2a9060c4e8770f92cc2c7bd05a3b)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
