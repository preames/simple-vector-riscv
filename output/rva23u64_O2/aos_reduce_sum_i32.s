	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zihintntl1p0_zihintpause2p0_zihpm2p0_zimop1p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zawrs1p0_zfa1p0_zfhmin1p0_zca1p0_zcb1p0_zcd1p0_zcmop1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0_zvbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfhmin1p0_zvkb1p0_zvkt1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0_supm1p0"
	.file	"aos_reduce_sum_i32.c"
	.text
	.globl	aos_reduce_sum_i32              # -- Begin function aos_reduce_sum_i32
	.p2align	1
	.type	aos_reduce_sum_i32,@function
aos_reduce_sum_i32:                     # @aos_reduce_sum_i32
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a0, .LBB0_8
# %bb.1:                                # %for.body.preheader
	zext.w	a6, a0
	csrr	a2, vlenb
	srli	a0, a2, 1
	bgeu	a6, a0, .LBB0_3
# %bb.2:
	li	a7, 0
	li	a0, 0
	j	.LBB0_6
.LBB0_3:                                # %vector.ph
	srli	a2, a2, 3
	addi	a4, a1, 48
	slli	a3, a2, 2
	slli	a5, a2, 5
	slli	a2, a2, 8
	neg	a3, a3
	sub	a5, a2, a5
	and	a7, a3, a6
	vsetvli	a2, zero, e32, m2, ta, ma
	vmv.v.i	v8, 0
	li	a2, 56
	mv	a3, a7
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vlse32.v	v10, (a4), a2
	sub	a3, a3, a0
	vadd.vv	v8, v10, v8
	add	a4, a4, a5
	bnez	a3, .LBB0_4
# %bb.5:                                # %middle.block
	vmv.s.x	v10, zero
	vredsum.vs	v8, v8, v10
	vmv.x.s	a0, v8
	beq	a7, a6, .LBB0_8
.LBB0_6:                                # %for.body.preheader7
	slli	a2, a7, 3
	slli	a7, a7, 6
	sub	a2, a7, a2
	slli	a3, a6, 3
	slli	a6, a6, 6
	sub	a3, a6, a3
	add	a2, a2, a1
	add	a3, a3, a1
	addi	a1, a2, 48
	addi	a2, a3, 48
.LBB0_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lw	a3, 0(a1)
	addi	a1, a1, 56
	addw	a0, a0, a3
	bne	a1, a2, .LBB0_7
.LBB0_8:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	aos_reduce_sum_i32, .Lfunc_end0-aos_reduce_sum_i32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
