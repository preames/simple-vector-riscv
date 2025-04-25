	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"dotproduct_i32.c"
	.text
	.globl	dotproduct_i32                  # -- Begin function dotproduct_i32
	.p2align	1
	.type	dotproduct_i32,@function
dotproduct_i32:                         # @dotproduct_i32
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a0, .LBB0_3
# %bb.1:                                # %for.body.preheader
	mv	a3, a0
	li	a0, 0
	sh2add.uw	a3, a3, a1
.LBB0_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lw	a4, 0(a1)
	lw	a5, 0(a2)
	addi	a1, a1, 4
	mul	a4, a5, a4
	addw	a0, a0, a4
	addi	a2, a2, 4
	bne	a1, a3, .LBB0_2
.LBB0_3:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	dotproduct_i32, .Lfunc_end0-dotproduct_i32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
