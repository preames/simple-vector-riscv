	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"dotproduct_fp32.c"
	.globl	dotproduct_fp32                 # -- Begin function dotproduct_fp32
	.p2align	1
	.type	dotproduct_fp32,@function
dotproduct_fp32:                        # @dotproduct_fp32
# %bb.0:                                # %entry
	beqz	a0, .LBB0_3
# %bb.1:                                # %for.body.preheader
	zext.w	a7, a0
	csrr	a5, vlenb
	srli	t1, a5, 1
	bgeu	a7, t1, .LBB0_4
# %bb.2:
	li	t0, 0
	fmv.w.x	fa0, zero
	j	.LBB0_7
.LBB0_3:
	fmv.w.x	fa0, zero
	ret
.LBB0_4:                                # %vector.ph
	addi	a0, t1, -1
	and	a6, a7, a0
	sub	t0, a7, a6
	slli	a5, a5, 1
	fmv.w.x	fa0, zero
	vsetvli	a0, zero, e32, m2, ta, ma
	mv	a3, t0
	mv	a4, a2
	mv	a0, a1
.LBB0_5:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vl2re32.v	v8, (a0)
	vl2re32.v	v10, (a4)
	vfmul.vv	v8, v8, v10
	vfmv.s.f	v10, fa0
	vfredosum.vs	v8, v8, v10
	vfmv.f.s	fa0, v8
	add	a0, a0, a5
	sub	a3, a3, t1
	add	a4, a4, a5
	bnez	a3, .LBB0_5
# %bb.6:                                # %middle.block
	beqz	a6, .LBB0_9
.LBB0_7:                                # %for.body.preheader11
	sh2add	a1, t0, a1
	sh2add	a2, t0, a2
	sub	a0, a7, t0
.LBB0_8:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	flw	fa5, 0(a1)
	flw	fa4, 0(a2)
	fmadd.s	fa0, fa5, fa4, fa0
	addi	a1, a1, 4
	addi	a0, a0, -1
	addi	a2, a2, 4
	bnez	a0, .LBB0_8
.LBB0_9:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	dotproduct_fp32, .Lfunc_end0-dotproduct_fp32
                                        # -- End function
	.ident	"clang version 17.0.0 (https://github.com/llvm/llvm-project.git e2d7d988115c1b67b0175be5d6bc95153945b5be)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
