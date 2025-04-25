	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zihintntl1p0_zihintpause2p0_zihpm2p0_zimop1p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zawrs1p0_zfa1p0_zfhmin1p0_zca1p0_zcb1p0_zcd1p0_zcmop1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0_zvbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfhmin1p0_zvkb1p0_zvkt1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0_supm1p0"
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
	addi	sp, sp, -96
	.cfi_def_cfa_offset 96
	sd	ra, 88(sp)                      # 8-byte Folded Spill
	sd	s0, 80(sp)                      # 8-byte Folded Spill
	sd	s1, 72(sp)                      # 8-byte Folded Spill
	sd	s2, 64(sp)                      # 8-byte Folded Spill
	sd	s3, 56(sp)                      # 8-byte Folded Spill
	sd	s4, 48(sp)                      # 8-byte Folded Spill
	sd	s5, 40(sp)                      # 8-byte Folded Spill
	sd	s6, 32(sp)                      # 8-byte Folded Spill
	sd	s7, 24(sp)                      # 8-byte Folded Spill
	fsd	fs0, 16(sp)                     # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	.cfi_offset s2, -32
	.cfi_offset s3, -40
	.cfi_offset s4, -48
	.cfi_offset s5, -56
	.cfi_offset s6, -64
	.cfi_offset s7, -72
	.cfi_offset fs0, -80
	csrr	a3, vlenb
	slli	a3, a3, 1
	sub	sp, sp, a3
	.cfi_escape 0x0f, 0x0e, 0x72, 0x00, 0x11, 0xe0, 0x00, 0x22, 0x11, 0x02, 0x92, 0xa2, 0x38, 0x00, 0x1e, 0x22 # sp + 96 + 2 * vlenb
	.cfi_remember_state
	zext.w	s2, a2
	li	a3, 4
	sh2add	s7, s2, a1
	bltu	a2, a3, .LBB0_4
# %bb.2:                                # %vector.memcheck
	bgeu	a0, s7, .LBB0_9
# %bb.3:                                # %vector.memcheck
	sh2add	a2, s2, a0
	bgeu	a1, a2, .LBB0_9
.LBB0_4:
	li	s5, 0
.LBB0_5:                                # %for.body.preheader10
	sh2add	s0, s5, a1
	sh2add	s1, s5, a0
.LBB0_6:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	flw	fa0, 0(s0)
	call	expf
	flw	fa5, 0(s1)
	addi	s0, s0, 4
	fadd.s	fa5, fa5, fa0
	fsw	fa5, 0(s1)
	addi	s1, s1, 4
	bne	s0, s7, .LBB0_6
.LBB0_7:
	csrr	a0, vlenb
	sh1add	sp, a0, sp
	.cfi_def_cfa sp, 96
	ld	ra, 88(sp)                      # 8-byte Folded Reload
	ld	s0, 80(sp)                      # 8-byte Folded Reload
	ld	s1, 72(sp)                      # 8-byte Folded Reload
	ld	s2, 64(sp)                      # 8-byte Folded Reload
	ld	s3, 56(sp)                      # 8-byte Folded Reload
	ld	s4, 48(sp)                      # 8-byte Folded Reload
	ld	s5, 40(sp)                      # 8-byte Folded Reload
	ld	s6, 32(sp)                      # 8-byte Folded Reload
	ld	s7, 24(sp)                      # 8-byte Folded Reload
	fld	fs0, 16(sp)                     # 8-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	.cfi_restore s1
	.cfi_restore s2
	.cfi_restore s3
	.cfi_restore s4
	.cfi_restore s5
	.cfi_restore s6
	.cfi_restore s7
	.cfi_restore fs0
	addi	sp, sp, 96
	.cfi_def_cfa_offset 0
.LBB0_8:                                # %for.cond.cleanup
	ret
.LBB0_9:                                # %vector.ph
	.cfi_restore_state
	andi	s5, s2, -4
	addi	a2, s5, -4
	sh2add	s6, a2, a0
	addi	s6, s6, 16
	mv	s3, a1
	mv	s1, a1
	mv	s4, a0
	mv	s0, a0
	vsetivli	zero, 4, e32, m1, ta, ma
.LBB0_10:                               # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vle32.v	v8, (s1)
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 16
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	vslidedown.vi	v8, v8, 1
	vfmv.f.s	fa0, v8
	call	expf
	fmv.s	fs0, fa0
	csrr	a0, vlenb
	add	a0, a0, sp
	flw	fa0, 16(a0)                     # 8-byte Folded Reload
	call	expf
	vsetivli	zero, 4, e32, m1, ta, ma
	vfmv.v.f	v8, fa0
	vfslide1down.vf	v8, v8, fs0
	addi	a0, sp, 16
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 16
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vi	v8, v8, 2
	vfmv.f.s	fa0, v8
	call	expf
	addi	a0, sp, 16
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vsetivli	zero, 4, e32, m1, ta, ma
	vfslide1down.vf	v8, v8, fa0
	vs1r.v	v8, (a0)                        # vscale x 8-byte Folded Spill
	csrr	a0, vlenb
	add	a0, a0, sp
	addi	a0, a0, 16
	vl1r.v	v8, (a0)                        # vscale x 8-byte Folded Reload
	vslidedown.vi	v8, v8, 3
	vfmv.f.s	fa0, v8
	call	expf
	vsetivli	zero, 4, e32, m1, ta, ma
	vle32.v	v8, (s0)
	addi	a0, sp, 16
	vl1r.v	v9, (a0)                        # vscale x 8-byte Folded Reload
	vfslide1down.vf	v9, v9, fa0
	vfadd.vv	v8, v8, v9
	vse32.v	v8, (s0)
	addi	s0, s0, 16
	addi	s1, s1, 16
	bne	s0, s6, .LBB0_10
# %bb.11:                               # %middle.block
	mv	a0, s4
	mv	a1, s3
	beq	s5, s2, .LBB0_7
	j	.LBB0_5
.Lfunc_end0:
	.size	vector_expr_f32, .Lfunc_end0-vector_expr_f32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
