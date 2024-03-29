	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"riscv_vspec_example_a2.c"
	.globl	example_a2                      # -- Begin function example_a2
	.p2align	1
	.type	example_a2,@function
example_a2:                             # @example_a2
# %bb.0:                                # %entry
	beqz	a3, .LBB0_11
# %bb.1:                                # %for.body.preheader
	zext.w	a6, a3
	csrr	t0, vlenb
	slli	t0, t0, 1
	li	a3, 32
	maxu	a3, t0, a3
	bltu	a6, a3, .LBB0_3
# %bb.2:                                # %vector.memcheck
	sub	a3, a1, a0
	sub	a4, a1, a2
	minu	a3, a3, a4
	bgeu	a3, t0, .LBB0_8
.LBB0_3:
	li	a7, 0
.LBB0_4:                                # %for.body.preheader19
	add	a0, a0, a7
	add	a2, a2, a7
	add	a1, a1, a7
	sub	a3, a6, a7
	li	a6, 4
	j	.LBB0_6
.LBB0_5:                                # %cond.end
                                        #   in Loop: Header=BB0_6 Depth=1
	sb	a5, 0(a1)
	addi	a0, a0, 1
	addi	a2, a2, 1
	addi	a3, a3, -1
	addi	a1, a1, 1
	beqz	a3, .LBB0_11
.LBB0_6:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lbu	a4, 0(a0)
	li	a5, 1
	bltu	a6, a4, .LBB0_5
# %bb.7:                                # %cond.true
                                        #   in Loop: Header=BB0_6 Depth=1
	lbu	a5, 0(a2)
	j	.LBB0_5
.LBB0_8:                                # %vector.ph
	neg	a3, t0
	and	a7, a3, a6
	vsetvli	a3, zero, e8, m2, ta, ma
	vmv.v.i	v8, 1
	mv	t1, a7
	mv	a5, a1
	mv	a3, a2
	mv	a4, a0
.LBB0_9:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vl2r.v	v10, (a4)
	vmsleu.vi	v0, v10, 4
	vle8.v	v10, (a3), v0.t
	vmerge.vvm	v10, v8, v10, v0
	vs2r.v	v10, (a5)
	add	a4, a4, t0
	add	a3, a3, t0
	sub	t1, t1, t0
	add	a5, a5, t0
	bnez	t1, .LBB0_9
# %bb.10:                               # %middle.block
	bne	a7, a6, .LBB0_4
.LBB0_11:                               # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	example_a2, .Lfunc_end0-example_a2
                                        # -- End function
	.ident	"clang version 18.0.0 (https://github.com/llvm/llvm-project.git 660b740e4b3c4b23dfba36940ae0fe2ad41bfedf)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
