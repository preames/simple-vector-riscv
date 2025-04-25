	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zfh1p0_zfhmin1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfh1p0_zvfhmin1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl512b1p0_zvl64b1p0"
	.file	"vector_splat_i32.c"
	.text
	.globl	vector_splat_i32                # -- Begin function vector_splat_i32
	.p2align	1
	.type	vector_splat_i32,@function
vector_splat_i32:                       # @vector_splat_i32
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a2, .LBB0_8
# %bb.1:                                # %for.body.preheader
	csrr	a3, vlenb
	zext.w	a2, a2
	srli	a4, a3, 1
	bgeu	a2, a4, .LBB0_3
# %bb.2:
	li	a6, 0
	j	.LBB0_6
.LBB0_3:                                # %vector.ph
	srli	a5, a3, 3
	slli	a3, a5, 2
	neg	a3, a3
	and	a6, a3, a2
	sub	a3, a6, a4
	divu	a3, a3, a4
	slli	a3, a3, 4
	addi	a4, a3, 16
	vsetvli	a3, zero, e32, m2, ta, ma
	vmv.v.x	v8, a1
	slli	a3, a5, 4
	mul	a5, a4, a5
	mv	a4, a0
	add	a5, a5, a0
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vs2r.v	v8, (a4)
	add	a4, a4, a3
	bne	a4, a5, .LBB0_4
# %bb.5:                                # %middle.block
	beq	a6, a2, .LBB0_8
.LBB0_6:                                # %for.body.preheader5
	sh2add	a3, a6, a0
	sh2add	a0, a2, a0
.LBB0_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	sw	a1, 0(a3)
	addi	a3, a3, 4
	bne	a3, a0, .LBB0_7
.LBB0_8:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	vector_splat_i32, .Lfunc_end0-vector_splat_i32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
