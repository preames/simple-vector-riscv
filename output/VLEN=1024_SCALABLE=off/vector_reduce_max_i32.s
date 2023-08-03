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
	li	a3, 16
	zext.w	a2, a1
	bgeu	a1, a3, .LBB0_4
# %bb.2:
	li	a3, 0
	addiw	a1, a4, 1871
	j	.LBB0_7
.LBB0_3:
	addiw	a1, a4, 1871
	mv	a0, a1
	ret
.LBB0_4:                                # %vector.ph
	lui	a1, 807449
	addiw	a1, a1, 1871
	vsetivli	zero, 8, e32, m2, ta, ma
	vmv.v.x	v8, a1
	andi	a3, a2, -16
	mv	a1, a3
	mv	a4, a0
	vmv.v.v	v10, v8
.LBB0_5:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	addi	a5, a4, 32
	vle32.v	v12, (a4)
	vle32.v	v14, (a5)
	vmax.vv	v8, v12, v8
	vmax.vv	v10, v14, v10
	addi	a1, a1, -16
	addi	a4, a4, 64
	bnez	a1, .LBB0_5
# %bb.6:                                # %middle.block
	vmax.vv	v8, v8, v10
	vredmax.vs	v8, v8, v8
	vmv.x.s	a1, v8
	beq	a3, a2, .LBB0_9
.LBB0_7:                                # %for.body.preheader15
	sh2add	a0, a3, a0
	sub	a2, a2, a3
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
