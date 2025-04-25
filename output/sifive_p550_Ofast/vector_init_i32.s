	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
	.file	"vector_init_i32.c"
	.text
	.globl	vector_init_i32                 # -- Begin function vector_init_i32
	.p2align	1
	.type	vector_init_i32,@function
vector_init_i32:                        # @vector_init_i32
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a1, .LBB0_13
# %bb.1:                                # %for.body.preheader
	andi	a6, a1, 7
	li	a3, 8
	bgeu	a1, a3, .LBB0_3
# %bb.2:
	li	a3, 0
	j	.LBB0_5
.LBB0_3:                                # %for.body.preheader.new
	zext.w	a1, a1
	li	a4, 0
	li	a3, 0
	andi	a7, a1, -8
	addi	a5, a0, 16
.LBB0_4:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	addi	t0, a3, 1
	addi	a1, a3, 2
	addi	a2, a3, 3
	sw	a4, -16(a5)
	sw	t0, -12(a5)
	sw	a1, -8(a5)
	sw	a2, -4(a5)
	addi	t0, a3, 4
	addi	t1, a3, 5
	addi	a1, a3, 6
	addi	a2, a3, 7
	addi	a3, a3, 8
	addi	a4, a4, 8
	sw	t0, 0(a5)
	sw	t1, 4(a5)
	sw	a1, 8(a5)
	sw	a2, 12(a5)
	addi	a5, a5, 32
	bne	a3, a7, .LBB0_4
.LBB0_5:                                # %for.cond.cleanup.loopexit.unr-lcssa
	beqz	a6, .LBB0_13
# %bb.6:                                # %for.body.epil
	sh2add	a0, a3, a0
	li	a1, 1
	sw	a3, 0(a0)
	beq	a6, a1, .LBB0_13
# %bb.7:                                # %for.body.epil.1
	addi	a1, a3, 1
	sw	a1, 4(a0)
	li	a1, 2
	beq	a6, a1, .LBB0_13
# %bb.8:                                # %for.body.epil.2
	addi	a1, a3, 2
	sw	a1, 8(a0)
	li	a1, 3
	beq	a6, a1, .LBB0_13
# %bb.9:                                # %for.body.epil.3
	addi	a1, a3, 3
	sw	a1, 12(a0)
	li	a1, 4
	beq	a6, a1, .LBB0_13
# %bb.10:                               # %for.body.epil.4
	addi	a1, a3, 4
	sw	a1, 16(a0)
	li	a1, 5
	beq	a6, a1, .LBB0_13
# %bb.11:                               # %for.body.epil.5
	addi	a1, a3, 5
	sw	a1, 20(a0)
	li	a1, 6
	beq	a6, a1, .LBB0_13
# %bb.12:                               # %for.body.epil.6
	addi	a3, a3, 6
	sw	a3, 24(a0)
.LBB0_13:                               # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	vector_init_i32, .Lfunc_end0-vector_init_i32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
