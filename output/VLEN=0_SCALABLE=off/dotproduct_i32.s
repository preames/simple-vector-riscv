	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"dotproduct_i32.c"
	.globl	dotproduct_i32
	.p2align	1
	.type	dotproduct_i32,@function
dotproduct_i32:
	beqz	a0, .LBB0_3
	mv	a3, a0
	li	a0, 0
	zext.w	a3, a3
.LBB0_2:
	lw	a4, 0(a1)
	lw	a5, 0(a2)
	mulw	a4, a5, a4
	addw	a0, a0, a4
	addi	a1, a1, 4
	addi	a3, a3, -1
	addi	a2, a2, 4
	bnez	a3, .LBB0_2
.LBB0_3:
	ret
.Lfunc_end0:
	.size	dotproduct_i32, .Lfunc_end0-dotproduct_i32

	.ident	"clang version 15.0.0 (https://github.com/llvm/llvm-project.git dde2a7fb6da46da2b2f765fa569d8fddb4270eb6)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
