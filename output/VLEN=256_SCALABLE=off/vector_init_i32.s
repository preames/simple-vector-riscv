	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_init_i32.c"
	.globl	vector_init_i32
	.p2align	1
	.type	vector_init_i32,@function
vector_init_i32:
	beqz	a1, .LBB0_8
	li	a3, 16
	zext.w	a6, a1
	bgeu	a1, a3, .LBB0_3
	li	a1, 0
	j	.LBB0_6
.LBB0_3:
	vsetivli	zero, 8, e32, m1, ta, ma
	andi	a1, a6, -16
	vid.v	v8
	mv	a4, a1
	mv	a5, a0
.LBB0_4:
	addi	a2, a5, 32
	vadd.vi	v9, v8, 8
	vse32.v	v8, (a5)
	vse32.v	v9, (a2)
	vadd.vx	v8, v8, a3
	addi	a4, a4, -16
	addi	a5, a5, 64
	bnez	a4, .LBB0_4
	beq	a1, a6, .LBB0_8
.LBB0_6:
	sh2add	a0, a1, a0
	sub	a2, a6, a1
.LBB0_7:
	sw	a1, 0(a0)
	addiw	a1, a1, 1
	addi	a2, a2, -1
	addi	a0, a0, 4
	bnez	a2, .LBB0_7
.LBB0_8:
	ret
.Lfunc_end0:
	.size	vector_init_i32, .Lfunc_end0-vector_init_i32

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git b77533306876fc807e58e355d95d848a0077131f)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
