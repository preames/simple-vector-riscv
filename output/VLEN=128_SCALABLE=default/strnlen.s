	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"strnlen.c"
	.globl	my_strnlne                      # -- Begin function my_strnlne
	.p2align	1
	.type	my_strnlne,@function
my_strnlne:                             # @my_strnlne
# %bb.0:                                # %entry
	li	a2, 0
	beqz	a0, .LBB0_5
# %bb.1:                                # %for.body.preheader
	zext.w	a3, a0
.LBB0_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lbu	a4, 0(a1)
	beqz	a4, .LBB0_5
# %bb.3:                                # %for.inc
                                        #   in Loop: Header=BB0_2 Depth=1
	addiw	a2, a2, 1
	addi	a3, a3, -1
	addi	a1, a1, 1
	bnez	a3, .LBB0_2
# %bb.4:
	mv	a2, a0
.LBB0_5:                                # %cleanup
	minu	a0, a2, a0
	ret
.Lfunc_end0:
	.size	my_strnlne, .Lfunc_end0-my_strnlne
                                        # -- End function
	.ident	"clang version 17.0.0 (https://github.com/llvm/llvm-project.git e2d7d988115c1b67b0175be5d6bc95153945b5be)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
