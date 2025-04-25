	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_h1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zifencei2p0_zihintntl1p0_zihintpause2p0_zihpm2p0_zimop1p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zawrs1p0_zfa1p0_zfbfmin1p0_zfh1p0_zfhmin1p0_zca1p0_zcb1p0_zcd1p0_zcmop1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0_zvbb1p0_zvbc1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfbfmin1p0_zvfbfwma1p0_zvfh1p0_zvfhmin1p0_zvkb1p0_zvkg1p0_zvkn1p0_zvknc1p0_zvkned1p0_zvkng1p0_zvknhb1p0_zvkt1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0_sha1p0_shcounterenw1p0_shgatpa1p0_shtvala1p0_shvsatpa1p0_shvstvala1p0_shvstvecd1p0_smaia1p0_ssaia1p0_ssccptr1p0_sscofpmf1p0_sscounterenw1p0_ssnpm1p0_ssstateen1p0_ssstrict1p0_sstc1p0_sstvala1p0_sstvecd1p0_ssu64xl1p0_supm1p0_svade1p0_svbare1p0_svinval1p0_svnapot1p0_svpbmt1p0"
	.file	"memcpy_i8.c"
	.text
	.globl	my_memcpy                       # -- Begin function my_memcpy
	.p2align	1
	.type	my_memcpy,@function
my_memcpy:                              # @my_memcpy
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a0, .LBB0_6
# %bb.1:                                # %for.body.preheader
	zext.w	a6, a0
	csrr	a0, vlenb
	li	a3, 64
	slli	a4, a0, 1
	maxu	a3, a4, a3
	bltu	a6, a3, .LBB0_3
# %bb.2:                                # %vector.memcheck
	sub	a3, a1, a2
	bgeu	a3, a4, .LBB0_7
.LBB0_3:
	li	a7, 0
.LBB0_4:                                # %for.body.preheader10
	add	a3, a2, a7
	add	a1, a1, a7
	add	a0, a2, a6
.LBB0_5:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lbu	a2, 0(a3)
	addi	a3, a3, 1
	sb	a2, 0(a1)
	addi	a1, a1, 1
	bne	a3, a0, .LBB0_5
.LBB0_6:                                # %for.cond.cleanup
	ret
.LBB0_7:                                # %vector.ph
	neg	a3, a4
	srli	a0, a0, 3
	and	a7, a3, a6
	sub	a3, a7, a4
	divu	a3, a3, a4
	slli	a3, a3, 4
	addi	a3, a3, 16
	mul	a0, a0, a3
	mv	a3, a2
	add	a5, a1, a0
	mv	a0, a1
.LBB0_8:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vl2r.v	v8, (a3)
	add	a3, a3, a4
	vs2r.v	v8, (a0)
	add	a0, a0, a4
	bne	a0, a5, .LBB0_8
# %bb.9:                                # %middle.block
	beq	a7, a6, .LBB0_6
	j	.LBB0_4
.Lfunc_end0:
	.size	my_memcpy, .Lfunc_end0-my_memcpy
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
