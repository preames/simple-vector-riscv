	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
	.file	"sparsevec_init_i32.c"
	.text
	.globl	sparsevec_init_i32              # -- Begin function sparsevec_init_i32
	.p2align	1
	.type	sparsevec_init_i32,@function
sparsevec_init_i32:                     # @sparsevec_init_i32
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a0, .LBB0_13
# %bb.1:                                # %for.body.preheader
	andi	a6, a0, 7
	li	a3, 8
	bgeu	a0, a3, .LBB0_3
# %bb.2:
	li	a4, 0
	j	.LBB0_5
.LBB0_3:                                # %for.body.preheader.new
	zext.w	a0, a0
	li	t5, 0
	li	a4, 0
	andi	a7, a0, -8
	addi	a3, a2, 8
.LBB0_4:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lh	a0, -8(a3)
	lh	t1, -6(a3)
	lh	t2, -4(a3)
	lh	t3, -2(a3)
	addi	t0, a4, 1
	addi	t4, a4, 2
	sh2add	a0, a0, a1
	sh2add	a5, t3, a1
	sw	t5, 0(a0)
	sh2add	a0, t1, a1
	addi	t1, a4, 3
	addi	t5, t5, 8
	sw	t0, 0(a0)
	sh2add	a0, t2, a1
	addi	t0, a4, 4
	sw	t4, 0(a0)
	sw	t1, 0(a5)
	lh	t1, 0(a3)
	lh	t2, 2(a3)
	lh	t3, 4(a3)
	lh	t4, 6(a3)
	addi	a3, a3, 16
	sh2add	a0, t1, a1
	sh2add	a5, t2, a1
	sw	t0, 0(a0)
	addi	a0, a4, 5
	sw	a0, 0(a5)
	addi	a0, a4, 6
	sh2add	a5, t3, a1
	sw	a0, 0(a5)
	addi	a0, a4, 7
	sh2add	a5, t4, a1
	addi	a4, a4, 8
	sw	a0, 0(a5)
	bne	a4, a7, .LBB0_4
.LBB0_5:                                # %for.cond.cleanup.loopexit.unr-lcssa
	beqz	a6, .LBB0_13
# %bb.6:                                # %for.body.epil
	sh1add	a0, a4, a2
	lh	a2, 0(a0)
	sh2add	a2, a2, a1
	sw	a4, 0(a2)
	li	a2, 1
	beq	a6, a2, .LBB0_13
# %bb.7:                                # %for.body.epil.1
	lh	a3, 2(a0)
	addi	a2, a4, 1
	sh2add	a3, a3, a1
	sw	a2, 0(a3)
	li	a2, 2
	beq	a6, a2, .LBB0_13
# %bb.8:                                # %for.body.epil.2
	lh	a3, 4(a0)
	addi	a2, a4, 2
	sh2add	a3, a3, a1
	sw	a2, 0(a3)
	li	a2, 3
	beq	a6, a2, .LBB0_13
# %bb.9:                                # %for.body.epil.3
	lh	a3, 6(a0)
	addi	a2, a4, 3
	sh2add	a3, a3, a1
	sw	a2, 0(a3)
	li	a2, 4
	beq	a6, a2, .LBB0_13
# %bb.10:                               # %for.body.epil.4
	lh	a3, 8(a0)
	addi	a2, a4, 4
	sh2add	a3, a3, a1
	sw	a2, 0(a3)
	li	a2, 5
	beq	a6, a2, .LBB0_13
# %bb.11:                               # %for.body.epil.5
	lh	a3, 10(a0)
	addi	a2, a4, 5
	sh2add	a3, a3, a1
	sw	a2, 0(a3)
	li	a2, 6
	beq	a6, a2, .LBB0_13
# %bb.12:                               # %for.body.epil.6
	lh	a0, 12(a0)
	addi	a4, a4, 6
	sh2add	a0, a0, a1
	sw	a4, 0(a0)
.LBB0_13:                               # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	sparsevec_init_i32, .Lfunc_end0-sparsevec_init_i32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
