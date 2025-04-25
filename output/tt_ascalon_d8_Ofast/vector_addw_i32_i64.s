	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_h1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zifencei2p0_zihintntl1p0_zihintpause2p0_zihpm2p0_zimop1p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zawrs1p0_zfa1p0_zfbfmin1p0_zfh1p0_zfhmin1p0_zca1p0_zcb1p0_zcd1p0_zcmop1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0_zvbb1p0_zvbc1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfbfmin1p0_zvfbfwma1p0_zvfh1p0_zvfhmin1p0_zvkb1p0_zvkg1p0_zvkn1p0_zvknc1p0_zvkned1p0_zvkng1p0_zvknhb1p0_zvkt1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0_sha1p0_shcounterenw1p0_shgatpa1p0_shtvala1p0_shvsatpa1p0_shvstvala1p0_shvstvecd1p0_smaia1p0_ssaia1p0_ssccptr1p0_sscofpmf1p0_sscounterenw1p0_ssnpm1p0_ssstateen1p0_ssstrict1p0_sstc1p0_sstvala1p0_sstvecd1p0_ssu64xl1p0_supm1p0_svade1p0_svbare1p0_svinval1p0_svnapot1p0_svpbmt1p0"
	.file	"vector_addw_i32_i64.c"
	.text
	.globl	test                            # -- Begin function test
	.p2align	1
	.type	test,@function
test:                                   # @test
	.cfi_startproc
# %bb.0:                                # %entry
	blez	a3, .LBB0_8
# %bb.1:                                # %for.body.preheader
	csrr	a5, vlenb
	srli	t0, a5, 2
	bgeu	a3, t0, .LBB0_3
# %bb.2:
	li	a6, 0
	j	.LBB0_6
.LBB0_3:                                # %vector.ph
	srli	a4, a5, 3
	mv	t2, a1
	mv	t3, a2
	slli	a6, a4, 1
	slli	a5, a4, 31
	slli	a7, a4, 4
	slli	t1, a4, 3
	sub	a5, a5, a6
	and	a6, a5, a3
	sub	a5, a6, t0
	divu	a5, a5, t0
	slli	a5, a5, 4
	addi	a5, a5, 16
	mul	a4, a4, a5
	add	t0, a0, a4
	mv	a4, a0
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vl1re32.v	v10, (t2)
	vl1re32.v	v11, (t3)
	vsetvli	a5, zero, e32, m1, ta, ma
	add	t3, t3, t1
	add	t2, t2, t1
	vwadd.vv	v8, v11, v10
	vl2re64.v	v10, (a4)
	vsetvli	zero, zero, e64, m2, ta, ma
	vadd.vv	v8, v8, v10
	vs2r.v	v8, (a4)
	add	a4, a4, a7
	bne	a4, t0, .LBB0_4
# %bb.5:                                # %middle.block
	beq	a6, a3, .LBB0_8
.LBB0_6:                                # %for.body.preheader15
	sh3add	a4, a6, a0
	sh2add	a2, a6, a2
	sh2add	a1, a6, a1
	sh3add	a0, a3, a0
.LBB0_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lw	a3, 0(a1)
	lw	a5, 0(a2)
	addi	a2, a2, 4
	addi	a1, a1, 4
	add	a3, a3, a5
	ld	a5, 0(a4)
	add	a3, a3, a5
	sd	a3, 0(a4)
	addi	a4, a4, 8
	bne	a4, a0, .LBB0_7
.LBB0_8:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	test, .Lfunc_end0-test
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
