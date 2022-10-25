	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl1024b1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl512b1p0_zvl64b1p0"
	.file	"memset_i8.c"
	.globl	my_memset
	.p2align	1
	.type	my_memset,@function
my_memset:
	beqz	a1, .LBB0_2
	zext.w	a3, a1
	mv	a1, a2
	mv	a2, a3
	tail	memset@plt
.LBB0_2:
	ret
.Lfunc_end0:
	.size	my_memset, .Lfunc_end0-my_memset

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 6d859266803e2a9060c4e8770f92cc2c7bd05a3b)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
