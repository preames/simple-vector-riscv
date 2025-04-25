	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_xmipscmov1p0_xmipslsp1p0"
	.file	"memcpy_i8.c"
	.text
	.globl	my_memcpy                       # -- Begin function my_memcpy
	.p2align	1
	.type	my_memcpy,@function
my_memcpy:                              # @my_memcpy
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a0, .LBB0_3
# %bb.1:                                # %for.body.preheader
	add.uw	a0, a0, a2
.LBB0_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lbu	a3, 0(a2)
	sb	a3, 0(a1)
	addi	a2, a2, 1
	addi	a1, a1, 1
	bne	a2, a0, .LBB0_2
.LBB0_3:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	my_memcpy, .Lfunc_end0-my_memcpy
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
