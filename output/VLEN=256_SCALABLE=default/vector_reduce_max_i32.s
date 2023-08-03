	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_reduce_max_i32.c"
	.globl	vector_reduce_max_i32           # -- Begin function vector_reduce_max_i32
	.p2align	1
	.type	vector_reduce_max_i32,@function
vector_reduce_max_i32:                  # @vector_reduce_max_i32
# %bb.0:                                # %entry
	lui	a4, 807449
	beqz	a1, .LBB0_3
# %bb.1:                                # %for.body.preheader
	zext.w	a6, a1
	csrr	a2, vlenb
	srli	a1, a2, 1
	bgeu	a6, a1, .LBB0_4
# %bb.2:
	li	a3, 0
	addiw	a1, a4, 1871
	j	.LBB0_7
.LBB0_3:
	addiw	a1, a4, 1871
	mv	a0, a1
	ret
.LBB0_4:                                # %vector.ph
	srli	a3, a2, 3
	slli	a3, a3, 2
	neg	a3, a3
	and	a3, a3, a6
	addiw	a4, a4, 1871
	vsetvli	a5, zero, e32, m2, ta, ma
	vmv.v.x	v8, a4
	slli	a2, a2, 1
	mv	a5, a3
	mv	a4, a0
.LBB0_5:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vl2re32.v	v10, (a4)
	vmax.vv	v8, v10, v8
	sub	a5, a5, a1
	add	a4, a4, a2
	bnez	a5, .LBB0_5
# %bb.6:                                # %middle.block
	vredmax.vs	v8, v8, v8
	vmv.x.s	a1, v8
	beq	a3, a6, .LBB0_9
.LBB0_7:                                # %for.body.preheader13
	sh2add	a0, a3, a0
	sub	a2, a6, a3
.LBB0_8:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lw	a3, 0(a0)
	sext.w	a1, a1
	max	a1, a3, a1
	addi	a2, a2, -1
	addi	a0, a0, 4
	bnez	a2, .LBB0_8
.LBB0_9:                                # %for.cond.cleanup
	mv	a0, a1
	ret
.Lfunc_end0:
	.size	vector_reduce_max_i32, .Lfunc_end0-vector_reduce_max_i32
                                        # -- End function
	.ident	"clang version 18.0.0 (https://github.com/llvm/llvm-project.git 660b740e4b3c4b23dfba36940ae0fe2ad41bfedf)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
