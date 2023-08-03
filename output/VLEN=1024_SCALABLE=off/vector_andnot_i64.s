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
	li	a3, 8
	zext.w	a6, a2
	bltu	a2, a3, .LBB0_3
# %bb.2:                                # %vector.memcheck
	sh3add	a2, a6, a0
	sh3add	a3, a6, a1
	sltu	a3, a0, a3
	sltu	a2, a1, a2
	and	a2, a2, a3
	beqz	a2, .LBB0_7
.LBB0_3:
	li	a7, 0
.LBB0_4:                                # %for.body.preheader16
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
	andi	a7, a6, -8
	vsetivli	zero, 4, e64, m2, ta, ma
	mv	a4, a7
	mv	a5, a1
	mv	a3, a0
.LBB0_8:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	addi	t0, a5, 32
	addi	a2, a3, 32
	vle64.v	v8, (a5)
	vle64.v	v10, (t0)
	vle64.v	v12, (a3)
	vle64.v	v14, (a2)
	vnot.v	v8, v8
	vnot.v	v10, v10
	vand.vv	v8, v12, v8
	vand.vv	v10, v14, v10
	vse64.v	v8, (a3)
	vse64.v	v10, (a2)
	addi	a3, a3, 64
	addi	a4, a4, -8
	addi	a5, a5, 64
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
