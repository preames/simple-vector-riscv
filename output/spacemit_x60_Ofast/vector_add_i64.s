	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zifencei2p0_zihintpause2p0_zihpm2p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zfh1p0_zfhmin1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zbc1p0_zbkc1p0_zbs1p0_zkt1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfh1p0_zvfhmin1p0_zvkt1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0_ssccptr1p0_sscofpmf1p0_sscounterenw1p0_sstc1p0_sstvala1p0_sstvecd1p0_svade1p0_svbare1p0_svinval1p0_svnapot1p0_svpbmt1p0"
	.file	"vector_add_i64.c"
	.text
	.globl	vector_add_i64                  # -- Begin function vector_add_i64
	.p2align	1
	.type	vector_add_i64,@function
vector_add_i64:                         # @vector_add_i64
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a1, .LBB0_8
# %bb.1:                                # %for.body.preheader
	zext.w	a7, a1
	csrr	a4, vlenb
	srli	a3, a4, 2
	bgeu	a7, a3, .LBB0_3
# %bb.2:
	li	a6, 0
	j	.LBB0_6
.LBB0_3:                                # %vector.ph
	srli	a4, a4, 3
	slli	a5, a4, 1
	neg	a5, a5
	and	a6, a5, a7
	sub	a5, a6, a3
	divu	a5, a5, a3
	slli	a3, a4, 4
	slli	a5, a5, 4
	addi	a5, a5, 16
	mul	a5, a5, a4
	add	a5, a5, a0
	mv	a4, a0
	vsetvli	a1, zero, e64, m2, ta, ma
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vl2re64.v	v8, (a4)
	vadd.vx	v8, v8, a2
	vs2r.v	v8, (a4)
	add	a4, a4, a3
	bne	a4, a5, .LBB0_4
# %bb.5:                                # %middle.block
	beq	a6, a7, .LBB0_8
.LBB0_6:                                # %for.body.preheader5
	sh3add	a3, a6, a0
	sh3add	a0, a7, a0
.LBB0_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	ld	a1, 0(a3)
	add	a1, a1, a2
	sd	a1, 0(a3)
	addi	a3, a3, 8
	bne	a3, a0, .LBB0_7
.LBB0_8:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	vector_add_i64, .Lfunc_end0-vector_add_i64
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
