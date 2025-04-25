	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
	.file	"lemire-20220714.c"
	.text
	.globl	remove_negatives_scalar         # -- Begin function remove_negatives_scalar
	.p2align	1
	.type	remove_negatives_scalar,@function
remove_negatives_scalar:                # @remove_negatives_scalar
	.cfi_startproc
# %bb.0:                                # %entry
	blez	a1, .LBB0_21
# %bb.1:                                # %for.body.preheader
	andi	a6, a1, 7
	srli	a3, a1, 3
	beqz	a3, .LBB0_22
# %bb.2:                                # %for.body.preheader.new
	slli	a3, a3, 4
	li	t0, 0
	li	a1, 0
	srli	a3, a3, 1
	addi	a5, a0, 16
	neg	a7, a3
	j	.LBB0_4
.LBB0_3:                                # %for.inc.7
                                        #   in Loop: Header=BB0_4 Depth=1
	addi	t0, t0, -8
	addi	a5, a5, 32
	beq	a7, t0, .LBB0_20
.LBB0_4:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lw	a3, -16(a5)
	bltz	a3, .LBB0_6
# %bb.5:                                # %if.then
                                        #   in Loop: Header=BB0_4 Depth=1
	sh2add	a4, a1, a2
	addi	a1, a1, 1
	sw	a3, 0(a4)
.LBB0_6:                                # %for.inc
                                        #   in Loop: Header=BB0_4 Depth=1
	lw	a3, -12(a5)
	bltz	a3, .LBB0_8
# %bb.7:                                # %if.then.1
                                        #   in Loop: Header=BB0_4 Depth=1
	sh2add	a4, a1, a2
	addi	a1, a1, 1
	sw	a3, 0(a4)
.LBB0_8:                                # %for.inc.1
                                        #   in Loop: Header=BB0_4 Depth=1
	lw	a3, -8(a5)
	bltz	a3, .LBB0_10
# %bb.9:                                # %if.then.2
                                        #   in Loop: Header=BB0_4 Depth=1
	sh2add	a4, a1, a2
	addi	a1, a1, 1
	sw	a3, 0(a4)
.LBB0_10:                               # %for.inc.2
                                        #   in Loop: Header=BB0_4 Depth=1
	lw	a3, -4(a5)
	bltz	a3, .LBB0_12
# %bb.11:                               # %if.then.3
                                        #   in Loop: Header=BB0_4 Depth=1
	sh2add	a4, a1, a2
	addi	a1, a1, 1
	sw	a3, 0(a4)
.LBB0_12:                               # %for.inc.3
                                        #   in Loop: Header=BB0_4 Depth=1
	lw	a3, 0(a5)
	bltz	a3, .LBB0_14
# %bb.13:                               # %if.then.4
                                        #   in Loop: Header=BB0_4 Depth=1
	sh2add	a4, a1, a2
	addi	a1, a1, 1
	sw	a3, 0(a4)
.LBB0_14:                               # %for.inc.4
                                        #   in Loop: Header=BB0_4 Depth=1
	lw	a3, 4(a5)
	bltz	a3, .LBB0_16
# %bb.15:                               # %if.then.5
                                        #   in Loop: Header=BB0_4 Depth=1
	sh2add	a4, a1, a2
	addi	a1, a1, 1
	sw	a3, 0(a4)
.LBB0_16:                               # %for.inc.5
                                        #   in Loop: Header=BB0_4 Depth=1
	lw	a3, 8(a5)
	bltz	a3, .LBB0_18
# %bb.17:                               # %if.then.6
                                        #   in Loop: Header=BB0_4 Depth=1
	sh2add	a4, a1, a2
	addi	a1, a1, 1
	sw	a3, 0(a4)
.LBB0_18:                               # %for.inc.6
                                        #   in Loop: Header=BB0_4 Depth=1
	lw	a3, 12(a5)
	bltz	a3, .LBB0_3
# %bb.19:                               # %if.then.7
                                        #   in Loop: Header=BB0_4 Depth=1
	sh2add	a4, a1, a2
	addi	a1, a1, 1
	sw	a3, 0(a4)
	j	.LBB0_3
.LBB0_20:                               # %for.end.loopexit.unr-lcssa.loopexit
	neg	a3, t0
	bnez	a6, .LBB0_23
.LBB0_21:                               # %for.end
	ret
.LBB0_22:
	li	a1, 0
	beqz	a6, .LBB0_21
.LBB0_23:                               # %for.body.epil
	sh2add	a0, a3, a0
	lw	a3, 0(a0)
	bltz	a3, .LBB0_25
# %bb.24:                               # %if.then.epil
	sh2add	a4, a1, a2
	addi	a1, a1, 1
	sw	a3, 0(a4)
.LBB0_25:                               # %for.inc.epil
	li	a3, 1
	beq	a6, a3, .LBB0_21
# %bb.26:                               # %for.body.epil.1
	lw	a3, 4(a0)
	bltz	a3, .LBB0_28
# %bb.27:                               # %if.then.epil.1
	sh2add	a4, a1, a2
	addi	a1, a1, 1
	sw	a3, 0(a4)
.LBB0_28:                               # %for.inc.epil.1
	li	a3, 2
	beq	a6, a3, .LBB0_21
# %bb.29:                               # %for.body.epil.2
	lw	a3, 8(a0)
	bltz	a3, .LBB0_31
# %bb.30:                               # %if.then.epil.2
	sh2add	a4, a1, a2
	addi	a1, a1, 1
	sw	a3, 0(a4)
.LBB0_31:                               # %for.inc.epil.2
	li	a3, 3
	beq	a6, a3, .LBB0_21
# %bb.32:                               # %for.body.epil.3
	lw	a3, 12(a0)
	bltz	a3, .LBB0_34
# %bb.33:                               # %if.then.epil.3
	sh2add	a4, a1, a2
	addi	a1, a1, 1
	sw	a3, 0(a4)
.LBB0_34:                               # %for.inc.epil.3
	li	a3, 4
	beq	a6, a3, .LBB0_21
# %bb.35:                               # %for.body.epil.4
	lw	a3, 16(a0)
	bltz	a3, .LBB0_37
# %bb.36:                               # %if.then.epil.4
	sh2add	a4, a1, a2
	addi	a1, a1, 1
	sw	a3, 0(a4)
.LBB0_37:                               # %for.inc.epil.4
	li	a3, 5
	beq	a6, a3, .LBB0_21
# %bb.38:                               # %for.body.epil.5
	lw	a3, 20(a0)
	bltz	a3, .LBB0_40
# %bb.39:                               # %if.then.epil.5
	sh2add	a4, a1, a2
	addi	a1, a1, 1
	sw	a3, 0(a4)
.LBB0_40:                               # %for.inc.epil.5
	li	a3, 6
	beq	a6, a3, .LBB0_21
# %bb.41:                               # %for.body.epil.6
	lw	a0, 24(a0)
	bltz	a0, .LBB0_21
# %bb.42:                               # %if.then.epil.6
	sh2add	a1, a1, a2
	sw	a0, 0(a1)
	ret
.Lfunc_end0:
	.size	remove_negatives_scalar, .Lfunc_end0-remove_negatives_scalar
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
