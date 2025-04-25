	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zihintntl1p0_zihintpause2p0_zihpm2p0_zimop1p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zawrs1p0_zfa1p0_zfhmin1p0_zca1p0_zcb1p0_zcd1p0_zcmop1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0_zvbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfhmin1p0_zvkb1p0_zvkt1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0_supm1p0"
	.file	"vector_init_i32.c"
	.text
	.globl	vector_init_i32                 # -- Begin function vector_init_i32
	.p2align	1
	.type	vector_init_i32,@function
vector_init_i32:                        # @vector_init_i32
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a1, .LBB0_8
# %bb.1:                                # %for.body.preheader
	zext.w	a6, a1
	csrr	a1, vlenb
	srli	a3, a1, 1
	bgeu	a6, a3, .LBB0_3
# %bb.2:
	li	a1, 0
	j	.LBB0_6
.LBB0_3:                                # %vector.ph
	srli	a4, a1, 3
	slli	a1, a4, 2
	neg	a1, a1
	and	a1, a1, a6
	sub	a2, a1, a3
	divu	a5, a2, a3
	vsetvli	a2, zero, e32, m2, ta, ma
	vid.v	v8
	slli	a2, a4, 4
	slli	a5, a5, 4
	addi	a5, a5, 16
	mul	a4, a4, a5
	add	a5, a0, a4
	mv	a4, a0
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vs2r.v	v8, (a4)
	add	a4, a4, a2
	vadd.vx	v8, v8, a3
	bne	a4, a5, .LBB0_4
# %bb.5:                                # %middle.block
	beq	a1, a6, .LBB0_8
.LBB0_6:                                # %for.body.preheader6
	sh2add	a3, a1, a0
	sh2add	a0, a6, a0
.LBB0_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	sw	a1, 0(a3)
	addi	a3, a3, 4
	addi	a1, a1, 1
	bne	a3, a0, .LBB0_7
.LBB0_8:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	vector_init_i32, .Lfunc_end0-vector_init_i32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
