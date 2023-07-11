	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"sparsevec_reduce_add_i32.c"
	.globl	sparsevec_reduce_add_i32        # -- Begin function sparsevec_reduce_add_i32
	.p2align	1
	.type	sparsevec_reduce_add_i32,@function
sparsevec_reduce_add_i32:               # @sparsevec_reduce_add_i32
# %bb.0:                                # %entry
	beqz	a0, .LBB0_8
# %bb.1:                                # %for.body.preheader
	li	a4, 16
	zext.w	a6, a0
	bgeu	a0, a4, .LBB0_3
# %bb.2:
	li	a4, 0
	li	a0, 0
	j	.LBB0_6
.LBB0_3:                                # %vector.ph
	andi	a4, a6, -16
	vsetivli	zero, 8, e32, m2, ta, ma
	vmv.v.i	v8, 0
	mv	a0, a4
	mv	a5, a2
	vmv.v.i	v10, 0
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	addi	a3, a5, 16
	vle16.v	v12, (a5)
	vle16.v	v13, (a3)
	vsetvli	zero, zero, e64, m4, ta, ma
	vsext.vf4	v16, v12
	vsext.vf4	v20, v13
	vsll.vi	v12, v16, 2
	vsll.vi	v16, v20, 2
	vsetvli	zero, zero, e32, m2, ta, ma
	vluxei64.v	v20, (a1), v12
	vluxei64.v	v12, (a1), v16
	vadd.vv	v8, v20, v8
	vadd.vv	v10, v12, v10
	addi	a0, a0, -16
	addi	a5, a5, 32
	bnez	a0, .LBB0_4
# %bb.5:                                # %middle.block
	vadd.vv	v8, v10, v8
	vmv.s.x	v10, zero
	vredsum.vs	v8, v8, v10
	vmv.x.s	a0, v8
	beq	a4, a6, .LBB0_8
.LBB0_6:                                # %for.body.preheader12
	sh1add	a2, a4, a2
	sub	a3, a6, a4
.LBB0_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lh	a4, 0(a2)
	sh2add	a4, a4, a1
	lw	a4, 0(a4)
	addw	a0, a0, a4
	addi	a3, a3, -1
	addi	a2, a2, 2
	bnez	a3, .LBB0_7
.LBB0_8:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	sparsevec_reduce_add_i32, .Lfunc_end0-sparsevec_reduce_add_i32
                                        # -- End function
	.ident	"clang version 17.0.0 (https://github.com/llvm/llvm-project.git e2d7d988115c1b67b0175be5d6bc95153945b5be)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
