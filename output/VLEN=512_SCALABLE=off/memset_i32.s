	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"memset_i32.c"
	.globl	my_memset
	.p2align	1
	.type	my_memset,@function
my_memset:
	beqz	a1, .LBB0_14
	li	a4, 8
	zext.w	a7, a1
	bgeu	a1, a4, .LBB0_3
	li	a1, 0
	j	.LBB0_12
.LBB0_3:
	li	a4, -32
	li	a5, 32
	zext.w	a6, a4
	bgeu	a1, a5, .LBB0_5
	li	a1, 0
	j	.LBB0_9
.LBB0_5:
	and	a1, a7, a6
	vsetivli	zero, 16, e32, m1, ta, mu
	vmv.v.x	v8, a2
	mv	a5, a1
	mv	a4, a0
.LBB0_6:
	addi	a3, a4, 64
	vse32.v	v8, (a4)
	vse32.v	v8, (a3)
	addi	a5, a5, -32
	addi	a4, a4, 128
	bnez	a5, .LBB0_6
	beq	a1, a7, .LBB0_14
	andi	a3, a7, 24
	beqz	a3, .LBB0_12
.LBB0_9:
	mv	a3, a1
	addi	a1, a6, 24
	and	a1, a7, a1
	vsetivli	zero, 8, e32, mf2, ta, mu
	vmv.v.x	v8, a2
	sh2add	a4, a3, a0
	sub	a5, a3, a1
.LBB0_10:
	vse32.v	v8, (a4)
	addi	a5, a5, 8
	addi	a4, a4, 32
	bnez	a5, .LBB0_10
	beq	a1, a7, .LBB0_14
.LBB0_12:
	sh2add	a0, a1, a0
	sub	a1, a7, a1
.LBB0_13:
	sw	a2, 0(a0)
	addi	a1, a1, -1
	addi	a0, a0, 4
	bnez	a1, .LBB0_13
.LBB0_14:
	ret
.Lfunc_end0:
	.size	my_memset, .Lfunc_end0-my_memset

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 954c1ed009d423ca9593ee63479a9394a23864fd)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
