	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl1024b1p0_zvl128b1p0_zvl2048b1p0_zvl256b1p0_zvl32b1p0_zvl4096b1p0_zvl512b1p0_zvl64b1p0"
	.file	"vector_init_i32.c"
	.globl	vector_init_i32
	.p2align	1
	.type	vector_init_i32,@function
vector_init_i32:
	beqz	a1, .LBB0_8
	zext.w	a7, a1
	csrr	t1, vlenb
	srli	t0, t1, 1
	bgeu	a7, t0, .LBB0_3
	li	a4, 0
	j	.LBB0_6
.LBB0_3:
	addi	a1, t0, -1
	and	a6, a7, a1
	sub	a4, a7, a6
	vsetvli	a1, zero, e32, m1, ta, ma
	vid.v	v8
	srli	a5, t1, 2
	slli	t2, t1, 1
	mv	a1, a4
	mv	a3, a0
.LBB0_4:
	vadd.vx	v9, v8, a5
	vs1r.v	v8, (a3)
	add	a2, a3, t1
	vs1r.v	v9, (a2)
	vadd.vx	v8, v9, a5
	sub	a1, a1, t0
	add	a3, a3, t2
	bnez	a1, .LBB0_4
	beqz	a6, .LBB0_8
.LBB0_6:
	sh2add	a0, a4, a0
	sub	a1, a7, a4
.LBB0_7:
	sw	a4, 0(a0)
	addiw	a4, a4, 1
	addi	a1, a1, -1
	addi	a0, a0, 4
	bnez	a1, .LBB0_7
.LBB0_8:
	ret
.Lfunc_end0:
	.size	vector_init_i32, .Lfunc_end0-vector_init_i32

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 9472a810ed33bc9e655484f43047eed07d50bc16)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
