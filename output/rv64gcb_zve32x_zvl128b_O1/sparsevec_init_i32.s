	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zbs1p0_zve32x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"sparsevec_init_i32.c"
	.text
	.globl	sparsevec_init_i32              # -- Begin function sparsevec_init_i32
	.p2align	1
	.type	sparsevec_init_i32,@function
sparsevec_init_i32:                     # @sparsevec_init_i32
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a0, .LBB0_3
# %bb.1:                                # %for.body.preheader
	li	a3, 0
	sh1add.uw	a0, a0, a2
.LBB0_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lh	a4, 0(a2)
	addi	a2, a2, 2
	sh2add	a4, a4, a1
	sw	a3, 0(a4)
	addi	a3, a3, 1
	bne	a2, a0, .LBB0_2
.LBB0_3:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	sparsevec_init_i32, .Lfunc_end0-sparsevec_init_i32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
