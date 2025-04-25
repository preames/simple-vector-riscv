	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0"
	.file	"vector_andnot_i64.c"
	.text
	.globl	vector_andnot_i64               # -- Begin function vector_andnot_i64
	.p2align	1
	.type	vector_andnot_i64,@function
vector_andnot_i64:                      # @vector_andnot_i64
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a2, .LBB0_3
# %bb.1:                                # %for.body.preheader
	slli	a2, a2, 32
	srli	a2, a2, 29
	add	a2, a2, a0
.LBB0_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	ld	a3, 0(a1)
	ld	a4, 0(a0)
	not	a3, a3
	and	a3, a3, a4
	sd	a3, 0(a0)
	addi	a0, a0, 8
	addi	a1, a1, 8
	bne	a0, a2, .LBB0_2
.LBB0_3:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	vector_andnot_i64, .Lfunc_end0-vector_andnot_i64
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
