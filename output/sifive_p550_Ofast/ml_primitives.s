	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
	.file	"ml_primitives.c"
	.text
	.globl	vector_expr_f32                 # -- Begin function vector_expr_f32
	.p2align	1
	.type	vector_expr_f32,@function
vector_expr_f32:                        # @vector_expr_f32
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a2, .LBB0_14
# %bb.1:                                # %for.body.preheader
	addi	sp, sp, -64
	.cfi_def_cfa_offset 64
	sd	ra, 56(sp)                      # 8-byte Folded Spill
	sd	s0, 48(sp)                      # 8-byte Folded Spill
	sd	s1, 40(sp)                      # 8-byte Folded Spill
	sd	s2, 32(sp)                      # 8-byte Folded Spill
	sd	s3, 24(sp)                      # 8-byte Folded Spill
	sd	s4, 16(sp)                      # 8-byte Folded Spill
	sd	s5, 8(sp)                       # 8-byte Folded Spill
	sd	s6, 0(sp)                       # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	.cfi_offset s2, -32
	.cfi_offset s3, -40
	.cfi_offset s4, -48
	.cfi_offset s5, -56
	.cfi_offset s6, -64
	mv	s4, a0
	andi	s2, a2, 7
	li	a0, 8
	bgeu	a2, a0, .LBB0_3
# %bb.2:
	li	s0, 0
	bnez	s2, .LBB0_6
	j	.LBB0_13
.LBB0_3:                                # %for.body.preheader.new
	zext.w	a0, a2
	li	s6, 0
	addi	s0, s4, 16
	andi	a0, a0, -8
	mv	s3, a1
	addi	s1, a1, 16
	neg	s5, a0
.LBB0_4:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	flw	fa0, -16(s1)
	call	expf
	flw	fa5, -16(s0)
	fadd.s	fa5, fa5, fa0
	fsw	fa5, -16(s0)
	flw	fa0, -12(s1)
	call	expf
	flw	fa5, -12(s0)
	fadd.s	fa5, fa5, fa0
	fsw	fa5, -12(s0)
	flw	fa0, -8(s1)
	call	expf
	flw	fa5, -8(s0)
	fadd.s	fa5, fa5, fa0
	fsw	fa5, -8(s0)
	flw	fa0, -4(s1)
	call	expf
	flw	fa5, -4(s0)
	fadd.s	fa5, fa5, fa0
	fsw	fa5, -4(s0)
	flw	fa0, 0(s1)
	call	expf
	flw	fa5, 0(s0)
	fadd.s	fa5, fa5, fa0
	fsw	fa5, 0(s0)
	flw	fa0, 4(s1)
	call	expf
	flw	fa5, 4(s0)
	fadd.s	fa5, fa5, fa0
	fsw	fa5, 4(s0)
	flw	fa0, 8(s1)
	call	expf
	flw	fa5, 8(s0)
	fadd.s	fa5, fa5, fa0
	fsw	fa5, 8(s0)
	flw	fa0, 12(s1)
	call	expf
	flw	fa5, 12(s0)
	addi	s6, s6, -8
	addi	s1, s1, 32
	fadd.s	fa5, fa5, fa0
	fsw	fa5, 12(s0)
	addi	s0, s0, 32
	bne	s5, s6, .LBB0_4
# %bb.5:                                # %for.cond.cleanup.loopexit.unr-lcssa.loopexit
	neg	s0, s6
	mv	a1, s3
	beqz	s2, .LBB0_13
.LBB0_6:                                # %for.body.epil
	sh2add	s1, s0, a1
	flw	fa0, 0(s1)
	call	expf
	sh2add	s0, s0, s4
	li	a0, 1
	flw	fa5, 0(s0)
	fadd.s	fa5, fa5, fa0
	fsw	fa5, 0(s0)
	beq	s2, a0, .LBB0_13
# %bb.7:                                # %for.body.epil.1
	flw	fa0, 4(s1)
	call	expf
	flw	fa5, 4(s0)
	li	a0, 2
	fadd.s	fa5, fa5, fa0
	fsw	fa5, 4(s0)
	beq	s2, a0, .LBB0_13
# %bb.8:                                # %for.body.epil.2
	flw	fa0, 8(s1)
	call	expf
	flw	fa5, 8(s0)
	li	a0, 3
	fadd.s	fa5, fa5, fa0
	fsw	fa5, 8(s0)
	beq	s2, a0, .LBB0_13
# %bb.9:                                # %for.body.epil.3
	flw	fa0, 12(s1)
	call	expf
	flw	fa5, 12(s0)
	li	a0, 4
	fadd.s	fa5, fa5, fa0
	fsw	fa5, 12(s0)
	beq	s2, a0, .LBB0_13
# %bb.10:                               # %for.body.epil.4
	flw	fa0, 16(s1)
	call	expf
	flw	fa5, 16(s0)
	li	a0, 5
	fadd.s	fa5, fa5, fa0
	fsw	fa5, 16(s0)
	beq	s2, a0, .LBB0_13
# %bb.11:                               # %for.body.epil.5
	flw	fa0, 20(s1)
	call	expf
	flw	fa5, 20(s0)
	li	a0, 6
	fadd.s	fa5, fa5, fa0
	fsw	fa5, 20(s0)
	beq	s2, a0, .LBB0_13
# %bb.12:                               # %for.body.epil.6
	flw	fa0, 24(s1)
	call	expf
	flw	fa5, 24(s0)
	fadd.s	fa5, fa5, fa0
	fsw	fa5, 24(s0)
.LBB0_13:
	ld	ra, 56(sp)                      # 8-byte Folded Reload
	ld	s0, 48(sp)                      # 8-byte Folded Reload
	ld	s1, 40(sp)                      # 8-byte Folded Reload
	ld	s2, 32(sp)                      # 8-byte Folded Reload
	ld	s3, 24(sp)                      # 8-byte Folded Reload
	ld	s4, 16(sp)                      # 8-byte Folded Reload
	ld	s5, 8(sp)                       # 8-byte Folded Reload
	ld	s6, 0(sp)                       # 8-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	.cfi_restore s1
	.cfi_restore s2
	.cfi_restore s3
	.cfi_restore s4
	.cfi_restore s5
	.cfi_restore s6
	addi	sp, sp, 64
	.cfi_def_cfa_offset 0
.LBB0_14:                               # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	vector_expr_f32, .Lfunc_end0-vector_expr_f32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
