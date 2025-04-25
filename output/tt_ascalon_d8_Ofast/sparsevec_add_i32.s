	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_h1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zifencei2p0_zihintntl1p0_zihintpause2p0_zihpm2p0_zimop1p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zawrs1p0_zfa1p0_zfbfmin1p0_zfh1p0_zfhmin1p0_zca1p0_zcb1p0_zcd1p0_zcmop1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0_zvbb1p0_zvbc1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfbfmin1p0_zvfbfwma1p0_zvfh1p0_zvfhmin1p0_zvkb1p0_zvkg1p0_zvkn1p0_zvknc1p0_zvkned1p0_zvkng1p0_zvknhb1p0_zvkt1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0_sha1p0_shcounterenw1p0_shgatpa1p0_shtvala1p0_shvsatpa1p0_shvstvala1p0_shvstvecd1p0_smaia1p0_ssaia1p0_ssccptr1p0_sscofpmf1p0_sscounterenw1p0_ssnpm1p0_ssstateen1p0_ssstrict1p0_sstc1p0_sstvala1p0_sstvecd1p0_ssu64xl1p0_supm1p0_svade1p0_svbare1p0_svinval1p0_svnapot1p0_svpbmt1p0"
	.file	"sparsevec_add_i32.c"
	.text
	.globl	sparsevec_add_i32               # -- Begin function sparsevec_add_i32
	.p2align	1
	.type	sparsevec_add_i32,@function
sparsevec_add_i32:                      # @sparsevec_add_i32
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a0, .LBB0_3
# %bb.1:                                # %for.body.preheader
	andi	a6, a0, 7
	li	a5, 8
	bgeu	a0, a5, .LBB0_4
# %bb.2:
	li	a5, 0
	bnez	a6, .LBB0_7
.LBB0_3:                                # %for.cond.cleanup
	ret
.LBB0_4:                                # %for.body.preheader.new
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sd	s0, 24(sp)                      # 8-byte Folded Spill
	sd	s1, 16(sp)                      # 8-byte Folded Spill
	sd	s2, 8(sp)                       # 8-byte Folded Spill
	sd	s3, 0(sp)                       # 8-byte Folded Spill
	.cfi_offset s0, -8
	.cfi_offset s1, -16
	.cfi_offset s2, -24
	.cfi_offset s3, -32
	zext.w	a0, a0
	li	t0, 0
	addi	a5, a4, 8
	andi	a0, a0, -8
	neg	a7, a0
	addi	a0, a2, 8
.LBB0_5:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lh	t1, -8(a5)
	lh	t2, -6(a5)
	lh	t3, -4(a5)
	lh	t4, -2(a5)
	addi	t0, t0, -8
	sh2add	t1, t1, a3
	lh	t5, -8(a0)
	lh	t6, -6(a0)
	lh	s3, -4(a0)
	lh	s2, -2(a0)
	sh2add	s1, t5, a1
	lw	t1, 0(t1)
	lw	s0, 0(s1)
	add	t1, t1, s0
	sh2add	s0, t6, a1
	sw	t1, 0(s1)
	sh2add	s1, t2, a3
	lw	t1, 0(s1)
	lw	s1, 0(s0)
	add	t1, t1, s1
	sh2add	s1, t3, a3
	sw	t1, 0(s0)
	sh2add	s0, s3, a1
	lw	t1, 0(s1)
	lw	s1, 0(s0)
	add	t1, t1, s1
	sh2add	s1, t4, a3
	sw	t1, 0(s0)
	sh2add	t1, s2, a1
	lw	s1, 0(s1)
	lw	s0, 0(t1)
	add	s0, s0, s1
	lh	s1, 0(a5)
	lh	t2, 2(a5)
	lh	t3, 4(a5)
	sw	s0, 0(t1)
	lh	t1, 6(a5)
	lh	s0, 0(a0)
	lh	t4, 2(a0)
	lh	t5, 4(a0)
	lh	t6, 6(a0)
	addi	a0, a0, 16
	addi	a5, a5, 16
	sh2add	s1, s1, a3
	sh2add	s0, s0, a1
	lw	s2, 0(s1)
	lw	s1, 0(s0)
	add	s1, s1, s2
	sw	s1, 0(s0)
	sh2add	s1, t2, a3
	sh2add	s0, t4, a1
	lw	t2, 0(s1)
	lw	s1, 0(s0)
	add	t2, t2, s1
	sh2add	s1, t3, a3
	sw	t2, 0(s0)
	sh2add	s0, t5, a1
	lw	t2, 0(s1)
	lw	s1, 0(s0)
	add	t2, t2, s1
	sh2add	s1, t1, a3
	sw	t2, 0(s0)
	sh2add	s0, t6, a1
	lw	t1, 0(s1)
	lw	s1, 0(s0)
	add	t1, t1, s1
	sw	t1, 0(s0)
	bne	a7, t0, .LBB0_5
# %bb.6:                                # %for.cond.cleanup.loopexit.unr-lcssa.loopexit
	ld	s0, 24(sp)                      # 8-byte Folded Reload
	ld	s1, 16(sp)                      # 8-byte Folded Reload
	ld	s2, 8(sp)                       # 8-byte Folded Reload
	neg	a5, t0
	ld	s3, 0(sp)                       # 8-byte Folded Reload
	.cfi_restore s0
	.cfi_restore s1
	.cfi_restore s2
	.cfi_restore s3
	addi	sp, sp, 32
	.cfi_def_cfa_offset 0
	beqz	a6, .LBB0_3
.LBB0_7:                                # %for.body.epil
	sh1add	a7, a5, a4
	sh1add	a2, a5, a2
	lh	a4, 0(a7)
	lh	a5, 0(a2)
	sh2add	a4, a4, a3
	sh2add	a5, a5, a1
	lw	a4, 0(a4)
	lw	a0, 0(a5)
	add	a0, a0, a4
	sw	a0, 0(a5)
	li	a0, 1
	beq	a6, a0, .LBB0_3
# %bb.8:                                # %for.body.epil.1
	lh	a0, 2(a7)
	lh	a4, 2(a2)
	sh2add	a0, a0, a3
	sh2add	a4, a4, a1
	lw	a0, 0(a0)
	lw	a5, 0(a4)
	add	a0, a0, a5
	sw	a0, 0(a4)
	li	a0, 2
	beq	a6, a0, .LBB0_3
# %bb.9:                                # %for.body.epil.2
	lh	a0, 4(a7)
	lh	a4, 4(a2)
	sh2add	a0, a0, a3
	sh2add	a4, a4, a1
	lw	a0, 0(a0)
	lw	a5, 0(a4)
	add	a0, a0, a5
	sw	a0, 0(a4)
	li	a0, 3
	beq	a6, a0, .LBB0_3
# %bb.10:                               # %for.body.epil.3
	lh	a0, 6(a7)
	lh	a4, 6(a2)
	sh2add	a0, a0, a3
	sh2add	a4, a4, a1
	lw	a0, 0(a0)
	lw	a5, 0(a4)
	add	a0, a0, a5
	sw	a0, 0(a4)
	li	a0, 4
	beq	a6, a0, .LBB0_3
# %bb.11:                               # %for.body.epil.4
	lh	a0, 8(a7)
	lh	a4, 8(a2)
	sh2add	a0, a0, a3
	sh2add	a4, a4, a1
	lw	a0, 0(a0)
	lw	a5, 0(a4)
	add	a0, a0, a5
	sw	a0, 0(a4)
	li	a0, 5
	beq	a6, a0, .LBB0_3
# %bb.12:                               # %for.body.epil.5
	lh	a0, 10(a7)
	lh	a4, 10(a2)
	sh2add	a0, a0, a3
	sh2add	a4, a4, a1
	lw	a0, 0(a0)
	lw	a5, 0(a4)
	add	a0, a0, a5
	sw	a0, 0(a4)
	li	a0, 6
	beq	a6, a0, .LBB0_3
# %bb.13:                               # %for.body.epil.6
	lh	a0, 12(a7)
	lh	a2, 12(a2)
	sh2add	a0, a0, a3
	sh2add	a1, a2, a1
	lw	a0, 0(a0)
	lw	a2, 0(a1)
	add	a0, a0, a2
	sw	a0, 0(a1)
	ret
.Lfunc_end0:
	.size	sparsevec_add_i32, .Lfunc_end0-sparsevec_add_i32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
