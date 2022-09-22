	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"riscv_vspec_example_a5.c"
	.globl	saxpy
	.p2align	1
	.type	saxpy,@function
saxpy:
	blez	a0, .LBB0_3
	fmv.w.x	ft0, a1
.LBB0_2:
	flw	ft1, 0(a2)
	flw	ft2, 0(a3)
	fmadd.s	ft1, ft0, ft1, ft2
	fsw	ft1, 0(a3)
	addi	a0, a0, -1
	addi	a3, a3, 4
	addi	a2, a2, 4
	bnez	a0, .LBB0_2
.LBB0_3:
	ret
.Lfunc_end0:
	.size	saxpy, .Lfunc_end0-saxpy

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 0cf0a120fd4242dfc047116ea6a506874c1ea3d0)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
