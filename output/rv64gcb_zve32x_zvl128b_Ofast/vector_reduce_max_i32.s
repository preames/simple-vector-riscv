	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zbs1p0_zve32x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_reduce_max_i32.c"
	.text
	.globl	vector_reduce_max_i32           # -- Begin function vector_reduce_max_i32
	.p2align	1
	.type	vector_reduce_max_i32,@function
vector_reduce_max_i32:                  # @vector_reduce_max_i32
	.cfi_startproc
# %bb.0:                                # %entry
	lui	a4, 807449
	beqz	a1, .LBB0_3
# %bb.1:                                # %for.body.preheader
	zext.w	a2, a1
	csrr	a3, vlenb
	srli	a1, a3, 1
	bgeu	a2, a1, .LBB0_4
# %bb.2:
	li	a3, 0
	addiw	a1, a4, 1871
	j	.LBB0_7
.LBB0_3:
	addiw	a0, a4, 1871
	ret
.LBB0_4:                                # %vector.ph
	srli	a4, a3, 3
	slli	a3, a4, 2
	neg	a3, a3
	and	a3, a3, a2
	sub	a5, a3, a1
	divu	a7, a5, a1
	lui	a6, 807449
	slli	a1, a4, 4
	addi	a6, a6, 1871
	slli	a7, a7, 4
	addi	a7, a7, 16
	mul	a4, a7, a4
	add	a4, a4, a0
	vsetvli	a5, zero, e32, m2, ta, ma
	vmv.v.x	v8, a6
	mv	a5, a0
.LBB0_5:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vl2re32.v	v10, (a5)
	add	a5, a5, a1
	vmax.vv	v8, v10, v8
	bne	a5, a4, .LBB0_5
# %bb.6:                                # %middle.block
	vredmax.vs	v8, v8, v8
	vmv.x.s	a1, v8
	beq	a3, a2, .LBB0_9
.LBB0_7:                                # %for.body.preheader13
	sh2add	a3, a3, a0
	sh2add	a0, a2, a0
.LBB0_8:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lw	a2, 0(a3)
	addi	a3, a3, 4
	max	a1, a2, a1
	bne	a3, a0, .LBB0_8
.LBB0_9:                                # %for.cond.cleanup
	mv	a0, a1
	ret
.Lfunc_end0:
	.size	vector_reduce_max_i32, .Lfunc_end0-vector_reduce_max_i32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
