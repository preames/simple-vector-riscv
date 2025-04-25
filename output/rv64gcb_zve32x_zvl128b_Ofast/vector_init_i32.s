	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zbs1p0_zve32x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
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
	li	a3, 16
	zext.w	a6, a1
	bgeu	a1, a3, .LBB0_3
# %bb.2:
	li	a1, 0
	j	.LBB0_6
.LBB0_3:                                # %vector.ph
	andi	a1, a6, -16
	addi	a4, a1, -16
	sh2add	a4, a4, a0
	addi	a4, a4, 64
	vsetivli	zero, 8, e32, m2, ta, ma
	vid.v	v8
	mv	a5, a0
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	addi	a2, a5, 32
	vadd.vi	v10, v8, 8
	vse32.v	v8, (a5)
	addi	a5, a5, 64
	vse32.v	v10, (a2)
	vadd.vx	v8, v8, a3
	bne	a5, a4, .LBB0_4
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
