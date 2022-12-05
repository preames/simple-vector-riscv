	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl1024b1p0_zvl128b1p0_zvl2048b1p0_zvl256b1p0_zvl32b1p0_zvl4096b1p0_zvl512b1p0_zvl64b1p0"
	.file	"vector_reduce_add_i32.c"
	.globl	vector_reduce_add_i32
	.p2align	1
	.type	vector_reduce_add_i32,@function
vector_reduce_add_i32:
	beqz	a1, .LBB0_8
	li	a3, 256
	zext.w	a2, a1
	bgeu	a1, a3, .LBB0_3
	li	a3, 0
	li	a1, 0
	j	.LBB0_6
.LBB0_3:
	andi	a3, a2, -256
	li	a1, 128
	vsetvli	zero, a1, e32, m1, ta, ma
	vmv.v.i	v8, 0
	mv	a1, a3
	mv	a4, a0
	vmv.v.i	v9, 0
.LBB0_4:
	addi	a5, a4, 512
	vle32.v	v10, (a4)
	vle32.v	v11, (a5)
	vadd.vv	v8, v10, v8
	vadd.vv	v9, v11, v9
	addi	a1, a1, -256
	addi	a4, a4, 1024
	bnez	a1, .LBB0_4
	li	a1, 128
	vsetvli	zero, a1, e32, m1, ta, ma
	vadd.vv	v8, v9, v8
	vsetivli	zero, 1, e32, m1, ta, ma
	vmv.s.x	v9, zero
	vsetvli	zero, a1, e32, m1, ta, ma
	vredsum.vs	v8, v8, v9
	vmv.x.s	a1, v8
	beq	a3, a2, .LBB0_8
.LBB0_6:
	sh2add	a0, a3, a0
	sub	a2, a2, a3
.LBB0_7:
	lw	a3, 0(a0)
	addw	a1, a1, a3
	addi	a2, a2, -1
	addi	a0, a0, 4
	bnez	a2, .LBB0_7
.LBB0_8:
	mv	a0, a1
	ret
.Lfunc_end0:
	.size	vector_reduce_add_i32, .Lfunc_end0-vector_reduce_add_i32

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git b77533306876fc807e58e355d95d848a0077131f)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
