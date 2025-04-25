	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0"
	.file	"strnlen.c"
	.text
	.globl	my_strnlne                      # -- Begin function my_strnlne
	.p2align	1
	.type	my_strnlne,@function
my_strnlne:                             # @my_strnlne
	.cfi_startproc
# %bb.0:                                # %entry
	li	a2, 0
	beqz	a0, .LBB0_4
.LBB0_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lbu	a3, 0(a1)
	beqz	a3, .LBB0_4
# %bb.2:                                # %for.inc
                                        #   in Loop: Header=BB0_1 Depth=1
	addiw	a2, a2, 1
	addi	a1, a1, 1
	bne	a0, a2, .LBB0_1
# %bb.3:
	mv	a2, a0
.LBB0_4:                                # %cleanup
	bltu	a2, a0, .LBB0_6
# %bb.5:                                # %cleanup
	mv	a2, a0
.LBB0_6:                                # %cleanup
	mv	a0, a2
	ret
.Lfunc_end0:
	.size	my_strnlne, .Lfunc_end0-my_strnlne
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
