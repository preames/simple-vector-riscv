	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zihintntl1p0_zihintpause2p0_zihpm2p0_zimop1p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zawrs1p0_zfa1p0_zfhmin1p0_zca1p0_zcb1p0_zcd1p0_zcmop1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0_zvbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfhmin1p0_zvkb1p0_zvkt1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0_supm1p0"
	.file	"dotproduct_fp32.c"
	.text
	.globl	dotproduct_fp32                 # -- Begin function dotproduct_fp32
	.p2align	1
	.type	dotproduct_fp32,@function
dotproduct_fp32:                        # @dotproduct_fp32
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a0, .LBB0_3
# %bb.1:                                # %for.body.preheader
	zext.w	a6, a0
	csrr	a3, vlenb
	srli	a0, a3, 1
	bgeu	a6, a0, .LBB0_4
# %bb.2:
	li	a7, 0
	fmv.w.x	fa0, zero
	j	.LBB0_7
.LBB0_3:
	fmv.w.x	fa0, zero
	ret
.LBB0_4:                                # %vector.ph
	srli	a4, a3, 3
	slli	a3, a4, 2
	neg	a3, a3
	and	a7, a3, a6
	sub	a3, a7, a0
	divu	a0, a3, a0
	slli	a3, a4, 4
	slli	a0, a0, 4
	addi	a0, a0, 16
	mul	a0, a0, a4
	add	a5, a2, a0
	vsetvli	a0, zero, e32, m2, ta, ma
	vmv.v.i	v8, 0
	mv	a4, a1
	mv	a0, a2
.LBB0_5:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vl2re32.v	v10, (a4)
	vl2re32.v	v12, (a0)
	add	a0, a0, a3
	vfmacc.vv	v8, v12, v10
	add	a4, a4, a3
	bne	a0, a5, .LBB0_5
# %bb.6:                                # %middle.block
	vmv.s.x	v10, zero
	vfredusum.vs	v8, v8, v10
	vfmv.f.s	fa0, v8
	beq	a7, a6, .LBB0_9
.LBB0_7:                                # %for.body.preheader11
	sh2add	a4, a7, a1
	sh2add	a2, a7, a2
	sh2add	a0, a6, a1
.LBB0_8:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	flw	fa5, 0(a4)
	flw	fa4, 0(a2)
	addi	a4, a4, 4
	fmadd.s	fa0, fa4, fa5, fa0
	addi	a2, a2, 4
	bne	a4, a0, .LBB0_8
.LBB0_9:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	dotproduct_fp32, .Lfunc_end0-dotproduct_fp32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
