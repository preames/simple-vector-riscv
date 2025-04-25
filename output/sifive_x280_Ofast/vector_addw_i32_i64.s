	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zfh1p0_zfhmin1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfh1p0_zvfhmin1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl512b1p0_zvl64b1p0"
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
	srli	t1, a5, 3
	mv	t2, a1
	slli	a6, t1, 1
	slli	a5, t1, 31
	sub	a5, a5, a6
	slli	a7, t1, 4
	and	a6, a5, a3
	mv	t3, a2
	sub	a5, a6, a4
	divu	a4, a5, a4
	mv	a5, a0
	slli	a4, a4, 4
	addi	a4, a4, 16
	mul	t0, a4, t1
	slli	t1, t1, 3
	add	t0, t0, a0
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vl1re32.v	v10, (t2)
	vsetvli	a4, zero, e32, m1, ta, ma
	add	t2, t2, t1
	vl1re32.v	v11, (t3)
	add	t3, t3, t1
	vwadd.vv	v8, v11, v10
	vsetvli	zero, zero, e64, m2, ta, ma
	vl2re64.v	v10, (a5)
	vadd.vv	v8, v8, v10
	vs2r.v	v8, (a5)
	add	a5, a5, a7
	bne	a5, t0, .LBB0_4
# %bb.5:                                # %middle.block
	beq	a6, a3, .LBB0_8
.LBB0_6:                                # %for.body.preheader15
	sh3add	a4, a6, a0
	sh2add	a2, a6, a2
	sh2add	a1, a6, a1
	sh3add	a0, a3, a0
.LBB0_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lw	a3, 0(a1)
	addi	a1, a1, 4
	lw	a5, 0(a2)
	addi	a2, a2, 4
	add	a3, a3, a5
	ld	a5, 0(a4)
	add	a3, a3, a5
	sd	a3, 0(a4)
	addi	a4, a4, 8
	bne	a4, a0, .LBB0_7
.LBB0_8:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	test, .Lfunc_end0-test
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
