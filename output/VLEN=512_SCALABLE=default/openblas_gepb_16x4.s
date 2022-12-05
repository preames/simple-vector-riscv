	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl512b1p0_zvl64b1p0"
	.file	"openblas_gepb_16x4.c"
	.globl	test
	.p2align	1
	.type	test,@function
test:
	addi	sp, sp, -64
	sd	s0, 56(sp)
	sd	s1, 48(sp)
	sd	s2, 40(sp)
	sd	s3, 32(sp)
	sd	s4, 24(sp)
	sd	s5, 16(sp)
	sd	s6, 8(sp)
	sd	s7, 0(sp)
	li	a3, 0
	addi	t0, a0, 8
	addi	s3, a0, 4
	addi	t1, a0, 60
	addi	t2, a0, 56
	addi	t3, a0, 52
	addi	t4, a0, 48
	addi	t5, a0, 44
	addi	t6, a0, 40
	addi	s2, a0, 36
	addi	s4, a0, 32
	addi	s5, a0, 28
	addi	s6, a0, 24
	addi	s7, a0, 20
	addi	s0, a0, 16
	addi	a4, a0, 12
	csrr	a7, vlenb
	srli	a5, a7, 2
	neg	s1, a5
	and	a6, a5, s1
	vsetvli	s1, zero, e64, m2, ta, ma
	vlse32.v	v8, (a0), zero
	vlse32.v	v9, (s3), zero
	vlse32.v	v10, (t0), zero
	vlse32.v	v11, (a4), zero
	vlse32.v	v12, (s0), zero
	vlse32.v	v13, (s7), zero
	vlse32.v	v14, (s6), zero
	vlse32.v	v15, (s5), zero
	vlse32.v	v16, (s4), zero
	vlse32.v	v17, (s2), zero
	vlse32.v	v18, (t6), zero
	vlse32.v	v19, (t5), zero
	vlse32.v	v20, (t4), zero
	vlse32.v	v21, (t3), zero
	vlse32.v	v22, (t2), zero
	vlse32.v	v23, (t1), zero
	slli	a0, a7, 4
	vid.v	v24
	li	a4, 64
.LBB0_1:
	vsetvli	zero, zero, e64, m2, ta, ma
	vsaddu.vx	v26, v24, a3
	vmsleu.vi	v0, v26, 3
	vle32.v	v26, (a1), v0.t
	vlse32.v	v27, (a2), a4, v0.t
	vsetvli	zero, zero, e32, m1, ta, ma
	vfmacc.vv	v27, v8, v26
	vsse32.v	v27, (a2), a4, v0.t
	addi	s1, a2, 4
	vlse32.v	v27, (s1), a4, v0.t
	vfmacc.vv	v27, v9, v26
	vsse32.v	v27, (s1), a4, v0.t
	addi	s1, a2, 8
	vlse32.v	v27, (s1), a4, v0.t
	vfmacc.vv	v27, v10, v26
	vsse32.v	v27, (s1), a4, v0.t
	addi	s1, a2, 12
	vlse32.v	v27, (s1), a4, v0.t
	vfmacc.vv	v27, v11, v26
	vsse32.v	v27, (s1), a4, v0.t
	addi	s1, a2, 16
	vlse32.v	v27, (s1), a4, v0.t
	vfmacc.vv	v27, v12, v26
	vsse32.v	v27, (s1), a4, v0.t
	addi	s1, a2, 20
	vlse32.v	v27, (s1), a4, v0.t
	vfmacc.vv	v27, v13, v26
	vsse32.v	v27, (s1), a4, v0.t
	addi	s1, a2, 24
	vlse32.v	v27, (s1), a4, v0.t
	vfmacc.vv	v27, v14, v26
	vsse32.v	v27, (s1), a4, v0.t
	addi	s1, a2, 28
	vlse32.v	v27, (s1), a4, v0.t
	vfmacc.vv	v27, v15, v26
	vsse32.v	v27, (s1), a4, v0.t
	addi	s1, a2, 32
	vlse32.v	v27, (s1), a4, v0.t
	vfmacc.vv	v27, v16, v26
	vsse32.v	v27, (s1), a4, v0.t
	addi	s1, a2, 36
	vlse32.v	v27, (s1), a4, v0.t
	vfmacc.vv	v27, v17, v26
	vsse32.v	v27, (s1), a4, v0.t
	addi	s1, a2, 40
	vlse32.v	v27, (s1), a4, v0.t
	vfmacc.vv	v27, v18, v26
	vsse32.v	v27, (s1), a4, v0.t
	addi	s1, a2, 44
	vlse32.v	v27, (s1), a4, v0.t
	vfmacc.vv	v27, v19, v26
	vsse32.v	v27, (s1), a4, v0.t
	addi	s1, a2, 48
	vlse32.v	v27, (s1), a4, v0.t
	vfmacc.vv	v27, v20, v26
	vsse32.v	v27, (s1), a4, v0.t
	addi	s1, a2, 52
	vlse32.v	v27, (s1), a4, v0.t
	vfmacc.vv	v27, v21, v26
	vsse32.v	v27, (s1), a4, v0.t
	addi	s1, a2, 56
	vlse32.v	v27, (s1), a4, v0.t
	vfmacc.vv	v27, v22, v26
	vsse32.v	v27, (s1), a4, v0.t
	addi	s1, a2, 60
	vlse32.v	v27, (s1), a4, v0.t
	vfmacc.vv	v27, v23, v26
	vsse32.v	v27, (s1), a4, v0.t
	add	a3, a3, a5
	add	a1, a1, a7
	add	a2, a2, a0
	bne	a6, a3, .LBB0_1
	ld	s0, 56(sp)
	ld	s1, 48(sp)
	ld	s2, 40(sp)
	ld	s3, 32(sp)
	ld	s4, 24(sp)
	ld	s5, 16(sp)
	ld	s6, 8(sp)
	ld	s7, 0(sp)
	addi	sp, sp, 64
	ret
.Lfunc_end0:
	.size	test, .Lfunc_end0-test

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git b77533306876fc807e58e355d95d848a0077131f)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
