	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0"
	.file	"vector_reduce_mul_i32.c"
	.text
	.globl	vector_reduce_mul_i32           # -- Begin function vector_reduce_mul_i32
	.p2align	1
	.type	vector_reduce_mul_i32,@function
vector_reduce_mul_i32:                  # @vector_reduce_mul_i32
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a1, .LBB0_4
# %bb.1:                                # %for.body.preheader
	slli	a1, a1, 32
	srli	a1, a1, 30
	add	a2, a0, a1
	li	a1, 1
.LBB0_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lw	a3, 0(a0)
	addi	a0, a0, 4
	mulw	a1, a3, a1
	bne	a0, a2, .LBB0_2
# %bb.3:                                # %for.cond.cleanup
	mv	a0, a1
	ret
.LBB0_4:
	li	a1, 1
	mv	a0, a1
	ret
.Lfunc_end0:
	.size	vector_reduce_mul_i32, .Lfunc_end0-vector_reduce_mul_i32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
