	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicsr2p0_zihintpause2p0_zihpm2p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zfhmin1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0"
	.file	"vector_splat_ptr.c"
	.text
	.globl	vector_splat_ptr                # -- Begin function vector_splat_ptr
	.p2align	1
	.type	vector_splat_ptr,@function
vector_splat_ptr:                       # @vector_splat_ptr
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a2, .LBB0_3
# %bb.1:                                # %for.body.preheader
	sh3add.uw	a2, a2, a0
.LBB0_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	sd	a1, 0(a0)
	addi	a0, a0, 8
	bne	a0, a2, .LBB0_2
.LBB0_3:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	vector_splat_ptr, .Lfunc_end0-vector_splat_ptr
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
