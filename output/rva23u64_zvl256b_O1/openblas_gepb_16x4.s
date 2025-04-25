	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zihintntl1p0_zihintpause2p0_zihpm2p0_zimop1p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zawrs1p0_zfa1p0_zfhmin1p0_zca1p0_zcb1p0_zcd1p0_zcmop1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0_zvbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfhmin1p0_zvkb1p0_zvkt1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0_supm1p0"
	.file	"openblas_gepb_16x4.c"
	.text
	.globl	test                            # -- Begin function test
	.p2align	1
	.type	test,@function
test:                                   # @test
	.cfi_startproc
# %bb.0:                                # %entry
	li	t0, 0
	li	a6, 4
	mv	a7, a2
.LBB0_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
	sh2add	a3, t0, a1
	flw	fa5, 0(a3)
	slli	a3, t0, 6
	add	a3, a3, a2
	addi	a4, a3, 64
	mv	a5, a0
	mv	a3, a7
.LBB0_2:                                # %for.body4
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa4, 0(a5)
	flw	fa3, 0(a3)
	fmadd.s	fa4, fa4, fa5, fa3
	fsw	fa4, 0(a3)
	addi	a3, a3, 4
	addi	a5, a5, 4
	bne	a3, a4, .LBB0_2
# %bb.3:                                # %for.cond.cleanup3
                                        #   in Loop: Header=BB0_1 Depth=1
	addi	t0, t0, 1
	addi	a7, a7, 64
	bne	t0, a6, .LBB0_1
# %bb.4:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	test, .Lfunc_end0-test
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
