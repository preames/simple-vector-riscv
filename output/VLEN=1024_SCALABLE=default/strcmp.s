	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"strcmp.c"
	.globl	my_strcmp                       # -- Begin function my_strcmp
	.p2align	1
	.type	my_strcmp,@function
my_strcmp:                              # @my_strcmp
# %bb.0:                                # %entry
	lbu	a2, 0(a0)
	lbu	a3, 0(a1)
	bne	a2, a3, .LBB0_4
# %bb.1:                                # %if.end.preheader
	addi	a1, a1, 1
	addi	a0, a0, 1
.LBB0_2:                                # %if.end
                                        # =>This Inner Loop Header: Depth=1
	andi	a2, a2, 255
	beqz	a2, .LBB0_5
# %bb.3:                                # %if.end11
                                        #   in Loop: Header=BB0_2 Depth=1
	lbu	a2, 0(a0)
	lbu	a3, 0(a1)
	addi	a1, a1, 1
	addi	a0, a0, 1
	beq	a2, a3, .LBB0_2
.LBB0_4:                                # %if.then
	sltu	a0, a2, a3
	neg	a0, a0
	ori	a0, a0, 1
	ret
.LBB0_5:
	li	a0, 0
	ret
.Lfunc_end0:
	.size	my_strcmp, .Lfunc_end0-my_strcmp
                                        # -- End function
	.ident	"clang version 18.0.0 (https://github.com/llvm/llvm-project.git 660b740e4b3c4b23dfba36940ae0fe2ad41bfedf)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
