	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zifencei2p0_zihintpause2p0_zihpm2p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zfh1p0_zfhmin1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zbc1p0_zbkc1p0_zbs1p0_zkt1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfh1p0_zvfhmin1p0_zvkt1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0_ssccptr1p0_sscofpmf1p0_sscounterenw1p0_sstc1p0_sstvala1p0_sstvecd1p0_svade1p0_svbare1p0_svinval1p0_svnapot1p0_svpbmt1p0"
	.file	"strcmp.c"
	.text
	.globl	my_strcmp                       # -- Begin function my_strcmp
	.p2align	1
	.type	my_strcmp,@function
my_strcmp:                              # @my_strcmp
	.cfi_startproc
# %bb.0:                                # %entry
	lbu	a2, 0(a0)
	lbu	a3, 0(a1)
	bne	a2, a3, .LBB0_4
# %bb.1:                                # %if.end.preheader
	addi	a1, a1, 1
	addi	a0, a0, 1
.LBB0_2:                                # %if.end
                                        # =>This Inner Loop Header: Depth=1
	beqz	a2, .LBB0_5
# %bb.3:                                # %if.end11
                                        #   in Loop: Header=BB0_2 Depth=1
	lbu	a2, 0(a0)
	lbu	a3, 0(a1)
	addi	a1, a1, 1
	addi	a0, a0, 1
	beq	a2, a3, .LBB0_2
.LBB0_4:                                # %if.then
	sltu	a0, a2, a3
	neg	a0, a0
	ori	a0, a0, 1
	ret
.LBB0_5:
	li	a0, 0
	ret
.Lfunc_end0:
	.size	my_strcmp, .Lfunc_end0-my_strcmp
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
