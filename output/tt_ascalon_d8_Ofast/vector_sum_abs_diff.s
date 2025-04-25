	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_h1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zifencei2p0_zihintntl1p0_zihintpause2p0_zihpm2p0_zimop1p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zawrs1p0_zfa1p0_zfbfmin1p0_zfh1p0_zfhmin1p0_zca1p0_zcb1p0_zcd1p0_zcmop1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0_zvbb1p0_zvbc1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfbfmin1p0_zvfbfwma1p0_zvfh1p0_zvfhmin1p0_zvkb1p0_zvkg1p0_zvkn1p0_zvknc1p0_zvkned1p0_zvkng1p0_zvknhb1p0_zvkt1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0_sha1p0_shcounterenw1p0_shgatpa1p0_shtvala1p0_shvsatpa1p0_shvstvala1p0_shvstvecd1p0_smaia1p0_ssaia1p0_ssccptr1p0_sscofpmf1p0_sscounterenw1p0_ssnpm1p0_ssstateen1p0_ssstrict1p0_sstc1p0_sstvala1p0_sstvecd1p0_ssu64xl1p0_supm1p0_svade1p0_svbare1p0_svinval1p0_svnapot1p0_svpbmt1p0"
	.file	"vector_sum_abs_diff.c"
	.text
	.globl	sub                             # -- Begin function sub
	.p2align	1
	.type	sub,@function
sub:                                    # @sub
	.cfi_startproc
# %bb.0:                                # %entry
	subw	a0, a0, a1
	sext.b	a0, a0
	ret
.Lfunc_end0:
	.size	sub, .Lfunc_end0-sub
	.cfi_endproc
                                        # -- End function
	.globl	myabs                           # -- Begin function myabs
	.p2align	1
	.type	myabs,@function
myabs:                                  # @myabs
	.cfi_startproc
# %bb.0:                                # %entry
	neg	a1, a0
	max	a0, a0, a1
	sext.b	a0, a0
	ret
.Lfunc_end1:
	.size	myabs, .Lfunc_end1-myabs
	.cfi_endproc
                                        # -- End function
	.globl	vector_sum_abs_diff             # -- Begin function vector_sum_abs_diff
	.p2align	1
	.type	vector_sum_abs_diff,@function
vector_sum_abs_diff:                    # @vector_sum_abs_diff
	.cfi_startproc
# %bb.0:                                # %entry
	srliw	a7, a3, 3
	beqz	a7, .LBB2_4
# %bb.1:                                # %for.cond1.preheader.preheader
	csrr	a3, vlenb
	li	a4, 16
	sh2add	t3, a7, a0
	li	a6, 0
	srli	t0, a3, 1
	maxu	a4, t0, a4
	bgeu	a7, a4, .LBB2_5
.LBB2_2:                                # %for.cond1.preheader.preheader49
	sh2add	a0, a6, a0
	sh3add	a1, a6, a1
	sh3add	a2, a6, a2
	vsetivli	zero, 8, e32, m1, ta, ma
	vmv.s.x	v8, zero
.LBB2_3:                                # %for.cond1.preheader
                                        # =>This Inner Loop Header: Depth=1
	vsetivli	zero, 8, e8, mf4, ta, ma
	vle8.v	v9, (a1)
	vle8.v	v10, (a2)
	addi	a1, a1, 8
	addi	a2, a2, 8
	vsub.vv	v9, v9, v10
	vrsub.vi	v10, v9, 0
	vmax.vv	v9, v9, v10
	vsetvli	zero, zero, e32, m1, ta, ma
	vsext.vf4	v10, v9
	vredsum.vs	v9, v10, v8
	vsetivli	zero, 1, e32, m1, ta, ma
	vse32.v	v9, (a0)
	addi	a0, a0, 4
	bne	a0, t3, .LBB2_3
.LBB2_4:                                # %for.cond.cleanup
	ret
.LBB2_5:                                # %vector.memcheck
	sh3add	a4, a7, a1
	sltu	a5, a1, t3
	sltu	a4, a0, a4
	and	a4, a4, a5
	bnez	a4, .LBB2_2
# %bb.6:                                # %vector.memcheck
	sh3add	a4, a7, a2
	sltu	a5, a2, t3
	sltu	a4, a0, a4
	and	a4, a4, a5
	bnez	a4, .LBB2_2
# %bb.7:                                # %vector.ph
	srli	a3, a3, 3
	mv	t4, a1
	mv	t5, a2
	slli	a4, a3, 2
	slli	t1, a3, 4
	slli	t2, a3, 5
	mv	a3, a0
	neg	a4, a4
	and	a6, a4, a7
	mv	a5, a6
.LBB2_8:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vsetvli	a4, zero, e8, mf2, ta, ma
	vlseg8e8.v	v8, (t4)
	vlseg8e8.v	v16, (t5)
	sub	a5, a5, t0
	add	t5, t5, t2
	add	t4, t4, t2
	vsub.vv	v8, v8, v16
	vrsub.vi	v16, v8, 0
	vmax.vv	v8, v8, v16
	vsetvli	zero, zero, e16, m1, ta, ma
	vsext.vf2	v16, v8
	vsetvli	zero, zero, e8, mf2, ta, ma
	vsub.vv	v8, v9, v17
	vrsub.vi	v9, v8, 0
	vmax.vv	v8, v8, v9
	vsetvli	zero, zero, e16, m1, ta, ma
	vsext.vf2	v17, v8
	vwadd.vv	v8, v16, v17
	vsetvli	zero, zero, e8, mf2, ta, ma
	vsub.vv	v10, v10, v18
	vrsub.vi	v16, v10, 0
	vmax.vv	v10, v10, v16
	vsetvli	zero, zero, e16, m1, ta, ma
	vsext.vf2	v16, v10
	vwadd.wv	v8, v8, v16
	vsetvli	zero, zero, e8, mf2, ta, ma
	vsub.vv	v10, v11, v19
	vrsub.vi	v11, v10, 0
	vmax.vv	v10, v10, v11
	vsetvli	zero, zero, e16, m1, ta, ma
	vsext.vf2	v11, v10
	vwadd.wv	v8, v8, v11
	vsetvli	zero, zero, e8, mf2, ta, ma
	vsub.vv	v10, v12, v20
	vrsub.vi	v11, v10, 0
	vmax.vv	v10, v10, v11
	vsetvli	zero, zero, e16, m1, ta, ma
	vsext.vf2	v11, v10
	vwadd.wv	v8, v8, v11
	vsetvli	zero, zero, e8, mf2, ta, ma
	vsub.vv	v10, v13, v21
	vrsub.vi	v11, v10, 0
	vmax.vv	v10, v10, v11
	vsetvli	zero, zero, e16, m1, ta, ma
	vsext.vf2	v11, v10
	vwadd.wv	v8, v8, v11
	vsetvli	zero, zero, e8, mf2, ta, ma
	vsub.vv	v10, v14, v22
	vrsub.vi	v11, v10, 0
	vmax.vv	v10, v10, v11
	vsetvli	zero, zero, e16, m1, ta, ma
	vsext.vf2	v11, v10
	vwadd.wv	v8, v8, v11
	vsetvli	zero, zero, e8, mf2, ta, ma
	vsub.vv	v10, v15, v23
	vrsub.vi	v11, v10, 0
	vmax.vv	v10, v10, v11
	vsetvli	zero, zero, e16, m1, ta, ma
	vsext.vf2	v11, v10
	vwadd.wv	v8, v8, v11
	vs2r.v	v8, (a3)
	add	a3, a3, t1
	bnez	a5, .LBB2_8
# %bb.9:                                # %middle.block
	bne	a6, a7, .LBB2_2
	j	.LBB2_4
.Lfunc_end2:
	.size	vector_sum_abs_diff, .Lfunc_end2-vector_sum_abs_diff
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
