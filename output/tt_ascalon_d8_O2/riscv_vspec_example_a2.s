	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_h1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zifencei2p0_zihintntl1p0_zihintpause2p0_zihpm2p0_zimop1p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zawrs1p0_zfa1p0_zfbfmin1p0_zfh1p0_zfhmin1p0_zca1p0_zcb1p0_zcd1p0_zcmop1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0_zvbb1p0_zvbc1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfbfmin1p0_zvfbfwma1p0_zvfh1p0_zvfhmin1p0_zvkb1p0_zvkg1p0_zvkn1p0_zvknc1p0_zvkned1p0_zvkng1p0_zvknhb1p0_zvkt1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0_sha1p0_shcounterenw1p0_shgatpa1p0_shtvala1p0_shvsatpa1p0_shvstvala1p0_shvstvecd1p0_smaia1p0_ssaia1p0_ssccptr1p0_sscofpmf1p0_sscounterenw1p0_ssnpm1p0_ssstateen1p0_ssstrict1p0_sstc1p0_sstvala1p0_sstvecd1p0_ssu64xl1p0_supm1p0_svade1p0_svbare1p0_svinval1p0_svnapot1p0_svpbmt1p0"
	.file	"riscv_vspec_example_a2.c"
	.text
	.globl	example_a2                      # -- Begin function example_a2
	.p2align	1
	.type	example_a2,@function
example_a2:                             # @example_a2
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a3, .LBB0_12
# %bb.1:                                # %for.body.preheader
	zext.w	a6, a3
	csrr	a3, vlenb
	li	a4, 64
	li	a7, 0
	slli	t1, a3, 1
	maxu	a4, t1, a4
	bgeu	a6, a4, .LBB0_7
.LBB0_2:                                # %for.body.preheader19
	add	a5, a0, a7
	add	a2, a2, a7
	add	a1, a1, a7
	add	a0, a0, a6
	li	a3, 4
	j	.LBB0_5
.LBB0_3:                                # %cond.true
                                        #   in Loop: Header=BB0_5 Depth=1
	lbu	a4, 0(a2)
.LBB0_4:                                # %cond.end
                                        #   in Loop: Header=BB0_5 Depth=1
	sb	a4, 0(a1)
	addi	a5, a5, 1
	addi	a2, a2, 1
	addi	a1, a1, 1
	beq	a5, a0, .LBB0_12
.LBB0_5:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lbu	a4, 0(a5)
	bgeu	a3, a4, .LBB0_3
# %bb.6:                                #   in Loop: Header=BB0_5 Depth=1
	li	a4, 1
	j	.LBB0_4
.LBB0_7:                                # %vector.memcheck
	sub	a4, a1, a0
	bltu	a4, t1, .LBB0_2
# %bb.8:                                # %vector.memcheck
	sub	a4, a1, a2
	bltu	a4, t1, .LBB0_2
# %bb.9:                                # %vector.ph
	neg	a4, t1
	srli	a3, a3, 3
	mv	a5, a0
	and	a7, a4, a6
	sub	a4, a7, t1
	divu	a4, a4, t1
	slli	a4, a4, 4
	addi	a4, a4, 16
	mul	a3, a3, a4
	mv	a4, a2
	add	t0, a1, a3
	vsetvli	a3, zero, e8, m2, ta, ma
	vmv.v.i	v8, 1
	mv	a3, a1
.LBB0_10:                               # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vl2r.v	v10, (a5)
	vsetvli	zero, zero, e8, m2, ta, mu
	add	a5, a5, t1
	vmsleu.vi	v0, v10, 4
	vmv2r.v	v10, v8
	vle8.v	v10, (a4), v0.t
	add	a4, a4, t1
	vs2r.v	v10, (a3)
	add	a3, a3, t1
	bne	a3, t0, .LBB0_10
# %bb.11:                               # %middle.block
	bne	a7, a6, .LBB0_2
.LBB0_12:                               # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	example_a2, .Lfunc_end0-example_a2
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
