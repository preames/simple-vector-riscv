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
	addi	t5, a0, 8
	addi	s2, a0, 4
	addi	a7, a0, 60
	addi	t0, a0, 56
	addi	t1, a0, 52
	addi	t2, a0, 48
	addi	t3, a0, 44
	addi	t4, a0, 40
	addi	t6, a0, 36
	addi	s3, a0, 32
	addi	s4, a0, 28
	addi	s5, a0, 24
	addi	s6, a0, 20
	addi	s7, a0, 16
	addi	s0, a0, 12
	csrr	a4, vlenb
	srli	a5, a4, 2
	neg	s1, a5
	and	a6, a5, s1
	vsetvli	s1, zero, e64, m2, ta, ma
	vid.v	v8
	vlse32.v	v10, (a0), zero
	vlse32.v	v11, (s2), zero
	vlse32.v	v12, (t5), zero
	vlse32.v	v13, (s0), zero
	vlse32.v	v14, (s7), zero
	vlse32.v	v15, (s6), zero
	vlse32.v	v16, (s5), zero
	vlse32.v	v17, (s4), zero
	vlse32.v	v18, (s3), zero
	vlse32.v	v19, (t6), zero
	vlse32.v	v20, (t4), zero
	vlse32.v	v21, (t3), zero
	vlse32.v	v22, (t2), zero
	vlse32.v	v23, (t1), zero
	vlse32.v	v24, (t0), zero
	vlse32.v	v25, (a7), zero
	slli	a0, a4, 4
	li	a7, 64
	li	t0, 16
	li	t1, 20
	li	t2, 24
	li	t3, 28
	li	t4, 32
	li	t5, 36
	li	t6, 40
	li	s2, 44
	li	s3, 48
	li	s4, 52
	li	s5, 56
	li	s0, 60
	mv	s1, a2
	vmv.v.v	v26, v8
.LBB0_1:
	vsaddu.vx	v28, v8, a3
	vmsleu.vi	v0, v28, 3
	vle32.v	v28, (a1), v0.t
	vlse32.v	v29, (s1), a7, v0.t
	vsetvli	zero, zero, e32, m1, ta, ma
	vfmacc.vv	v29, v10, v28
	vsse32.v	v29, (s1), a7, v0.t
	vsetvli	zero, zero, e64, m2, ta, ma
	vsll.vi	v30, v26, 6
	vor.vi	v2, v30, 4
	vsetvli	zero, zero, e32, m1, ta, ma
	vluxei64.v	v29, (a2), v2, v0.t
	vfmacc.vv	v29, v11, v28
	vsoxei64.v	v29, (a2), v2, v0.t
	vsetvli	zero, zero, e64, m2, ta, ma
	vor.vi	v2, v30, 8
	vsetvli	zero, zero, e32, m1, ta, ma
	vluxei64.v	v29, (a2), v2, v0.t
	vfmacc.vv	v29, v12, v28
	vsoxei64.v	v29, (a2), v2, v0.t
	vsetvli	zero, zero, e64, m2, ta, ma
	vor.vi	v2, v30, 12
	vsetvli	zero, zero, e32, m1, ta, ma
	vluxei64.v	v29, (a2), v2, v0.t
	vfmacc.vv	v29, v13, v28
	vsoxei64.v	v29, (a2), v2, v0.t
	vsetvli	zero, zero, e64, m2, ta, ma
	vor.vx	v2, v30, t0
	vsetvli	zero, zero, e32, m1, ta, ma
	vluxei64.v	v29, (a2), v2, v0.t
	vfmacc.vv	v29, v14, v28
	vsoxei64.v	v29, (a2), v2, v0.t
	vsetvli	zero, zero, e64, m2, ta, ma
	vor.vx	v2, v30, t1
	vsetvli	zero, zero, e32, m1, ta, ma
	vluxei64.v	v29, (a2), v2, v0.t
	vfmacc.vv	v29, v15, v28
	vsoxei64.v	v29, (a2), v2, v0.t
	vsetvli	zero, zero, e64, m2, ta, ma
	vor.vx	v2, v30, t2
	vsetvli	zero, zero, e32, m1, ta, ma
	vluxei64.v	v29, (a2), v2, v0.t
	vfmacc.vv	v29, v16, v28
	vsoxei64.v	v29, (a2), v2, v0.t
	vsetvli	zero, zero, e64, m2, ta, ma
	vor.vx	v2, v30, t3
	vsetvli	zero, zero, e32, m1, ta, ma
	vluxei64.v	v29, (a2), v2, v0.t
	vfmacc.vv	v29, v17, v28
	vsoxei64.v	v29, (a2), v2, v0.t
	vsetvli	zero, zero, e64, m2, ta, ma
	vor.vx	v2, v30, t4
	vsetvli	zero, zero, e32, m1, ta, ma
	vluxei64.v	v29, (a2), v2, v0.t
	vfmacc.vv	v29, v18, v28
	vsoxei64.v	v29, (a2), v2, v0.t
	vsetvli	zero, zero, e64, m2, ta, ma
	vor.vx	v2, v30, t5
	vsetvli	zero, zero, e32, m1, ta, ma
	vluxei64.v	v29, (a2), v2, v0.t
	vfmacc.vv	v29, v19, v28
	vsoxei64.v	v29, (a2), v2, v0.t
	vsetvli	zero, zero, e64, m2, ta, ma
	vor.vx	v2, v30, t6
	vsetvli	zero, zero, e32, m1, ta, ma
	vluxei64.v	v29, (a2), v2, v0.t
	vfmacc.vv	v29, v20, v28
	vsoxei64.v	v29, (a2), v2, v0.t
	vsetvli	zero, zero, e64, m2, ta, ma
	vor.vx	v2, v30, s2
	vsetvli	zero, zero, e32, m1, ta, ma
	vluxei64.v	v29, (a2), v2, v0.t
	vfmacc.vv	v29, v21, v28
	vsoxei64.v	v29, (a2), v2, v0.t
	vsetvli	zero, zero, e64, m2, ta, ma
	vor.vx	v2, v30, s3
	vsetvli	zero, zero, e32, m1, ta, ma
	vluxei64.v	v29, (a2), v2, v0.t
	vfmacc.vv	v29, v22, v28
	vsoxei64.v	v29, (a2), v2, v0.t
	vsetvli	zero, zero, e64, m2, ta, ma
	vor.vx	v2, v30, s4
	vsetvli	zero, zero, e32, m1, ta, ma
	vluxei64.v	v29, (a2), v2, v0.t
	vfmacc.vv	v29, v23, v28
	vsoxei64.v	v29, (a2), v2, v0.t
	vsetvli	zero, zero, e64, m2, ta, ma
	vor.vx	v2, v30, s5
	vsetvli	zero, zero, e32, m1, ta, ma
	vluxei64.v	v29, (a2), v2, v0.t
	vfmacc.vv	v29, v24, v28
	vsoxei64.v	v29, (a2), v2, v0.t
	vsetvli	zero, zero, e64, m2, ta, ma
	vor.vx	v30, v30, s0
	vsetvli	zero, zero, e32, m1, ta, ma
	vluxei64.v	v29, (a2), v30, v0.t
	vfmacc.vv	v29, v25, v28
	vsoxei64.v	v29, (a2), v30, v0.t
	add	a3, a3, a5
	vsetvli	zero, zero, e64, m2, ta, ma
	vadd.vx	v26, v26, a5
	add	a1, a1, a4
	add	s1, s1, a0
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

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 269bc684e7a0c3f727ea5e74270112585acaf55d)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
