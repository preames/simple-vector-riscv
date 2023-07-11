	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_abs_diff_i8.c"
	.globl	sub                             # -- Begin function sub
	.p2align	1
	.type	sub,@function
sub:                                    # @sub
# %bb.0:                                # %entry
	subw	a0, a0, a1
	sext.b	a0, a0
	ret
.Lfunc_end0:
	.size	sub, .Lfunc_end0-sub
                                        # -- End function
	.globl	myabs                           # -- Begin function myabs
	.p2align	1
	.type	myabs,@function
myabs:                                  # @myabs
# %bb.0:                                # %entry
	neg	a1, a0
	max	a0, a0, a1
	sext.b	a0, a0
	ret
.Lfunc_end1:
	.size	myabs, .Lfunc_end1-myabs
                                        # -- End function
	.globl	vector_abs_diff                 # -- Begin function vector_abs_diff
	.p2align	1
	.type	vector_abs_diff,@function
vector_abs_diff:                        # @vector_abs_diff
# %bb.0:                                # %entry
	beqz	a3, .LBB2_6
# %bb.1:                                # %for.body.preheader
	zext.w	a7, a3
	csrr	t1, vlenb
	slli	t1, t1, 1
	li	a3, 32
	maxu	a3, t1, a3
	bltu	a7, a3, .LBB2_3
# %bb.2:                                # %vector.memcheck
	sub	a3, a0, a1
	sub	a4, a0, a2
	minu	a3, a3, a4
	bgeu	a3, t1, .LBB2_7
.LBB2_3:
	li	t0, 0
.LBB2_4:                                # %for.body.preheader17
	add	a1, a1, t0
	add	a2, a2, t0
	add	a0, a0, t0
	sub	a3, a7, t0
.LBB2_5:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lbu	a4, 0(a1)
	lbu	a5, 0(a2)
	subw	a4, a4, a5
	sext.b	a4, a4
	neg	a5, a4
	max	a4, a4, a5
	sb	a4, 0(a0)
	addi	a1, a1, 1
	addi	a2, a2, 1
	addi	a3, a3, -1
	addi	a0, a0, 1
	bnez	a3, .LBB2_5
.LBB2_6:                                # %for.cond.cleanup
	ret
.LBB2_7:                                # %vector.ph
	addi	a3, t1, -1
	and	a6, a7, a3
	sub	t0, a7, a6
	vsetvli	a3, zero, e8, m2, ta, ma
	mv	t2, t0
	mv	a5, a0
	mv	a3, a2
	mv	a4, a1
.LBB2_8:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vl2r.v	v8, (a4)
	vl2r.v	v10, (a3)
	vsub.vv	v8, v8, v10
	vrsub.vi	v10, v8, 0
	vmax.vv	v8, v8, v10
	vs2r.v	v8, (a5)
	add	a4, a4, t1
	add	a3, a3, t1
	sub	t2, t2, t1
	add	a5, a5, t1
	bnez	t2, .LBB2_8
# %bb.9:                                # %middle.block
	bnez	a6, .LBB2_4
	j	.LBB2_6
.Lfunc_end2:
	.size	vector_abs_diff, .Lfunc_end2-vector_abs_diff
                                        # -- End function
	.ident	"clang version 17.0.0 (https://github.com/llvm/llvm-project.git e2d7d988115c1b67b0175be5d6bc95153945b5be)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
