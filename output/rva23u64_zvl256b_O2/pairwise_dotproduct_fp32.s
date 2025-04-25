	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zihintntl1p0_zihintpause2p0_zihpm2p0_zimop1p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zawrs1p0_zfa1p0_zfhmin1p0_zca1p0_zcb1p0_zcd1p0_zcmop1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0_zvbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfhmin1p0_zvkb1p0_zvkt1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0_supm1p0"
	.file	"pairwise_dotproduct_fp32.c"
	.text
	.globl	pairwise_dotproduct_fp32        # -- Begin function pairwise_dotproduct_fp32
	.p2align	1
	.type	pairwise_dotproduct_fp32,@function
pairwise_dotproduct_fp32:               # @pairwise_dotproduct_fp32
	.cfi_startproc
# %bb.0:                                # %entry
	andi	a0, a0, -2
	beqz	a0, .LBB0_5
# %bb.1:                                # %for.body.preheader
	zext.w	t1, a0
	csrr	a0, vlenb
	li	a4, 16
	addi	a5, t1, -1
	srli	a7, a0, 1
	srli	a5, a5, 1
	addi	a6, a5, 1
	maxu	a4, a7, a4
	bgeu	a6, a4, .LBB0_6
# %bb.2:
	li	a4, 0
.LBB0_3:                                # %for.body.preheader35
	sh2add	a3, a4, a3
	sh2add	a0, a4, a2
	srli	a5, a4, 1
	addi	a0, a0, 4
	addi	a2, a3, 4
	sh2add	a1, a5, a1
.LBB0_4:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	flw	fa5, -4(a0)
	flw	fa4, 0(a0)
	flw	fa3, -4(a2)
	flw	fa2, 0(a2)
	addi	a4, a4, 2
	addi	a0, a0, 8
	addi	a2, a2, 8
	fmul.s	fa4, fa4, fa2
	fmadd.s	fa5, fa5, fa3, fa4
	fsw	fa5, 0(a1)
	addi	a1, a1, 4
	bltu	a4, t1, .LBB0_4
.LBB0_5:                                # %for.cond.cleanup
	ret
.LBB0_6:                                # %vector.memcheck
	sh2add	t0, a5, a1
	sh3add	a4, a5, a2
	addi	t0, t0, 4
	addi	a4, a4, 8
	sltu	t2, a1, a4
	sltu	a4, a2, t0
	and	t2, t2, a4
	li	a4, 0
	bnez	t2, .LBB0_3
# %bb.7:                                # %vector.memcheck
	sh3add	a5, a5, a3
	addi	a5, a5, 8
	sltu	t2, a1, a5
	sltu	a5, a3, t0
	and	a5, t2, a5
	bnez	a5, .LBB0_3
# %bb.8:                                # %vector.ph
	li	t3, 0
	srli	a0, a0, 3
	neg	a4, a7
	and	t0, a6, a4
	slli	a4, t0, 1
	slli	t2, a0, 5
	mv	t4, a3
	mv	a5, a2
	vsetvli	a0, zero, e32, m2, ta, ma
.LBB0_9:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vlseg2e32.v	v8, (a5)
	vlseg2e32.v	v12, (t4)
	andi	a0, t3, -4
	add	t3, t3, a7
	add	a5, a5, t2
	sh2add	a0, a0, a1
	vfmul.vv	v10, v10, v14
	vfmacc.vv	v10, v8, v12
	vs2r.v	v10, (a0)
	add	t4, t4, t2
	bne	t0, t3, .LBB0_9
# %bb.10:                               # %middle.block
	bne	a6, t0, .LBB0_3
	j	.LBB0_5
.Lfunc_end0:
	.size	pairwise_dotproduct_fp32, .Lfunc_end0-pairwise_dotproduct_fp32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
