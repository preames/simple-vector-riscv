	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
	.file	"vector_overlap_i32.c"
	.text
	.globl	vector_overlap                  # -- Begin function vector_overlap
	.p2align	1
	.type	vector_overlap,@function
vector_overlap:                         # @vector_overlap
	.cfi_startproc
# %bb.0:                                # %entry
	li	a3, 2
	bltu	a2, a3, .LBB0_13
# %bb.1:                                # %for.body.preheader
	lw	t1, 4(a0)
	zext.w	a4, a2
	addiw	a2, a2, -2
	addi	a4, a4, -1
	li	a5, 7
	andi	a6, a4, 7
	bgeu	a2, a5, .LBB0_3
# %bb.2:
	li	t0, 1
	j	.LBB0_5
.LBB0_3:                                # %for.body.preheader.new
	andi	a2, a4, -8
	addi	a4, a0, 20
	addi	a5, a1, 16
	addi	a2, a2, -8
	li	t0, 1
	sh2add	a2, a2, a0
	addi	a7, a2, 52
.LBB0_4:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lw	t2, -20(a4)
	lw	t3, -16(a4)
	lw	a2, -12(a4)
	lw	t4, -8(a4)
	addi	t0, t0, 8
	add	t1, t1, t2
	lw	t5, -4(a4)
	lw	a3, 0(a4)
	add	t3, t3, a2
	add	t2, t4, a2
	add	t1, t1, a2
	lw	a2, 4(a4)
	lw	t6, 8(a4)
	add	t3, t3, t4
	add	t4, t4, t5
	add	t2, t2, t5
	add	t5, t5, a3
	add	t4, t4, a3
	sw	t1, -12(a5)
	sw	t3, -8(a5)
	sw	t2, -4(a5)
	sw	t4, 0(a5)
	add	a3, a3, a2
	add	t5, t5, a2
	add	a2, a2, t6
	add	t2, a3, t6
	lw	a3, 12(a4)
	lw	t1, 16(a4)
	sw	t5, 4(a5)
	addi	a4, a4, 32
	add	a2, a2, a3
	sw	t2, 8(a5)
	add	a3, a3, t6
	add	a3, a3, t1
	sw	a2, 12(a5)
	sw	a3, 16(a5)
	addi	a5, a5, 32
	bne	a4, a7, .LBB0_4
.LBB0_5:                                # %for.cond.cleanup.loopexit.unr-lcssa
	beqz	a6, .LBB0_13
# %bb.6:                                # %for.body.epil
	sh2add	a0, t0, a0
	sh2add	a1, t0, a1
	li	a2, 1
	lw	a5, -4(a0)
	lw	a4, 4(a0)
	add	a3, t1, a5
	add	a3, a3, a4
	sw	a3, 0(a1)
	beq	a6, a2, .LBB0_13
# %bb.7:                                # %for.body.epil.1
	lw	a3, 0(a0)
	lw	a2, 8(a0)
	add	a3, a3, a4
	add	a3, a3, a2
	sw	a3, 4(a1)
	li	a3, 2
	beq	a6, a3, .LBB0_13
# %bb.8:                                # %for.body.epil.2
	lw	a4, 4(a0)
	lw	a3, 12(a0)
	add	a2, a2, a4
	add	a2, a2, a3
	sw	a2, 8(a1)
	li	a2, 3
	beq	a6, a2, .LBB0_13
# %bb.9:                                # %for.body.epil.3
	lw	a4, 8(a0)
	lw	a2, 16(a0)
	add	a3, a3, a4
	add	a3, a3, a2
	sw	a3, 12(a1)
	li	a3, 4
	beq	a6, a3, .LBB0_13
# %bb.10:                               # %for.body.epil.4
	lw	a4, 12(a0)
	lw	a3, 20(a0)
	add	a2, a2, a4
	add	a2, a2, a3
	sw	a2, 16(a1)
	li	a2, 5
	beq	a6, a2, .LBB0_13
# %bb.11:                               # %for.body.epil.5
	lw	a4, 16(a0)
	lw	a2, 24(a0)
	add	a3, a3, a4
	add	a3, a3, a2
	sw	a3, 20(a1)
	li	a3, 6
	beq	a6, a3, .LBB0_13
# %bb.12:                               # %for.body.epil.6
	lw	a3, 20(a0)
	add	a2, a2, a3
	lw	a0, 28(a0)
	add	a0, a0, a2
	sw	a0, 24(a1)
.LBB0_13:                               # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	vector_overlap, .Lfunc_end0-vector_overlap
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
