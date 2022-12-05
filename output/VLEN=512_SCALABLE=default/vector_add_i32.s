	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl512b1p0_zvl64b1p0"
	.file	"vector_add_i32.c"
	.globl	vector_add_i32
	.p2align	1
	.type	vector_add_i32,@function
vector_add_i32:
	beqz	a1, .LBB0_8
	zext.w	t0, a1
	csrr	t1, vlenb
	srli	t2, t1, 1
	bgeu	t0, t2, .LBB0_3
	li	a7, 0
	j	.LBB0_6
.LBB0_3:
	addi	a1, t2, -1
	and	a6, t0, a1
	sub	a7, t0, a6
	slli	a3, t1, 1
	vsetvli	a1, zero, e32, m1, ta, ma
	mv	a1, a7
	mv	a4, a0
.LBB0_4:
	vl1re32.v	v8, (a4)
	add	a5, a4, t1
	vl1re32.v	v9, (a5)
	vadd.vx	v8, v8, a2
	vadd.vx	v9, v9, a2
	vs1r.v	v8, (a4)
	vs1r.v	v9, (a5)
	sub	a1, a1, t2
	add	a4, a4, a3
	bnez	a1, .LBB0_4
	beqz	a6, .LBB0_8
.LBB0_6:
	sh2add	a0, a7, a0
	sub	a1, t0, a7
.LBB0_7:
	lw	a3, 0(a0)
	addw	a3, a3, a2
	sw	a3, 0(a0)
	addi	a1, a1, -1
	addi	a0, a0, 4
	bnez	a1, .LBB0_7
.LBB0_8:
	ret
.Lfunc_end0:
	.size	vector_add_i32, .Lfunc_end0-vector_add_i32

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git b77533306876fc807e58e355d95d848a0077131f)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
