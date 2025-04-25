	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zihintntl1p0_zihintpause2p0_zihpm2p0_zimop1p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zawrs1p0_zfa1p0_zfhmin1p0_zca1p0_zcb1p0_zcd1p0_zcmop1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0_zvbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfhmin1p0_zvkb1p0_zvkt1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl512b1p0_zvl64b1p0_supm1p0"
	.file	"vector_addw_i32_i64.c"
	.text
	.globl	test                            # -- Begin function test
	.p2align	1
	.type	test,@function
test:                                   # @test
	.cfi_startproc
# %bb.0:                                # %entry
	blez	a3, .LBB0_8
# %bb.1:                                # %for.body.preheader
	csrr	a5, vlenb
	srli	a4, a5, 2
	bgeu	a3, a4, .LBB0_3
# %bb.2:
	li	a6, 0
	j	.LBB0_6
.LBB0_3:                                # %vector.ph
	srli	t0, a5, 3
	slli	a6, t0, 1
	slli	a5, t0, 31
	sub	a5, a5, a6
	and	a6, a5, a3
	sub	a5, a6, a4
	divu	a4, a5, a4
	slli	a7, t0, 4
	slli	t1, t0, 3
	slli	a4, a4, 4
	addi	a4, a4, 16
	mul	t0, a4, t0
	add	t0, t0, a0
	mv	t2, a1
	mv	t3, a2
	mv	a4, a0
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vl1re32.v	v12, (t2)
	vl1re32.v	v13, (t3)
	vl2re64.v	v8, (a4)
	vsetvli	a5, zero, e32, m1, ta, ma
	vwadd.vv	v10, v13, v12
	vsetvli	zero, zero, e64, m2, ta, ma
	vadd.vv	v8, v10, v8
	vs2r.v	v8, (a4)
	add	a4, a4, a7
	add	t3, t3, t1
	add	t2, t2, t1
	bne	a4, t0, .LBB0_4
# %bb.5:                                # %middle.block
	beq	a6, a3, .LBB0_8
.LBB0_6:                                # %for.body.preheader15
	sh3add	a4, a6, a0
	sh2add	a2, a6, a2
	sh2add	a1, a6, a1
	sh3add	a6, a3, a0
.LBB0_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lw	a3, 0(a1)
	lw	a5, 0(a2)
	ld	a0, 0(a4)
	add	a3, a3, a5
	add	a0, a0, a3
	sd	a0, 0(a4)
	addi	a4, a4, 8
	addi	a2, a2, 4
	addi	a1, a1, 4
	bne	a4, a6, .LBB0_7
.LBB0_8:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	test, .Lfunc_end0-test
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
