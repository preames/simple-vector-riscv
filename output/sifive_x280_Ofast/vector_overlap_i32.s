	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zfh1p0_zfhmin1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfh1p0_zvfhmin1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl512b1p0_zvl64b1p0"
	.file	"vector_overlap_i32.c"
	.text
	.globl	vector_overlap                  # -- Begin function vector_overlap
	.p2align	1
	.type	vector_overlap,@function
vector_overlap:                         # @vector_overlap
	.cfi_startproc
# %bb.0:                                # %entry
	li	a3, 2
	bltu	a2, a3, .LBB0_9
# %bb.1:                                # %for.body.preheader
	csrr	a3, vlenb
	zext.w	a6, a2
	lw	a2, 4(a0)
	addi	t2, a6, -1
	srli	t3, a3, 1
	bgeu	t2, t3, .LBB0_3
# %bb.2:
	li	t0, 1
	j	.LBB0_7
.LBB0_3:                                # %vector.ph
	addi	a4, t3, -1
	vsetvli	a5, zero, e32, m1, ta, ma
	vmv.s.x	v10, a2
	zext.w	a7, a4
	srli	t4, a3, 3
	neg	a4, t3
	addi	a3, a7, 1
	and	t1, t2, a4
	vsetvli	zero, a3, e32, m2, ta, ma
	vslideup.vx	v8, v10, a7
	addi	a5, a1, 4
	addi	t0, t1, 1
	slli	t5, t4, 4
	addi	t4, t3, -1
	mv	a3, t1
	mv	a2, a0
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vsetivli	zero, 1, e32, m2, ta, ma
	addi	a4, a2, 8
	sub	a3, a3, t3
	vl2re32.v	v12, (a2)
	add	a2, a2, t5
	vslidedown.vx	v10, v8, t4
	vl2re32.v	v8, (a4)
	vsetvli	a4, zero, e32, m2, ta, ma
	vslideup.vi	v10, v8, 1
	vadd.vv	v12, v12, v8
	vadd.vv	v10, v10, v12
	vs2r.v	v10, (a5)
	add	a5, a5, t5
	bnez	a3, .LBB0_4
# %bb.5:                                # %middle.block
	beq	t2, t1, .LBB0_9
# %bb.6:
	vslidedown.vx	v8, v8, a7
	vmv.x.s	a2, v8
.LBB0_7:                                # %for.body.preheader19
	sh2add	a3, t0, a0
	sh2add	a4, a6, a0
	addi	a0, a3, 4
	addi	a3, a4, 4
	sh2add	a1, t0, a1
.LBB0_8:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lw	a4, -8(a0)
	add	a4, a4, a2
	lw	a2, 0(a0)
	add	a4, a4, a2
	addi	a0, a0, 4
	sw	a4, 0(a1)
	addi	a1, a1, 4
	bne	a0, a3, .LBB0_8
.LBB0_9:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	vector_overlap, .Lfunc_end0-vector_overlap
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
