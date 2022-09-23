	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"aos_write_i32.c"
	.globl	aos_init_i32
	.p2align	1
	.type	aos_init_i32,@function
aos_init_i32:
	beqz	a0, .LBB0_8
	li	a4, 32
	zext.w	a2, a0
	bgeu	a0, a4, .LBB0_3
	li	a0, 0
	j	.LBB0_6
.LBB0_3:
	andi	a0, a2, -32
	addi	a3, a1, 48
	vsetvli	zero, a4, e32, m1, ta, mu
	vmv.v.i	v8, 0
	li	a4, 56
	mv	a5, a0
.LBB0_4:
	vsse32.v	v8, (a3), a4
	addi	a5, a5, -32
	addi	a3, a3, 1792
	bnez	a5, .LBB0_4
	beq	a0, a2, .LBB0_8
.LBB0_6:
	li	a3, 56
	mul	a3, a0, a3
	add	a1, a1, a3
	addi	a1, a1, 48
	sub	a0, a2, a0
.LBB0_7:
	sw	zero, 0(a1)
	addi	a0, a0, -1
	addi	a1, a1, 56
	bnez	a0, .LBB0_7
.LBB0_8:
	ret
.Lfunc_end0:
	.size	aos_init_i32, .Lfunc_end0-aos_init_i32

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 954c1ed009d423ca9593ee63479a9394a23864fd)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
