	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicsr2p0_zihintpause2p0_zihpm2p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zfhmin1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"openblas_gepb_16x4.c"
	.text
	.globl	test                            # -- Begin function test
	.p2align	1
	.type	test,@function
test:                                   # @test
	.cfi_startproc
# %bb.0:                                # %entry
	addi	a3, a2, 4
	flw	fa2, 48(a0)
	flw	fa3, 52(a0)
	flw	fa4, 56(a0)
	flw	fa5, 60(a0)
	flw	ft1, 32(a0)
	flw	ft0, 36(a0)
	flw	fa0, 40(a0)
	flw	fa1, 44(a0)
	flw	ft2, 16(a0)
	flw	ft3, 20(a0)
	flw	ft4, 24(a0)
	flw	ft5, 28(a0)
	vsetivli	zero, 4, e32, m1, ta, ma
	vle32.v	v8, (a1)
	li	a1, 64
	vlse32.v	v9, (a2), a1
	flw	ft6, 0(a0)
	flw	ft7, 4(a0)
	flw	fa6, 8(a0)
	flw	fa7, 12(a0)
	vfmacc.vf	v9, ft6, v8
	vsse32.v	v9, (a2), a1
	vlse32.v	v9, (a3), a1
	addi	a0, a2, 8
	vfmacc.vf	v9, ft7, v8
	vsse32.v	v9, (a3), a1
	vlse32.v	v9, (a0), a1
	addi	a3, a2, 12
	vfmacc.vf	v9, fa6, v8
	vsse32.v	v9, (a0), a1
	vlse32.v	v9, (a3), a1
	addi	a0, a2, 16
	vfmacc.vf	v9, fa7, v8
	vsse32.v	v9, (a3), a1
	vlse32.v	v9, (a0), a1
	addi	a3, a2, 20
	vfmacc.vf	v9, ft2, v8
	vsse32.v	v9, (a0), a1
	vlse32.v	v9, (a3), a1
	addi	a0, a2, 24
	vfmacc.vf	v9, ft3, v8
	vsse32.v	v9, (a3), a1
	vlse32.v	v9, (a0), a1
	addi	a3, a2, 28
	vfmacc.vf	v9, ft4, v8
	vsse32.v	v9, (a0), a1
	vlse32.v	v9, (a3), a1
	addi	a0, a2, 32
	vfmacc.vf	v9, ft5, v8
	vsse32.v	v9, (a3), a1
	vlse32.v	v9, (a0), a1
	addi	a3, a2, 36
	vfmacc.vf	v9, ft1, v8
	vsse32.v	v9, (a0), a1
	vlse32.v	v9, (a3), a1
	addi	a0, a2, 40
	vfmacc.vf	v9, ft0, v8
	vsse32.v	v9, (a3), a1
	vlse32.v	v9, (a0), a1
	addi	a3, a2, 44
	vfmacc.vf	v9, fa0, v8
	vsse32.v	v9, (a0), a1
	vlse32.v	v9, (a3), a1
	addi	a0, a2, 48
	vfmacc.vf	v9, fa1, v8
	vsse32.v	v9, (a3), a1
	vlse32.v	v9, (a0), a1
	addi	a3, a2, 52
	vfmacc.vf	v9, fa2, v8
	vsse32.v	v9, (a0), a1
	vlse32.v	v9, (a3), a1
	addi	a0, a2, 56
	vfmacc.vf	v9, fa3, v8
	vsse32.v	v9, (a3), a1
	vlse32.v	v9, (a0), a1
	addi	a2, a2, 60
	vfmacc.vf	v9, fa4, v8
	vsse32.v	v9, (a0), a1
	vlse32.v	v9, (a2), a1
	vfmacc.vf	v9, fa5, v8
	vsse32.v	v9, (a2), a1
	ret
.Lfunc_end0:
	.size	test, .Lfunc_end0-test
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
