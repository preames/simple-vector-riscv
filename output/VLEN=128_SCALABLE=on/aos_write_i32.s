	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"aos_write_i32.c"
	.globl	aos_init_i32
	.p2align	1
	.type	aos_init_i32,@function
aos_init_i32:
	beqz	a0, .LBB0_8
	zext.w	t0, a0
	csrr	a0, vlenb
	srli	a3, a0, 1
	bgeu	t0, a3, .LBB0_3
	li	a7, 0
	j	.LBB0_6
.LBB0_3:
	addi	a2, a3, -1
	and	a6, t0, a2
	sub	a7, t0, a6
	vsetvli	a2, zero, e64, m2, ta, ma
	vid.v	v10
	srli	a5, a0, 2
	li	a4, 56
	vsetvli	zero, zero, e32, m1, ta, ma
	vmv.v.i	v8, 0
	addi	a2, a1, 48
	mv	a0, a7
.LBB0_4:
	vsetvli	zero, zero, e64, m2, ta, ma
	vadd.vx	v12, v10, a5
	vmul.vx	v10, v10, a4
	vmul.vx	v14, v12, a4
	vsetvli	zero, zero, e32, m1, ta, ma
	vsoxei64.v	v8, (a2), v10
	vsoxei64.v	v8, (a2), v14
	vsetvli	zero, zero, e64, m2, ta, ma
	sub	a0, a0, a3
	vadd.vx	v10, v12, a5
	bnez	a0, .LBB0_4
	beqz	a6, .LBB0_8
.LBB0_6:
	li	a0, 56
	mul	a0, a7, a0
	add	a0, a0, a1
	addi	a0, a0, 48
	sub	a1, t0, a7
.LBB0_7:
	sw	zero, 0(a0)
	addi	a1, a1, -1
	addi	a0, a0, 56
	bnez	a1, .LBB0_7
.LBB0_8:
	ret
.Lfunc_end0:
	.size	aos_init_i32, .Lfunc_end0-aos_init_i32

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 9472a810ed33bc9e655484f43047eed07d50bc16)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
