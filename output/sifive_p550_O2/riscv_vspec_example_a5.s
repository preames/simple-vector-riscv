	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
	.file	"riscv_vspec_example_a5.c"
	.text
	.globl	saxpy                           # -- Begin function saxpy
	.p2align	1
	.type	saxpy,@function
saxpy:                                  # @saxpy
	.cfi_startproc
# %bb.0:                                # %entry
	blez	a0, .LBB0_5
# %bb.1:                                # %for.body.preheader
	andi	a6, a0, 7
	srli	a3, a0, 3
	beqz	a3, .LBB0_6
# %bb.2:                                # %for.body.preheader.new
	slli	a3, a3, 4
	li	a0, 0
	addi	a5, a2, 16
	srli	a3, a3, 1
	neg	a4, a3
	addi	a3, a1, 16
.LBB0_3:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	flw	fa5, -16(a3)
	addi	a0, a0, -8
	flw	fa4, -16(a5)
	flw	fa3, -12(a5)
	flw	fa2, -8(a5)
	flw	fa1, -4(a5)
	fmadd.s	fa5, fa0, fa5, fa4
	flw	fa4, 0(a5)
	fsw	fa5, -16(a5)
	flw	fa5, -12(a3)
	fmadd.s	fa5, fa0, fa5, fa3
	flw	fa3, 4(a5)
	fsw	fa5, -12(a5)
	flw	fa5, -8(a3)
	fmadd.s	fa5, fa0, fa5, fa2
	flw	fa2, 8(a5)
	fsw	fa5, -8(a5)
	flw	fa5, -4(a3)
	fmadd.s	fa5, fa0, fa5, fa1
	flw	fa1, 12(a5)
	fsw	fa5, -4(a5)
	flw	fa5, 0(a3)
	fmadd.s	fa5, fa0, fa5, fa4
	fsw	fa5, 0(a5)
	flw	fa5, 4(a3)
	fmadd.s	fa5, fa0, fa5, fa3
	fsw	fa5, 4(a5)
	flw	fa5, 8(a3)
	fmadd.s	fa5, fa0, fa5, fa2
	fsw	fa5, 8(a5)
	flw	fa5, 12(a3)
	addi	a3, a3, 32
	fmadd.s	fa5, fa0, fa5, fa1
	fsw	fa5, 12(a5)
	addi	a5, a5, 32
	bne	a4, a0, .LBB0_3
# %bb.4:                                # %for.end.loopexit.unr-lcssa.loopexit
	neg	a0, a0
	bnez	a6, .LBB0_7
.LBB0_5:                                # %for.end
	ret
.LBB0_6:
	li	a0, 0
	beqz	a6, .LBB0_5
.LBB0_7:                                # %for.body.epil
	sh2add	a1, a0, a1
	sh2add	a0, a0, a2
	li	a2, 1
	flw	fa5, 0(a1)
	flw	fa4, 0(a0)
	fmadd.s	fa5, fa0, fa5, fa4
	fsw	fa5, 0(a0)
	beq	a6, a2, .LBB0_5
# %bb.8:                                # %for.body.epil.1
	flw	fa5, 4(a1)
	li	a2, 2
	flw	fa4, 4(a0)
	fmadd.s	fa5, fa0, fa5, fa4
	fsw	fa5, 4(a0)
	beq	a6, a2, .LBB0_5
# %bb.9:                                # %for.body.epil.2
	flw	fa5, 8(a1)
	li	a2, 3
	flw	fa4, 8(a0)
	fmadd.s	fa5, fa0, fa5, fa4
	fsw	fa5, 8(a0)
	beq	a6, a2, .LBB0_5
# %bb.10:                               # %for.body.epil.3
	flw	fa5, 12(a1)
	li	a2, 4
	flw	fa4, 12(a0)
	fmadd.s	fa5, fa0, fa5, fa4
	fsw	fa5, 12(a0)
	beq	a6, a2, .LBB0_5
# %bb.11:                               # %for.body.epil.4
	flw	fa5, 16(a1)
	li	a2, 5
	flw	fa4, 16(a0)
	fmadd.s	fa5, fa0, fa5, fa4
	fsw	fa5, 16(a0)
	beq	a6, a2, .LBB0_5
# %bb.12:                               # %for.body.epil.5
	flw	fa5, 20(a1)
	li	a2, 6
	flw	fa4, 20(a0)
	fmadd.s	fa5, fa0, fa5, fa4
	fsw	fa5, 20(a0)
	beq	a6, a2, .LBB0_5
# %bb.13:                               # %for.body.epil.6
	flw	fa5, 24(a1)
	flw	fa4, 24(a0)
	fmadd.s	fa5, fa0, fa5, fa4
	fsw	fa5, 24(a0)
	ret
.Lfunc_end0:
	.size	saxpy, .Lfunc_end0-saxpy
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
