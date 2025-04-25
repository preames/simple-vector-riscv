	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_h1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zifencei2p0_zihintntl1p0_zihintpause2p0_zihpm2p0_zimop1p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zawrs1p0_zfa1p0_zfbfmin1p0_zfh1p0_zfhmin1p0_zca1p0_zcb1p0_zcd1p0_zcmop1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0_zvbb1p0_zvbc1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfbfmin1p0_zvfbfwma1p0_zvfh1p0_zvfhmin1p0_zvkb1p0_zvkg1p0_zvkn1p0_zvknc1p0_zvkned1p0_zvkng1p0_zvknhb1p0_zvkt1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0_sha1p0_shcounterenw1p0_shgatpa1p0_shtvala1p0_shvsatpa1p0_shvstvala1p0_shvstvecd1p0_smaia1p0_ssaia1p0_ssccptr1p0_sscofpmf1p0_sscounterenw1p0_ssnpm1p0_ssstateen1p0_ssstrict1p0_sstc1p0_sstvala1p0_sstvecd1p0_ssu64xl1p0_supm1p0_svade1p0_svbare1p0_svinval1p0_svnapot1p0_svpbmt1p0"
	.file	"openblas_gepb_16x4.c"
	.text
	.globl	test                            # -- Begin function test
	.p2align	1
	.type	test,@function
test:                                   # @test
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sd	s0, 24(sp)                      # 8-byte Folded Spill
	sd	s1, 16(sp)                      # 8-byte Folded Spill
	sd	s2, 8(sp)                       # 8-byte Folded Spill
	.cfi_offset s0, -8
	.cfi_offset s1, -16
	.cfi_offset s2, -24
	flw	fa2, 48(a0)
	flw	fa3, 52(a0)
	flw	fa4, 56(a0)
	flw	fa5, 60(a0)
	vsetivli	zero, 4, e32, mf2, ta, ma
	vle32.v	v8, (a1)
	addi	s1, a2, 4
	addi	a3, a2, 8
	flw	fa1, 32(a0)
	flw	fa0, 36(a0)
	flw	ft0, 40(a0)
	flw	ft1, 44(a0)
	addi	s0, a2, 12
	addi	a5, a2, 16
	addi	a4, a2, 20
	addi	s2, a2, 24
	flw	ft2, 16(a0)
	flw	ft3, 20(a0)
	flw	ft4, 24(a0)
	flw	ft5, 28(a0)
	addi	t6, a2, 28
	addi	t5, a2, 32
	addi	t4, a2, 36
	addi	t3, a2, 40
	addi	t2, a2, 44
	addi	t1, a2, 48
	addi	t0, a2, 52
	addi	a7, a2, 56
	addi	a6, a2, 60
	flw	ft6, 0(a0)
	flw	ft7, 4(a0)
	flw	fa6, 8(a0)
	flw	fa7, 12(a0)
	li	a0, 64
	vlse32.v	v9, (a2), a0
	vfmacc.vf	v9, ft6, v8
	vsse32.v	v9, (a2), a0
	vlse32.v	v9, (s1), a0
	vfmacc.vf	v9, ft7, v8
	vsse32.v	v9, (s1), a0
	vlse32.v	v9, (a3), a0
	vfmacc.vf	v9, fa6, v8
	vsse32.v	v9, (a3), a0
	vlse32.v	v9, (s0), a0
	vfmacc.vf	v9, fa7, v8
	vsse32.v	v9, (s0), a0
	vlse32.v	v9, (a5), a0
	vfmacc.vf	v9, ft2, v8
	vsse32.v	v9, (a5), a0
	vlse32.v	v9, (a4), a0
	vfmacc.vf	v9, ft3, v8
	vsse32.v	v9, (a4), a0
	vlse32.v	v9, (s2), a0
	vfmacc.vf	v9, ft4, v8
	vsse32.v	v9, (s2), a0
	vlse32.v	v9, (t6), a0
	vfmacc.vf	v9, ft5, v8
	vsse32.v	v9, (t6), a0
	vlse32.v	v9, (t5), a0
	vfmacc.vf	v9, fa1, v8
	vsse32.v	v9, (t5), a0
	vlse32.v	v9, (t4), a0
	vfmacc.vf	v9, fa0, v8
	vsse32.v	v9, (t4), a0
	vlse32.v	v9, (t3), a0
	vfmacc.vf	v9, ft0, v8
	vsse32.v	v9, (t3), a0
	vlse32.v	v9, (t2), a0
	vfmacc.vf	v9, ft1, v8
	vsse32.v	v9, (t2), a0
	vlse32.v	v9, (t1), a0
	vfmacc.vf	v9, fa2, v8
	vsse32.v	v9, (t1), a0
	vlse32.v	v9, (t0), a0
	vfmacc.vf	v9, fa3, v8
	vsse32.v	v9, (t0), a0
	vlse32.v	v9, (a7), a0
	vfmacc.vf	v9, fa4, v8
	vsse32.v	v9, (a7), a0
	vlse32.v	v9, (a6), a0
	vfmacc.vf	v9, fa5, v8
	vsse32.v	v9, (a6), a0
	ld	s0, 24(sp)                      # 8-byte Folded Reload
	ld	s1, 16(sp)                      # 8-byte Folded Reload
	ld	s2, 8(sp)                       # 8-byte Folded Reload
	.cfi_restore s0
	.cfi_restore s1
	.cfi_restore s2
	addi	sp, sp, 32
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end0:
	.size	test, .Lfunc_end0-test
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
