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
	zext.w	a6, a1
	csrr	a1, vlenb
	srli	a3, a1, 1
	bgeu	a6, a3, .LBB0_3
# %bb.2:
	li	a2, 0
	j	.LBB0_6
.LBB0_3:                                # %vector.ph
	srli	a2, a1, 3
	slli	a2, a2, 2
	neg	a2, a2
	and	a2, a2, a6
	slli	a1, a1, 1
	vsetvli	a4, zero, e32, m2, ta, ma
	mv	a5, a2
	mv	a4, a0
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vl2re32.v	v8, (a4)
	vfadd.vf	v8, v8, fa0
	vs2r.v	v8, (a4)
	sub	a5, a5, a3
	add	a4, a4, a1
	bnez	a5, .LBB0_4
# %bb.5:                                # %middle.block
	beq	a2, a6, .LBB0_8
.LBB0_6:                                # %for.body.preheader5
	sh2add	a0, a2, a0
	sub	a1, a6, a2
.LBB0_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	flw	fa5, 0(a0)
	fadd.s	fa5, fa5, fa0
	fsw	fa5, 0(a0)
	addi	a1, a1, -1
	addi	a0, a0, 4
	bnez	a1, .LBB0_7
.LBB0_8:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	vector_add_i32, .Lfunc_end0-vector_add_i32
                                        # -- End function
	.ident	"clang version 18.0.0 (https://github.com/llvm/llvm-project.git 660b740e4b3c4b23dfba36940ae0fe2ad41bfedf)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
