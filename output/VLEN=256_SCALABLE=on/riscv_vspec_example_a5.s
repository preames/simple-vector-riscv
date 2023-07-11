	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"riscv_vspec_example_a5.c"
	.globl	saxpy                           # -- Begin function saxpy
	.p2align	1
	.type	saxpy,@function
saxpy:                                  # @saxpy
# %bb.0:                                # %entry
	blez	a0, .LBB0_6
# %bb.1:                                # %for.body.preheader
	csrr	a3, vlenb
	srli	t0, a3, 1
	li	a4, 8
	maxu	a4, t0, a4
	bltu	a0, a4, .LBB0_3
# %bb.2:                                # %vector.memcheck
	sh2add	a4, a0, a2
	sh2add	a5, a0, a1
	sltu	a5, a2, a5
	sltu	a4, a1, a4
	and	a4, a4, a5
	beqz	a4, .LBB0_7
.LBB0_3:
	li	a7, 0
.LBB0_4:                                # %for.body.preheader12
	sub	a0, a0, a7
	sh2add	a2, a7, a2
	sh2add	a1, a7, a1
.LBB0_5:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	flw	fa5, 0(a1)
	flw	fa4, 0(a2)
	fmadd.s	fa5, fa0, fa5, fa4
	fsw	fa5, 0(a2)
	addi	a0, a0, -1
	addi	a2, a2, 4
	addi	a1, a1, 4
	bnez	a0, .LBB0_5
.LBB0_6:                                # %for.end
	ret
.LBB0_7:                                # %vector.ph
	addi	a4, t0, -1
	and	a6, a0, a4
	sub	a7, a0, a6
	vsetvli	a4, zero, e32, m2, ta, ma
	vfmv.v.f	v8, fa0
	slli	t1, a3, 1
	mv	a4, a7
	mv	a5, a2
	mv	a3, a1
.LBB0_8:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vl2re32.v	v10, (a3)
	vl2re32.v	v12, (a5)
	vfmacc.vv	v12, v8, v10
	vs2r.v	v12, (a5)
	add	a3, a3, t1
	sub	a4, a4, t0
	add	a5, a5, t1
	bnez	a4, .LBB0_8
# %bb.9:                                # %middle.block
	bnez	a6, .LBB0_4
	j	.LBB0_6
.Lfunc_end0:
	.size	saxpy, .Lfunc_end0-saxpy
                                        # -- End function
	.ident	"clang version 17.0.0 (https://github.com/llvm/llvm-project.git e2d7d988115c1b67b0175be5d6bc95153945b5be)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
