	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"memcpy_i8.c"
	.globl	my_memcpy                       # -- Begin function my_memcpy
	.p2align	1
	.type	my_memcpy,@function
my_memcpy:                              # @my_memcpy
# %bb.0:                                # %entry
	beqz	a0, .LBB0_8
# %bb.1:                                # %for.body.preheader
	sub	a3, a1, a2
	minu	a3, a0, a3
	li	a4, 64
	zext.w	a6, a0
	bgeu	a3, a4, .LBB0_3
# %bb.2:
	li	a7, 0
	j	.LBB0_6
.LBB0_3:                                # %vector.ph
	andi	a7, a6, -64
	mv	a5, a7
	mv	a0, a1
	mv	a3, a2
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vsetvli	zero, a4, e8, m4, ta, ma
	vle8.v	v8, (a3)
	vse8.v	v8, (a0)
	addi	a3, a3, 64
	addi	a5, a5, -64
	addi	a0, a0, 64
	bnez	a5, .LBB0_4
# %bb.5:                                # %middle.block
	beq	a7, a6, .LBB0_8
.LBB0_6:                                # %for.body.preheader11
	add	a2, a2, a7
	add	a1, a1, a7
	sub	a0, a6, a7
.LBB0_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lbu	a3, 0(a2)
	sb	a3, 0(a1)
	addi	a2, a2, 1
	addi	a0, a0, -1
	addi	a1, a1, 1
	bnez	a0, .LBB0_7
.LBB0_8:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	my_memcpy, .Lfunc_end0-my_memcpy
                                        # -- End function
	.ident	"clang version 17.0.0 (https://github.com/llvm/llvm-project.git e2d7d988115c1b67b0175be5d6bc95153945b5be)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
