	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zfh1p0_zfhmin1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfh1p0_zvfhmin1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl512b1p0_zvl64b1p0"
	.file	"vector_add_i32_pragma_vf32_uf2.c"
	.text
	.globl	vector_add_i32                  # -- Begin function vector_add_i32
	.p2align	1
	.type	vector_add_i32,@function
vector_add_i32:                         # @vector_add_i32
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a1, .LBB0_8
# %bb.1:                                # %for.body.preheader
	csrr	t3, vlenb
	zext.w	a7, a1
	slli	a1, t3, 3
	bgeu	a7, a1, .LBB0_3
# %bb.2:
	li	a6, 0
	j	.LBB0_6
.LBB0_3:                                # %vector.ph
	neg	a4, a1
	slli	t0, t3, 4
	and	a6, a4, a7
	vsetvli	a5, zero, e32, m8, ta, ma
	sub	a4, a6, a1
	divu	a1, a4, a1
	srli	a4, t3, 3
	slli	t1, a4, 8
	slli	a1, a1, 8
	addi	a1, a1, 256
	mul	a1, a1, a4
	mv	a4, a0
	add	t2, a0, a1
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vl8re32.v	v16, (a4)
	sh3add	a5, t3, a4
	add	a1, a4, t0
	sh3add	a3, t3, a1
	vadd.vx	v24, v16, a2
	vl8re32.v	v8, (a5)
	vadd.vx	v8, v8, a2
	vl8re32.v	v16, (a3)
	vs8r.v	v24, (a4)
	add	a4, a4, t1
	vl8re32.v	v24, (a1)
	vs8r.v	v8, (a5)
	vadd.vx	v8, v24, a2
	vs8r.v	v8, (a1)
	vadd.vx	v8, v16, a2
	vs8r.v	v8, (a3)
	bne	a4, t2, .LBB0_4
# %bb.5:                                # %middle.block
	beq	a6, a7, .LBB0_8
.LBB0_6:                                # %for.body.preheader7
	sh2add	a1, a6, a0
	sh2add	a0, a7, a0
.LBB0_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lw	a3, 0(a1)
	add	a3, a3, a2
	sw	a3, 0(a1)
	addi	a1, a1, 4
	bne	a1, a0, .LBB0_7
.LBB0_8:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	vector_add_i32, .Lfunc_end0-vector_add_i32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
