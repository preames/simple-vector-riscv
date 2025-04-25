	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zfh1p0_zfhmin1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfh1p0_zvfhmin1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl512b1p0_zvl64b1p0"
	.file	"dotproduct_i32.c"
	.text
	.globl	dotproduct_i32                  # -- Begin function dotproduct_i32
	.p2align	1
	.type	dotproduct_i32,@function
dotproduct_i32:                         # @dotproduct_i32
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a0, .LBB0_8
# %bb.1:                                # %for.body.preheader
	csrr	a3, vlenb
	zext.w	a6, a0
	srli	a0, a3, 1
	bgeu	a6, a0, .LBB0_3
# %bb.2:
	li	a7, 0
	li	a0, 0
	j	.LBB0_6
.LBB0_3:                                # %vector.ph
	srli	a3, a3, 3
	slli	a4, a3, 2
	neg	a4, a4
	and	a7, a4, a6
	sub	a4, a7, a0
	divu	a0, a4, a0
	vsetvli	a4, zero, e32, m2, ta, ma
	vmv.v.i	v8, 0
	slli	a4, a3, 4
	slli	a0, a0, 4
	addi	a0, a0, 16
	mul	a5, a0, a3
	mv	a0, a1
	add	a5, a5, a2
	mv	a3, a2
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vl2re32.v	v10, (a0)
	add	a0, a0, a4
	vl2re32.v	v12, (a3)
	add	a3, a3, a4
	vmacc.vv	v8, v12, v10
	bne	a3, a5, .LBB0_4
# %bb.5:                                # %middle.block
	vmv.s.x	v10, zero
	vredsum.vs	v8, v8, v10
	vmv.x.s	a0, v8
	beq	a7, a6, .LBB0_8
.LBB0_6:                                # %for.body.preheader11
	sh2add	a5, a7, a1
	sh2add	a2, a7, a2
	sh2add	a1, a6, a1
.LBB0_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lw	a3, 0(a5)
	addi	a5, a5, 4
	lw	a4, 0(a2)
	addi	a2, a2, 4
	mul	a3, a4, a3
	addw	a0, a0, a3
	bne	a5, a1, .LBB0_7
.LBB0_8:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	dotproduct_i32, .Lfunc_end0-dotproduct_i32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
