	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zihintntl1p0_zihintpause2p0_zihpm2p0_zimop1p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zawrs1p0_zfa1p0_zfhmin1p0_zca1p0_zcb1p0_zcd1p0_zcmop1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0_zvbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfhmin1p0_zvkb1p0_zvkt1p0_zvl1024b1p0_zvl128b1p0_zvl2048b1p0_zvl256b1p0_zvl32b1p0_zvl4096b1p0_zvl512b1p0_zvl64b1p0_supm1p0"
	.file	"ml_primitives.c"
	.text
	.globl	vector_expr_f32                 # -- Begin function vector_expr_f32
	.p2align	1
	.type	vector_expr_f32,@function
vector_expr_f32:                        # @vector_expr_f32
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a2, .LBB0_8
# %bb.1:                                # %for.body.preheader
	addi	sp, sp, -176
	.cfi_def_cfa_offset 176
	sd	ra, 168(sp)                     # 8-byte Folded Spill
	sd	s0, 160(sp)                     # 8-byte Folded Spill
	sd	s1, 152(sp)                     # 8-byte Folded Spill
	sd	s2, 144(sp)                     # 8-byte Folded Spill
	sd	s3, 136(sp)                     # 8-byte Folded Spill
	sd	s4, 128(sp)                     # 8-byte Folded Spill
	sd	s5, 120(sp)                     # 8-byte Folded Spill
	sd	s6, 112(sp)                     # 8-byte Folded Spill
	sd	s7, 104(sp)                     # 8-byte Folded Spill
	sd	s8, 96(sp)                      # 8-byte Folded Spill
	sd	s9, 88(sp)                      # 8-byte Folded Spill
	sd	s10, 80(sp)                     # 8-byte Folded Spill
	sd	s11, 72(sp)                     # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	.cfi_offset s2, -32
	.cfi_offset s3, -40
	.cfi_offset s4, -48
	.cfi_offset s5, -56
	.cfi_offset s6, -64
	.cfi_offset s7, -72
	.cfi_offset s8, -80
	.cfi_offset s9, -88
	.cfi_offset s10, -96
	.cfi_offset s11, -104
	csrr	a3, vlenb
	slli	a3, a3, 2
	sub	sp, sp, a3
	.cfi_escape 0x0f, 0x0e, 0x72, 0x00, 0x11, 0xb0, 0x01, 0x22, 0x11, 0x04, 0x92, 0xa2, 0x38, 0x00, 0x1e, 0x22 # sp + 176 + 4 * vlenb
	.cfi_remember_state
	zext.w	a4, a2
	li	a3, 128
	sh2add	s10, a4, a1
	bltu	a2, a3, .LBB0_4
# %bb.2:                                # %vector.memcheck
	bgeu	a0, s10, .LBB0_9
# %bb.3:                                # %vector.memcheck
	sh2add	a2, a4, a0
	bgeu	a1, a2, .LBB0_9
.LBB0_4:
	li	a3, 0
.LBB0_5:                                # %for.body.preheader10
	sh2add	s1, a3, a1
	sh2add	s0, a3, a0
.LBB0_6:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	flw	fa0, 0(s1)
	call	expf
	flw	fa5, 0(s0)
	addi	s1, s1, 4
	fadd.s	fa5, fa5, fa0
	fsw	fa5, 0(s0)
	addi	s0, s0, 4
	bne	s1, s10, .LBB0_6
.LBB0_7:
	csrr	a0, vlenb
	sh2add	sp, a0, sp
	.cfi_def_cfa sp, 176
	ld	ra, 168(sp)                     # 8-byte Folded Reload
	ld	s0, 160(sp)                     # 8-byte Folded Reload
	ld	s1, 152(sp)                     # 8-byte Folded Reload
	ld	s2, 144(sp)                     # 8-byte Folded Reload
	ld	s3, 136(sp)                     # 8-byte Folded Reload
	ld	s4, 128(sp)                     # 8-byte Folded Reload
	ld	s5, 120(sp)                     # 8-byte Folded Reload
	ld	s6, 112(sp)                     # 8-byte Folded Reload
	ld	s7, 104(sp)                     # 8-byte Folded Reload
	ld	s8, 96(sp)                      # 8-byte Folded Reload
	ld	s9, 88(sp)                      # 8-byte Folded Reload
	ld	s10, 80(sp)                     # 8-byte Folded Reload
	ld	s11, 72(sp)                     # 8-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	.cfi_restore s1
	.cfi_restore s2
	.cfi_restore s3
	.cfi_restore s4
	.cfi_restore s5
	.cfi_restore s6
	.cfi_restore s7
	.cfi_restore s8
	.cfi_restore s9
	.cfi_restore s10
	.cfi_restore s11
	addi	sp, sp, 176
	.cfi_def_cfa_offset 0
.LBB0_8:                                # %for.cond.cleanup
	ret
.LBB0_9:                                # %vector.ph
	.cfi_restore_state
	sd	a4, 32(sp)                      # 8-byte Folded Spill
	andi	a2, a4, -128
	li	s1, 128
	vsetivli	zero, 2, e64, m1, ta, ma
	vid.v	v8
	sd	a2, 24(sp)                      # 8-byte Folded Spill
	addi	a2, a2, -128
	vadd.vi	v8, v8, -1
	addi	a3, sp, 64
	vs1r.v	v8, (a3)                        # vscale x 8-byte Folded Spill
	sh2add	a2, a2, a0
	addi	s9, a2, 512
	li	s7, 64
	li	s0, 122
	li	s11, 123
	li	s2, 124
	li	s3, 125
	li	s4, 126
	li	s5, 127
	sd	a1, 48(sp)                      # 8-byte Folded Spill
	mv	s6, a1
	sd	a0, 40(sp)                      # 8-byte Folded Spill
	mv	s8, a0
.LBB0_10:                               # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vsetvli	zero, s1, e32, m1, ta, ma
	vle32.v	v8, (s6)
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	vfmv.f.s	fa0, v8
	call	expf
	vsetvli	zero, s1, e32, m1, ta, ma
	vfmv.v.f	v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vi	v8, v8, 1
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vi	v8, v8, 2
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vi	v8, v8, 3
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vi	v8, v8, 4
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vi	v8, v8, 5
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vi	v8, v8, 6
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vi	v8, v8, 7
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vi	v8, v8, 8
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vi	v8, v8, 9
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vi	v8, v8, 10
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vi	v8, v8, 11
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vi	v8, v8, 12
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vi	v8, v8, 13
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vi	v8, v8, 14
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vi	v8, v8, 15
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vi	v8, v8, 16
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vi	v8, v8, 17
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vi	v8, v8, 18
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vi	v8, v8, 19
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vi	v8, v8, 20
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vi	v8, v8, 21
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vi	v8, v8, 22
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vi	v8, v8, 23
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vi	v8, v8, 24
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vi	v8, v8, 25
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vi	v8, v8, 26
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vi	v8, v8, 27
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vi	v8, v8, 28
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vi	v8, v8, 29
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vi	v8, v8, 30
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vi	v8, v8, 31
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 32
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 33
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 34
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 35
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 36
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 37
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 38
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 39
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 40
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 41
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 42
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 43
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 44
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 45
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 46
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 47
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 48
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 49
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 50
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 51
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 52
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 53
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 54
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 55
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 56
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 57
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 58
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 59
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 60
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 61
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 62
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 63
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vx	v8, v8, s7
	vfmv.f.s	fa0, v8
	call	expf
	vsetvli	zero, s1, e32, m1, ta, ma
	vfmv.v.f	v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 65
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 66
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 67
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 68
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 69
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 70
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 71
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 72
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 73
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 74
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 75
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 76
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 77
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 78
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 79
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 80
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 81
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 82
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 83
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 84
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 85
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 86
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 87
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 88
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 89
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 90
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 91
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 92
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 93
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 94
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 95
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 96
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 97
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 98
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 99
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 100
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 101
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 102
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 103
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 104
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 105
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 106
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 107
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 108
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 109
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 110
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 111
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 112
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 113
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 114
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 115
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 116
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 117
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 118
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 119
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 120
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	li	a0, 121
	vslidedown.vx	v8, v8, a0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vx	v8, v8, s0
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vx	v8, v8, s11
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vx	v8, v8, s2
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vx	v8, v8, s3
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vx	v8, v8, s4
	vfmv.f.s	fa0, v8
	call	expf
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetvli	zero, s1, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	sh1add	a0, a0, a0
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vx	v8, v8, s5
	vfmv.f.s	fa0, v8
	call	expf
	vsetvli	zero, s1, e32, m1, ta, mu
	vle32.v	v8, (s8)
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v9, (a0)                        # vscale x 8-byte Folded Reload
	vfslide1down.vf	v9, v9, fa0
	addi	a0, sp, 64
	vl1r.v	v0, (a0)                        # vscale x 8-byte Folded Reload
	csrr	a0, vlenb
	sh1add	a0, a0, sp
	addi	a0, a0, 64
	vl1r.v	v10, (a0)                       # vscale x 8-byte Folded Reload
	vslidedown.vx	v9, v10, s7, v0.t
	vfadd.vv	v8, v8, v9
	vse32.v	v8, (s8)
	addi	s8, s8, 512
	addi	s6, s6, 512
	beq	s8, s9, .LBB0_11
	j	.LBB0_10
.LBB0_11:                               # %middle.block
	ld	a0, 40(sp)                      # 8-byte Folded Reload
	ld	a1, 48(sp)                      # 8-byte Folded Reload
	ld	a2, 32(sp)                      # 8-byte Folded Reload
	ld	a3, 24(sp)                      # 8-byte Folded Reload
	bne	a3, a2, .LBB0_12
	j	.LBB0_7
.LBB0_12:                               # %middle.block
	j	.LBB0_5
.Lfunc_end0:
	.size	vector_expr_f32, .Lfunc_end0-vector_expr_f32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
