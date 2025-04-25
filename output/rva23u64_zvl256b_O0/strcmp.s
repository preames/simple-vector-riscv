	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zihintntl1p0_zihintpause2p0_zihpm2p0_zimop1p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zawrs1p0_zfa1p0_zfhmin1p0_zca1p0_zcb1p0_zcd1p0_zcmop1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0_zvbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfhmin1p0_zvkb1p0_zvkt1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0_supm1p0"
	.file	"strcmp.c"
	.text
	.globl	my_strcmp                       # -- Begin function my_strcmp
	.p2align	1
	.type	my_strcmp,@function
my_strcmp:                              # @my_strcmp
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -48
	.cfi_def_cfa_offset 48
	sd	ra, 40(sp)                      # 8-byte Folded Spill
	sd	s0, 32(sp)                      # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	addi	s0, sp, 48
	.cfi_def_cfa s0, 0
	sd	a0, -32(s0)
	sd	a1, -40(s0)
	j	.LBB0_1
.LBB0_1:                                # %while.body
                                        # =>This Inner Loop Header: Depth=1
	ld	a0, -32(s0)
	lbu	a0, 0(a0)
	ld	a1, -40(s0)
	lbu	a1, 0(a1)
	beq	a0, a1, .LBB0_3
	j	.LBB0_2
.LBB0_2:                                # %if.then
	ld	a0, -32(s0)
	lbu	a0, 0(a0)
	ld	a1, -40(s0)
	lbu	a1, 0(a1)
	slt	a1, a0, a1
	li	a0, 0
	subw	a0, a0, a1
	ori	a0, a0, 1
	sw	a0, -20(s0)
	j	.LBB0_6
.LBB0_3:                                # %if.end
                                        #   in Loop: Header=BB0_1 Depth=1
	ld	a0, -32(s0)
	lbu	a0, 0(a0)
	bnez	a0, .LBB0_5
	j	.LBB0_4
.LBB0_4:                                # %if.then10
	li	a0, 0
	sw	a0, -20(s0)
	j	.LBB0_6
.LBB0_5:                                # %if.end11
                                        #   in Loop: Header=BB0_1 Depth=1
	ld	a0, -32(s0)
	addi	a0, a0, 1
	sd	a0, -32(s0)
	ld	a0, -40(s0)
	addi	a0, a0, 1
	sd	a0, -40(s0)
	j	.LBB0_1
.LBB0_6:                                # %return
	lw	a0, -20(s0)
	addi	sp, s0, -48
	.cfi_def_cfa sp, 48
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 48
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end0:
	.size	my_strcmp, .Lfunc_end0-my_strcmp
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
