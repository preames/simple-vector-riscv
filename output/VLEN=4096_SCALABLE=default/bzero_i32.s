	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"bzero_i32.c"
	.globl	my_bzero                        # -- Begin function my_bzero
	.p2align	1
	.type	my_bzero,@function
my_bzero:                               # @my_bzero
# %bb.0:                                # %entry
	beqz	a1, .LBB0_2
# %bb.1:                                # %for.body.preheader
	slli.uw	a2, a1, 2
	li	a1, 0
	tail	memset@plt
.LBB0_2:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	my_bzero, .Lfunc_end0-my_bzero
                                        # -- End function
	.ident	"clang version 17.0.0 (https://github.com/llvm/llvm-project.git e2d7d988115c1b67b0175be5d6bc95153945b5be)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
