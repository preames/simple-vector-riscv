	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
	.file	"pairwise_dotproduct_fp32.c"
	.text
	.globl	pairwise_dotproduct_fp32        # -- Begin function pairwise_dotproduct_fp32
	.p2align	1
	.type	pairwise_dotproduct_fp32,@function
pairwise_dotproduct_fp32:               # @pairwise_dotproduct_fp32
	.cfi_startproc
# %bb.0:                                # %entry
	andi	a0, a0, -2
	beqz	a0, .LBB0_13
# %bb.1:                                # %for.body.preheader
	zext.w	a4, a0
	li	a5, 15
	addi	a4, a4, -1
	srli	a4, a4, 1
	addi	a4, a4, 1
	andi	a6, a4, 7
	bgeu	a0, a5, .LBB0_3
# %bb.2:
	li	a7, 0
	j	.LBB0_5
.LBB0_3:                                # %for.body.preheader.new
	andi	a7, a4, -8
	addi	a5, a3, 32
	addi	a0, a2, 32
	addi	a7, a7, -8
	addi	a4, a1, 16
	srli	t0, a7, 3
	slli	a7, t0, 4
	slli	t0, t0, 6
	add	t0, t0, a3
	addi	a7, a7, 16
	addi	t0, t0, 96
.LBB0_4:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	flw	fa5, -32(a0)
	flw	fa4, -28(a0)
	flw	fa3, -32(a5)
	flw	fa2, -28(a5)
	fmul.s	fa5, fa3, fa5
	fmadd.s	fa5, fa2, fa4, fa5
	fsw	fa5, -16(a4)
	flw	fa5, -24(a0)
	flw	fa4, -20(a0)
	flw	fa3, -24(a5)
	flw	fa2, -20(a5)
	fmul.s	fa5, fa3, fa5
	fmadd.s	fa5, fa2, fa4, fa5
	fsw	fa5, -12(a4)
	flw	fa5, -16(a0)
	flw	fa4, -12(a0)
	flw	fa3, -16(a5)
	flw	fa2, -12(a5)
	fmul.s	fa5, fa3, fa5
	fmadd.s	fa5, fa2, fa4, fa5
	fsw	fa5, -8(a4)
	flw	fa5, -8(a0)
	flw	fa4, -4(a0)
	flw	fa3, -8(a5)
	flw	fa2, -4(a5)
	fmul.s	fa5, fa3, fa5
	fmadd.s	fa5, fa2, fa4, fa5
	fsw	fa5, -4(a4)
	flw	fa5, 0(a0)
	flw	fa4, 4(a0)
	flw	fa3, 0(a5)
	flw	fa2, 4(a5)
	fmul.s	fa5, fa3, fa5
	fmadd.s	fa5, fa2, fa4, fa5
	fsw	fa5, 0(a4)
	flw	fa5, 8(a0)
	flw	fa4, 12(a0)
	flw	fa3, 8(a5)
	flw	fa2, 12(a5)
	fmul.s	fa5, fa3, fa5
	fmadd.s	fa5, fa2, fa4, fa5
	fsw	fa5, 4(a4)
	flw	fa5, 16(a0)
	flw	fa4, 20(a0)
	flw	fa3, 16(a5)
	flw	fa2, 20(a5)
	fmul.s	fa5, fa3, fa5
	fmadd.s	fa5, fa2, fa4, fa5
	fsw	fa5, 8(a4)
	flw	fa5, 24(a0)
	flw	fa4, 28(a0)
	flw	fa3, 24(a5)
	flw	fa2, 28(a5)
	addi	a5, a5, 64
	addi	a0, a0, 64
	fmul.s	fa5, fa3, fa5
	fmadd.s	fa5, fa2, fa4, fa5
	fsw	fa5, 12(a4)
	addi	a4, a4, 32
	bne	a5, t0, .LBB0_4
.LBB0_5:                                # %for.cond.cleanup.loopexit.unr-lcssa
	beqz	a6, .LBB0_13
# %bb.6:                                # %for.body.epil
	sh2add	a0, a7, a2
	slli	a4, a7, 2
	flw	fa5, 0(a0)
	sh2add	a0, a7, a3
	flw	fa4, 0(a0)
	add	a0, a2, a4
	add	a4, a4, a3
	flw	fa3, 4(a4)
	fmul.s	fa5, fa4, fa5
	flw	fa4, 4(a0)
	sh1add	a0, a7, a1
	fmadd.s	fa5, fa3, fa4, fa5
	fsw	fa5, 0(a0)
	li	a0, 1
	beq	a6, a0, .LBB0_13
# %bb.7:                                # %for.body.epil.1
	addi	a0, a7, 2
	sh2add	a4, a0, a2
	slli	a5, a0, 2
	flw	fa5, 0(a4)
	sh2add	a4, a0, a3
	sh1add	a0, a0, a1
	flw	fa4, 0(a4)
	add	a4, a2, a5
	add	a5, a5, a3
	flw	fa3, 4(a5)
	fmul.s	fa5, fa4, fa5
	flw	fa4, 4(a4)
	fmadd.s	fa5, fa3, fa4, fa5
	fsw	fa5, 0(a0)
	li	a0, 2
	beq	a6, a0, .LBB0_13
# %bb.8:                                # %for.body.epil.2
	addi	a0, a7, 4
	sh2add	a4, a0, a2
	slli	a5, a0, 2
	flw	fa5, 0(a4)
	sh2add	a4, a0, a3
	sh1add	a0, a0, a1
	flw	fa4, 0(a4)
	add	a4, a2, a5
	add	a5, a5, a3
	flw	fa3, 4(a5)
	fmul.s	fa5, fa4, fa5
	flw	fa4, 4(a4)
	fmadd.s	fa5, fa3, fa4, fa5
	fsw	fa5, 0(a0)
	li	a0, 3
	beq	a6, a0, .LBB0_13
# %bb.9:                                # %for.body.epil.3
	addi	a0, a7, 6
	sh2add	a4, a0, a2
	slli	a5, a0, 2
	flw	fa5, 0(a4)
	sh2add	a4, a0, a3
	sh1add	a0, a0, a1
	flw	fa4, 0(a4)
	add	a4, a2, a5
	add	a5, a5, a3
	flw	fa3, 4(a5)
	fmul.s	fa5, fa4, fa5
	flw	fa4, 4(a4)
	fmadd.s	fa5, fa3, fa4, fa5
	fsw	fa5, 0(a0)
	li	a0, 4
	beq	a6, a0, .LBB0_13
# %bb.10:                               # %for.body.epil.4
	addi	a0, a7, 8
	sh2add	a4, a0, a2
	slli	a5, a0, 2
	flw	fa5, 0(a4)
	sh2add	a4, a0, a3
	sh1add	a0, a0, a1
	flw	fa4, 0(a4)
	add	a4, a2, a5
	add	a5, a5, a3
	flw	fa3, 4(a5)
	fmul.s	fa5, fa4, fa5
	flw	fa4, 4(a4)
	fmadd.s	fa5, fa3, fa4, fa5
	fsw	fa5, 0(a0)
	li	a0, 5
	beq	a6, a0, .LBB0_13
# %bb.11:                               # %for.body.epil.5
	addi	a0, a7, 10
	sh2add	a4, a0, a2
	slli	a5, a0, 2
	flw	fa5, 0(a4)
	sh2add	a4, a0, a3
	sh1add	a0, a0, a1
	flw	fa4, 0(a4)
	add	a4, a2, a5
	add	a5, a5, a3
	flw	fa3, 4(a5)
	fmul.s	fa5, fa4, fa5
	flw	fa4, 4(a4)
	fmadd.s	fa5, fa3, fa4, fa5
	fsw	fa5, 0(a0)
	li	a0, 6
	beq	a6, a0, .LBB0_13
# %bb.12:                               # %for.body.epil.6
	addi	a7, a7, 12
	sh2add	a0, a7, a2
	slli	a4, a7, 2
	flw	fa5, 0(a0)
	sh2add	a0, a7, a3
	add	a2, a2, a4
	add	a3, a3, a4
	flw	fa4, 0(a0)
	flw	fa3, 4(a3)
	sh1add	a0, a7, a1
	fmul.s	fa5, fa4, fa5
	flw	fa4, 4(a2)
	fmadd.s	fa5, fa3, fa4, fa5
	fsw	fa5, 0(a0)
.LBB0_13:                               # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	pairwise_dotproduct_fp32, .Lfunc_end0-pairwise_dotproduct_fp32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
