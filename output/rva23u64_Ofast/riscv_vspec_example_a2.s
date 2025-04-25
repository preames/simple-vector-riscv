	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zihintntl1p0_zihintpause2p0_zihpm2p0_zimop1p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zawrs1p0_zfa1p0_zfhmin1p0_zca1p0_zcb1p0_zcd1p0_zcmop1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0_zvbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfhmin1p0_zvkb1p0_zvkt1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0_supm1p0"
	.file	"riscv_vspec_example_a2.c"
	.text
	.globl	example_a2                      # -- Begin function example_a2
	.p2align	1
	.type	example_a2,@function
example_a2:                             # @example_a2
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a3, .LBB0_12
# %bb.1:                                # %for.body.preheader
	zext.w	a6, a3
	csrr	a4, vlenb
	slli	t1, a4, 1
	li	a3, 32
	maxu	a3, t1, a3
	bgeu	a6, a3, .LBB0_7
# %bb.2:
	li	a7, 0
.LBB0_3:                                # %for.body.preheader19
	add	a5, a0, a7
	add	a2, a2, a7
	add	a1, a1, a7
	add	a0, a0, a6
	li	a3, 4
	j	.LBB0_5
.LBB0_4:                                # %cond.true
                                        #   in Loop: Header=BB0_5 Depth=1
	lbu	a4, 0(a2)
	sb	a4, 0(a1)
	addi	a5, a5, 1
	addi	a2, a2, 1
	addi	a1, a1, 1
	beq	a5, a0, .LBB0_12
.LBB0_5:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lbu	a4, 0(a5)
	bgeu	a3, a4, .LBB0_4
# %bb.6:                                #   in Loop: Header=BB0_5 Depth=1
	li	a4, 1
	sb	a4, 0(a1)
	addi	a5, a5, 1
	addi	a2, a2, 1
	addi	a1, a1, 1
	bne	a5, a0, .LBB0_5
	j	.LBB0_12
.LBB0_7:                                # %vector.memcheck
	sub	a3, a1, a0
	li	a7, 0
	bltu	a3, t1, .LBB0_3
# %bb.8:                                # %vector.memcheck
	sub	a3, a1, a2
	bltu	a3, t1, .LBB0_3
# %bb.9:                                # %vector.ph
	neg	a3, t1
	and	a7, a3, a6
	sub	a3, a7, t1
	divu	a3, a3, t1
	srli	a4, a4, 3
	slli	a3, a3, 4
	addi	a3, a3, 16
	mul	a3, a3, a4
	add	t0, a1, a3
	vsetvli	a3, zero, e8, m2, ta, ma
	vmv.v.i	v8, 1
	mv	a5, a0
	mv	a4, a2
	mv	a3, a1
.LBB0_10:                               # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vl2r.v	v10, (a5)
	vsetvli	zero, zero, e8, m2, ta, mu
	vmsleu.vi	v0, v10, 4
	vmv2r.v	v10, v8
	vle8.v	v10, (a4), v0.t
	vs2r.v	v10, (a3)
	add	a3, a3, t1
	add	a4, a4, t1
	add	a5, a5, t1
	bne	a3, t0, .LBB0_10
# %bb.11:                               # %middle.block
	bne	a7, a6, .LBB0_3
.LBB0_12:                               # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	example_a2, .Lfunc_end0-example_a2
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
