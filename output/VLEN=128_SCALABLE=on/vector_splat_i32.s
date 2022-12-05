	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_splat_i32.c"
	.globl	vector_splat_i32
	.p2align	1
	.type	vector_splat_i32,@function
vector_splat_i32:
	beqz	a2, .LBB0_8
	zext.w	t0, a2
	csrr	t1, vlenb
	srli	t2, t1, 1
	bgeu	t0, t2, .LBB0_3
	li	a7, 0
	j	.LBB0_6
.LBB0_3:
	addi	a2, t2, -1
	and	a6, t0, a2
	sub	a7, t0, a6
	vsetvli	a2, zero, e32, m1, ta, ma
	vmv.v.x	v8, a1
	slli	a5, t1, 1
	mv	a2, a7
	mv	a3, a0
.LBB0_4:
	vs1r.v	v8, (a3)
	add	a4, a3, t1
	vs1r.v	v8, (a4)
	sub	a2, a2, t2
	add	a3, a3, a5
	bnez	a2, .LBB0_4
	beqz	a6, .LBB0_8
.LBB0_6:
	sh2add	a0, a7, a0
	sub	a2, t0, a7
.LBB0_7:
	sw	a1, 0(a0)
	addi	a2, a2, -1
	addi	a0, a0, 4
	bnez	a2, .LBB0_7
.LBB0_8:
	ret
.Lfunc_end0:
	.size	vector_splat_i32, .Lfunc_end0-vector_splat_i32

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git b77533306876fc807e58e355d95d848a0077131f)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
