	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zifencei2p0_zihintpause2p0_zihpm2p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zfh1p0_zfhmin1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zbc1p0_zbkc1p0_zbs1p0_zkt1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfh1p0_zvfhmin1p0_zvkt1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0_ssccptr1p0_sscofpmf1p0_sscounterenw1p0_sstc1p0_sstvala1p0_sstvecd1p0_svade1p0_svbare1p0_svinval1p0_svnapot1p0_svpbmt1p0"
	.file	"sparsevec_reduce_add_i32.c"
	.text
	.globl	sparsevec_reduce_add_i32        # -- Begin function sparsevec_reduce_add_i32
	.p2align	1
	.type	sparsevec_reduce_add_i32,@function
sparsevec_reduce_add_i32:               # @sparsevec_reduce_add_i32
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a0, .LBB0_8
# %bb.1:                                # %for.body.preheader
	zext.w	a3, a0
	csrr	a4, vlenb
	srli	a0, a4, 1
	bgeu	a3, a0, .LBB0_3
# %bb.2:
	li	a6, 0
	li	a0, 0
	j	.LBB0_6
.LBB0_3:                                # %vector.ph
	srli	a5, a4, 3
	slli	a4, a5, 2
	neg	a4, a4
	and	a6, a4, a3
	sub	a4, a6, a0
	divu	a0, a4, a0
	slli	a4, a5, 3
	slli	a0, a0, 3
	addi	a0, a0, 8
	mul	a5, a0, a5
	add	a5, a5, a2
	vsetvli	a0, zero, e32, m2, ta, ma
	vmv.v.i	v8, 0
	mv	a0, a2
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vl1re16.v	v10, (a0)
	vsetvli	zero, zero, e64, m4, ta, ma
	vsext.vf4	v12, v10
	vsll.vi	v12, v12, 2
	vsetvli	zero, zero, e32, m2, ta, ma
	vluxei64.v	v10, (a1), v12
	add	a0, a0, a4
	vadd.vv	v8, v10, v8
	bne	a0, a5, .LBB0_4
# %bb.5:                                # %middle.block
	vmv.s.x	v10, zero
	vredsum.vs	v8, v8, v10
	vmv.x.s	a0, v8
	beq	a6, a3, .LBB0_8
.LBB0_6:                                # %for.body.preheader9
	sh1add	a4, a6, a2
	sh1add	a2, a3, a2
.LBB0_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lh	a3, 0(a4)
	sh2add	a3, a3, a1
	lw	a3, 0(a3)
	addi	a4, a4, 2
	addw	a0, a0, a3
	bne	a4, a2, .LBB0_7
.LBB0_8:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	sparsevec_reduce_add_i32, .Lfunc_end0-sparsevec_reduce_add_i32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
