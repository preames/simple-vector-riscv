	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_add_fp32.c"
	.globl	vector_add_i32                  # -- Begin function vector_add_i32
	.p2align	1
	.type	vector_add_i32,@function
vector_add_i32:                         # @vector_add_i32
# %bb.0:                                # %entry
	beqz	a1, .LBB0_8
# %bb.1:                                # %for.body.preheader
	li	a3, 16
	zext.w	a2, a1
	bgeu	a1, a3, .LBB0_3
# %bb.2:
	li	a1, 0
	j	.LBB0_6
.LBB0_3:                                # %vector.ph
	andi	a1, a2, -16
	vsetivli	zero, 8, e32, m2, ta, ma
	mv	a3, a1
	mv	a4, a0
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	addi	a5, a4, 32
	vle32.v	v8, (a4)
	vle32.v	v10, (a5)
	vfadd.vf	v8, v8, fa0
	vfadd.vf	v10, v10, fa0
	vse32.v	v8, (a4)
	vse32.v	v10, (a5)
	addi	a3, a3, -16
	addi	a4, a4, 64
	bnez	a3, .LBB0_4
# %bb.5:                                # %middle.block
	beq	a1, a2, .LBB0_8
.LBB0_6:                                # %for.body.preheader6
	sh2add	a0, a1, a0
	sub	a2, a2, a1
.LBB0_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	flw	fa5, 0(a0)
	fadd.s	fa5, fa5, fa0
	fsw	fa5, 0(a0)
	addi	a2, a2, -1
	addi	a0, a0, 4
	bnez	a2, .LBB0_7
.LBB0_8:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	vector_add_i32, .Lfunc_end0-vector_add_i32
                                        # -- End function
	.ident	"clang version 18.0.0 (https://github.com/llvm/llvm-project.git 660b740e4b3c4b23dfba36940ae0fe2ad41bfedf)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
