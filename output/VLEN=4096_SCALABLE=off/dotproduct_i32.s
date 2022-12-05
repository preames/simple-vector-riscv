	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl1024b1p0_zvl128b1p0_zvl2048b1p0_zvl256b1p0_zvl32b1p0_zvl4096b1p0_zvl512b1p0_zvl64b1p0"
	.file	"dotproduct_i32.c"
	.globl	dotproduct_i32
	.p2align	1
	.type	dotproduct_i32,@function
dotproduct_i32:
	beqz	a0, .LBB0_8
	li	a3, 256
	zext.w	a6, a0
	bgeu	a0, a3, .LBB0_3
	li	a7, 0
	li	a0, 0
	j	.LBB0_6
.LBB0_3:
	andi	a7, a6, -256
	li	a0, 128
	vsetvli	zero, a0, e32, m1, ta, ma
	vmv.v.i	v8, 0
	mv	a0, a7
	mv	a5, a2
	mv	a3, a1
	vmv.v.i	v9, 0
.LBB0_4:
	addi	t0, a5, 512
	addi	a4, a3, 512
	vle32.v	v10, (a3)
	vle32.v	v11, (a4)
	vle32.v	v12, (a5)
	vle32.v	v13, (t0)
	vmacc.vv	v8, v12, v10
	vmacc.vv	v9, v13, v11
	addi	a3, a3, 1024
	addi	a0, a0, -256
	addi	a5, a5, 1024
	bnez	a0, .LBB0_4
	li	a0, 128
	vsetvli	zero, a0, e32, m1, ta, ma
	vadd.vv	v8, v9, v8
	vsetivli	zero, 1, e32, m1, ta, ma
	vmv.s.x	v9, zero
	vsetvli	zero, a0, e32, m1, ta, ma
	vredsum.vs	v8, v8, v9
	vmv.x.s	a0, v8
	beq	a7, a6, .LBB0_8
.LBB0_6:
	sh2add	a1, a7, a1
	sh2add	a2, a7, a2
	sub	a3, a6, a7
.LBB0_7:
	lw	a4, 0(a1)
	lw	a5, 0(a2)
	mulw	a4, a5, a4
	addw	a0, a0, a4
	addi	a1, a1, 4
	addi	a3, a3, -1
	addi	a2, a2, 4
	bnez	a3, .LBB0_7
.LBB0_8:
	ret
.Lfunc_end0:
	.size	dotproduct_i32, .Lfunc_end0-dotproduct_i32

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git b77533306876fc807e58e355d95d848a0077131f)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
