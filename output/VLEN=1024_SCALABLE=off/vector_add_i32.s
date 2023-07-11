	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_add_i32.c"
	.globl	vector_add_i32                  # -- Begin function vector_add_i32
	.p2align	1
	.type	vector_add_i32,@function
vector_add_i32:                         # @vector_add_i32
# %bb.0:                                # %entry
	beqz	a1, .LBB0_8
# %bb.1:                                # %for.body.preheader
	li	a4, 16
	zext.w	a6, a1
	bgeu	a1, a4, .LBB0_3
# %bb.2:
	li	a1, 0
	j	.LBB0_6
.LBB0_3:                                # %vector.ph
	andi	a1, a6, -16
	vsetivli	zero, 8, e32, m2, ta, ma
	mv	a4, a1
	mv	a5, a0
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	addi	a3, a5, 32
	vle32.v	v8, (a5)
	vle32.v	v10, (a3)
	vadd.vx	v8, v8, a2
	vadd.vx	v10, v10, a2
	vse32.v	v8, (a5)
	vse32.v	v10, (a3)
	addi	a4, a4, -16
	addi	a5, a5, 64
	bnez	a4, .LBB0_4
# %bb.5:                                # %middle.block
	beq	a1, a6, .LBB0_8
.LBB0_6:                                # %for.body.preheader8
	sh2add	a0, a1, a0
	sub	a3, a6, a1
.LBB0_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lw	a1, 0(a0)
	add	a1, a1, a2
	sw	a1, 0(a0)
	addi	a3, a3, -1
	addi	a0, a0, 4
	bnez	a3, .LBB0_7
.LBB0_8:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	vector_add_i32, .Lfunc_end0-vector_add_i32
                                        # -- End function
	.ident	"clang version 17.0.0 (https://github.com/llvm/llvm-project.git e2d7d988115c1b67b0175be5d6bc95153945b5be)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
