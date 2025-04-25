	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zihintntl1p0_zihintpause2p0_zihpm2p0_zimop1p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zawrs1p0_zfa1p0_zfhmin1p0_zca1p0_zcb1p0_zcd1p0_zcmop1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0_zvbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfhmin1p0_zvkb1p0_zvkt1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0_supm1p0"
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
	csrr	a6, vlenb
	srli	a5, a6, 1
	li	a3, 16
	maxu	a3, a5, a3
	sh2add	t0, a0, a2
	bltu	a0, a3, .LBB0_4
# %bb.2:                                # %vector.memcheck
	sh2add	a3, a0, a1
	bgeu	a2, a3, .LBB0_8
# %bb.3:                                # %vector.memcheck
	bgeu	a1, t0, .LBB0_8
.LBB0_4:
	li	a7, 0
.LBB0_5:                                # %for.body.preheader12
	sh2add	a0, a7, a2
	sh2add	a1, a7, a1
.LBB0_6:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	flw	fa5, 0(a1)
	flw	fa4, 0(a0)
	fmadd.s	fa5, fa0, fa5, fa4
	fsw	fa5, 0(a0)
	addi	a0, a0, 4
	addi	a1, a1, 4
	bne	a0, t0, .LBB0_6
.LBB0_7:                                # %for.end
	ret
.LBB0_8:                                # %vector.ph
	neg	a3, a5
	and	a7, a0, a3
	sub	a3, a7, a5
	divu	a4, a3, a5
	srli	a5, a6, 3
	slli	t1, a5, 4
	slli	a4, a4, 4
	addi	a4, a4, 16
	mul	a4, a4, a5
	add	a6, a2, a4
	mv	a5, a1
	mv	a4, a2
	vsetvli	a3, zero, e32, m2, ta, ma
.LBB0_9:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vl2re32.v	v8, (a5)
	vl2re32.v	v10, (a4)
	vfmacc.vf	v10, fa0, v8
	vs2r.v	v10, (a4)
	add	a4, a4, t1
	add	a5, a5, t1
	bne	a4, a6, .LBB0_9
# %bb.10:                               # %middle.block
	beq	a0, a7, .LBB0_7
	j	.LBB0_5
.Lfunc_end0:
	.size	saxpy, .Lfunc_end0-saxpy
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
