	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zbs1p0_zve32x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_abs_diff_i8.c"
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
	.globl	vector_abs_diff                 # -- Begin function vector_abs_diff
	.p2align	1
	.type	vector_abs_diff,@function
vector_abs_diff:                        # @vector_abs_diff
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a3, .LBB2_5
# %bb.1:                                # %for.body.preheader
	zext.w	a6, a3
	csrr	a3, vlenb
	slli	t1, a3, 1
	li	a4, 32
	maxu	a4, t1, a4
	bgeu	a6, a4, .LBB2_6
# %bb.2:
	li	a7, 0
.LBB2_3:                                # %for.body.preheader17
	add	a5, a1, a7
	add	a2, a2, a7
	add	a0, a0, a7
	add	a1, a1, a6
.LBB2_4:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lbu	a3, 0(a5)
	lbu	a4, 0(a2)
	addi	a5, a5, 1
	addi	a2, a2, 1
	sub	a3, a3, a4
	sext.b	a3, a3
	neg	a4, a3
	max	a3, a3, a4
	sb	a3, 0(a0)
	addi	a0, a0, 1
	bne	a5, a1, .LBB2_4
.LBB2_5:                                # %for.cond.cleanup
	ret
.LBB2_6:                                # %vector.memcheck
	sub	a4, a0, a1
	li	a7, 0
	bltu	a4, t1, .LBB2_3
# %bb.7:                                # %vector.memcheck
	sub	a4, a0, a2
	bltu	a4, t1, .LBB2_3
# %bb.8:                                # %vector.ph
	neg	a4, t1
	and	a7, a4, a6
	sub	a4, a7, t1
	divu	a4, a4, t1
	srli	a3, a3, 3
	slli	a4, a4, 4
	addi	a4, a4, 16
	mul	t0, a4, a3
	add	t0, t0, a0
	mv	t2, a1
	mv	a3, a2
	mv	a4, a0
	vsetvli	a5, zero, e8, m2, ta, ma
.LBB2_9:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vl2r.v	v8, (t2)
	vl2r.v	v10, (a3)
	vsub.vv	v8, v8, v10
	vrsub.vi	v10, v8, 0
	vmax.vv	v8, v8, v10
	vs2r.v	v8, (a4)
	add	a4, a4, t1
	add	a3, a3, t1
	add	t2, t2, t1
	bne	a4, t0, .LBB2_9
# %bb.10:                               # %middle.block
	bne	a7, a6, .LBB2_3
	j	.LBB2_5
.Lfunc_end2:
	.size	vector_abs_diff, .Lfunc_end2-vector_abs_diff
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
