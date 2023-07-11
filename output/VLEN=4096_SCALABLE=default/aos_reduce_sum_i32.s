	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"aos_reduce_sum_i32.c"
	.globl	aos_reduce_sum_i32              # -- Begin function aos_reduce_sum_i32
	.p2align	1
	.type	aos_reduce_sum_i32,@function
aos_reduce_sum_i32:                     # @aos_reduce_sum_i32
# %bb.0:                                # %entry
	beqz	a0, .LBB0_8
# %bb.1:                                # %for.body.preheader
	zext.w	t0, a0
	csrr	a2, vlenb
	srli	a0, a2, 1
	bgeu	t0, a0, .LBB0_3
# %bb.2:
	li	a7, 0
	li	a0, 0
	j	.LBB0_6
.LBB0_3:                                # %vector.ph
	addi	a3, a0, -1
	and	a6, t0, a3
	sub	a7, t0, a6
	addi	a5, a1, 48
	li	a3, 28
	mul	a4, a2, a3
	vsetvli	a2, zero, e32, m2, ta, ma
	vmv.v.i	v8, 0
	li	a3, 56
	mv	a2, a7
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vlse32.v	v10, (a5), a3
	vadd.vv	v8, v10, v8
	sub	a2, a2, a0
	add	a5, a5, a4
	bnez	a2, .LBB0_4
# %bb.5:                                # %middle.block
	vmv.s.x	v10, zero
	vredsum.vs	v8, v8, v10
	vmv.x.s	a0, v8
	beqz	a6, .LBB0_8
.LBB0_6:                                # %for.body.preheader7
	li	a2, 56
	mul	a2, a7, a2
	add	a1, a1, a2
	addi	a1, a1, 48
	sub	a2, t0, a7
.LBB0_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lw	a3, 0(a1)
	addw	a0, a0, a3
	addi	a2, a2, -1
	addi	a1, a1, 56
	bnez	a2, .LBB0_7
.LBB0_8:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	aos_reduce_sum_i32, .Lfunc_end0-aos_reduce_sum_i32
                                        # -- End function
	.ident	"clang version 17.0.0 (https://github.com/llvm/llvm-project.git e2d7d988115c1b67b0175be5d6bc95153945b5be)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
