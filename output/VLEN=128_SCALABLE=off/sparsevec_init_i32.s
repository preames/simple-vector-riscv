	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"sparsevec_init_i32.c"
	.globl	sparsevec_init_i32              # -- Begin function sparsevec_init_i32
	.p2align	1
	.type	sparsevec_init_i32,@function
sparsevec_init_i32:                     # @sparsevec_init_i32
# %bb.0:                                # %entry
	beqz	a0, .LBB0_8
# %bb.1:                                # %for.body.preheader
	li	a7, 16
	zext.w	a6, a0
	bgeu	a0, a7, .LBB0_3
# %bb.2:
	li	a0, 0
	j	.LBB0_6
.LBB0_3:                                # %vector.ph
	andi	a0, a6, -16
	vsetivli	zero, 8, e32, m2, ta, ma
	vid.v	v8
	mv	a5, a0
	mv	a3, a2
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	addi	a4, a3, 16
	vle16.v	v10, (a3)
	vle16.v	v11, (a4)
	vadd.vi	v12, v8, 8
	vsetvli	zero, zero, e64, m4, ta, ma
	vsext.vf4	v16, v10
	vsext.vf4	v20, v11
	vsll.vi	v16, v16, 2
	vsll.vi	v20, v20, 2
	vsetvli	zero, zero, e32, m2, ta, ma
	vsoxei64.v	v8, (a1), v16
	vsoxei64.v	v12, (a1), v20
	vadd.vx	v8, v8, a7
	addi	a5, a5, -16
	addi	a3, a3, 32
	bnez	a5, .LBB0_4
# %bb.5:                                # %middle.block
	beq	a0, a6, .LBB0_8
.LBB0_6:                                # %for.body.preheader10
	sh1add	a2, a0, a2
	sub	a3, a6, a0
.LBB0_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lh	a4, 0(a2)
	sh2add	a4, a4, a1
	sw	a0, 0(a4)
	addiw	a0, a0, 1
	addi	a3, a3, -1
	addi	a2, a2, 2
	bnez	a3, .LBB0_7
.LBB0_8:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	sparsevec_init_i32, .Lfunc_end0-sparsevec_init_i32
                                        # -- End function
	.ident	"clang version 18.0.0 (https://github.com/llvm/llvm-project.git 660b740e4b3c4b23dfba36940ae0fe2ad41bfedf)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
