	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zbs1p0_zve32x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_reduce_add_i8.c"
	.text
	.globl	vector_reduce_add_i32           # -- Begin function vector_reduce_add_i32
	.p2align	1
	.type	vector_reduce_add_i32,@function
vector_reduce_add_i32:                  # @vector_reduce_add_i32
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a1, .LBB0_8
# %bb.1:                                # %for.body.preheader
	zext.w	a2, a1
	csrr	a3, vlenb
	srli	a1, a3, 1
	bgeu	a2, a1, .LBB0_3
# %bb.2:
	li	a3, 0
	li	a1, 0
	j	.LBB0_6
.LBB0_3:                                # %vector.ph
	srli	a4, a3, 3
	slli	a3, a4, 2
	neg	a3, a3
	and	a3, a3, a2
	sub	a5, a3, a1
	divu	a5, a5, a1
	slli	a5, a5, 2
	addi	a5, a5, 4
	mul	a4, a5, a4
	add	a4, a4, a0
	vsetvli	a5, zero, e32, m2, ta, ma
	vmv.v.i	v8, 0
	mv	a5, a0
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vsetvli	zero, zero, e16, m1, ta, ma
	vle8.v	v10, (a5)
	add	a5, a5, a1
	vzext.vf2	v11, v10
	vwaddu.wv	v8, v8, v11
	bne	a5, a4, .LBB0_4
# %bb.5:                                # %middle.block
	vsetvli	zero, zero, e32, m2, ta, ma
	vmv.s.x	v10, zero
	vredsum.vs	v8, v8, v10
	vmv.x.s	a1, v8
	beq	a3, a2, .LBB0_8
.LBB0_6:                                # %for.body.preheader7
	add	a3, a3, a0
	add	a0, a0, a2
.LBB0_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lbu	a2, 0(a3)
	addi	a3, a3, 1
	addw	a1, a1, a2
	bne	a3, a0, .LBB0_7
.LBB0_8:                                # %for.cond.cleanup
	mv	a0, a1
	ret
.Lfunc_end0:
	.size	vector_reduce_add_i32, .Lfunc_end0-vector_reduce_add_i32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
