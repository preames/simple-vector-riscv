	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_h1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zifencei2p0_zihintntl1p0_zihintpause2p0_zihpm2p0_zimop1p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zawrs1p0_zfa1p0_zfbfmin1p0_zfh1p0_zfhmin1p0_zca1p0_zcb1p0_zcd1p0_zcmop1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0_zvbb1p0_zvbc1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfbfmin1p0_zvfbfwma1p0_zvfh1p0_zvfhmin1p0_zvkb1p0_zvkg1p0_zvkn1p0_zvknc1p0_zvkned1p0_zvkng1p0_zvknhb1p0_zvkt1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0_sha1p0_shcounterenw1p0_shgatpa1p0_shtvala1p0_shvsatpa1p0_shvstvala1p0_shvstvecd1p0_smaia1p0_ssaia1p0_ssccptr1p0_sscofpmf1p0_sscounterenw1p0_ssnpm1p0_ssstateen1p0_ssstrict1p0_sstc1p0_sstvala1p0_sstvecd1p0_ssu64xl1p0_supm1p0_svade1p0_svbare1p0_svinval1p0_svnapot1p0_svpbmt1p0"
	.file	"riscv_vspec_example_a5.c"
	.text
	.globl	saxpy                           # -- Begin function saxpy
	.p2align	1
	.type	saxpy,@function
saxpy:                                  # @saxpy
	.cfi_startproc
# %bb.0:                                # %entry
	blez	a0, .LBB0_7
# %bb.1:                                # %for.body.preheader
	csrr	a3, vlenb
	li	a4, 16
	sh2add	t0, a0, a2
	srli	a5, a3, 1
	maxu	a4, a5, a4
	bltu	a0, a4, .LBB0_4
# %bb.2:                                # %vector.memcheck
	sh2add	a4, a0, a1
	bgeu	a2, a4, .LBB0_8
# %bb.3:                                # %vector.memcheck
	bgeu	a1, t0, .LBB0_8
.LBB0_4:
	li	a6, 0
.LBB0_5:                                # %for.body.preheader12
	sh2add	a0, a6, a2
	sh2add	a1, a6, a1
.LBB0_6:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	flw	fa5, 0(a1)
	flw	fa4, 0(a0)
	addi	a1, a1, 4
	fmadd.s	fa5, fa0, fa5, fa4
	fsw	fa5, 0(a0)
	addi	a0, a0, 4
	bne	a0, t0, .LBB0_6
.LBB0_7:                                # %for.end
	ret
.LBB0_8:                                # %vector.ph
	srli	a7, a3, 3
	neg	a3, a5
	and	a6, a0, a3
	slli	t1, a7, 4
	vsetvli	a3, zero, e32, m2, ta, ma
	sub	a4, a6, a5
	divu	a4, a4, a5
	mv	a5, a1
	slli	a4, a4, 4
	addi	a4, a4, 16
	mul	a7, a4, a7
	mv	a4, a2
	add	a7, a7, a2
.LBB0_9:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vl2re32.v	v8, (a5)
	vl2re32.v	v10, (a4)
	add	a5, a5, t1
	vfmacc.vf	v10, fa0, v8
	vs2r.v	v10, (a4)
	add	a4, a4, t1
	bne	a4, a7, .LBB0_9
# %bb.10:                               # %middle.block
	beq	a0, a6, .LBB0_7
	j	.LBB0_5
.Lfunc_end0:
	.size	saxpy, .Lfunc_end0-saxpy
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
