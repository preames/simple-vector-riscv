	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
	.file	"vector_splat_ptr.c"
	.text
	.globl	vector_splat_ptr                # -- Begin function vector_splat_ptr
	.p2align	1
	.type	vector_splat_ptr,@function
vector_splat_ptr:                       # @vector_splat_ptr
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a2, .LBB0_3
# %bb.1:                                # %for.body.preheader
	andi	a3, a2, 7
	li	a4, 8
	bgeu	a2, a4, .LBB0_4
# %bb.2:
	li	a2, 0
	bnez	a3, .LBB0_7
.LBB0_3:                                # %for.cond.cleanup
	ret
.LBB0_4:                                # %for.body.preheader.new
	zext.w	a5, a2
	li	a4, 0
	addi	a2, a0, 32
	andi	a5, a5, -8
	neg	a5, a5
.LBB0_5:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	sd	a1, -32(a2)
	sd	a1, -24(a2)
	sd	a1, -16(a2)
	sd	a1, -8(a2)
	addi	a4, a4, -8
	sd	a1, 0(a2)
	sd	a1, 8(a2)
	sd	a1, 16(a2)
	sd	a1, 24(a2)
	addi	a2, a2, 64
	bne	a5, a4, .LBB0_5
# %bb.6:                                # %for.cond.cleanup.loopexit.unr-lcssa.loopexit
	neg	a2, a4
	beqz	a3, .LBB0_3
.LBB0_7:                                # %for.body.epil
	sh3add	a0, a2, a0
	li	a2, 1
	sd	a1, 0(a0)
	beq	a3, a2, .LBB0_3
# %bb.8:                                # %for.body.epil.1
	li	a2, 2
	sd	a1, 8(a0)
	beq	a3, a2, .LBB0_3
# %bb.9:                                # %for.body.epil.2
	li	a2, 3
	sd	a1, 16(a0)
	beq	a3, a2, .LBB0_3
# %bb.10:                               # %for.body.epil.3
	li	a2, 4
	sd	a1, 24(a0)
	beq	a3, a2, .LBB0_3
# %bb.11:                               # %for.body.epil.4
	li	a2, 5
	sd	a1, 32(a0)
	beq	a3, a2, .LBB0_3
# %bb.12:                               # %for.body.epil.5
	li	a2, 6
	sd	a1, 40(a0)
	beq	a3, a2, .LBB0_3
# %bb.13:                               # %for.body.epil.6
	sd	a1, 48(a0)
	ret
.Lfunc_end0:
	.size	vector_splat_ptr, .Lfunc_end0-vector_splat_ptr
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
