	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
	.file	"dotproduct_i32.c"
	.text
	.globl	dotproduct_i32                  # -- Begin function dotproduct_i32
	.p2align	1
	.type	dotproduct_i32,@function
dotproduct_i32:                         # @dotproduct_i32
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a0, .LBB0_4
# %bb.1:                                # %for.body.preheader
	andi	a6, a0, 7
	li	a3, 8
	bgeu	a0, a3, .LBB0_5
# %bb.2:
	li	a3, 0
	li	t0, 0
	bnez	a6, .LBB0_8
.LBB0_3:                                # %for.cond.cleanup
	sext.w	a0, t0
	ret
.LBB0_4:
	li	a0, 0
	ret
.LBB0_5:                                # %for.body.preheader.new
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sd	s0, 8(sp)                       # 8-byte Folded Spill
	sd	s1, 0(sp)                       # 8-byte Folded Spill
	.cfi_offset s0, -8
	.cfi_offset s1, -16
	zext.w	a0, a0
	li	t5, 0
	li	t0, 0
	andi	a0, a0, -8
	addi	a3, a2, 16
	neg	a7, a0
	addi	a0, a1, 16
.LBB0_6:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lw	t1, -16(a0)
	lw	t2, -12(a0)
	lw	t3, -8(a0)
	lw	t4, -4(a0)
	addi	t5, t5, -8
	lw	a4, -16(a3)
	lw	a5, -12(a3)
	lw	t6, -8(a3)
	lw	s0, -4(a3)
	mul	t1, a4, t1
	mul	a5, a5, t2
	mul	a4, t6, t3
	mul	t2, s0, t4
	add	t0, t0, t1
	add	a4, a4, a5
	add	t0, t0, a4
	lw	t1, 0(a0)
	lw	t3, 4(a0)
	lw	t4, 8(a0)
	lw	t6, 12(a0)
	addi	a0, a0, 32
	lw	a4, 0(a3)
	lw	s0, 4(a3)
	lw	a5, 8(a3)
	lw	s1, 12(a3)
	addi	a3, a3, 32
	mul	a4, a4, t1
	mul	s0, s0, t3
	mul	a5, a5, t4
	mul	s1, s1, t6
	add	a4, a4, t2
	add	a5, a5, s1
	add	a4, a4, s0
	add	a4, a4, t0
	add	t0, a5, a4
	bne	a7, t5, .LBB0_6
# %bb.7:                                # %for.cond.cleanup.loopexit.unr-lcssa.loopexit
	ld	s0, 8(sp)                       # 8-byte Folded Reload
	neg	a3, t5
	ld	s1, 0(sp)                       # 8-byte Folded Reload
	.cfi_restore s0
	.cfi_restore s1
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	beqz	a6, .LBB0_3
.LBB0_8:                                # %for.body.epil
	sh2add	a0, a3, a1
	sh2add	a1, a3, a2
	lw	a5, 0(a0)
	lw	a2, 0(a1)
	mul	a2, a2, a5
	add	t0, t0, a2
	li	a2, 1
	beq	a6, a2, .LBB0_3
# %bb.9:                                # %for.body.epil.1
	lw	a2, 4(a0)
	lw	a3, 4(a1)
	mul	a2, a3, a2
	add	t0, t0, a2
	li	a2, 2
	beq	a6, a2, .LBB0_3
# %bb.10:                               # %for.body.epil.2
	lw	a2, 8(a0)
	lw	a3, 8(a1)
	mul	a2, a3, a2
	add	t0, t0, a2
	li	a2, 3
	beq	a6, a2, .LBB0_3
# %bb.11:                               # %for.body.epil.3
	lw	a2, 12(a0)
	lw	a3, 12(a1)
	mul	a2, a3, a2
	add	t0, t0, a2
	li	a2, 4
	beq	a6, a2, .LBB0_3
# %bb.12:                               # %for.body.epil.4
	lw	a2, 16(a0)
	lw	a3, 16(a1)
	mul	a2, a3, a2
	add	t0, t0, a2
	li	a2, 5
	beq	a6, a2, .LBB0_3
# %bb.13:                               # %for.body.epil.5
	lw	a2, 20(a0)
	lw	a3, 20(a1)
	mul	a2, a3, a2
	add	t0, t0, a2
	li	a2, 6
	beq	a6, a2, .LBB0_3
# %bb.14:                               # %for.body.epil.6
	lw	a0, 24(a0)
	lw	a1, 24(a1)
	mul	a0, a1, a0
	add	t0, t0, a0
	sext.w	a0, t0
	ret
.Lfunc_end0:
	.size	dotproduct_i32, .Lfunc_end0-dotproduct_i32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
