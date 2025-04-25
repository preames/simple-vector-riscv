	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_h1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zifencei2p0_zihintntl1p0_zihintpause2p0_zihpm2p0_zimop1p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zawrs1p0_zfa1p0_zfbfmin1p0_zfh1p0_zfhmin1p0_zca1p0_zcb1p0_zcd1p0_zcmop1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0_zvbb1p0_zvbc1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfbfmin1p0_zvfbfwma1p0_zvfh1p0_zvfhmin1p0_zvkb1p0_zvkg1p0_zvkn1p0_zvknc1p0_zvkned1p0_zvkng1p0_zvknhb1p0_zvkt1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0_sha1p0_shcounterenw1p0_shgatpa1p0_shtvala1p0_shvsatpa1p0_shvstvala1p0_shvstvecd1p0_smaia1p0_ssaia1p0_ssccptr1p0_sscofpmf1p0_sscounterenw1p0_ssnpm1p0_ssstateen1p0_ssstrict1p0_sstc1p0_sstvala1p0_sstvecd1p0_ssu64xl1p0_supm1p0_svade1p0_svbare1p0_svinval1p0_svnapot1p0_svpbmt1p0"
	.file	"dotproduct_i32.c"
	.text
	.globl	dotproduct_i32                  # -- Begin function dotproduct_i32
	.p2align	1
	.type	dotproduct_i32,@function
dotproduct_i32:                         # @dotproduct_i32
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a0, .LBB0_8
# %bb.1:                                # %for.body.preheader
	csrr	a3, vlenb
	zext.w	a6, a0
	srli	a0, a3, 1
	bgeu	a6, a0, .LBB0_3
# %bb.2:
	li	a7, 0
	li	a0, 0
	j	.LBB0_6
.LBB0_3:                                # %vector.ph
	srli	a3, a3, 3
	slli	a4, a3, 2
	neg	a4, a4
	and	a7, a4, a6
	slli	a4, a3, 4
	sub	a5, a7, a0
	divu	a0, a5, a0
	slli	a0, a0, 4
	addi	a0, a0, 16
	mul	a0, a0, a3
	mv	a3, a2
	add	a5, a2, a0
	vsetvli	a0, zero, e32, m2, ta, ma
	vmv.v.i	v8, 0
	mv	a0, a1
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vl2re32.v	v10, (a0)
	vl2re32.v	v12, (a3)
	add	a3, a3, a4
	add	a0, a0, a4
	vmacc.vv	v8, v12, v10
	bne	a3, a5, .LBB0_4
# %bb.5:                                # %middle.block
	vmv.s.x	v10, zero
	vredsum.vs	v8, v8, v10
	vmv.x.s	a0, v8
	beq	a7, a6, .LBB0_8
.LBB0_6:                                # %for.body.preheader11
	sh2add	a5, a7, a1
	sh2add	a2, a7, a2
	sh2add	a1, a6, a1
.LBB0_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lw	a3, 0(a5)
	lw	a4, 0(a2)
	addi	a5, a5, 4
	addi	a2, a2, 4
	mul	a3, a3, a4
	addw	a0, a0, a3
	bne	a5, a1, .LBB0_7
.LBB0_8:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	dotproduct_i32, .Lfunc_end0-dotproduct_i32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
