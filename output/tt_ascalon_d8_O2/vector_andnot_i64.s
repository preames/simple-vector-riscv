	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_h1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zifencei2p0_zihintntl1p0_zihintpause2p0_zihpm2p0_zimop1p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zawrs1p0_zfa1p0_zfbfmin1p0_zfh1p0_zfhmin1p0_zca1p0_zcb1p0_zcd1p0_zcmop1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0_zvbb1p0_zvbc1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfbfmin1p0_zvfbfwma1p0_zvfh1p0_zvfhmin1p0_zvkb1p0_zvkg1p0_zvkn1p0_zvknc1p0_zvkned1p0_zvkng1p0_zvknhb1p0_zvkt1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0_sha1p0_shcounterenw1p0_shgatpa1p0_shtvala1p0_shvsatpa1p0_shvstvala1p0_shvstvecd1p0_smaia1p0_ssaia1p0_ssccptr1p0_sscofpmf1p0_sscounterenw1p0_ssnpm1p0_ssstateen1p0_ssstrict1p0_sstc1p0_sstvala1p0_sstvecd1p0_ssu64xl1p0_supm1p0_svade1p0_svbare1p0_svinval1p0_svnapot1p0_svpbmt1p0"
	.file	"vector_andnot_i64.c"
	.text
	.globl	vector_andnot_i64               # -- Begin function vector_andnot_i64
	.p2align	1
	.type	vector_andnot_i64,@function
vector_andnot_i64:                      # @vector_andnot_i64
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a2, .LBB0_7
# %bb.1:                                # %for.body.preheader
	csrr	a4, vlenb
	zext.w	a7, a2
	li	a2, 16
	srli	a3, a4, 2
	sh3add	t1, a7, a0
	maxu	a5, a3, a2
	bltu	a7, a5, .LBB0_4
# %bb.2:                                # %vector.memcheck
	sh3add	a5, a7, a1
	bgeu	a0, a5, .LBB0_8
# %bb.3:                                # %vector.memcheck
	bgeu	a1, t1, .LBB0_8
.LBB0_4:
	li	a6, 0
.LBB0_5:                                # %for.body.preheader14
	sh3add	a0, a6, a0
	sh3add	a1, a6, a1
.LBB0_6:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	ld	a2, 0(a0)
	ld	a3, 0(a1)
	addi	a1, a1, 8
	andn	a2, a2, a3
	sd	a2, 0(a0)
	addi	a0, a0, 8
	bne	a0, t1, .LBB0_6
.LBB0_7:                                # %for.cond.cleanup
	ret
.LBB0_8:                                # %vector.ph
	srli	t0, a4, 3
	vsetvli	a2, zero, e64, m2, ta, ma
	slli	a4, t0, 1
	neg	a4, a4
	and	a6, a4, a7
	slli	a4, t0, 4
	sub	a5, a6, a3
	divu	a3, a5, a3
	mv	a5, a0
	slli	a3, a3, 4
	addi	a3, a3, 16
	mul	t0, a3, t0
	mv	a3, a1
	add	t0, t0, a1
.LBB0_9:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vl2re64.v	v8, (a5)
	vl2re64.v	v10, (a3)
	add	a3, a3, a4
	vandn.vv	v8, v8, v10
	vs2r.v	v8, (a5)
	add	a5, a5, a4
	bne	a3, t0, .LBB0_9
# %bb.10:                               # %middle.block
	beq	a6, a7, .LBB0_7
	j	.LBB0_5
.Lfunc_end0:
	.size	vector_andnot_i64, .Lfunc_end0-vector_andnot_i64
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
