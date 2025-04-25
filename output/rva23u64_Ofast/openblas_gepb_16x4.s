	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zihintntl1p0_zihintpause2p0_zihpm2p0_zimop1p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zawrs1p0_zfa1p0_zfhmin1p0_zca1p0_zcb1p0_zcd1p0_zcmop1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0_zvbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfhmin1p0_zvkb1p0_zvkt1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0_supm1p0"
	.file	"openblas_gepb_16x4.c"
	.text
	.globl	test                            # -- Begin function test
	.p2align	1
	.type	test,@function
test:                                   # @test
	.cfi_startproc
# %bb.0:                                # %entry
	addi	a6, a2, 32
	addi	a7, a0, 32
	vsetivli	zero, 8, e32, m2, ta, ma
	vle32.v	v12, (a0)
	vle32.v	v8, (a2)
	vle32.v	v14, (a7)
	vle32.v	v10, (a6)
	flw	fa4, 0(a1)
	flw	fa3, 4(a1)
	flw	fa2, 8(a1)
	flw	fa5, 12(a1)
	vfmacc.vf	v8, fa4, v12
	vfmacc.vf	v10, fa4, v14
	addi	a1, a0, 48
	addi	a5, a2, 64
	addi	t0, a2, 96
	addi	a3, a2, 128
	vle32.v	v18, (a5)
	vsetivli	zero, 4, e32, m1, ta, ma
	vle32.v	v20, (a7)
	vsetivli	zero, 2, e32, mf2, ta, ma
	vle32.v	v22, (a1)
	vsetivli	zero, 8, e32, m2, ta, ma
	vle32.v	v16, (t0)
	vsetivli	zero, 6, e32, m2, tu, ma
	vslideup.vi	v14, v22, 4
	vsetivli	zero, 8, e32, m2, ta, ma
	vle32.v	v22, (a3)
	vfmacc.vf	v18, fa3, v12
	vsetivli	zero, 4, e32, m2, tu, ma
	vmv.v.v	v14, v20
	vsetivli	zero, 8, e32, m2, ta, ma
	vfmacc.vf	v16, fa3, v14
	addi	a4, a2, 160
	vle32.v	v14, (a4)
	vfmacc.vf	v22, fa2, v12
	vsetivli	zero, 4, e32, m1, ta, ma
	vle32.v	v12, (a1)
	vsetivli	zero, 8, e32, m2, ta, ma
	vslideup.vi	v20, v12, 4
	vfmacc.vf	v14, fa2, v20
	vle32.v	v20, (a0)
	addi	a0, a2, 192
	vse32.v	v8, (a2)
	vle32.v	v8, (a0)
	vse32.v	v10, (a6)
	vse32.v	v18, (a5)
	vse32.v	v22, (a3)
	vfmacc.vf	v8, fa5, v20
	vsetivli	zero, 4, e32, m1, ta, ma
	vle32.v	v10, (a7)
	vsetivli	zero, 8, e32, m2, ta, ma
	vse32.v	v8, (a0)
	addi	a0, a2, 224
	vslideup.vi	v10, v12, 4
	vsetivli	zero, 2, e32, mf2, ta, ma
	vle32.v	v8, (a1)
	vsetivli	zero, 8, e32, m2, ta, ma
	vse32.v	v16, (t0)
	vle32.v	v12, (a0)
	vse32.v	v14, (a4)
	vsetivli	zero, 6, e32, m2, tu, ma
	vslideup.vi	v10, v8, 4
	vsetivli	zero, 8, e32, m2, ta, ma
	vfmacc.vf	v12, fa5, v10
	vse32.v	v12, (a0)
	ret
.Lfunc_end0:
	.size	test, .Lfunc_end0-test
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
