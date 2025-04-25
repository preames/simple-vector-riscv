	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zfh1p0_zfhmin1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfh1p0_zvfhmin1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl512b1p0_zvl64b1p0"
	.file	"sparsevec_reduce_add_i32.c"
	.text
	.globl	sparsevec_reduce_add_i32        # -- Begin function sparsevec_reduce_add_i32
	.p2align	1
	.type	sparsevec_reduce_add_i32,@function
sparsevec_reduce_add_i32:               # @sparsevec_reduce_add_i32
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a0, .LBB0_8
# %bb.1:                                # %for.body.preheader
	csrr	a4, vlenb
	zext.w	a3, a0
	srli	a0, a4, 1
	bgeu	a3, a0, .LBB0_3
# %bb.2:
	li	a6, 0
	li	a0, 0
	j	.LBB0_6
.LBB0_3:                                # %vector.ph
	srli	a5, a4, 3
	slli	a4, a5, 2
	neg	a4, a4
	and	a6, a4, a3
	sub	a4, a6, a0
	divu	a0, a4, a0
	slli	a4, a5, 3
	slli	a0, a0, 3
	addi	a0, a0, 8
	mul	a5, a0, a5
	vsetvli	a0, zero, e32, m2, ta, ma
	vmv.v.i	v8, 0
	add	a5, a5, a2
	mv	a0, a2
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vl1re16.v	v10, (a0)
	vsetvli	zero, zero, e64, m4, ta, ma
	add	a0, a0, a4
	vsext.vf4	v12, v10
	vsll.vi	v12, v12, 2
	vsetvli	zero, zero, e32, m2, ta, ma
	vluxei64.v	v10, (a1), v12
	vadd.vv	v8, v10, v8
	bne	a0, a5, .LBB0_4
# %bb.5:                                # %middle.block
	vmv.s.x	v10, zero
	vredsum.vs	v8, v8, v10
	vmv.x.s	a0, v8
	beq	a6, a3, .LBB0_8
.LBB0_6:                                # %for.body.preheader9
	sh1add	a4, a6, a2
	sh1add	a2, a3, a2
.LBB0_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lh	a3, 0(a4)
	addi	a4, a4, 2
	sh2add	a3, a3, a1
	lw	a3, 0(a3)
	addw	a0, a0, a3
	bne	a4, a2, .LBB0_7
.LBB0_8:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	sparsevec_reduce_add_i32, .Lfunc_end0-sparsevec_reduce_add_i32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
