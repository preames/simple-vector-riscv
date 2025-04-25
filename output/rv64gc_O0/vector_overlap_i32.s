	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0"
	.file	"vector_overlap_i32.c"
	.text
	.globl	vector_overlap                  # -- Begin function vector_overlap
	.p2align	1
	.type	vector_overlap,@function
vector_overlap:                         # @vector_overlap
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
                                        # kill: def $x13 killed $x12
	sd	a0, -24(s0)
	sd	a1, -32(s0)
	sw	a2, -36(s0)
	li	a0, 1
	sw	a0, -40(s0)
	j	.LBB0_1
.LBB0_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	lw	a0, -40(s0)
	lw	a1, -36(s0)
	bgeu	a0, a1, .LBB0_4
	j	.LBB0_2
.LBB0_2:                                # %for.body
                                        #   in Loop: Header=BB0_1 Depth=1
	ld	a1, -24(s0)
	lw	a2, -40(s0)
	addiw	a0, a2, -1
	slli	a0, a0, 2
	add	a0, a0, a1
	lw	a0, 0(a0)
	slli	a2, a2, 2
	add	a1, a1, a2
	lw	a3, 0(a1)
	addw	a0, a0, a3
	lw	a1, 4(a1)
	addw	a0, a0, a1
	ld	a1, -32(s0)
	add	a1, a1, a2
	sw	a0, 0(a1)
	j	.LBB0_3
.LBB0_3:                                # %for.inc
                                        #   in Loop: Header=BB0_1 Depth=1
	lw	a0, -40(s0)
	addiw	a0, a0, 1
	sw	a0, -40(s0)
	j	.LBB0_1
.LBB0_4:                                # %for.end
	.cfi_def_cfa sp, 48
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 48
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end0:
	.size	vector_overlap, .Lfunc_end0-vector_overlap
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
