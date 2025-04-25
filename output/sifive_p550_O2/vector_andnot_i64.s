	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
	.file	"vector_andnot_i64.c"
	.text
	.globl	vector_andnot_i64               # -- Begin function vector_andnot_i64
	.p2align	1
	.type	vector_andnot_i64,@function
vector_andnot_i64:                      # @vector_andnot_i64
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a2, .LBB0_3
# %bb.1:                                # %for.body.preheader
	andi	a6, a2, 7
	li	a3, 8
	bgeu	a2, a3, .LBB0_4
# %bb.2:
	li	a2, 0
	bnez	a6, .LBB0_7
.LBB0_3:                                # %for.cond.cleanup
	ret
.LBB0_4:                                # %for.body.preheader.new
	zext.w	a2, a2
	li	a4, 0
	addi	a5, a1, 32
	andi	a2, a2, -8
	addi	a3, a0, 32
	neg	a7, a2
.LBB0_5:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	ld	t0, -32(a5)
	addi	a4, a4, -8
	ld	t2, -32(a3)
	ld	t1, -24(a3)
	ld	t3, -16(a3)
	ld	t4, -8(a3)
	andn	a2, t2, t0
	sd	a2, -32(a3)
	ld	t2, 0(a3)
	ld	a2, -24(a5)
	andn	a2, t1, a2
	ld	t1, 8(a3)
	sd	a2, -24(a3)
	ld	a2, -16(a5)
	andn	a2, t3, a2
	ld	t3, 16(a3)
	sd	a2, -16(a3)
	ld	a2, -8(a5)
	andn	a2, t4, a2
	ld	t4, 24(a3)
	sd	a2, -8(a3)
	ld	t0, 0(a5)
	andn	a2, t2, t0
	sd	a2, 0(a3)
	ld	a2, 8(a5)
	andn	a2, t1, a2
	sd	a2, 8(a3)
	ld	a2, 16(a5)
	andn	a2, t3, a2
	sd	a2, 16(a3)
	ld	a2, 24(a5)
	addi	a5, a5, 64
	andn	a2, t4, a2
	sd	a2, 24(a3)
	addi	a3, a3, 64
	bne	a7, a4, .LBB0_5
# %bb.6:                                # %for.cond.cleanup.loopexit.unr-lcssa.loopexit
	neg	a2, a4
	beqz	a6, .LBB0_3
.LBB0_7:                                # %for.body.epil
	sh3add	a0, a2, a0
	sh3add	a1, a2, a1
	ld	a3, 0(a0)
	ld	a2, 0(a1)
	andn	a2, a3, a2
	sd	a2, 0(a0)
	li	a2, 1
	beq	a6, a2, .LBB0_3
# %bb.8:                                # %for.body.epil.1
	ld	a2, 8(a0)
	ld	a3, 8(a1)
	andn	a2, a2, a3
	sd	a2, 8(a0)
	li	a2, 2
	beq	a6, a2, .LBB0_3
# %bb.9:                                # %for.body.epil.2
	ld	a2, 16(a0)
	ld	a3, 16(a1)
	andn	a2, a2, a3
	sd	a2, 16(a0)
	li	a2, 3
	beq	a6, a2, .LBB0_3
# %bb.10:                               # %for.body.epil.3
	ld	a2, 24(a0)
	ld	a3, 24(a1)
	andn	a2, a2, a3
	sd	a2, 24(a0)
	li	a2, 4
	beq	a6, a2, .LBB0_3
# %bb.11:                               # %for.body.epil.4
	ld	a2, 32(a0)
	ld	a3, 32(a1)
	andn	a2, a2, a3
	sd	a2, 32(a0)
	li	a2, 5
	beq	a6, a2, .LBB0_3
# %bb.12:                               # %for.body.epil.5
	ld	a2, 40(a0)
	ld	a3, 40(a1)
	andn	a2, a2, a3
	sd	a2, 40(a0)
	li	a2, 6
	beq	a6, a2, .LBB0_3
# %bb.13:                               # %for.body.epil.6
	ld	a2, 48(a0)
	ld	a1, 48(a1)
	andn	a1, a2, a1
	sd	a1, 48(a0)
	ret
.Lfunc_end0:
	.size	vector_andnot_i64, .Lfunc_end0-vector_andnot_i64
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
