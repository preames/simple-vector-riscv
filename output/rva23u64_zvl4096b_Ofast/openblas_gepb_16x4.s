	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zihintntl1p0_zihintpause2p0_zihpm2p0_zimop1p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zawrs1p0_zfa1p0_zfhmin1p0_zca1p0_zcb1p0_zcd1p0_zcmop1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0_zvbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfhmin1p0_zvkb1p0_zvkt1p0_zvl1024b1p0_zvl128b1p0_zvl2048b1p0_zvl256b1p0_zvl32b1p0_zvl4096b1p0_zvl512b1p0_zvl64b1p0_supm1p0"
	.file	"openblas_gepb_16x4.c"
	.text
	.globl	test                            # -- Begin function test
	.p2align	1
	.type	test,@function
test:                                   # @test
	.cfi_startproc
# %bb.0:                                # %entry
	addi	a3, a0, 16
	vsetivli	zero, 16, e32, mf2, ta, ma
	vle32.v	v8, (a0)
	vsetivli	zero, 2, e32, mf2, ta, ma
	vle32.v	v9, (a1)
	li	a4, 32
	addi	a1, a1, 8
	vsetvli	zero, a4, e32, mf2, ta, ma
	vid.v	v10
	vle32.v	v11, (a2)
	vsrl.vi	v10, v10, 4
	vrgather.vv	v12, v9, v10
	vmv1r.v	v9, v8
	vslideup.vi	v9, v8, 16
	vfmacc.vv	v11, v9, v12
	vsetivli	zero, 2, e32, mf2, ta, ma
	vle32.v	v12, (a1)
	addi	a1, a2, 128
	vsetvli	zero, a4, e32, mf2, ta, ma
	vse32.v	v11, (a2)
	vsetivli	zero, 2, e32, mf2, ta, ma
	vle32.v	v11, (a3)
	vsetivli	zero, 4, e32, mf2, tu, ma
	vle32.v	v9, (a0)
	vsetvli	zero, a4, e32, mf2, ta, ma
	vrgather.vv	v13, v12, v10
	vle32.v	v10, (a1)
	vsetivli	zero, 4, e32, mf2, ta, ma
	vslidedown.vi	v8, v8, 8
	vsetivli	zero, 12, e32, mf2, tu, ma
	vslideup.vi	v9, v8, 8
	vsetivli	zero, 6, e32, mf2, tu, ma
	vslideup.vi	v9, v11, 4
	vsetvli	zero, a4, e32, mf2, ta, ma
	vfmacc.vv	v10, v13, v9
	vse32.v	v10, (a1)
	ret
.Lfunc_end0:
	.size	test, .Lfunc_end0-test
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
