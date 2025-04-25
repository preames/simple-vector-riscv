	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zihintntl1p0_zihintpause2p0_zihpm2p0_zimop1p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zawrs1p0_zfa1p0_zfhmin1p0_zca1p0_zcb1p0_zcd1p0_zcmop1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0_zvbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfhmin1p0_zvkb1p0_zvkt1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl512b1p0_zvl64b1p0_supm1p0"
	.file	"openblas_gepb_16x4.c"
	.text
	.globl	test                            # -- Begin function test
	.p2align	1
	.type	test,@function
test:                                   # @test
	.cfi_startproc
# %bb.0:                                # %entry
	addi	a4, a0, 16
	vsetivli	zero, 16, e32, m1, ta, ma
	vle32.v	v8, (a0)
	vsetivli	zero, 2, e32, mf2, ta, ma
	vle32.v	v16, (a1)
	li	a3, 32
	csrr	a5, vlenb
	addi	a1, a1, 8
	vle32.v	v18, (a1)
	addi	a1, a2, 128
	vsetvli	zero, a3, e16, m1, ta, ma
	vid.v	v10
	srli	a5, a5, 2
	vle32.v	v12, (a2)
	vsrl.vi	v19, v10, 4
	vmv2r.v	v10, v8
	vslidedown.vx	v20, v19, a5
	vsetvli	zero, zero, e32, m2, ta, ma
	vslideup.vi	v10, v8, 16
	vsetvli	a5, zero, e32, m1, ta, ma
	vrgatherei16.vv	v15, v16, v20
	vrgatherei16.vv	v14, v16, v19
	vsetvli	zero, a3, e32, m2, ta, ma
	vfmacc.vv	v12, v10, v14
	vsetivli	zero, 4, e32, mf2, ta, ma
	vle32.v	v14, (a0)
	vsetvli	a0, zero, e32, m1, ta, ma
	vrgatherei16.vv	v17, v18, v20
	vrgatherei16.vv	v16, v18, v19
	vsetivli	zero, 2, e32, mf2, ta, ma
	vle32.v	v18, (a4)
	vsetivli	zero, 4, e32, m2, tu, ma
	vmv.v.v	v10, v14
	vsetvli	zero, a3, e32, m2, ta, ma
	vle32.v	v14, (a1)
	vsetivli	zero, 4, e32, m1, ta, ma
	vslidedown.vi	v8, v8, 8
	vsetvli	zero, a3, e32, m2, ta, ma
	vse32.v	v12, (a2)
	vsetivli	zero, 12, e32, m2, tu, ma
	vslideup.vi	v10, v8, 8
	vsetivli	zero, 6, e32, m2, tu, ma
	vslideup.vi	v10, v18, 4
	vsetvli	zero, a3, e32, m2, ta, ma
	vfmacc.vv	v14, v16, v10
	vse32.v	v14, (a1)
	ret
.Lfunc_end0:
	.size	test, .Lfunc_end0-test
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
