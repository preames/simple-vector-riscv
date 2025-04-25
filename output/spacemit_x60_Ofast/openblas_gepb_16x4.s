	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zifencei2p0_zihintpause2p0_zihpm2p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zfh1p0_zfhmin1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zbc1p0_zbkc1p0_zbs1p0_zkt1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfh1p0_zvfhmin1p0_zvkt1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0_ssccptr1p0_sscofpmf1p0_sscounterenw1p0_sstc1p0_sstvala1p0_sstvecd1p0_svade1p0_svbare1p0_svinval1p0_svnapot1p0_svpbmt1p0"
	.file	"openblas_gepb_16x4.c"
	.text
	.globl	test                            # -- Begin function test
	.p2align	1
	.type	test,@function
test:                                   # @test
	.cfi_startproc
# %bb.0:                                # %entry
	vsetivli	zero, 16, e32, m2, ta, ma
	vle32.v	v10, (a0)
	vle32.v	v8, (a2)
	flw	fa5, 0(a1)
	flw	fa4, 4(a1)
	flw	fa3, 8(a1)
	flw	fa2, 12(a1)
	vfmacc.vf	v8, fa5, v10
	addi	a1, a2, 64
	addi	a3, a0, 32
	addi	a4, a0, 48
	vsetivli	zero, 8, e32, m1, ta, ma
	vle32.v	v12, (a0)
	vsetivli	zero, 2, e32, mf2, ta, ma
	vle32.v	v14, (a4)
	vsetivli	zero, 4, e32, mf2, ta, ma
	vle32.v	v16, (a3)
	vsetivli	zero, 16, e32, m2, ta, ma
	vle32.v	v18, (a1)
	vsetivli	zero, 14, e32, m2, tu, ma
	vslideup.vi	v10, v14, 12
	vsetivli	zero, 8, e32, m2, tu, ma
	vmv.v.v	v10, v12
	vsetivli	zero, 12, e32, m2, tu, ma
	vslideup.vi	v10, v16, 8
	vsetivli	zero, 16, e32, m2, ta, ma
	vfmacc.vf	v18, fa4, v10
	addi	a0, a2, 128
	vle32.v	v10, (a0)
	vsetivli	zero, 12, e32, m2, tu, ma
	vslideup.vi	v12, v16, 8
	vsetivli	zero, 4, e32, mf2, ta, ma
	vle32.v	v16, (a4)
	vsetivli	zero, 16, e32, m2, ta, ma
	vslideup.vi	v12, v16, 12
	vfmacc.vf	v10, fa3, v12
	addi	a3, a2, 192
	vse32.v	v8, (a2)
	vle32.v	v8, (a3)
	vse32.v	v18, (a1)
	vsetivli	zero, 14, e32, m2, tu, ma
	vslideup.vi	v12, v14, 12
	vsetivli	zero, 16, e32, m2, ta, ma
	vse32.v	v10, (a0)
	vfmacc.vf	v8, fa2, v12
	vse32.v	v8, (a3)
	ret
.Lfunc_end0:
	.size	test, .Lfunc_end0-test
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
