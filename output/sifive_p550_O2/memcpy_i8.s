	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
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
	andi	a6, a0, 7
	li	a3, 8
	bgeu	a0, a3, .LBB0_4
# %bb.2:
	li	a0, 0
	bnez	a6, .LBB0_7
.LBB0_3:                                # %for.cond.cleanup
	ret
.LBB0_4:                                # %for.body.preheader.new
	zext.w	a0, a0
	li	a4, 0
	addi	a5, a1, 3
	andi	a0, a0, -8
	addi	a3, a2, 3
	neg	a7, a0
.LBB0_5:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lbu	a0, -3(a3)
	addi	a4, a4, -8
	sb	a0, -3(a5)
	lbu	a0, -2(a3)
	sb	a0, -2(a5)
	lbu	a0, -1(a3)
	sb	a0, -1(a5)
	lbu	a0, 0(a3)
	sb	a0, 0(a5)
	lbu	a0, 1(a3)
	sb	a0, 1(a5)
	lbu	a0, 2(a3)
	sb	a0, 2(a5)
	lbu	a0, 3(a3)
	sb	a0, 3(a5)
	lbu	a0, 4(a3)
	addi	a3, a3, 8
	sb	a0, 4(a5)
	addi	a5, a5, 8
	bne	a7, a4, .LBB0_5
# %bb.6:                                # %for.cond.cleanup.loopexit.unr-lcssa.loopexit
	neg	a0, a4
	beqz	a6, .LBB0_3
.LBB0_7:                                # %for.body.epil
	add	a2, a2, a0
	add	a1, a1, a0
	li	a0, 1
	lbu	a3, 0(a2)
	sb	a3, 0(a1)
	beq	a6, a0, .LBB0_3
# %bb.8:                                # %for.body.epil.1
	lbu	a0, 1(a2)
	sb	a0, 1(a1)
	li	a0, 2
	beq	a6, a0, .LBB0_3
# %bb.9:                                # %for.body.epil.2
	lbu	a0, 2(a2)
	sb	a0, 2(a1)
	li	a0, 3
	beq	a6, a0, .LBB0_3
# %bb.10:                               # %for.body.epil.3
	lbu	a0, 3(a2)
	sb	a0, 3(a1)
	li	a0, 4
	beq	a6, a0, .LBB0_3
# %bb.11:                               # %for.body.epil.4
	lbu	a0, 4(a2)
	sb	a0, 4(a1)
	li	a0, 5
	beq	a6, a0, .LBB0_3
# %bb.12:                               # %for.body.epil.5
	lbu	a0, 5(a2)
	sb	a0, 5(a1)
	li	a0, 6
	beq	a6, a0, .LBB0_3
# %bb.13:                               # %for.body.epil.6
	lbu	a0, 6(a2)
	sb	a0, 6(a1)
	ret
.Lfunc_end0:
	.size	my_memcpy, .Lfunc_end0-my_memcpy
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
