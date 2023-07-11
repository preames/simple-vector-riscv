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
	li	a4, 8
	bgeu	a3, a4, .LBB0_3
# %bb.2:
	li	a6, 0
	j	.LBB0_6
.LBB0_3:                                # %vector.ph
	andi	a6, a3, -8
	mv	a7, a6
	mv	a4, a0
	mv	t0, a2
	mv	t3, a1
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	addi	t1, a4, 32
	addi	t2, t0, 16
	vsetivli	zero, 4, e32, m1, ta, ma
	vle32.v	v8, (t3)
	vle32.v	v9, (t0)
	addi	a5, t3, 16
	vle32.v	v10, (a5)
	vle32.v	v11, (t2)
	vwadd.vv	v12, v9, v8
	vle64.v	v8, (a4)
	vle64.v	v14, (t1)
	vwadd.vv	v16, v11, v10
	vsetvli	zero, zero, e64, m2, ta, ma
	vadd.vv	v8, v12, v8
	vadd.vv	v10, v16, v14
	vse64.v	v8, (a4)
	vse64.v	v10, (t1)
	addi	t3, t3, 32
	addi	t0, t0, 32
	addi	a7, a7, -8
	addi	a4, a4, 64
	bnez	a7, .LBB0_4
# %bb.5:                                # %middle.block
	beq	a6, a3, .LBB0_8
.LBB0_6:                                # %for.body.preheader18
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
	.ident	"clang version 17.0.0 (https://github.com/llvm/llvm-project.git e2d7d988115c1b67b0175be5d6bc95153945b5be)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
