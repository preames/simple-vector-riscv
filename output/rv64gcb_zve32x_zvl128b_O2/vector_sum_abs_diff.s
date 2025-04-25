	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zbs1p0_zve32x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
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
	neg	a1, a0
	max	a0, a0, a1
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
	beqz	a7, .LBB2_5
# %bb.1:                                # %for.cond1.preheader.preheader
	csrr	a3, vlenb
	srli	t1, a3, 1
	li	a4, 8
	maxu	a4, t1, a4
	sh2add	t3, a7, a0
	bgeu	a7, a4, .LBB2_6
# %bb.2:
	li	a6, 0
.LBB2_3:                                # %for.cond1.preheader.preheader49
	sh2add	a0, a6, a0
	sh3add	a1, a6, a1
	sh3add	a2, a6, a2
	vsetivli	zero, 8, e32, m1, ta, ma
	vmv.s.x	v8, zero
.LBB2_4:                                # %for.cond1.preheader
                                        # =>This Inner Loop Header: Depth=1
	vsetivli	zero, 8, e8, mf2, ta, ma
	vle8.v	v9, (a1)
	vle8.v	v10, (a2)
	vsub.vv	v9, v9, v10
	vrsub.vi	v10, v9, 0
	vmax.vv	v9, v9, v10
	vsetvli	zero, zero, e32, m2, ta, ma
	vsext.vf4	v10, v9
	vredsum.vs	v9, v10, v8
	vsetivli	zero, 1, e32, m1, ta, ma
	vse32.v	v9, (a0)
	addi	a0, a0, 4
	addi	a1, a1, 8
	addi	a2, a2, 8
	bne	a0, t3, .LBB2_4
.LBB2_5:                                # %for.cond.cleanup
	ret
.LBB2_6:                                # %vector.memcheck
	sh3add	a4, a7, a1
	sltu	a4, a0, a4
	sltu	a5, a1, t3
	and	a4, a4, a5
	li	a6, 0
	bnez	a4, .LBB2_3
# %bb.7:                                # %vector.memcheck
	sh3add	a4, a7, a2
	sltu	a4, a0, a4
	sltu	a5, a2, t3
	and	a4, a4, a5
	bnez	a4, .LBB2_3
# %bb.8:                                # %vector.ph
	srli	a3, a3, 3
	slli	a4, a3, 2
	neg	a4, a4
	and	a6, a4, a7
	slli	t0, a3, 4
	slli	t2, a3, 5
	mv	t4, a1
	mv	t5, a2
	mv	a3, a0
	mv	a4, a6
.LBB2_9:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vsetvli	a5, zero, e8, mf2, ta, ma
	vlseg8e8.v	v8, (t4)
	vlseg8e8.v	v16, (t5)
	vsub.vv	v8, v8, v16
	vsub.vv	v9, v9, v17
	vsub.vv	v10, v10, v18
	vsub.vv	v11, v11, v19
	vsub.vv	v12, v12, v20
	vsub.vv	v13, v13, v21
	vsub.vv	v14, v14, v22
	vsub.vv	v15, v15, v23
	sub	a4, a4, t1
	add	t5, t5, t2
	vrsub.vi	v16, v8, 0
	vrsub.vi	v17, v9, 0
	vrsub.vi	v18, v10, 0
	vrsub.vi	v19, v11, 0
	vrsub.vi	v20, v12, 0
	vrsub.vi	v21, v13, 0
	vrsub.vi	v22, v14, 0
	vrsub.vi	v23, v15, 0
	vmax.vv	v8, v8, v16
	vmax.vv	v9, v9, v17
	vmax.vv	v10, v10, v18
	vmax.vv	v11, v11, v19
	vmax.vv	v12, v12, v20
	vmax.vv	v13, v13, v21
	vmax.vv	v14, v14, v22
	vmax.vv	v15, v15, v23
	vsetvli	zero, zero, e16, m1, ta, ma
	vsext.vf2	v16, v8
	vsext.vf2	v17, v9
	vsext.vf2	v18, v10
	vsext.vf2	v10, v11
	vsext.vf2	v11, v12
	vsext.vf2	v12, v13
	vsext.vf2	v13, v14
	vsext.vf2	v14, v15
	vwadd.vv	v8, v16, v17
	vwadd.wv	v8, v8, v18
	vwadd.wv	v8, v8, v10
	vwadd.wv	v8, v8, v11
	vwadd.wv	v8, v8, v12
	vwadd.wv	v8, v8, v13
	vwadd.wv	v8, v8, v14
	vs2r.v	v8, (a3)
	add	a3, a3, t0
	add	t4, t4, t2
	bnez	a4, .LBB2_9
# %bb.10:                               # %middle.block
	bne	a6, a7, .LBB2_3
	j	.LBB2_5
.Lfunc_end2:
	.size	vector_sum_abs_diff, .Lfunc_end2-vector_sum_abs_diff
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
