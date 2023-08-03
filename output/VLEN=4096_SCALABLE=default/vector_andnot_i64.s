	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_andnot_i64.c"
	.globl	vector_andnot_i64               # -- Begin function vector_andnot_i64
	.p2align	1
	.type	vector_andnot_i64,@function
vector_andnot_i64:                      # @vector_andnot_i64
# %bb.0:                                # %entry
	beqz	a2, .LBB0_6
# %bb.1:                                # %for.body.preheader
	zext.w	a6, a2
	csrr	a2, vlenb
	srli	t0, a2, 2
	li	a3, 8
	maxu	a3, t0, a3
	bltu	a6, a3, .LBB0_3
# %bb.2:                                # %vector.memcheck
	sh3add	a3, a6, a0
	sh3add	a4, a6, a1
	sltu	a4, a0, a4
	sltu	a3, a1, a3
	and	a3, a3, a4
	beqz	a3, .LBB0_7
.LBB0_3:
	li	a7, 0
.LBB0_4:                                # %for.body.preheader14
	sh3add	a0, a7, a0
	sh3add	a1, a7, a1
	sub	a2, a6, a7
.LBB0_5:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	ld	a3, 0(a0)
	ld	a4, 0(a1)
	andn	a3, a3, a4
	sd	a3, 0(a0)
	addi	a0, a0, 8
	addi	a2, a2, -1
	addi	a1, a1, 8
	bnez	a2, .LBB0_5
.LBB0_6:                                # %for.cond.cleanup
	ret
.LBB0_7:                                # %vector.ph
	srli	a3, a2, 3
	slli	a3, a3, 1
	neg	a3, a3
	and	a7, a3, a6
	slli	a3, a2, 1
	vsetvli	a2, zero, e64, m2, ta, ma
	mv	a4, a7
	mv	a5, a1
	mv	a2, a0
.LBB0_8:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vl2re64.v	v8, (a5)
	vl2re64.v	v10, (a2)
	vnot.v	v8, v8
	vand.vv	v8, v10, v8
	vs2r.v	v8, (a2)
	add	a2, a2, a3
	sub	a4, a4, t0
	add	a5, a5, a3
	bnez	a4, .LBB0_8
# %bb.9:                                # %middle.block
	beq	a7, a6, .LBB0_6
	j	.LBB0_4
.Lfunc_end0:
	.size	vector_andnot_i64, .Lfunc_end0-vector_andnot_i64
                                        # -- End function
	.ident	"clang version 18.0.0 (https://github.com/llvm/llvm-project.git 660b740e4b3c4b23dfba36940ae0fe2ad41bfedf)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
