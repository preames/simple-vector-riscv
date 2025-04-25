	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zfh1p0_zfhmin1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfh1p0_zvfhmin1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl512b1p0_zvl64b1p0"
	.file	"sparsevec_init_i32.c"
	.text
	.globl	sparsevec_init_i32              # -- Begin function sparsevec_init_i32
	.p2align	1
	.type	sparsevec_init_i32,@function
sparsevec_init_i32:                     # @sparsevec_init_i32
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a0, .LBB0_8
# %bb.1:                                # %for.body.preheader
	csrr	a3, vlenb
	zext.w	a6, a0
	srli	a7, a3, 1
	bgeu	a6, a7, .LBB0_3
# %bb.2:
	li	a0, 0
	j	.LBB0_6
.LBB0_3:                                # %vector.ph
	srli	a3, a3, 3
	slli	a0, a3, 2
	neg	a0, a0
	and	a0, a0, a6
	sub	a4, a0, a7
	divu	a4, a4, a7
	slli	a4, a4, 3
	addi	a5, a4, 8
	vsetvli	a4, zero, e32, m2, ta, ma
	vid.v	v8
	slli	a4, a3, 3
	mul	a3, a5, a3
	mv	a5, a2
	add	a3, a3, a2
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vl1re16.v	v10, (a5)
	vsetvli	zero, zero, e64, m4, ta, ma
	add	a5, a5, a4
	vsext.vf4	v12, v10
	vsll.vi	v12, v12, 2
	vsetvli	zero, zero, e32, m2, ta, ma
	vsoxei64.v	v8, (a1), v12
	vadd.vx	v8, v8, a7
	bne	a5, a3, .LBB0_4
# %bb.5:                                # %middle.block
	beq	a0, a6, .LBB0_8
.LBB0_6:                                # %for.body.preheader8
	sh1add	a3, a0, a2
	sh1add	a2, a6, a2
.LBB0_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lh	a4, 0(a3)
	addi	a3, a3, 2
	sh2add	a4, a4, a1
	sw	a0, 0(a4)
	addi	a0, a0, 1
	bne	a3, a2, .LBB0_7
.LBB0_8:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	sparsevec_init_i32, .Lfunc_end0-sparsevec_init_i32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
