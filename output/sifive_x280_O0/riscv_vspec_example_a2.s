	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zfh1p0_zfhmin1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfh1p0_zvfhmin1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl512b1p0_zvl64b1p0"
	.file	"riscv_vspec_example_a2.c"
	.text
	.globl	example_a2                      # -- Begin function example_a2
	.p2align	1
	.type	example_a2,@function
example_a2:                             # @example_a2
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -64
	.cfi_def_cfa_offset 64
	sd	ra, 56(sp)                      # 8-byte Folded Spill
	sd	s0, 48(sp)                      # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	addi	s0, sp, 64
	.cfi_def_cfa s0, 0
                                        # kill: def $x14 killed $x13
	sd	a0, -24(s0)
	sd	a1, -32(s0)
	sd	a2, -40(s0)
	sw	a3, -44(s0)
	li	a0, 0
	sw	a0, -48(s0)
	j	.LBB0_1
.LBB0_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	lw	a0, -48(s0)
	lw	a1, -44(s0)
	bgeu	a0, a1, .LBB0_7
	j	.LBB0_2
.LBB0_2:                                # %for.body
                                        #   in Loop: Header=BB0_1 Depth=1
	ld	a0, -24(s0)
	lwu	a1, -48(s0)
	add	a0, a0, a1
	lbu	a1, 0(a0)
	li	a0, 4
	blt	a0, a1, .LBB0_4
	j	.LBB0_3
.LBB0_3:                                # %cond.true
                                        #   in Loop: Header=BB0_1 Depth=1
	ld	a0, -40(s0)
	lwu	a1, -48(s0)
	add	a0, a0, a1
	lbu	a0, 0(a0)
	sd	a0, -56(s0)                     # 8-byte Folded Spill
	j	.LBB0_5
.LBB0_4:                                # %cond.false
                                        #   in Loop: Header=BB0_1 Depth=1
	li	a0, 1
	sd	a0, -56(s0)                     # 8-byte Folded Spill
	j	.LBB0_5
.LBB0_5:                                # %cond.end
                                        #   in Loop: Header=BB0_1 Depth=1
	ld	a0, -56(s0)                     # 8-byte Folded Reload
	ld	a1, -32(s0)
	lwu	a2, -48(s0)
	add	a1, a1, a2
	sb	a0, 0(a1)
	j	.LBB0_6
.LBB0_6:                                # %for.inc
                                        #   in Loop: Header=BB0_1 Depth=1
	lw	a0, -48(s0)
	addiw	a0, a0, 1
	sw	a0, -48(s0)
	j	.LBB0_1
.LBB0_7:                                # %for.end
	addi	sp, s0, -64
	.cfi_def_cfa sp, 64
	ld	ra, 56(sp)                      # 8-byte Folded Reload
	ld	s0, 48(sp)                      # 8-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 64
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end0:
	.size	example_a2, .Lfunc_end0-example_a2
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
