	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_add_i32_pragma_vf32_uf2.c"
	.globl	vector_add_i32                  # -- Begin function vector_add_i32
	.p2align	1
	.type	vector_add_i32,@function
vector_add_i32:                         # @vector_add_i32
# %bb.0:                                # %entry
	beqz	a1, .LBB0_8
# %bb.1:                                # %for.body.preheader
	li	a3, 64
	zext.w	a6, a1
	bgeu	a1, a3, .LBB0_3
# %bb.2:
	li	a7, 0
	j	.LBB0_6
.LBB0_3:                                # %vector.ph
	andi	a7, a6, -64
	li	a4, 32
	mv	a5, a7
	mv	a3, a0
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	addi	a1, a3, 128
	vsetvli	zero, a4, e32, m8, ta, ma
	vle32.v	v8, (a3)
	vle32.v	v16, (a1)
	vadd.vx	v8, v8, a2
	vadd.vx	v16, v16, a2
	vse32.v	v8, (a3)
	vse32.v	v16, (a1)
	addi	a5, a5, -64
	addi	a3, a3, 256
	bnez	a5, .LBB0_4
# %bb.5:                                # %middle.block
	beq	a7, a6, .LBB0_8
.LBB0_6:                                # %for.body.preheader6
	sh2add	a0, a7, a0
	sub	a1, a6, a7
.LBB0_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lw	a3, 0(a0)
	add	a3, a3, a2
	sw	a3, 0(a0)
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
