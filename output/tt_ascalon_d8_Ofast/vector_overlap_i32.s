	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_h1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zifencei2p0_zihintntl1p0_zihintpause2p0_zihpm2p0_zimop1p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zawrs1p0_zfa1p0_zfbfmin1p0_zfh1p0_zfhmin1p0_zca1p0_zcb1p0_zcd1p0_zcmop1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0_zvbb1p0_zvbc1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfbfmin1p0_zvfbfwma1p0_zvfh1p0_zvfhmin1p0_zvkb1p0_zvkg1p0_zvkn1p0_zvknc1p0_zvkned1p0_zvkng1p0_zvknhb1p0_zvkt1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0_sha1p0_shcounterenw1p0_shgatpa1p0_shtvala1p0_shvsatpa1p0_shvstvala1p0_shvstvecd1p0_smaia1p0_ssaia1p0_ssccptr1p0_sscofpmf1p0_sscounterenw1p0_ssnpm1p0_ssstateen1p0_ssstrict1p0_sstc1p0_sstvala1p0_sstvecd1p0_ssu64xl1p0_supm1p0_svade1p0_svbare1p0_svinval1p0_svnapot1p0_svpbmt1p0"
	.file	"vector_overlap_i32.c"
	.text
	.globl	vector_overlap                  # -- Begin function vector_overlap
	.p2align	1
	.type	vector_overlap,@function
vector_overlap:                         # @vector_overlap
	.cfi_startproc
# %bb.0:                                # %entry
	li	a3, 2
	bltu	a2, a3, .LBB0_9
# %bb.1:                                # %for.body.preheader
	zext.w	a6, a2
	lw	a2, 4(a0)
	csrr	a3, vlenb
	addi	t2, a6, -1
	srli	t3, a3, 1
	bgeu	t2, t3, .LBB0_3
# %bb.2:
	li	t1, 1
	j	.LBB0_7
.LBB0_3:                                # %vector.ph
	neg	a4, t3
	srli	a3, a3, 3
	vsetvli	a5, zero, e32, m1, ta, ma
	vmv.s.x	v10, a2
	addi	t4, t3, -1
	and	a7, t2, a4
	addi	a4, t3, -1
	slli	t5, a3, 4
	mv	a3, a0
	zext.w	t0, a4
	addi	t1, a7, 1
	mv	a4, a7
	addi	a2, t0, 1
	vsetvli	zero, a2, e32, m2, ta, ma
	vslideup.vx	v8, v10, t0
	addi	a2, a1, 4
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	addi	a5, a3, 8
	vl2re32.v	v10, (a3)
	vsetivli	zero, 1, e32, m2, ta, ma
	vslidedown.vx	v12, v8, t4
	add	a3, a3, t5
	sub	a4, a4, t3
	vl2re32.v	v8, (a5)
	vsetvli	a5, zero, e32, m2, ta, ma
	vslideup.vi	v12, v8, 1
	vadd.vv	v10, v10, v8
	vadd.vv	v10, v12, v10
	vs2r.v	v10, (a2)
	add	a2, a2, t5
	bnez	a4, .LBB0_4
# %bb.5:                                # %middle.block
	beq	t2, a7, .LBB0_9
# %bb.6:
	vslidedown.vx	v8, v8, t0
	vmv.x.s	a2, v8
.LBB0_7:                                # %for.body.preheader19
	sh2add	a3, t1, a0
	sh2add	a0, a6, a0
	sh2add	a1, t1, a1
	addi	a3, a3, 4
	addi	a0, a0, 4
.LBB0_8:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lw	a4, -8(a3)
	add	a4, a4, a2
	lw	a2, 0(a3)
	addi	a3, a3, 4
	add	a4, a4, a2
	sw	a4, 0(a1)
	addi	a1, a1, 4
	bne	a3, a0, .LBB0_8
.LBB0_9:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	vector_overlap, .Lfunc_end0-vector_overlap
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
