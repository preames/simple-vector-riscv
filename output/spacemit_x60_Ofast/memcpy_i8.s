	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zifencei2p0_zihintpause2p0_zihpm2p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zfh1p0_zfhmin1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zbc1p0_zbkc1p0_zbs1p0_zkt1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfh1p0_zvfhmin1p0_zvkt1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0_ssccptr1p0_sscofpmf1p0_sscounterenw1p0_sstc1p0_sstvala1p0_sstvecd1p0_svade1p0_svbare1p0_svinval1p0_svnapot1p0_svpbmt1p0"
	.file	"memcpy_i8.c"
	.text
	.globl	my_memcpy                       # -- Begin function my_memcpy
	.p2align	1
	.type	my_memcpy,@function
my_memcpy:                              # @my_memcpy
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a0, .LBB0_6
# %bb.1:                                # %for.body.preheader
	zext.w	a6, a0
	csrr	a3, vlenb
	slli	a4, a3, 1
	li	a0, 64
	maxu	a0, a4, a0
	bltu	a6, a0, .LBB0_3
# %bb.2:                                # %vector.memcheck
	sub	a0, a1, a2
	bgeu	a0, a4, .LBB0_7
.LBB0_3:
	li	a7, 0
.LBB0_4:                                # %for.body.preheader10
	add	a3, a2, a7
	add	a1, a1, a7
	add	a0, a2, a6
.LBB0_5:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lbu	a2, 0(a3)
	addi	a3, a3, 1
	sb	a2, 0(a1)
	addi	a1, a1, 1
	bne	a3, a0, .LBB0_5
.LBB0_6:                                # %for.cond.cleanup
	ret
.LBB0_7:                                # %vector.ph
	neg	a0, a4
	and	a7, a0, a6
	sub	a0, a7, a4
	divu	a0, a0, a4
	srli	a3, a3, 3
	slli	a0, a0, 4
	addi	a0, a0, 16
	mul	a0, a0, a3
	add	a0, a0, a1
	mv	a3, a2
	mv	a5, a1
.LBB0_8:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vl2r.v	v8, (a3)
	vs2r.v	v8, (a5)
	add	a5, a5, a4
	add	a3, a3, a4
	bne	a5, a0, .LBB0_8
# %bb.9:                                # %middle.block
	beq	a7, a6, .LBB0_6
	j	.LBB0_4
.Lfunc_end0:
	.size	my_memcpy, .Lfunc_end0-my_memcpy
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
