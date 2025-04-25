	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
	.file	"vector_add_i64.c"
	.text
	.globl	vector_add_i64                  # -- Begin function vector_add_i64
	.p2align	1
	.type	vector_add_i64,@function
vector_add_i64:                         # @vector_add_i64
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a1, .LBB0_3
# %bb.1:                                # %for.body.preheader
	andi	a6, a1, 7
	li	a4, 8
	bgeu	a1, a4, .LBB0_4
# %bb.2:
	li	a1, 0
	bnez	a6, .LBB0_7
.LBB0_3:                                # %for.cond.cleanup
	ret
.LBB0_4:                                # %for.body.preheader.new
	zext.w	a5, a1
	li	a4, 0
	addi	a1, a0, 32
	andi	a5, a5, -8
	neg	a7, a5
.LBB0_5:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	ld	t0, -32(a1)
	ld	t1, -24(a1)
	ld	a3, -16(a1)
	ld	a5, -8(a1)
	addi	a4, a4, -8
	add	t0, t0, a2
	add	t1, t1, a2
	add	a3, a3, a2
	add	a5, a5, a2
	sd	t0, -32(a1)
	sd	t1, -24(a1)
	sd	a3, -16(a1)
	sd	a5, -8(a1)
	ld	t0, 0(a1)
	ld	t1, 8(a1)
	ld	a3, 16(a1)
	ld	a5, 24(a1)
	add	t0, t0, a2
	add	t1, t1, a2
	add	a3, a3, a2
	add	a5, a5, a2
	sd	t0, 0(a1)
	sd	t1, 8(a1)
	sd	a3, 16(a1)
	sd	a5, 24(a1)
	addi	a1, a1, 64
	bne	a7, a4, .LBB0_5
# %bb.6:                                # %for.cond.cleanup.loopexit.unr-lcssa.loopexit
	neg	a1, a4
	beqz	a6, .LBB0_3
.LBB0_7:                                # %for.body.epil
	sh3add	a0, a1, a0
	ld	a1, 0(a0)
	add	a1, a1, a2
	sd	a1, 0(a0)
	li	a1, 1
	beq	a6, a1, .LBB0_3
# %bb.8:                                # %for.body.epil.1
	ld	a1, 8(a0)
	add	a1, a1, a2
	sd	a1, 8(a0)
	li	a1, 2
	beq	a6, a1, .LBB0_3
# %bb.9:                                # %for.body.epil.2
	ld	a1, 16(a0)
	add	a1, a1, a2
	sd	a1, 16(a0)
	li	a1, 3
	beq	a6, a1, .LBB0_3
# %bb.10:                               # %for.body.epil.3
	ld	a1, 24(a0)
	add	a1, a1, a2
	sd	a1, 24(a0)
	li	a1, 4
	beq	a6, a1, .LBB0_3
# %bb.11:                               # %for.body.epil.4
	ld	a1, 32(a0)
	add	a1, a1, a2
	sd	a1, 32(a0)
	li	a1, 5
	beq	a6, a1, .LBB0_3
# %bb.12:                               # %for.body.epil.5
	ld	a1, 40(a0)
	add	a1, a1, a2
	sd	a1, 40(a0)
	li	a1, 6
	beq	a6, a1, .LBB0_3
# %bb.13:                               # %for.body.epil.6
	ld	a1, 48(a0)
	add	a1, a1, a2
	sd	a1, 48(a0)
	ret
.Lfunc_end0:
	.size	vector_add_i64, .Lfunc_end0-vector_add_i64
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
