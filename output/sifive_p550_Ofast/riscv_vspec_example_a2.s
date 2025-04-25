	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
	.file	"riscv_vspec_example_a2.c"
	.text
	.globl	example_a2                      # -- Begin function example_a2
	.p2align	1
	.type	example_a2,@function
example_a2:                             # @example_a2
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a3, .LBB0_3
# %bb.1:                                # %for.body.preheader
	andi	a6, a3, 7
	li	a4, 8
	bgeu	a3, a4, .LBB0_4
# %bb.2:
	li	a3, 0
	bnez	a6, .LBB0_23
.LBB0_3:                                # %for.cond.cleanup
	ret
.LBB0_4:                                # %for.body.preheader.new
	zext.w	a4, a3
	li	t0, 0
	addi	a3, a1, 3
	andi	a4, a4, -8
	addi	t3, a2, 3
	addi	a5, a0, 3
	neg	a7, a4
	li	t1, 4
	j	.LBB0_6
.LBB0_5:                                # %cond.end.7
                                        #   in Loop: Header=BB0_6 Depth=1
	sb	t2, 4(a3)
	addi	t0, t0, -8
	addi	a3, a3, 8
	addi	t3, t3, 8
	addi	a5, a5, 8
	beq	a7, t0, .LBB0_22
.LBB0_6:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lbu	t4, -3(a5)
	li	t2, 1
	li	a4, 1
	bgeu	t1, t4, .LBB0_14
# %bb.7:                                # %cond.end
                                        #   in Loop: Header=BB0_6 Depth=1
	sb	a4, -3(a3)
	lbu	a4, -2(a5)
	bgeu	t1, a4, .LBB0_15
.LBB0_8:                                # %cond.end.1
                                        #   in Loop: Header=BB0_6 Depth=1
	sb	t2, -2(a3)
	li	t2, 1
	li	a4, 1
	lbu	t4, -1(a5)
	bgeu	t1, t4, .LBB0_16
.LBB0_9:                                # %cond.end.2
                                        #   in Loop: Header=BB0_6 Depth=1
	sb	a4, -1(a3)
	lbu	a4, 0(a5)
	bgeu	t1, a4, .LBB0_17
.LBB0_10:                               # %cond.end.3
                                        #   in Loop: Header=BB0_6 Depth=1
	sb	t2, 0(a3)
	li	t2, 1
	li	a4, 1
	lbu	t4, 1(a5)
	bgeu	t1, t4, .LBB0_18
.LBB0_11:                               # %cond.end.4
                                        #   in Loop: Header=BB0_6 Depth=1
	sb	a4, 1(a3)
	lbu	a4, 2(a5)
	bgeu	t1, a4, .LBB0_19
.LBB0_12:                               # %cond.end.5
                                        #   in Loop: Header=BB0_6 Depth=1
	sb	t2, 2(a3)
	li	t2, 1
	li	a4, 1
	lbu	t4, 3(a5)
	bgeu	t1, t4, .LBB0_20
.LBB0_13:                               # %cond.end.6
                                        #   in Loop: Header=BB0_6 Depth=1
	sb	a4, 3(a3)
	lbu	a4, 4(a5)
	bltu	t1, a4, .LBB0_5
	j	.LBB0_21
.LBB0_14:                               # %cond.true
                                        #   in Loop: Header=BB0_6 Depth=1
	lbu	a4, -3(t3)
	sb	a4, -3(a3)
	lbu	a4, -2(a5)
	bltu	t1, a4, .LBB0_8
.LBB0_15:                               # %cond.true.1
                                        #   in Loop: Header=BB0_6 Depth=1
	lbu	t2, -2(t3)
	sb	t2, -2(a3)
	li	t2, 1
	li	a4, 1
	lbu	t4, -1(a5)
	bltu	t1, t4, .LBB0_9
.LBB0_16:                               # %cond.true.2
                                        #   in Loop: Header=BB0_6 Depth=1
	lbu	a4, -1(t3)
	sb	a4, -1(a3)
	lbu	a4, 0(a5)
	bltu	t1, a4, .LBB0_10
.LBB0_17:                               # %cond.true.3
                                        #   in Loop: Header=BB0_6 Depth=1
	lbu	t2, 0(t3)
	sb	t2, 0(a3)
	li	t2, 1
	li	a4, 1
	lbu	t4, 1(a5)
	bltu	t1, t4, .LBB0_11
.LBB0_18:                               # %cond.true.4
                                        #   in Loop: Header=BB0_6 Depth=1
	lbu	a4, 1(t3)
	sb	a4, 1(a3)
	lbu	a4, 2(a5)
	bltu	t1, a4, .LBB0_12
.LBB0_19:                               # %cond.true.5
                                        #   in Loop: Header=BB0_6 Depth=1
	lbu	t2, 2(t3)
	sb	t2, 2(a3)
	li	t2, 1
	li	a4, 1
	lbu	t4, 3(a5)
	bltu	t1, t4, .LBB0_13
.LBB0_20:                               # %cond.true.6
                                        #   in Loop: Header=BB0_6 Depth=1
	lbu	a4, 3(t3)
	sb	a4, 3(a3)
	lbu	a4, 4(a5)
	bltu	t1, a4, .LBB0_5
.LBB0_21:                               # %cond.true.7
                                        #   in Loop: Header=BB0_6 Depth=1
	lbu	t2, 4(t3)
	j	.LBB0_5
.LBB0_22:                               # %for.cond.cleanup.loopexit.unr-lcssa.loopexit
	neg	a3, t0
	beqz	a6, .LBB0_3
.LBB0_23:                               # %for.body.epil
	add	a7, a0, a3
	li	t0, 1
	li	a4, 4
	lbu	a0, 0(a7)
	li	a5, 1
	bltu	a4, a0, .LBB0_25
# %bb.24:                               # %cond.true.epil
	add	a0, a2, a3
	lbu	a5, 0(a0)
.LBB0_25:                               # %cond.end.epil
	add	a1, a1, a3
	sb	a5, 0(a1)
	beq	a6, t0, .LBB0_3
# %bb.26:                               # %for.body.epil.1
	lbu	a0, 1(a7)
	li	a4, 4
	bltu	a4, a0, .LBB0_28
# %bb.27:                               # %cond.true.epil.1
	add	a0, a2, a3
	lbu	a4, 1(a0)
	li	a0, 2
	sb	a4, 1(a1)
	beq	a6, a0, .LBB0_3
	j	.LBB0_29
.LBB0_28:
	li	a4, 1
	li	a0, 2
	sb	a4, 1(a1)
	beq	a6, a0, .LBB0_3
.LBB0_29:                               # %for.body.epil.2
	lbu	a0, 2(a7)
	li	a4, 4
	bltu	a4, a0, .LBB0_31
# %bb.30:                               # %cond.true.epil.2
	add	a0, a2, a3
	lbu	a4, 2(a0)
	li	a0, 3
	sb	a4, 2(a1)
	beq	a6, a0, .LBB0_3
	j	.LBB0_32
.LBB0_31:
	li	a4, 1
	li	a0, 3
	sb	a4, 2(a1)
	beq	a6, a0, .LBB0_3
.LBB0_32:                               # %for.body.epil.3
	lbu	a0, 3(a7)
	li	a4, 4
	bltu	a4, a0, .LBB0_34
# %bb.33:                               # %cond.true.epil.3
	add	a0, a2, a3
	lbu	a5, 3(a0)
	j	.LBB0_35
.LBB0_34:
	li	a5, 1
.LBB0_35:                               # %cond.end.epil.3
	sb	a5, 3(a1)
	beq	a6, a4, .LBB0_3
# %bb.36:                               # %for.body.epil.4
	lbu	a0, 4(a7)
	li	a4, 4
	bltu	a4, a0, .LBB0_38
# %bb.37:                               # %cond.true.epil.4
	add	a0, a2, a3
	lbu	a4, 4(a0)
	j	.LBB0_39
.LBB0_38:
	li	a4, 1
.LBB0_39:                               # %cond.end.epil.4
	li	a0, 5
	sb	a4, 4(a1)
	beq	a6, a0, .LBB0_3
# %bb.40:                               # %for.body.epil.5
	lbu	a0, 5(a7)
	li	a4, 4
	bltu	a4, a0, .LBB0_42
# %bb.41:                               # %cond.true.epil.5
	add	a0, a2, a3
	lbu	a4, 5(a0)
	j	.LBB0_43
.LBB0_42:
	li	a4, 1
.LBB0_43:                               # %cond.end.epil.5
	li	a0, 6
	sb	a4, 5(a1)
	beq	a6, a0, .LBB0_3
# %bb.44:                               # %for.body.epil.6
	lbu	a0, 6(a7)
	li	a4, 4
	bltu	a4, a0, .LBB0_46
# %bb.45:                               # %cond.true.epil.6
	add	a2, a2, a3
	lbu	a0, 6(a2)
	sb	a0, 6(a1)
	ret
.LBB0_46:
	li	a0, 1
	sb	a0, 6(a1)
	ret
.Lfunc_end0:
	.size	example_a2, .Lfunc_end0-example_a2
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
