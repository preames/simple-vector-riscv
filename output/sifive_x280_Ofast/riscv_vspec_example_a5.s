	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zfh1p0_zfhmin1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfh1p0_zvfhmin1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl512b1p0_zvl64b1p0"
	.file	"riscv_vspec_example_a5.c"
	.text
	.globl	saxpy                           # -- Begin function saxpy
	.p2align	1
	.type	saxpy,@function
saxpy:                                  # @saxpy
	.cfi_startproc
# %bb.0:                                # %entry
	blez	a0, .LBB0_7
# %bb.1:                                # %for.body.preheader
	csrr	a5, vlenb
	li	a3, 32
	sh2add	t0, a0, a2
	srli	a4, a5, 1
	maxu	a3, a4, a3
	bltu	a0, a3, .LBB0_4
# %bb.2:                                # %vector.memcheck
	sh2add	a3, a0, a1
	bgeu	a2, a3, .LBB0_8
# %bb.3:                                # %vector.memcheck
	bgeu	a1, t0, .LBB0_8
.LBB0_4:
	li	a6, 0
.LBB0_5:                                # %for.body.preheader12
	sh2add	a0, a6, a2
	sh2add	a1, a6, a1
.LBB0_6:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	flw	fa5, 0(a1)
	addi	a1, a1, 4
	flw	fa4, 0(a0)
	fmadd.s	fa5, fa5, fa0, fa4
	fsw	fa5, 0(a0)
	addi	a0, a0, 4
	bne	a0, t0, .LBB0_6
.LBB0_7:                                # %for.end
	ret
.LBB0_8:                                # %vector.ph
	neg	a3, a4
	srli	a5, a5, 3
	and	a6, a0, a3
	slli	t1, a5, 4
	sub	a3, a6, a4
	divu	a3, a3, a4
	mv	a4, a2
	slli	a3, a3, 4
	addi	a3, a3, 16
	mul	a7, a3, a5
	mv	a5, a1
	add	a7, a7, a2
	vsetvli	a3, zero, e32, m2, ta, ma
.LBB0_9:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vl2re32.v	v8, (a5)
	add	a5, a5, t1
	vl2re32.v	v10, (a4)
	vfmacc.vf	v10, fa0, v8
	vs2r.v	v10, (a4)
	add	a4, a4, t1
	bne	a4, a7, .LBB0_9
# %bb.10:                               # %middle.block
	beq	a0, a6, .LBB0_7
	j	.LBB0_5
.Lfunc_end0:
	.size	saxpy, .Lfunc_end0-saxpy
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
