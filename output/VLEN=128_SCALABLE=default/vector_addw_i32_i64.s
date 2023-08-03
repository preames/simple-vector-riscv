	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_addw_i32_i64.c"
	.globl	test                            # -- Begin function test
	.p2align	1
	.type	test,@function
test:                                   # @test
# %bb.0:                                # %entry
	blez	a3, .LBB0_8
# %bb.1:                                # %for.body.preheader
	csrr	t1, vlenb
	srli	a7, t1, 2
	bgeu	a3, a7, .LBB0_3
# %bb.2:
	li	a6, 0
	j	.LBB0_6
.LBB0_3:                                # %vector.ph
	srli	a4, t1, 3
	slli	a5, a4, 1
	slli	a4, a4, 32
	sub	a4, a4, a5
	and	a6, a4, a3
	slli	t0, t1, 1
	mv	t2, a6
	mv	a5, a0
	mv	t3, a2
	mv	t4, a1
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vl1re32.v	v8, (t4)
	vl1re32.v	v9, (t3)
	vsetvli	a4, zero, e32, m1, ta, ma
	vl2re64.v	v10, (a5)
	vwadd.vv	v12, v9, v8
	vsetvli	zero, zero, e64, m2, ta, ma
	vadd.vv	v8, v12, v10
	vs2r.v	v8, (a5)
	add	t4, t4, t1
	add	t3, t3, t1
	sub	t2, t2, a7
	add	a5, a5, t0
	bnez	t2, .LBB0_4
# %bb.5:                                # %middle.block
	beq	a6, a3, .LBB0_8
.LBB0_6:                                # %for.body.preheader15
	sh3add	a0, a6, a0
	sh2add	a2, a6, a2
	sh2add	a1, a6, a1
	sub	a3, a3, a6
.LBB0_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lw	a6, 0(a1)
	lw	a5, 0(a2)
	ld	a4, 0(a0)
	add	a5, a5, a6
	add	a4, a4, a5
	sd	a4, 0(a0)
	addi	a0, a0, 8
	addi	a2, a2, 4
	addi	a3, a3, -1
	addi	a1, a1, 4
	bnez	a3, .LBB0_7
.LBB0_8:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	test, .Lfunc_end0-test
                                        # -- End function
	.ident	"clang version 18.0.0 (https://github.com/llvm/llvm-project.git 660b740e4b3c4b23dfba36940ae0fe2ad41bfedf)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
