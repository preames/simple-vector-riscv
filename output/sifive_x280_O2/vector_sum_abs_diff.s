	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zfh1p0_zfhmin1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfh1p0_zvfhmin1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl512b1p0_zvl64b1p0"
	.file	"vector_sum_abs_diff.c"
	.text
	.globl	sub                             # -- Begin function sub
	.p2align	1
	.type	sub,@function
sub:                                    # @sub
	.cfi_startproc
# %bb.0:                                # %entry
	subw	a0, a0, a1
	sext.b	a0, a0
	ret
.Lfunc_end0:
	.size	sub, .Lfunc_end0-sub
	.cfi_endproc
                                        # -- End function
	.globl	myabs                           # -- Begin function myabs
	.p2align	1
	.type	myabs,@function
myabs:                                  # @myabs
	.cfi_startproc
# %bb.0:                                # %entry
	bgez	a0, .LBB1_2
# %bb.1:                                # %entry
	neg	a0, a0
.LBB1_2:                                # %entry
	sext.b	a0, a0
	ret
.Lfunc_end1:
	.size	myabs, .Lfunc_end1-myabs
	.cfi_endproc
                                        # -- End function
	.globl	vector_sum_abs_diff             # -- Begin function vector_sum_abs_diff
	.p2align	1
	.type	vector_sum_abs_diff,@function
vector_sum_abs_diff:                    # @vector_sum_abs_diff
	.cfi_startproc
# %bb.0:                                # %entry
	srliw	a7, a3, 3
	beqz	a7, .LBB2_4
# %bb.1:                                # %for.cond1.preheader.preheader
	csrr	a3, vlenb
	li	a6, 0
	sh2add	t3, a7, a0
	li	a4, 32
	srli	t1, a3, 1
	maxu	a4, t1, a4
	bgeu	a7, a4, .LBB2_5
.LBB2_2:                                # %for.cond1.preheader.preheader49
	vsetivli	zero, 8, e32, m1, ta, ma
	vmv.s.x	v8, zero
	sh2add	a0, a6, a0
	sh3add	a1, a6, a1
	sh3add	a2, a6, a2
.LBB2_3:                                # %for.cond1.preheader
                                        # =>This Inner Loop Header: Depth=1
	vsetivli	zero, 8, e8, mf8, ta, ma
	vle8.v	v9, (a1)
	vle8.v	v10, (a2)
	addi	a1, a1, 8
	addi	a2, a2, 8
	vsub.vv	v9, v9, v10
	vrsub.vi	v10, v9, 0
	vmax.vv	v9, v9, v10
	vsetvli	zero, zero, e32, mf2, ta, ma
	vsext.vf4	v10, v9
	vredsum.vs	v9, v10, v8
	vsetivli	zero, 1, e32, m1, ta, ma
	vse32.v	v9, (a0)
	addi	a0, a0, 4
	bne	a0, t3, .LBB2_3
.LBB2_4:                                # %for.cond.cleanup
	ret
.LBB2_5:                                # %vector.memcheck
	sh3add	a4, a7, a1
	sltu	a5, a1, t3
	sltu	a4, a0, a4
	and	a4, a4, a5
	bnez	a4, .LBB2_2
# %bb.6:                                # %vector.memcheck
	sh3add	a4, a7, a2
	sltu	a5, a2, t3
	sltu	a4, a0, a4
	and	a4, a4, a5
	bnez	a4, .LBB2_2
# %bb.7:                                # %vector.ph
	srli	a3, a3, 3
	mv	t4, a1
	slli	a4, a3, 2
	slli	t0, a3, 4
	neg	a4, a4
	slli	t2, a3, 5
	and	a6, a4, a7
	mv	t5, a2
	mv	a3, a0
	mv	a4, a6
.LBB2_8:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vsetvli	a5, zero, e8, mf2, ta, ma
	vlseg8e8.v	v8, (t4)
	add	t4, t4, t2
	sub	a4, a4, t1
	vlseg8e8.v	v16, (t5)
	add	t5, t5, t2
	vsub.vv	v8, v8, v16
	vsub.vv	v9, v9, v17
	vrsub.vi	v16, v8, 0
	vmax.vv	v8, v8, v16
	vrsub.vi	v16, v9, 0
	vsetvli	zero, zero, e16, m1, ta, ma
	vsext.vf2	v17, v8
	vsetvli	zero, zero, e8, mf2, ta, ma
	vmax.vv	v8, v9, v16
	vsub.vv	v10, v10, v18
	vsetvli	zero, zero, e16, m1, ta, ma
	vsext.vf2	v16, v8
	vsetvli	zero, zero, e8, mf2, ta, ma
	vrsub.vi	v18, v10, 0
	vsetvli	zero, zero, e16, m1, ta, ma
	vwadd.vv	v8, v17, v16
	vsetvli	zero, zero, e8, mf2, ta, ma
	vmax.vv	v10, v10, v18
	vsub.vv	v11, v11, v19
	vsetvli	zero, zero, e16, m1, ta, ma
	vsext.vf2	v16, v10
	vsetvli	zero, zero, e8, mf2, ta, ma
	vrsub.vi	v10, v11, 0
	vsetvli	zero, zero, e16, m1, ta, ma
	vwadd.wv	v8, v8, v16
	vsetvli	zero, zero, e8, mf2, ta, ma
	vsub.vv	v12, v12, v20
	vmax.vv	v10, v11, v10
	vrsub.vi	v11, v12, 0
	vsetvli	zero, zero, e16, m1, ta, ma
	vsext.vf2	v16, v10
	vsetvli	zero, zero, e8, mf2, ta, ma
	vsub.vv	v10, v13, v21
	vmax.vv	v11, v12, v11
	vsetvli	zero, zero, e16, m1, ta, ma
	vwadd.wv	v8, v8, v16
	vsetvli	zero, zero, e8, mf2, ta, ma
	vrsub.vi	v12, v10, 0
	vsetvli	zero, zero, e16, m1, ta, ma
	vsext.vf2	v13, v11
	vsetvli	zero, zero, e8, mf2, ta, ma
	vsub.vv	v11, v14, v22
	vmax.vv	v10, v10, v12
	vsetvli	zero, zero, e16, m1, ta, ma
	vwadd.wv	v8, v8, v13
	vsetvli	zero, zero, e8, mf2, ta, ma
	vrsub.vi	v12, v11, 0
	vsetvli	zero, zero, e16, m1, ta, ma
	vsext.vf2	v13, v10
	vsetvli	zero, zero, e8, mf2, ta, ma
	vsub.vv	v10, v15, v23
	vmax.vv	v11, v11, v12
	vsetvli	zero, zero, e16, m1, ta, ma
	vwadd.wv	v8, v8, v13
	vsetvli	zero, zero, e8, mf2, ta, ma
	vrsub.vi	v12, v10, 0
	vsetvli	zero, zero, e16, m1, ta, ma
	vsext.vf2	v13, v11
	vsetvli	zero, zero, e8, mf2, ta, ma
	vmax.vv	v10, v10, v12
	vsetvli	zero, zero, e16, m1, ta, ma
	vwadd.wv	v8, v8, v13
	vsext.vf2	v11, v10
	vwadd.wv	v8, v8, v11
	vs2r.v	v8, (a3)
	add	a3, a3, t0
	bnez	a4, .LBB2_8
# %bb.9:                                # %middle.block
	bne	a6, a7, .LBB2_2
	j	.LBB2_4
.Lfunc_end2:
	.size	vector_sum_abs_diff, .Lfunc_end2-vector_sum_abs_diff
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
