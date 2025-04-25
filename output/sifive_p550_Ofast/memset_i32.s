	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
	.file	"memset_i32.c"
	.text
	.globl	my_memset                       # -- Begin function my_memset
	.p2align	1
	.type	my_memset,@function
my_memset:                              # @my_memset
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a1, .LBB0_3
# %bb.1:                                # %for.body.preheader
	andi	a3, a1, 7
	li	a4, 8
	bgeu	a1, a4, .LBB0_4
# %bb.2:
	li	a1, 0
	bnez	a3, .LBB0_7
.LBB0_3:                                # %for.cond.cleanup
	ret
.LBB0_4:                                # %for.body.preheader.new
	zext.w	a5, a1
	li	a4, 0
	addi	a1, a0, 16
	andi	a5, a5, -8
	neg	a5, a5
.LBB0_5:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	sw	a2, -16(a1)
	sw	a2, -12(a1)
	sw	a2, -8(a1)
	sw	a2, -4(a1)
	addi	a4, a4, -8
	sw	a2, 0(a1)
	sw	a2, 4(a1)
	sw	a2, 8(a1)
	sw	a2, 12(a1)
	addi	a1, a1, 32
	bne	a5, a4, .LBB0_5
# %bb.6:                                # %for.cond.cleanup.loopexit.unr-lcssa.loopexit
	neg	a1, a4
	beqz	a3, .LBB0_3
.LBB0_7:                                # %for.body.epil
	sh2add	a0, a1, a0
	li	a1, 1
	sw	a2, 0(a0)
	beq	a3, a1, .LBB0_3
# %bb.8:                                # %for.body.epil.1
	li	a1, 2
	sw	a2, 4(a0)
	beq	a3, a1, .LBB0_3
# %bb.9:                                # %for.body.epil.2
	li	a1, 3
	sw	a2, 8(a0)
	beq	a3, a1, .LBB0_3
# %bb.10:                               # %for.body.epil.3
	li	a1, 4
	sw	a2, 12(a0)
	beq	a3, a1, .LBB0_3
# %bb.11:                               # %for.body.epil.4
	li	a1, 5
	sw	a2, 16(a0)
	beq	a3, a1, .LBB0_3
# %bb.12:                               # %for.body.epil.5
	li	a1, 6
	sw	a2, 20(a0)
	beq	a3, a1, .LBB0_3
# %bb.13:                               # %for.body.epil.6
	sw	a2, 24(a0)
	ret
.Lfunc_end0:
	.size	my_memset, .Lfunc_end0-my_memset
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
