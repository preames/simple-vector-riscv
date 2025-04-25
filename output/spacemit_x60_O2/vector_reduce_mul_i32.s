	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zifencei2p0_zihintpause2p0_zihpm2p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zfh1p0_zfhmin1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zbc1p0_zbkc1p0_zbs1p0_zkt1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfh1p0_zvfhmin1p0_zvkt1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0_ssccptr1p0_sscofpmf1p0_sscounterenw1p0_sstc1p0_sstvala1p0_sstvecd1p0_svade1p0_svbare1p0_svinval1p0_svnapot1p0_svpbmt1p0"
	.file	"vector_reduce_mul_i32.c"
	.text
	.globl	vector_reduce_mul_i32           # -- Begin function vector_reduce_mul_i32
	.p2align	1
	.type	vector_reduce_mul_i32,@function
vector_reduce_mul_i32:                  # @vector_reduce_mul_i32
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a1, .LBB0_3
# %bb.1:                                # %for.body.preheader
	li	a3, 32
	zext.w	a2, a1
	bgeu	a1, a3, .LBB0_4
# %bb.2:
	li	a3, 0
	li	a1, 1
	j	.LBB0_7
.LBB0_3:
	li	a0, 1
	ret
.LBB0_4:                                # %vector.ph
	andi	a3, a2, -32
	addi	a1, a3, -32
	sh2add	a1, a1, a0
	vsetivli	zero, 16, e32, m2, ta, ma
	vmv.v.i	v8, 1
	addi	a1, a1, 128
	mv	a4, a0
	vmv.v.i	v10, 1
.LBB0_5:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vle32.v	v12, (a4)
	addi	a5, a4, 64
	vle32.v	v14, (a5)
	vmul.vv	v8, v12, v8
	addi	a4, a4, 128
	vmul.vv	v10, v14, v10
	bne	a4, a1, .LBB0_5
# %bb.6:                                # %middle.block
	vmul.vv	v8, v10, v8
	vslidedown.vi	v10, v8, 8
	vmul.vv	v8, v8, v10
	vslidedown.vi	v10, v8, 4
	vmul.vv	v8, v8, v10
	vslidedown.vi	v10, v8, 2
	vmul.vv	v8, v8, v10
	vrgather.vi	v10, v8, 1
	vmul.vv	v8, v8, v10
	vmv.x.s	a1, v8
	beq	a3, a2, .LBB0_9
.LBB0_7:                                # %for.body.preheader9
	sh2add	a3, a3, a0
	sh2add	a0, a2, a0
.LBB0_8:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lw	a2, 0(a3)
	addi	a3, a3, 4
	mulw	a1, a2, a1
	bne	a3, a0, .LBB0_8
.LBB0_9:                                # %for.cond.cleanup
	mv	a0, a1
	ret
.Lfunc_end0:
	.size	vector_reduce_mul_i32, .Lfunc_end0-vector_reduce_mul_i32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
