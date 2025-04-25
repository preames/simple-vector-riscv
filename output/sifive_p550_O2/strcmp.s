	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
	.file	"strcmp.c"
	.text
	.globl	my_strcmp                       # -- Begin function my_strcmp
	.p2align	1
	.type	my_strcmp,@function
my_strcmp:                              # @my_strcmp
	.cfi_startproc
# %bb.0:                                # %entry
	lbu	a2, 0(a0)
	lbu	a3, 0(a1)
	bne	a2, a3, .LBB0_18
# %bb.1:                                # %if.end.preheader
	addi	a0, a0, 4
	addi	a1, a1, 4
.LBB0_2:                                # %if.end
                                        # =>This Inner Loop Header: Depth=1
	beqz	a2, .LBB0_19
# %bb.3:                                # %if.end11
                                        #   in Loop: Header=BB0_2 Depth=1
	lbu	a2, -3(a0)
	lbu	a3, -3(a1)
	bne	a2, a3, .LBB0_18
# %bb.4:                                # %if.end.1
                                        #   in Loop: Header=BB0_2 Depth=1
	beqz	a2, .LBB0_19
# %bb.5:                                # %if.end11.1
                                        #   in Loop: Header=BB0_2 Depth=1
	lbu	a2, -2(a0)
	lbu	a3, -2(a1)
	bne	a2, a3, .LBB0_18
# %bb.6:                                # %if.end.2
                                        #   in Loop: Header=BB0_2 Depth=1
	beqz	a2, .LBB0_19
# %bb.7:                                # %if.end11.2
                                        #   in Loop: Header=BB0_2 Depth=1
	lbu	a2, -1(a0)
	lbu	a3, -1(a1)
	bne	a2, a3, .LBB0_18
# %bb.8:                                # %if.end.3
                                        #   in Loop: Header=BB0_2 Depth=1
	beqz	a2, .LBB0_19
# %bb.9:                                # %if.end11.3
                                        #   in Loop: Header=BB0_2 Depth=1
	lbu	a2, 0(a0)
	lbu	a3, 0(a1)
	bne	a2, a3, .LBB0_18
# %bb.10:                               # %if.end.4
                                        #   in Loop: Header=BB0_2 Depth=1
	beqz	a2, .LBB0_19
# %bb.11:                               # %if.end11.4
                                        #   in Loop: Header=BB0_2 Depth=1
	lbu	a2, 1(a0)
	lbu	a3, 1(a1)
	bne	a2, a3, .LBB0_18
# %bb.12:                               # %if.end.5
                                        #   in Loop: Header=BB0_2 Depth=1
	beqz	a2, .LBB0_19
# %bb.13:                               # %if.end11.5
                                        #   in Loop: Header=BB0_2 Depth=1
	lbu	a2, 2(a0)
	lbu	a3, 2(a1)
	bne	a2, a3, .LBB0_18
# %bb.14:                               # %if.end.6
                                        #   in Loop: Header=BB0_2 Depth=1
	beqz	a2, .LBB0_19
# %bb.15:                               # %if.end11.6
                                        #   in Loop: Header=BB0_2 Depth=1
	lbu	a2, 3(a0)
	lbu	a3, 3(a1)
	bne	a2, a3, .LBB0_18
# %bb.16:                               # %if.end.7
                                        #   in Loop: Header=BB0_2 Depth=1
	beqz	a2, .LBB0_19
# %bb.17:                               # %if.end11.7
                                        #   in Loop: Header=BB0_2 Depth=1
	lbu	a2, 4(a0)
	addi	a0, a0, 8
	lbu	a3, 4(a1)
	addi	a1, a1, 8
	beq	a2, a3, .LBB0_2
.LBB0_18:                               # %if.then
	sltu	a0, a2, a3
	neg	a0, a0
	ori	a0, a0, 1
	ret
.LBB0_19:
	li	a0, 0
	ret
.Lfunc_end0:
	.size	my_strcmp, .Lfunc_end0-my_strcmp
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
