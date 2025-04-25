	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
	.file	"vector_overlap_i32.c"
	.text
	.globl	vector_overlap                  # -- Begin function vector_overlap
	.p2align	1
	.type	vector_overlap,@function
vector_overlap:                         # @vector_overlap
	.cfi_startproc
# %bb.0:                                # %entry
	li	a3, 2
	bltu	a2, a3, .LBB0_3
# %bb.1:                                # %for.body.preheader
	addi	a3, a0, 4
	addi	a1, a1, 4
	sh2add.uw	a0, a2, a0
.LBB0_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lw	a2, -4(a3)
	lw	a4, 0(a3)
	lw	a5, 4(a3)
	add	a2, a2, a4
	addi	a4, a3, 4
	add	a2, a2, a5
	mv	a3, a4
	sw	a2, 0(a1)
	addi	a1, a1, 4
	bne	a4, a0, .LBB0_2
.LBB0_3:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	vector_overlap, .Lfunc_end0-vector_overlap
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
