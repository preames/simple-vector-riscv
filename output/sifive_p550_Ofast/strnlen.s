	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
	.file	"strnlen.c"
	.text
	.globl	my_strnlne                      # -- Begin function my_strnlne
	.p2align	1
	.type	my_strnlne,@function
my_strnlne:                             # @my_strnlne
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a0, .LBB0_20
# %bb.1:                                # %for.body.preheader
	zext.w	a2, a0
	li	a6, 7
	li	t4, 6
	li	t3, 5
	li	a7, 4
	neg	t5, a2
	li	t0, 3
	li	t1, 2
	li	t2, 1
	li	a5, 7
.LBB0_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	add	a2, a1, a5
	lbu	a3, -7(a2)
	beqz	a3, .LBB0_22
# %bb.3:                                # %for.inc
                                        #   in Loop: Header=BB0_2 Depth=1
	add	a3, t5, a5
	beq	a3, t4, .LBB0_21
# %bb.4:                                # %for.body.1
                                        #   in Loop: Header=BB0_2 Depth=1
	lbu	a4, -6(a2)
	beqz	a4, .LBB0_23
# %bb.5:                                # %for.inc.1
                                        #   in Loop: Header=BB0_2 Depth=1
	beq	a3, t3, .LBB0_21
# %bb.6:                                # %for.body.2
                                        #   in Loop: Header=BB0_2 Depth=1
	lbu	a4, -5(a2)
	beqz	a4, .LBB0_24
# %bb.7:                                # %for.inc.2
                                        #   in Loop: Header=BB0_2 Depth=1
	beq	a3, a7, .LBB0_21
# %bb.8:                                # %for.body.3
                                        #   in Loop: Header=BB0_2 Depth=1
	lbu	a4, -4(a2)
	beqz	a4, .LBB0_25
# %bb.9:                                # %for.inc.3
                                        #   in Loop: Header=BB0_2 Depth=1
	beq	a3, t0, .LBB0_21
# %bb.10:                               # %for.body.4
                                        #   in Loop: Header=BB0_2 Depth=1
	lbu	a4, -3(a2)
	beqz	a4, .LBB0_26
# %bb.11:                               # %for.inc.4
                                        #   in Loop: Header=BB0_2 Depth=1
	beq	a3, t1, .LBB0_21
# %bb.12:                               # %for.body.5
                                        #   in Loop: Header=BB0_2 Depth=1
	lbu	a4, -2(a2)
	beqz	a4, .LBB0_27
# %bb.13:                               # %for.inc.5
                                        #   in Loop: Header=BB0_2 Depth=1
	beq	a3, t2, .LBB0_21
# %bb.14:                               # %for.body.6
                                        #   in Loop: Header=BB0_2 Depth=1
	lbu	a4, -1(a2)
	beqz	a4, .LBB0_28
# %bb.15:                               # %for.inc.6
                                        #   in Loop: Header=BB0_2 Depth=1
	beqz	a3, .LBB0_21
# %bb.16:                               # %for.body.7
                                        #   in Loop: Header=BB0_2 Depth=1
	lbu	a2, 0(a2)
	beqz	a2, .LBB0_19
# %bb.17:                               # %for.inc.7
                                        #   in Loop: Header=BB0_2 Depth=1
	addi	a5, a5, 8
	add	a2, t5, a5
	bne	a2, a6, .LBB0_2
# %bb.18:
	mv	a5, a0
.LBB0_19:                               # %cleanup
	sext.w	a5, a5
	minu	a0, a5, a0
	ret
.LBB0_20:
	li	a5, 0
	minu	a0, a5, a0
	ret
.LBB0_21:
	sext.w	a5, a0
	minu	a0, a5, a0
	ret
.LBB0_22:                               # %for.body.cleanup.loopexit.split.loop.exitsplitsplit_crit_edge
	addi	a5, a5, -7
	sext.w	a5, a5
	minu	a0, a5, a0
	ret
.LBB0_23:                               # %cleanup.loopexit.split.loop.exitsplitsplitsplitsplitsplitsplitsplit
	addi	a5, a5, -6
	sext.w	a5, a5
	minu	a0, a5, a0
	ret
.LBB0_24:                               # %for.body.2.cleanup.loopexit.split.loop.exitsplitsplitsplitsplitsplitsplit_crit_edge
	addi	a5, a5, -5
	sext.w	a5, a5
	minu	a0, a5, a0
	ret
.LBB0_25:                               # %for.body.3.cleanup.loopexit.split.loop.exitsplitsplitsplitsplitsplit_crit_edge
	addi	a5, a5, -4
	sext.w	a5, a5
	minu	a0, a5, a0
	ret
.LBB0_26:                               # %for.body.4.cleanup.loopexit.split.loop.exitsplitsplitsplitsplit_crit_edge
	addi	a5, a5, -3
	sext.w	a5, a5
	minu	a0, a5, a0
	ret
.LBB0_27:                               # %for.body.5.cleanup.loopexit.split.loop.exitsplitsplitsplit_crit_edge
	addi	a5, a5, -2
	sext.w	a5, a5
	minu	a0, a5, a0
	ret
.LBB0_28:                               # %for.body.6.cleanup.loopexit.split.loop.exitsplit_crit_edge
	addi	a5, a5, -1
	sext.w	a5, a5
	minu	a0, a5, a0
	ret
.Lfunc_end0:
	.size	my_strnlne, .Lfunc_end0-my_strnlne
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
