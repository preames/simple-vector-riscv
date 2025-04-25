	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zihintntl1p0_zihintpause2p0_zihpm2p0_zimop1p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zawrs1p0_zfa1p0_zfhmin1p0_zca1p0_zcb1p0_zcd1p0_zcmop1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0_zvbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfhmin1p0_zvkb1p0_zvkt1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl512b1p0_zvl64b1p0_supm1p0"
	.file	"riscv_vspec_example_a2.c"
	.text
	.globl	example_a2                      # -- Begin function example_a2
	.p2align	1
	.type	example_a2,@function
example_a2:                             # @example_a2
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a3, .LBB0_6
# %bb.1:                                # %for.body.preheader
	add.uw	a3, a3, a0
	li	a4, 4
	j	.LBB0_4
.LBB0_2:                                # %cond.true
                                        #   in Loop: Header=BB0_4 Depth=1
	lbu	a5, 0(a2)
.LBB0_3:                                # %cond.end
                                        #   in Loop: Header=BB0_4 Depth=1
	sb	a5, 0(a1)
	addi	a0, a0, 1
	addi	a2, a2, 1
	addi	a1, a1, 1
	beq	a0, a3, .LBB0_6
.LBB0_4:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lbu	a5, 0(a0)
	bgeu	a4, a5, .LBB0_2
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	li	a5, 1
	j	.LBB0_3
.LBB0_6:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	example_a2, .Lfunc_end0-example_a2
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
