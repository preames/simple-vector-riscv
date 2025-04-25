	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
	.file	"dotproduct_fp32.c"
	.text
	.globl	dotproduct_fp32                 # -- Begin function dotproduct_fp32
	.p2align	1
	.type	dotproduct_fp32,@function
dotproduct_fp32:                        # @dotproduct_fp32
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a0, .LBB0_4
# %bb.1:                                # %for.body.preheader
	andi	a6, a0, 7
	li	a3, 8
	bgeu	a0, a3, .LBB0_5
# %bb.2:
	li	a3, 0
	fmv.w.x	fa0, zero
	bnez	a6, .LBB0_8
.LBB0_3:                                # %for.cond.cleanup
	ret
.LBB0_4:
	fmv.w.x	fa0, zero
	ret
.LBB0_5:                                # %for.body.preheader.new
	zext.w	a0, a0
	fmv.w.x	fa0, zero
	li	a4, 0
	andi	a0, a0, -8
	addi	a5, a2, 16
	addi	a3, a1, 16
	neg	a0, a0
.LBB0_6:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	flw	fa5, -16(a3)
	flw	fa4, -12(a3)
	flw	fa3, -8(a3)
	flw	fa2, -4(a3)
	addi	a4, a4, -8
	flw	fa1, -16(a5)
	flw	ft0, -12(a5)
	flw	ft1, -8(a5)
	flw	ft2, -4(a5)
	fmadd.s	fa5, fa1, fa5, fa0
	fmadd.s	fa5, ft0, fa4, fa5
	flw	fa4, 0(a3)
	flw	fa0, 0(a5)
	flw	ft0, 4(a5)
	fmadd.s	fa5, ft1, fa3, fa5
	flw	ft1, 8(a5)
	flw	fa3, 4(a3)
	fmadd.s	fa5, ft2, fa2, fa5
	flw	fa2, 8(a3)
	flw	fa1, 12(a3)
	flw	ft2, 12(a5)
	addi	a5, a5, 32
	addi	a3, a3, 32
	fmadd.s	fa5, fa0, fa4, fa5
	fmadd.s	fa5, ft0, fa3, fa5
	fmadd.s	fa5, ft1, fa2, fa5
	fmadd.s	fa0, ft2, fa1, fa5
	bne	a0, a4, .LBB0_6
# %bb.7:                                # %for.cond.cleanup.loopexit.unr-lcssa.loopexit
	neg	a3, a4
	beqz	a6, .LBB0_3
.LBB0_8:                                # %for.body.epil
	sh2add	a0, a3, a1
	sh2add	a1, a3, a2
	li	a2, 1
	flw	fa5, 0(a0)
	flw	fa4, 0(a1)
	fmadd.s	fa0, fa4, fa5, fa0
	beq	a6, a2, .LBB0_3
# %bb.9:                                # %for.body.epil.1
	flw	fa5, 4(a0)
	li	a2, 2
	flw	fa4, 4(a1)
	fmadd.s	fa0, fa4, fa5, fa0
	beq	a6, a2, .LBB0_3
# %bb.10:                               # %for.body.epil.2
	flw	fa5, 8(a0)
	li	a2, 3
	flw	fa4, 8(a1)
	fmadd.s	fa0, fa4, fa5, fa0
	beq	a6, a2, .LBB0_3
# %bb.11:                               # %for.body.epil.3
	flw	fa5, 12(a0)
	li	a2, 4
	flw	fa4, 12(a1)
	fmadd.s	fa0, fa4, fa5, fa0
	beq	a6, a2, .LBB0_3
# %bb.12:                               # %for.body.epil.4
	flw	fa5, 16(a0)
	li	a2, 5
	flw	fa4, 16(a1)
	fmadd.s	fa0, fa4, fa5, fa0
	beq	a6, a2, .LBB0_3
# %bb.13:                               # %for.body.epil.5
	flw	fa5, 20(a0)
	li	a2, 6
	flw	fa4, 20(a1)
	fmadd.s	fa0, fa4, fa5, fa0
	beq	a6, a2, .LBB0_3
# %bb.14:                               # %for.body.epil.6
	flw	fa5, 24(a0)
	flw	fa4, 24(a1)
	fmadd.s	fa0, fa4, fa5, fa0
	ret
.Lfunc_end0:
	.size	dotproduct_fp32, .Lfunc_end0-dotproduct_fp32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
