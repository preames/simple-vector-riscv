	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_splat_i32.c"
	.globl	vector_splat_i32                # -- Begin function vector_splat_i32
	.p2align	1
	.type	vector_splat_i32,@function
vector_splat_i32:                       # @vector_splat_i32
# %bb.0:                                # %entry
	beqz	a2, .LBB0_8
# %bb.1:                                # %for.body.preheader
	li	a4, 16
	zext.w	a6, a2
	bgeu	a2, a4, .LBB0_3
# %bb.2:
	li	a2, 0
	j	.LBB0_6
.LBB0_3:                                # %vector.ph
	andi	a2, a6, -16
	vsetivli	zero, 8, e32, m2, ta, ma
	vmv.v.x	v8, a1
	mv	a4, a2
	mv	a5, a0
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	addi	a3, a5, 32
	vse32.v	v8, (a5)
	vse32.v	v8, (a3)
	addi	a4, a4, -16
	addi	a5, a5, 64
	bnez	a4, .LBB0_4
# %bb.5:                                # %middle.block
	beq	a2, a6, .LBB0_8
.LBB0_6:                                # %for.body.preheader5
	sh2add	a0, a2, a0
	sub	a3, a6, a2
.LBB0_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	sw	a1, 0(a0)
	addi	a3, a3, -1
	addi	a0, a0, 4
	bnez	a3, .LBB0_7
.LBB0_8:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	vector_splat_i32, .Lfunc_end0-vector_splat_i32
                                        # -- End function
	.ident	"clang version 18.0.0 (https://github.com/llvm/llvm-project.git 660b740e4b3c4b23dfba36940ae0fe2ad41bfedf)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
