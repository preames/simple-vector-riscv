	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zbs1p0_zve32x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"openblas_gepb_16x4.c"
	.text
	.globl	test                            # -- Begin function test
	.p2align	1
	.type	test,@function
test:                                   # @test
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
	sd	a0, -24(s0)
	sd	a1, -32(s0)
	sd	a2, -40(s0)
	li	a0, 0
	sw	a0, -44(s0)
	j	.LBB0_1
.LBB0_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	lw	a1, -44(s0)
	li	a0, 3
	blt	a0, a1, .LBB0_8
	j	.LBB0_2
.LBB0_2:                                # %for.body
                                        #   in Loop: Header=BB0_1 Depth=1
	li	a0, 0
	sw	a0, -48(s0)
	j	.LBB0_3
.LBB0_3:                                # %for.cond1
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a1, -48(s0)
	li	a0, 15
	blt	a0, a1, .LBB0_6
	j	.LBB0_4
.LBB0_4:                                # %for.body3
                                        #   in Loop: Header=BB0_3 Depth=2
	ld	a0, -24(s0)
	lw	a2, -48(s0)
	sh2add	a0, a2, a0
	flw	fa5, 0(a0)
	ld	a1, -32(s0)
	lw	a0, -44(s0)
	sh2add	a1, a0, a1
	flw	fa4, 0(a1)
	ld	a1, -40(s0)
	slliw	a0, a0, 4
	addw	a0, a0, a2
	sh2add	a0, a0, a1
	flw	fa3, 0(a0)
	fmadd.s	fa5, fa5, fa4, fa3
	fsw	fa5, 0(a0)
	j	.LBB0_5
.LBB0_5:                                # %for.inc
                                        #   in Loop: Header=BB0_3 Depth=2
	lw	a0, -48(s0)
	addiw	a0, a0, 1
	sw	a0, -48(s0)
	j	.LBB0_3
.LBB0_6:                                # %for.end
                                        #   in Loop: Header=BB0_1 Depth=1
	j	.LBB0_7
.LBB0_7:                                # %for.inc9
                                        #   in Loop: Header=BB0_1 Depth=1
	lw	a0, -44(s0)
	addiw	a0, a0, 1
	sw	a0, -44(s0)
	j	.LBB0_1
.LBB0_8:                                # %for.end11
	addi	sp, s0, -48
	.cfi_def_cfa sp, 48
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 48
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end0:
	.size	test, .Lfunc_end0-test
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
