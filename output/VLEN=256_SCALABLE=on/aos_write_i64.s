	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"aos_write_i64.c"
	.globl	aos_init_i64                    # -- Begin function aos_init_i64
	.p2align	1
	.type	aos_init_i64,@function
aos_init_i64:                           # @aos_init_i64
# %bb.0:                                # %entry
	beqz	a0, .LBB0_8
# %bb.1:                                # %for.body.preheader
	zext.w	t0, a0
	csrr	a0, vlenb
	srli	a3, a0, 2
	bgeu	t0, a3, .LBB0_3
# %bb.2:
	li	a7, 0
	j	.LBB0_6
.LBB0_3:                                # %vector.ph
	addi	a2, a3, -1
	and	a6, t0, a2
	sub	a7, t0, a6
	addi	a5, a1, 48
	li	a2, 14
	mul	a4, a0, a2
	vsetvli	a0, zero, e64, m2, ta, ma
	vmv.v.i	v8, 0
	li	a2, 56
	mv	a0, a7
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vsse64.v	v8, (a5), a2
	sub	a0, a0, a3
	add	a5, a5, a4
	bnez	a0, .LBB0_4
# %bb.5:                                # %middle.block
	beqz	a6, .LBB0_8
.LBB0_6:                                # %for.body.preheader5
	li	a0, 56
	mul	a0, a7, a0
	add	a0, a0, a1
	addi	a1, a0, 48
	sub	a0, t0, a7
.LBB0_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	sd	zero, 0(a1)
	addi	a0, a0, -1
	addi	a1, a1, 56
	bnez	a0, .LBB0_7
.LBB0_8:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	aos_init_i64, .Lfunc_end0-aos_init_i64
                                        # -- End function
	.ident	"clang version 17.0.0 (https://github.com/llvm/llvm-project.git e2d7d988115c1b67b0175be5d6bc95153945b5be)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
