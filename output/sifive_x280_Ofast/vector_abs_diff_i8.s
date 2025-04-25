	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zfh1p0_zfhmin1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfh1p0_zvfhmin1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl512b1p0_zvl64b1p0"
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
	.globl	vector_abs_diff                 # -- Begin function vector_abs_diff
	.p2align	1
	.type	vector_abs_diff,@function
vector_abs_diff:                        # @vector_abs_diff
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a3, .LBB2_4
# %bb.1:                                # %for.body.preheader
	csrr	a6, vlenb
	li	t0, 0
	li	a4, 128
	zext.w	a7, a3
	slli	t1, a6, 1
	maxu	a3, t1, a4
	bgeu	a7, a3, .LBB2_5
.LBB2_2:                                # %for.body.preheader17
	add	a5, a1, t0
	add	a2, a2, t0
	add	a0, a0, t0
	add	a1, a1, a7
.LBB2_3:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lbu	a3, 0(a5)
	addi	a5, a5, 1
	lbu	a4, 0(a2)
	addi	a2, a2, 1
	subw	a3, a3, a4
	sext.b	a3, a3
	bgez	a3, .LBB2_11
# %bb.10:                               # %for.body
                                        #   in Loop: Header=BB2_3 Depth=1
	neg	a3, a3
.LBB2_11:                               # %for.body
                                        #   in Loop: Header=BB2_3 Depth=1
	sb	a3, 0(a0)
	addi	a0, a0, 1
	bne	a5, a1, .LBB2_3
.LBB2_4:                                # %for.cond.cleanup
	ret
.LBB2_5:                                # %vector.memcheck
	sub	a3, a0, a1
	bltu	a3, t1, .LBB2_2
# %bb.6:                                # %vector.memcheck
	sub	a3, a0, a2
	bltu	a3, t1, .LBB2_2
# %bb.7:                                # %vector.ph
	neg	a3, t1
	srli	a4, a6, 3
	and	t0, a3, a7
	mv	t2, a1
	sub	a3, t0, t1
	vsetvli	a5, zero, e8, m2, ta, ma
	divu	a3, a3, t1
	slli	a3, a3, 4
	addi	a3, a3, 16
	mul	a6, a3, a4
	mv	a4, a2
	add	a6, a6, a0
	mv	a3, a0
.LBB2_8:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vl2r.v	v8, (t2)
	add	t2, t2, t1
	vl2r.v	v10, (a4)
	add	a4, a4, t1
	vsub.vv	v8, v8, v10
	vrsub.vi	v10, v8, 0
	vmax.vv	v8, v8, v10
	vs2r.v	v8, (a3)
	add	a3, a3, t1
	bne	a3, a6, .LBB2_8
# %bb.9:                                # %middle.block
	bne	t0, a7, .LBB2_2
	j	.LBB2_4
.Lfunc_end2:
	.size	vector_abs_diff, .Lfunc_end2-vector_abs_diff
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
