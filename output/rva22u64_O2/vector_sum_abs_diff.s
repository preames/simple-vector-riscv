	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicsr2p0_zihintpause2p0_zihpm2p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zfhmin1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0"
	.file	"vector_sum_abs_diff.c"
	.text
	.globl	sub                             # -- Begin function sub
	.p2align	1
	.type	sub,@function
sub:                                    # @sub
	.cfi_startproc
# %bb.0:                                # %entry
	subw	a0, a0, a1
	sext.b	a0, a0
	ret
.Lfunc_end0:
	.size	sub, .Lfunc_end0-sub
	.cfi_endproc
                                        # -- End function
	.globl	myabs                           # -- Begin function myabs
	.p2align	1
	.type	myabs,@function
myabs:                                  # @myabs
	.cfi_startproc
# %bb.0:                                # %entry
	neg	a1, a0
	max	a0, a0, a1
	sext.b	a0, a0
	ret
.Lfunc_end1:
	.size	myabs, .Lfunc_end1-myabs
	.cfi_endproc
                                        # -- End function
	.globl	vector_sum_abs_diff             # -- Begin function vector_sum_abs_diff
	.p2align	1
	.type	vector_sum_abs_diff,@function
vector_sum_abs_diff:                    # @vector_sum_abs_diff
	.cfi_startproc
# %bb.0:                                # %entry
	srliw	a3, a3, 3
	beqz	a3, .LBB2_4
# %bb.1:                                # %for.cond1.preheader.preheader
	addi	sp, sp, -48
	.cfi_def_cfa_offset 48
	sd	s0, 40(sp)                      # 8-byte Folded Spill
	sd	s1, 32(sp)                      # 8-byte Folded Spill
	sd	s2, 24(sp)                      # 8-byte Folded Spill
	sd	s3, 16(sp)                      # 8-byte Folded Spill
	sd	s4, 8(sp)                       # 8-byte Folded Spill
	sd	s5, 0(sp)                       # 8-byte Folded Spill
	.cfi_offset s0, -8
	.cfi_offset s1, -16
	.cfi_offset s2, -24
	.cfi_offset s3, -32
	.cfi_offset s4, -40
	.cfi_offset s5, -48
	addi	a2, a2, 3
	addi	a1, a1, 3
	sh2add	a6, a3, a0
.LBB2_2:                                # %for.cond1.preheader
                                        # =>This Inner Loop Header: Depth=1
	lbu	a7, -3(a1)
	lbu	t0, -2(a1)
	lbu	t1, -1(a1)
	lbu	t2, 0(a1)
	lbu	t6, -3(a2)
	lbu	t4, -2(a2)
	lbu	t5, -1(a2)
	lbu	t3, 0(a2)
	lbu	s2, 1(a1)
	lbu	s3, 2(a1)
	lbu	s4, 3(a1)
	lbu	s5, 4(a1)
	sub	a7, a7, t6
	sub	t4, t0, t4
	sub	t0, t1, t5
	sub	t1, t2, t3
	lbu	a3, 1(a2)
	lbu	a4, 2(a2)
	lbu	a5, 3(a2)
	lbu	s0, 4(a2)
	sub	t2, s2, a3
	sub	t3, s3, a4
	sub	t5, s4, a5
	sub	t6, s5, s0
	sext.b	s1, a7
	sext.b	a3, t4
	sext.b	a4, t0
	sext.b	a5, t1
	sext.b	t2, t2
	sext.b	a7, t3
	sext.b	t0, t5
	sext.b	t1, t6
	neg	s0, s1
	max	t3, s1, s0
	neg	s0, a3
	max	t4, a3, s0
	neg	s0, a4
	max	t5, a4, s0
	neg	s0, a5
	max	t6, a5, s0
	neg	s0, t2
	max	t2, t2, s0
	neg	s1, a7
	max	s1, a7, s1
	neg	a3, t0
	max	a7, t0, a3
	neg	a4, t1
	max	a4, t1, a4
	sext.b	a3, t3
	sext.b	a5, t4
	add	a3, a3, a5
	sext.b	a5, t5
	sext.b	s0, t6
	add	a5, a5, s0
	sext.b	s0, t2
	sext.b	s1, s1
	add	s0, s0, s1
	add	a3, a3, a5
	sext.b	a5, a7
	sext.b	a4, a4
	add	a5, a5, s0
	add	a3, a3, a5
	add	a3, a3, a4
	sw	a3, 0(a0)
	addi	a0, a0, 4
	addi	a2, a2, 8
	addi	a1, a1, 8
	bne	a0, a6, .LBB2_2
# %bb.3:
	ld	s0, 40(sp)                      # 8-byte Folded Reload
	ld	s1, 32(sp)                      # 8-byte Folded Reload
	ld	s2, 24(sp)                      # 8-byte Folded Reload
	ld	s3, 16(sp)                      # 8-byte Folded Reload
	ld	s4, 8(sp)                       # 8-byte Folded Reload
	ld	s5, 0(sp)                       # 8-byte Folded Reload
	.cfi_restore s0
	.cfi_restore s1
	.cfi_restore s2
	.cfi_restore s3
	.cfi_restore s4
	.cfi_restore s5
	addi	sp, sp, 48
	.cfi_def_cfa_offset 0
.LBB2_4:                                # %for.cond.cleanup
	ret
.Lfunc_end2:
	.size	vector_sum_abs_diff, .Lfunc_end2-vector_sum_abs_diff
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
