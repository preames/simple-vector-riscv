	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_h1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zifencei2p0_zihintntl1p0_zihintpause2p0_zihpm2p0_zimop1p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zawrs1p0_zfa1p0_zfbfmin1p0_zfh1p0_zfhmin1p0_zca1p0_zcb1p0_zcd1p0_zcmop1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0_zvbb1p0_zvbc1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfbfmin1p0_zvfbfwma1p0_zvfh1p0_zvfhmin1p0_zvkb1p0_zvkg1p0_zvkn1p0_zvknc1p0_zvkned1p0_zvkng1p0_zvknhb1p0_zvkt1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0_sha1p0_shcounterenw1p0_shgatpa1p0_shtvala1p0_shvsatpa1p0_shvstvala1p0_shvstvecd1p0_smaia1p0_ssaia1p0_ssccptr1p0_sscofpmf1p0_sscounterenw1p0_ssnpm1p0_ssstateen1p0_ssstrict1p0_sstc1p0_sstvala1p0_sstvecd1p0_ssu64xl1p0_supm1p0_svade1p0_svbare1p0_svinval1p0_svnapot1p0_svpbmt1p0"
	.file	"vector_add_fp32.c"
	.text
	.globl	vector_add_i32                  # -- Begin function vector_add_i32
	.p2align	1
	.type	vector_add_i32,@function
vector_add_i32:                         # @vector_add_i32
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a1, .LBB0_8
# %bb.1:                                # %for.body.preheader
	csrr	a2, vlenb
	zext.w	a1, a1
	srli	a4, a2, 1
	bgeu	a1, a4, .LBB0_3
# %bb.2:
	li	a6, 0
	j	.LBB0_6
.LBB0_3:                                # %vector.ph
	srli	a5, a2, 3
	slli	a2, a5, 2
	slli	a3, a5, 4
	neg	a2, a2
	and	a6, a2, a1
	sub	a2, a6, a4
	divu	a2, a2, a4
	slli	a2, a2, 4
	addi	a2, a2, 16
	mul	a2, a2, a5
	mv	a5, a0
	add	a4, a0, a2
	vsetvli	a2, zero, e32, m2, ta, ma
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vl2re32.v	v8, (a5)
	vfadd.vf	v8, v8, fa0
	vs2r.v	v8, (a5)
	add	a5, a5, a3
	bne	a5, a4, .LBB0_4
# %bb.5:                                # %middle.block
	beq	a6, a1, .LBB0_8
.LBB0_6:                                # %for.body.preheader5
	sh2add	a2, a6, a0
	sh2add	a0, a1, a0
.LBB0_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	flw	fa5, 0(a2)
	fadd.s	fa5, fa0, fa5
	fsw	fa5, 0(a2)
	addi	a2, a2, 4
	bne	a2, a0, .LBB0_7
.LBB0_8:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	vector_add_i32, .Lfunc_end0-vector_add_i32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
