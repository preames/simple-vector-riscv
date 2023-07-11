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
	zext.w	a7, a0
	csrr	t0, vlenb
	srli	a5, t0, 1
	bgeu	a7, a5, .LBB0_3
# %bb.2:
	li	a3, 0
	j	.LBB0_6
.LBB0_3:                                # %vector.ph
	addi	a0, a5, -1
	and	a6, a7, a0
	sub	a3, a7, a6
	vsetvli	a0, zero, e32, m2, ta, ma
	vid.v	v8
	mv	a0, a3
	mv	a4, a2
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vl1re16.v	v10, (a4)
	vsetvli	zero, zero, e64, m4, ta, ma
	vsext.vf4	v12, v10
	vsll.vi	v12, v12, 2
	vsetvli	zero, zero, e32, m2, ta, ma
	vsoxei64.v	v8, (a1), v12
	vadd.vx	v8, v8, a5
	sub	a0, a0, a5
	add	a4, a4, t0
	bnez	a0, .LBB0_4
# %bb.5:                                # %middle.block
	beqz	a6, .LBB0_8
.LBB0_6:                                # %for.body.preheader8
	sh1add	a0, a3, a2
	sub	a2, a7, a3
.LBB0_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lh	a4, 0(a0)
	sh2add	a4, a4, a1
	sw	a3, 0(a4)
	addiw	a3, a3, 1
	addi	a2, a2, -1
	addi	a0, a0, 2
	bnez	a2, .LBB0_7
.LBB0_8:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	sparsevec_init_i32, .Lfunc_end0-sparsevec_init_i32
                                        # -- End function
	.ident	"clang version 17.0.0 (https://github.com/llvm/llvm-project.git e2d7d988115c1b67b0175be5d6bc95153945b5be)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
