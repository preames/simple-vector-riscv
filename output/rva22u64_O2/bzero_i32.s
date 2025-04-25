	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicsr2p0_zihintpause2p0_zihpm2p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zfhmin1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0"
	.file	"bzero_i32.c"
	.text
	.globl	my_bzero                        # -- Begin function my_bzero
	.p2align	1
	.type	my_bzero,@function
my_bzero:                               # @my_bzero
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a1, .LBB0_2
# %bb.1:                                # %for.body.preheader
	slli.uw	a2, a1, 2
	li	a1, 0
	tail	memset
.LBB0_2:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	my_bzero, .Lfunc_end0-my_bzero
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
