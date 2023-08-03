	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_add_i32_pragma_vf32_uf2.c"
	.globl	vector_add_i32                  # -- Begin function vector_add_i32
	.p2align	1
	.type	vector_add_i32,@function
vector_add_i32:                         # @vector_add_i32
# %bb.0:                                # %entry
	beqz	a1, .LBB0_8
# %bb.1:                                # %for.body.preheader
	zext.w	a6, a1
	csrr	t3, vlenb
	slli	t1, t3, 3
	bgeu	a6, t1, .LBB0_3
# %bb.2:
	li	a7, 0
	j	.LBB0_6
.LBB0_3:                                # %vector.ph
	neg	a1, t1
	and	a7, a1, a6
	slli	t0, t3, 5
	slli	t2, t3, 4
	vsetvli	a1, zero, e32, m8, ta, ma
	mv	a1, a7
	mv	a5, a0
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	sh3add	t4, t3, a5
	vl8re32.v	v8, (t4)
	vl8re32.v	v16, (a5)
	add	a4, a5, t2
	sh3add	a3, t3, a4
	vl8re32.v	v24, (a4)
	vl8re32.v	v0, (a3)
	vadd.vx	v16, v16, a2
	vadd.vx	v8, v8, a2
	vadd.vx	v24, v24, a2
	vadd.vx	v0, v0, a2
	vs8r.v	v8, (t4)
	vs8r.v	v16, (a5)
	vs8r.v	v0, (a3)
	vs8r.v	v24, (a4)
	sub	a1, a1, t1
	add	a5, a5, t0
	bnez	a1, .LBB0_4
# %bb.5:                                # %middle.block
	beq	a7, a6, .LBB0_8
.LBB0_6:                                # %for.body.preheader6
	sh2add	a0, a7, a0
	sub	a1, a6, a7
.LBB0_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lw	a3, 0(a0)
	add	a3, a3, a2
	sw	a3, 0(a0)
	addi	a1, a1, -1
	addi	a0, a0, 4
	bnez	a1, .LBB0_7
.LBB0_8:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	vector_add_i32, .Lfunc_end0-vector_add_i32
                                        # -- End function
	.ident	"clang version 18.0.0 (https://github.com/llvm/llvm-project.git 660b740e4b3c4b23dfba36940ae0fe2ad41bfedf)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
