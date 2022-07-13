	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"sparsevec_init_i32.c"
	.globl	sparsevec_init_i32
	.p2align	1
	.type	sparsevec_init_i32,@function
sparsevec_init_i32:
	beqz	a0, .LBB0_3
	li	a3, 0
	zext.w	a0, a0
.LBB0_2:
	lh	a4, 0(a2)
	sh2add	a4, a4, a1
	sw	a3, 0(a4)
	addi	a3, a3, 1
	addi	a2, a2, 2
	bne	a0, a3, .LBB0_2
.LBB0_3:
	ret
.Lfunc_end0:
	.size	sparsevec_init_i32, .Lfunc_end0-sparsevec_init_i32

	.ident	"clang version 15.0.0 (https://github.com/llvm/llvm-project.git dde2a7fb6da46da2b2f765fa569d8fddb4270eb6)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
