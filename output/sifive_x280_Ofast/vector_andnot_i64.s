	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zfh1p0_zfhmin1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfh1p0_zvfhmin1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl512b1p0_zvl64b1p0"
	.file	"vector_andnot_i64.c"
	.text
	.globl	vector_andnot_i64               # -- Begin function vector_andnot_i64
	.p2align	1
	.type	vector_andnot_i64,@function
vector_andnot_i64:                      # @vector_andnot_i64
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a2, .LBB0_7
# %bb.1:                                # %for.body.preheader
	csrr	a3, vlenb
	zext.w	a7, a2
	sh3add	t1, a7, a0
	li	a4, 16
	srli	a5, a3, 2
	maxu	a4, a5, a4
	bltu	a7, a4, .LBB0_4
# %bb.2:                                # %vector.memcheck
	sh3add	a4, a7, a1
	bgeu	a0, a4, .LBB0_8
# %bb.3:                                # %vector.memcheck
	bgeu	a1, t1, .LBB0_8
.LBB0_4:
	li	a6, 0
.LBB0_5:                                # %for.body.preheader14
	sh3add	a0, a6, a0
	sh3add	a1, a6, a1
.LBB0_6:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	ld	a2, 0(a0)
	ld	a3, 0(a1)
	addi	a1, a1, 8
	andn	a2, a2, a3
	sd	a2, 0(a0)
	addi	a0, a0, 8
	bne	a0, t1, .LBB0_6
.LBB0_7:                                # %for.cond.cleanup
	ret
.LBB0_8:                                # %vector.ph
	srli	a3, a3, 3
	vsetvli	a2, zero, e64, m2, ta, ma
	slli	a4, a3, 1
	neg	a4, a4
	and	a6, a4, a7
	sub	a4, a6, a5
	divu	a4, a4, a5
	mv	a5, a0
	slli	a4, a4, 4
	addi	a4, a4, 16
	mul	t0, a4, a3
	slli	a4, a3, 4
	add	t0, t0, a1
	mv	a3, a1
.LBB0_9:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vl2re64.v	v8, (a3)
	add	a3, a3, a4
	vnot.v	v8, v8
	vl2re64.v	v10, (a5)
	vand.vv	v8, v10, v8
	vs2r.v	v8, (a5)
	add	a5, a5, a4
	bne	a3, t0, .LBB0_9
# %bb.10:                               # %middle.block
	beq	a6, a7, .LBB0_7
	j	.LBB0_5
.Lfunc_end0:
	.size	vector_andnot_i64, .Lfunc_end0-vector_andnot_i64
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
