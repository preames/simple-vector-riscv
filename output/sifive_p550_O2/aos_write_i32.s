	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
	.file	"aos_write_i32.c"
	.text
	.globl	aos_init_i32                    # -- Begin function aos_init_i32
	.p2align	1
	.type	aos_init_i32,@function
aos_init_i32:                           # @aos_init_i32
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a0, .LBB0_3
# %bb.1:                                # %for.body.preheader
	andi	a2, a0, 7
	li	a3, 8
	bgeu	a0, a3, .LBB0_4
# %bb.2:
	li	a0, 0
	bnez	a2, .LBB0_7
.LBB0_3:                                # %for.cond.cleanup
	ret
.LBB0_4:                                # %for.body.preheader.new
	zext.w	a0, a0
	li	a3, 0
	addi	a4, a1, 272
	andi	a0, a0, -8
	neg	a0, a0
.LBB0_5:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	sw	zero, -224(a4)
	sw	zero, -168(a4)
	sw	zero, -112(a4)
	sw	zero, -56(a4)
	addi	a3, a3, -8
	sw	zero, 0(a4)
	sw	zero, 56(a4)
	sw	zero, 112(a4)
	sw	zero, 168(a4)
	addi	a4, a4, 448
	bne	a0, a3, .LBB0_5
# %bb.6:                                # %for.cond.cleanup.loopexit.unr-lcssa.loopexit
	neg	a0, a3
	beqz	a2, .LBB0_3
.LBB0_7:                                # %for.body.epil
	slli	a3, a0, 3
	slli	a0, a0, 6
	sub	a0, a0, a3
	add	a1, a1, a0
	li	a0, 1
	sw	zero, 48(a1)
	beq	a2, a0, .LBB0_3
# %bb.8:                                # %for.body.epil.1
	li	a0, 2
	sw	zero, 104(a1)
	beq	a2, a0, .LBB0_3
# %bb.9:                                # %for.body.epil.2
	li	a0, 3
	sw	zero, 160(a1)
	beq	a2, a0, .LBB0_3
# %bb.10:                               # %for.body.epil.3
	li	a0, 4
	sw	zero, 216(a1)
	beq	a2, a0, .LBB0_3
# %bb.11:                               # %for.body.epil.4
	li	a0, 5
	sw	zero, 272(a1)
	beq	a2, a0, .LBB0_3
# %bb.12:                               # %for.body.epil.5
	li	a0, 6
	sw	zero, 328(a1)
	beq	a2, a0, .LBB0_3
# %bb.13:                               # %for.body.epil.6
	sw	zero, 384(a1)
	ret
.Lfunc_end0:
	.size	aos_init_i32, .Lfunc_end0-aos_init_i32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
