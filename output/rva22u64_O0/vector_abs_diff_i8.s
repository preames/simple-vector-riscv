	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicsr2p0_zihintpause2p0_zihpm2p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zfhmin1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0"
	.file	"vector_abs_diff_i8.c"
	.text
	.globl	sub                             # -- Begin function sub
	.p2align	1
	.type	sub,@function
sub:                                    # @sub
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sd	ra, 24(sp)                      # 8-byte Folded Spill
	sd	s0, 16(sp)                      # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
                                        # kill: def $x12 killed $x11
                                        # kill: def $x12 killed $x10
	sb	a0, -17(s0)
	sb	a1, -18(s0)
	lbu	a0, -17(s0)
	lbu	a1, -18(s0)
	subw	a0, a0, a1
	sext.b	a0, a0
	.cfi_def_cfa sp, 32
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 32
	.cfi_def_cfa_offset 0
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
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sd	ra, 24(sp)                      # 8-byte Folded Spill
	sd	s0, 16(sp)                      # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
                                        # kill: def $x11 killed $x10
	sb	a0, -17(s0)
	lb	a0, -17(s0)
	bgez	a0, .LBB1_2
	j	.LBB1_1
.LBB1_1:                                # %cond.true
	lb	a1, -17(s0)
	li	a0, 0
	call	sub
	sd	a0, -32(s0)                     # 8-byte Folded Spill
	j	.LBB1_3
.LBB1_2:                                # %cond.false
	lb	a0, -17(s0)
	sd	a0, -32(s0)                     # 8-byte Folded Spill
	j	.LBB1_3
.LBB1_3:                                # %cond.end
	ld	a0, -32(s0)                     # 8-byte Folded Reload
	sext.b	a0, a0
	.cfi_def_cfa sp, 32
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 32
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end1:
	.size	myabs, .Lfunc_end1-myabs
	.cfi_endproc
                                        # -- End function
	.globl	vector_abs_diff                 # -- Begin function vector_abs_diff
	.p2align	1
	.type	vector_abs_diff,@function
vector_abs_diff:                        # @vector_abs_diff
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -48
	.cfi_def_cfa_offset 48
	sd	ra, 40(sp)                      # 8-byte Folded Spill
	sd	s0, 32(sp)                      # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	addi	s0, sp, 48
	.cfi_def_cfa s0, 0
                                        # kill: def $x14 killed $x13
	sd	a0, -24(s0)
	sd	a1, -32(s0)
	sd	a2, -40(s0)
	sw	a3, -44(s0)
	li	a0, 0
	sw	a0, -48(s0)
	j	.LBB2_1
.LBB2_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	lw	a0, -48(s0)
	lw	a1, -44(s0)
	bgeu	a0, a1, .LBB2_4
	j	.LBB2_2
.LBB2_2:                                # %for.body
                                        #   in Loop: Header=BB2_1 Depth=1
	ld	a0, -32(s0)
	lwu	a2, -48(s0)
	add	a0, a0, a2
	lb	a0, 0(a0)
	ld	a1, -40(s0)
	add	a1, a1, a2
	lb	a1, 0(a1)
	call	sub
	call	myabs
	ld	a1, -24(s0)
	lwu	a2, -48(s0)
	add	a1, a1, a2
	sb	a0, 0(a1)
	j	.LBB2_3
.LBB2_3:                                # %for.inc
                                        #   in Loop: Header=BB2_1 Depth=1
	lw	a0, -48(s0)
	addiw	a0, a0, 1
	sw	a0, -48(s0)
	j	.LBB2_1
.LBB2_4:                                # %for.end
	.cfi_def_cfa sp, 48
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 48
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end2:
	.size	vector_abs_diff, .Lfunc_end2-vector_abs_diff
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym sub
	.addrsig_sym myabs
