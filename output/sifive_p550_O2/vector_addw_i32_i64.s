	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
	.file	"vector_addw_i32_i64.c"
	.text
	.globl	test                            # -- Begin function test
	.p2align	1
	.type	test,@function
test:                                   # @test
	.cfi_startproc
# %bb.0:                                # %entry
	blez	a3, .LBB0_3
# %bb.1:                                # %for.body.preheader
	andi	a6, a3, 7
	li	a4, 8
	bgeu	a3, a4, .LBB0_4
# %bb.2:
	li	a3, 0
	bnez	a6, .LBB0_7
.LBB0_3:                                # %for.cond.cleanup
	ret
.LBB0_4:                                # %for.body.preheader.new
	addi	sp, sp, -48
	.cfi_def_cfa_offset 48
	sd	s0, 40(sp)                      # 8-byte Folded Spill
	sd	s1, 32(sp)                      # 8-byte Folded Spill
	sd	s2, 24(sp)                      # 8-byte Folded Spill
	sd	s3, 16(sp)                      # 8-byte Folded Spill
	sd	s4, 8(sp)                       # 8-byte Folded Spill
	.cfi_offset s0, -8
	.cfi_offset s1, -16
	.cfi_offset s2, -24
	.cfi_offset s3, -32
	.cfi_offset s4, -40
	lui	a4, 524288
	addiw	a4, a4, -8
	li	t0, 0
	and	a3, a3, a4
	addi	a4, a0, 32
	addi	a5, a1, 16
	neg	a7, a3
	addi	a3, a2, 16
.LBB0_5:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lw	t1, -16(a5)
	lw	t2, -12(a5)
	lw	t3, -8(a5)
	lw	t4, -4(a5)
	addi	t0, t0, -8
	lw	t5, -16(a3)
	lw	t6, -12(a3)
	lw	s3, -8(a3)
	lw	s2, -4(a3)
	add	t1, t1, t5
	add	t2, t2, t6
	add	t3, t3, s3
	add	t4, t4, s2
	ld	s1, -32(a4)
	ld	s0, -24(a4)
	ld	t5, -16(a4)
	ld	s4, -8(a4)
	add	t1, t1, s1
	add	t2, t2, s0
	sd	t1, -32(a4)
	add	t3, t3, t5
	sd	t2, -24(a4)
	add	t4, t4, s4
	sd	t3, -16(a4)
	sd	t4, -8(a4)
	lw	t2, 0(a5)
	lw	t1, 4(a5)
	lw	t3, 8(a5)
	lw	t4, 12(a5)
	addi	a5, a5, 32
	lw	s0, 0(a3)
	lw	s2, 4(a3)
	lw	t5, 8(a3)
	lw	t6, 12(a3)
	addi	a3, a3, 32
	add	t2, t2, s0
	add	t1, t1, s2
	add	t3, t3, t5
	add	t4, t4, t6
	ld	s0, 0(a4)
	ld	s1, 8(a4)
	ld	s3, 16(a4)
	ld	s4, 24(a4)
	add	t2, t2, s0
	add	t1, t1, s1
	add	t3, t3, s3
	add	t4, t4, s4
	sd	t2, 0(a4)
	sd	t1, 8(a4)
	sd	t3, 16(a4)
	sd	t4, 24(a4)
	addi	a4, a4, 64
	bne	a7, t0, .LBB0_5
# %bb.6:                                # %for.cond.cleanup.loopexit.unr-lcssa.loopexit
	ld	s0, 40(sp)                      # 8-byte Folded Reload
	neg	a3, t0
	ld	s1, 32(sp)                      # 8-byte Folded Reload
	ld	s2, 24(sp)                      # 8-byte Folded Reload
	ld	s3, 16(sp)                      # 8-byte Folded Reload
	ld	s4, 8(sp)                       # 8-byte Folded Reload
	.cfi_restore s0
	.cfi_restore s1
	.cfi_restore s2
	.cfi_restore s3
	.cfi_restore s4
	addi	sp, sp, 48
	.cfi_def_cfa_offset 0
	beqz	a6, .LBB0_3
.LBB0_7:                                # %for.body.epil
	sh2add	a1, a3, a1
	sh2add	a2, a3, a2
	sh3add	a0, a3, a0
	lw	a4, 0(a1)
	lw	a5, 0(a2)
	add	a4, a4, a5
	ld	a3, 0(a0)
	add	a3, a3, a4
	sd	a3, 0(a0)
	li	a3, 1
	beq	a6, a3, .LBB0_3
# %bb.8:                                # %for.body.epil.1
	lw	a3, 4(a1)
	lw	a4, 4(a2)
	add	a3, a3, a4
	ld	a4, 8(a0)
	add	a3, a3, a4
	sd	a3, 8(a0)
	li	a3, 2
	beq	a6, a3, .LBB0_3
# %bb.9:                                # %for.body.epil.2
	lw	a3, 8(a1)
	lw	a4, 8(a2)
	add	a3, a3, a4
	ld	a4, 16(a0)
	add	a3, a3, a4
	sd	a3, 16(a0)
	li	a3, 3
	beq	a6, a3, .LBB0_3
# %bb.10:                               # %for.body.epil.3
	lw	a3, 12(a1)
	lw	a4, 12(a2)
	add	a3, a3, a4
	ld	a4, 24(a0)
	add	a3, a3, a4
	sd	a3, 24(a0)
	li	a3, 4
	beq	a6, a3, .LBB0_3
# %bb.11:                               # %for.body.epil.4
	lw	a3, 16(a1)
	lw	a4, 16(a2)
	add	a3, a3, a4
	ld	a4, 32(a0)
	add	a3, a3, a4
	sd	a3, 32(a0)
	li	a3, 5
	beq	a6, a3, .LBB0_3
# %bb.12:                               # %for.body.epil.5
	lw	a3, 20(a1)
	lw	a4, 20(a2)
	add	a3, a3, a4
	ld	a4, 40(a0)
	add	a3, a3, a4
	sd	a3, 40(a0)
	li	a3, 6
	beq	a6, a3, .LBB0_3
# %bb.13:                               # %for.body.epil.6
	lw	a1, 24(a1)
	lw	a2, 24(a2)
	add	a1, a1, a2
	ld	a2, 48(a0)
	add	a1, a1, a2
	sd	a1, 48(a0)
	ret
.Lfunc_end0:
	.size	test, .Lfunc_end0-test
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
