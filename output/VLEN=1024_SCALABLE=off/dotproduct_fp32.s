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
	li	a3, 16
	zext.w	a6, a0
	bgeu	a0, a3, .LBB0_4
# %bb.2:
	li	a7, 0
	fmv.w.x	fa0, zero
	j	.LBB0_7
.LBB0_3:
	fmv.w.x	fa0, zero
	ret
.LBB0_4:                                # %vector.ph
	andi	a7, a6, -16
	fmv.w.x	fa0, zero
	vsetivli	zero, 8, e32, m2, ta, ma
	mv	a4, a7
	mv	a5, a2
	mv	a3, a1
.LBB0_5:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	addi	t0, a5, 32
	addi	a0, a3, 32
	vle32.v	v8, (a3)
	vle32.v	v10, (a0)
	vle32.v	v12, (a5)
	vle32.v	v14, (t0)
	vfmul.vv	v8, v8, v12
	vfmul.vv	v10, v10, v14
	vfmv.s.f	v12, fa0
	vfredosum.vs	v8, v8, v12
	vfredosum.vs	v8, v10, v8
	vfmv.f.s	fa0, v8
	addi	a3, a3, 64
	addi	a4, a4, -16
	addi	a5, a5, 64
	bnez	a4, .LBB0_5
# %bb.6:                                # %middle.block
	beq	a7, a6, .LBB0_9
.LBB0_7:                                # %for.body.preheader13
	sh2add	a1, a7, a1
	sh2add	a2, a7, a2
	sub	a0, a6, a7
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
	.ident	"clang version 18.0.0 (https://github.com/llvm/llvm-project.git 660b740e4b3c4b23dfba36940ae0fe2ad41bfedf)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
