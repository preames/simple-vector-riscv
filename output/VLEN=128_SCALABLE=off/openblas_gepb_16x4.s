	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"openblas_gepb_16x4.c"
	.globl	test
	.p2align	1
	.type	test,@function
test:
	flw	ft5, 8(a0)
	flw	ft6, 4(a0)
	flw	ft7, 0(a0)
	flw	ft0, 60(a0)
	flw	ft1, 56(a0)
	flw	ft2, 52(a0)
	flw	ft3, 48(a0)
	flw	ft4, 44(a0)
	flw	fa0, 40(a0)
	flw	fa1, 36(a0)
	flw	fa2, 32(a0)
	flw	fa3, 28(a0)
	flw	fa4, 24(a0)
	flw	fa5, 20(a0)
	flw	fa6, 16(a0)
	flw	fa7, 12(a0)
	vsetivli	zero, 4, e32, m1, ta, ma
	vle32.v	v8, (a1)
	li	a0, 64
	vlse32.v	v9, (a2), a0
	vfmacc.vf	v9, ft7, v8
	vsse32.v	v9, (a2), a0
	addi	a1, a2, 4
	vlse32.v	v9, (a1), a0
	vfmacc.vf	v9, ft6, v8
	vsse32.v	v9, (a1), a0
	addi	a1, a2, 8
	vlse32.v	v9, (a1), a0
	vfmacc.vf	v9, ft5, v8
	vsse32.v	v9, (a1), a0
	addi	a1, a2, 12
	vlse32.v	v9, (a1), a0
	vfmacc.vf	v9, fa7, v8
	vsse32.v	v9, (a1), a0
	addi	a1, a2, 16
	vlse32.v	v9, (a1), a0
	vfmacc.vf	v9, fa6, v8
	vsse32.v	v9, (a1), a0
	addi	a1, a2, 20
	vlse32.v	v9, (a1), a0
	vfmacc.vf	v9, fa5, v8
	vsse32.v	v9, (a1), a0
	addi	a1, a2, 24
	vlse32.v	v9, (a1), a0
	vfmacc.vf	v9, fa4, v8
	vsse32.v	v9, (a1), a0
	addi	a1, a2, 28
	vlse32.v	v9, (a1), a0
	vfmacc.vf	v9, fa3, v8
	vsse32.v	v9, (a1), a0
	addi	a1, a2, 32
	vlse32.v	v9, (a1), a0
	vfmacc.vf	v9, fa2, v8
	vsse32.v	v9, (a1), a0
	addi	a1, a2, 36
	vlse32.v	v9, (a1), a0
	vfmacc.vf	v9, fa1, v8
	vsse32.v	v9, (a1), a0
	addi	a1, a2, 40
	vlse32.v	v9, (a1), a0
	vfmacc.vf	v9, fa0, v8
	vsse32.v	v9, (a1), a0
	addi	a1, a2, 44
	vlse32.v	v9, (a1), a0
	vfmacc.vf	v9, ft4, v8
	vsse32.v	v9, (a1), a0
	addi	a1, a2, 48
	vlse32.v	v9, (a1), a0
	vfmacc.vf	v9, ft3, v8
	vsse32.v	v9, (a1), a0
	addi	a1, a2, 52
	vlse32.v	v9, (a1), a0
	vfmacc.vf	v9, ft2, v8
	vsse32.v	v9, (a1), a0
	addi	a1, a2, 56
	vlse32.v	v9, (a1), a0
	vfmacc.vf	v9, ft1, v8
	vsse32.v	v9, (a1), a0
	addi	a1, a2, 60
	vlse32.v	v9, (a1), a0
	vfmacc.vf	v9, ft0, v8
	vsse32.v	v9, (a1), a0
	ret
.Lfunc_end0:
	.size	test, .Lfunc_end0-test

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git a819f6c8d1f4909a1ac3a2eff390236e4e31dba3)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
