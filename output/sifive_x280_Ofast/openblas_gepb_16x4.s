	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zfh1p0_zfhmin1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfh1p0_zvfhmin1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl512b1p0_zvl64b1p0"
	.file	"openblas_gepb_16x4.c"
	.text
	.globl	test                            # -- Begin function test
	.p2align	1
	.type	test,@function
test:                                   # @test
	.cfi_startproc
# %bb.0:                                # %entry
	li	a3, 32
	csrr	a4, vlenb
	vsetvli	zero, a3, e16, m1, ta, ma
	vid.v	v8
	srli	a4, a4, 2
	vsrl.vi	v12, v8, 4
	vsetivli	zero, 2, e32, mf2, ta, ma
	vle32.v	v8, (a1)
	vsetvli	zero, a3, e16, m1, ta, ma
	addi	a1, a1, 8
	vslidedown.vx	v13, v12, a4
	vsetvli	a4, zero, e32, m1, ta, ma
	vrgatherei16.vv	v10, v8, v12
	vrgatherei16.vv	v11, v8, v13
	vsetivli	zero, 2, e32, mf2, ta, ma
	vle32.v	v14, (a1)
	vsetvli	a1, zero, e32, m1, ta, ma
	addi	a1, a2, 128
	vrgatherei16.vv	v9, v14, v13
	vrgatherei16.vv	v8, v14, v12
	vsetivli	zero, 16, e32, m1, ta, ma
	vle32.v	v12, (a0)
	vmv2r.v	v14, v12
	vsetvli	zero, a3, e32, m2, ta, ma
	vle32.v	v16, (a2)
	vslideup.vi	v14, v12, 16
	vfmacc.vv	v16, v14, v10
	vsetivli	zero, 4, e32, mf2, ta, ma
	vle32.v	v10, (a0)
	vsetivli	zero, 4, e32, m2, tu, ma
	addi	a0, a0, 16
	vmv.v.v	v14, v10
	vsetivli	zero, 4, e32, m1, ta, ma
	vslidedown.vi	v10, v12, 8
	vsetivli	zero, 12, e32, m2, tu, ma
	vslideup.vi	v14, v10, 8
	vsetivli	zero, 2, e32, mf2, ta, ma
	vle32.v	v10, (a0)
	vsetvli	zero, a3, e32, m2, ta, ma
	vle32.v	v12, (a1)
	vsetivli	zero, 6, e32, m2, tu, ma
	vslideup.vi	v14, v10, 4
	vsetvli	zero, a3, e32, m2, ta, ma
	vse32.v	v16, (a2)
	vfmacc.vv	v12, v8, v14
	vse32.v	v12, (a1)
	ret
.Lfunc_end0:
	.size	test, .Lfunc_end0-test
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
