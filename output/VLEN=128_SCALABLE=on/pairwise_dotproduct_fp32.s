	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"pairwise_dotproduct_fp32.c"
	.globl	pairwise_dotproduct_fp32        # -- Begin function pairwise_dotproduct_fp32
	.p2align	1
	.type	pairwise_dotproduct_fp32,@function
pairwise_dotproduct_fp32:               # @pairwise_dotproduct_fp32
# %bb.0:                                # %entry
	andi	a0, a0, -2
	beqz	a0, .LBB0_6
# %bb.1:                                # %for.body.preheader
	li	a4, 31
	zext.w	t0, a0
	bltu	a0, a4, .LBB0_3
# %bb.2:                                # %vector.memcheck
	addi	a0, t0, -1
	srli	a6, a0, 1
	sh2add	a0, a6, a1
	addi	a0, a0, 4
	slli	a4, a6, 3
	addi	a4, a4, 8
	add	a5, a2, a4
	add	a7, a3, a4
	sltu	a5, a1, a5
	sltu	a4, a2, a0
	and	a4, a4, a5
	sltu	a5, a1, a7
	sltu	a0, a3, a0
	and	a0, a0, a5
	or	a0, a0, a4
	beqz	a0, .LBB0_7
.LBB0_3:
	li	a4, 0
.LBB0_4:                                # %for.body.preheader37
	slli	a0, a4, 2
	addi	a0, a0, 4
	add	a2, a2, a0
	add	a3, a3, a0
	srli	a0, a4, 1
	sh2add	a1, a0, a1
.LBB0_5:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	flw	fa5, -4(a2)
	flw	fa4, 0(a2)
	flw	fa3, 0(a3)
	flw	fa2, -4(a3)
	fmul.s	fa4, fa4, fa3
	fmadd.s	fa5, fa5, fa2, fa4
	fsw	fa5, 0(a1)
	addi	a4, a4, 2
	addi	a2, a2, 8
	addi	a3, a3, 8
	addi	a1, a1, 4
	bltu	a4, t0, .LBB0_5
.LBB0_6:                                # %for.cond.cleanup
	ret
.LBB0_7:                                # %vector.ph
	addi	a6, a6, 1
	andi	a7, a6, -8
	slli	a4, a7, 1
	vsetivli	zero, 8, e32, m2, ta, ma
	mv	t1, a3
	mv	t2, a2
.LBB0_8:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vlseg2e32.v	v8, (t2)
	vlseg2e32.v	v12, (t1)
	vfmul.vv	v10, v10, v14
	vfmacc.vv	v10, v8, v12
	andi	a5, a0, -8
	sh2add	a5, a5, a1
	vse32.v	v10, (a5)
	addi	a0, a0, 8
	addi	t2, t2, 64
	addi	t1, t1, 64
	bne	a7, a0, .LBB0_8
# %bb.9:                                # %middle.block
	beq	a6, a7, .LBB0_6
	j	.LBB0_4
.Lfunc_end0:
	.size	pairwise_dotproduct_fp32, .Lfunc_end0-pairwise_dotproduct_fp32
                                        # -- End function
	.ident	"clang version 17.0.0 (https://github.com/llvm/llvm-project.git e2d7d988115c1b67b0175be5d6bc95153945b5be)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
