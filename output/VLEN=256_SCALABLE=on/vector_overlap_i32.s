	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_overlap_i32.c"
	.globl	vector_overlap                  # -- Begin function vector_overlap
	.p2align	1
	.type	vector_overlap,@function
vector_overlap:                         # @vector_overlap
# %bb.0:                                # %entry
	li	a3, 2
	bltu	a2, a3, .LBB0_8
# %bb.1:                                # %for.body.preheader
	zext.w	a7, a2
	lw	t5, 0(a0)
	lw	a4, 4(a0)
	addi	t1, a7, -1
	csrr	t4, vlenb
	srli	t3, t4, 1
	li	t2, 1
	bltu	t1, t3, .LBB0_6
# %bb.2:                                # %vector.ph
	neg	a3, t3
	and	a6, t1, a3
	addi	t2, a6, 1
	addiw	a3, t3, -1
	vsetvli	a5, zero, e32, m1, ta, ma
	vmv.s.x	v10, a4
	zext.w	t0, a3
	addi	a3, t0, 1
	vsetvli	zero, a3, e32, m2, ta, ma
	vslideup.vx	v8, v10, t0
	vsetvli	a4, zero, e32, m1, ta, ma
	vmv.s.x	v12, t5
	vsetvli	zero, a3, e32, m2, ta, ma
	vslideup.vx	v10, v12, t0
	addi	a2, a0, 8
	slli	t4, t4, 1
	addi	a4, a1, 4
	addi	t5, t3, -1
	mv	a3, a6
.LBB0_3:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vmv2r.v	v12, v10
	vmv2r.v	v10, v8
	vl2re32.v	v8, (a2)
	vsetivli	zero, 1, e32, m2, ta, ma
	vslidedown.vx	v10, v10, t5
	vsetvli	a5, zero, e32, m2, ta, ma
	vslideup.vi	v10, v8, 1
	vsetivli	zero, 1, e32, m2, ta, ma
	vslidedown.vx	v12, v12, t5
	vsetvli	a5, zero, e32, m2, ta, ma
	vslideup.vi	v12, v10, 1
	vadd.vv	v12, v10, v12
	vadd.vv	v12, v12, v8
	vs2r.v	v12, (a4)
	add	a2, a2, t4
	sub	a3, a3, t3
	add	a4, a4, t4
	bnez	a3, .LBB0_3
# %bb.4:                                # %middle.block
	beq	t1, a6, .LBB0_8
# %bb.5:
	vsetivli	zero, 1, e32, m2, ta, ma
	vslidedown.vx	v8, v8, t0
	vmv.x.s	a4, v8
	vslidedown.vx	v8, v10, t0
	vmv.x.s	t5, v8
.LBB0_6:                                # %for.body.preheader25
	sh2add	a1, t2, a1
	sub	a3, a7, t2
	sh2add	a0, t2, a0
	addi	a0, a0, 4
.LBB0_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	mv	a5, a4
	lw	a4, 0(a0)
	add	a2, a5, t5
	mv	t5, a5
	add	a2, a2, a4
	sw	a2, 0(a1)
	addi	a1, a1, 4
	addi	a3, a3, -1
	addi	a0, a0, 4
	bnez	a3, .LBB0_7
.LBB0_8:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	vector_overlap, .Lfunc_end0-vector_overlap
                                        # -- End function
	.ident	"clang version 18.0.0 (https://github.com/llvm/llvm-project.git 660b740e4b3c4b23dfba36940ae0fe2ad41bfedf)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
