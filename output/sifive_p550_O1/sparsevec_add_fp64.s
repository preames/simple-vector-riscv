	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
	.file	"sparsevec_add_fp64.c"
	.text
	.globl	sparsevec_add_i32               # -- Begin function sparsevec_add_i32
	.p2align	1
	.type	sparsevec_add_i32,@function
sparsevec_add_i32:                      # @sparsevec_add_i32
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a0, .LBB0_3
# %bb.1:                                # %for.body.preheader
	sh2add.uw	a0, a0, a4
.LBB0_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lw	a5, 0(a4)
	addi	a4, a4, 4
	sh3add	a5, a5, a3
	fld	fa5, 0(a5)
	lw	a5, 0(a2)
	addi	a2, a2, 4
	sh3add	a5, a5, a1
	fld	fa4, 0(a5)
	fadd.d	fa5, fa5, fa4
	fsd	fa5, 0(a5)
	bne	a4, a0, .LBB0_2
.LBB0_3:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	sparsevec_add_i32, .Lfunc_end0-sparsevec_add_i32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
