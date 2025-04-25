	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicsr2p0_zihintpause2p0_zihpm2p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zfhmin1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0"
	.file	"openblas_gepb_16x4.c"
	.text
	.globl	test                            # -- Begin function test
	.p2align	1
	.type	test,@function
test:                                   # @test
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -256
	.cfi_def_cfa_offset 256
	fsd	fs0, 248(sp)                    # 8-byte Folded Spill
	fsd	fs1, 240(sp)                    # 8-byte Folded Spill
	fsd	fs2, 232(sp)                    # 8-byte Folded Spill
	fsd	fs3, 224(sp)                    # 8-byte Folded Spill
	fsd	fs4, 216(sp)                    # 8-byte Folded Spill
	fsd	fs5, 208(sp)                    # 8-byte Folded Spill
	fsd	fs6, 200(sp)                    # 8-byte Folded Spill
	fsd	fs7, 192(sp)                    # 8-byte Folded Spill
	fsd	fs8, 184(sp)                    # 8-byte Folded Spill
	fsd	fs9, 176(sp)                    # 8-byte Folded Spill
	fsd	fs10, 168(sp)                   # 8-byte Folded Spill
	fsd	fs11, 160(sp)                   # 8-byte Folded Spill
	.cfi_offset fs0, -8
	.cfi_offset fs1, -16
	.cfi_offset fs2, -24
	.cfi_offset fs3, -32
	.cfi_offset fs4, -40
	.cfi_offset fs5, -48
	.cfi_offset fs6, -56
	.cfi_offset fs7, -64
	.cfi_offset fs8, -72
	.cfi_offset fs9, -80
	.cfi_offset fs10, -88
	.cfi_offset fs11, -96
	flw	fs1, 48(a0)
	flw	fs0, 52(a0)
	flw	fs4, 56(a0)
	flw	fs3, 60(a0)
	flw	ft1, 32(a0)
	flw	ft0, 36(a0)
	flw	fa0, 40(a0)
	flw	ft10, 44(a0)
	flw	ft5, 16(a0)
	flw	ft4, 20(a0)
	flw	ft3, 24(a0)
	flw	ft2, 28(a0)
	flw	fa6, 0(a0)
	flw	ft7, 4(a0)
	flw	ft6, 8(a0)
	flw	fa7, 12(a0)
	flw	fs5, 0(a2)
	flw	fs6, 4(a2)
	flw	fa4, 8(a2)
	flw	fa3, 12(a2)
	flw	fa2, 16(a2)
	flw	fs2, 20(a2)
	flw	fa1, 24(a2)
	flw	ft11, 28(a2)
	flw	fs7, 32(a2)
	flw	fs8, 36(a2)
	flw	fs10, 40(a2)
	flw	fs11, 44(a2)
	flw	ft9, 0(a1)
	flw	ft8, 4(a1)
	flw	fa5, 8(a1)
	flw	fs9, 12(a1)
	fmadd.s	fs5, fa6, ft9, fs5
	fsw	fs5, 156(sp)                    # 4-byte Folded Spill
	fmadd.s	fs5, ft7, ft9, fs6
	fsw	fs5, 152(sp)                    # 4-byte Folded Spill
	fmadd.s	fa4, ft6, ft9, fa4
	fsw	fa4, 148(sp)                    # 4-byte Folded Spill
	fmadd.s	fa4, fa7, ft9, fa3
	fsw	fa4, 144(sp)                    # 4-byte Folded Spill
	fmadd.s	fa4, ft5, ft9, fa2
	fsw	fa4, 140(sp)                    # 4-byte Folded Spill
	fmadd.s	fa4, ft4, ft9, fs2
	fsw	fa4, 136(sp)                    # 4-byte Folded Spill
	fmadd.s	fa4, ft3, ft9, fa1
	fsw	fa4, 132(sp)                    # 4-byte Folded Spill
	fmadd.s	fa4, ft2, ft9, ft11
	fsw	fa4, 128(sp)                    # 4-byte Folded Spill
	fmadd.s	fa4, ft1, ft9, fs7
	fsw	fa4, 124(sp)                    # 4-byte Folded Spill
	fmadd.s	fa4, ft0, ft9, fs8
	fsw	fa4, 120(sp)                    # 4-byte Folded Spill
	fmadd.s	fa4, fa0, ft9, fs10
	fsw	fa4, 116(sp)                    # 4-byte Folded Spill
	fmadd.s	fa4, ft10, ft9, fs11
	fsw	fa4, 112(sp)                    # 4-byte Folded Spill
	flw	fa4, 48(a2)
	flw	fa3, 52(a2)
	flw	fa2, 56(a2)
	flw	fs2, 60(a2)
	fmadd.s	fa4, fs1, ft9, fa4
	fsw	fa4, 108(sp)                    # 4-byte Folded Spill
	fmadd.s	fa4, fs0, ft9, fa3
	fsw	fa4, 104(sp)                    # 4-byte Folded Spill
	fmadd.s	fa4, fs4, ft9, fa2
	fsw	fa4, 100(sp)                    # 4-byte Folded Spill
	fmadd.s	fa4, fs3, ft9, fs2
	fsw	fa4, 96(sp)                     # 4-byte Folded Spill
	flw	fa4, 64(a2)
	flw	fa3, 68(a2)
	flw	fa2, 72(a2)
	flw	ft9, 76(a2)
	fmadd.s	fa4, fa6, ft8, fa4
	fsw	fa4, 92(sp)                     # 4-byte Folded Spill
	fmadd.s	fa4, ft7, ft8, fa3
	fsw	fa4, 88(sp)                     # 4-byte Folded Spill
	fmadd.s	fa4, ft6, ft8, fa2
	fsw	fa4, 84(sp)                     # 4-byte Folded Spill
	fmadd.s	fa4, fa7, ft8, ft9
	fsw	fa4, 80(sp)                     # 4-byte Folded Spill
	flw	fa4, 80(a2)
	flw	fa3, 84(a2)
	flw	fa2, 88(a2)
	flw	ft9, 92(a2)
	fmadd.s	fa4, ft5, ft8, fa4
	fsw	fa4, 76(sp)                     # 4-byte Folded Spill
	fmadd.s	fa4, ft4, ft8, fa3
	fsw	fa4, 72(sp)                     # 4-byte Folded Spill
	fmadd.s	fa4, ft3, ft8, fa2
	fsw	fa4, 68(sp)                     # 4-byte Folded Spill
	fmadd.s	fa4, ft2, ft8, ft9
	fsw	fa4, 64(sp)                     # 4-byte Folded Spill
	flw	fa4, 96(a2)
	flw	fa3, 100(a2)
	flw	fa2, 104(a2)
	flw	ft9, 108(a2)
	fmadd.s	fa4, ft1, ft8, fa4
	fsw	fa4, 60(sp)                     # 4-byte Folded Spill
	fmadd.s	fa4, ft0, ft8, fa3
	fsw	fa4, 56(sp)                     # 4-byte Folded Spill
	fmadd.s	fa4, fa0, ft8, fa2
	fsw	fa4, 52(sp)                     # 4-byte Folded Spill
	fmadd.s	fa4, ft10, ft8, ft9
	fsw	fa4, 48(sp)                     # 4-byte Folded Spill
	flw	fa4, 112(a2)
	flw	fa3, 116(a2)
	flw	fa2, 120(a2)
	flw	ft9, 124(a2)
	fmadd.s	fa4, fs1, ft8, fa4
	fsw	fa4, 44(sp)                     # 4-byte Folded Spill
	fmadd.s	fa4, fs0, ft8, fa3
	fsw	fa4, 40(sp)                     # 4-byte Folded Spill
	fmadd.s	fa4, fs4, ft8, fa2
	fsw	fa4, 36(sp)                     # 4-byte Folded Spill
	fmadd.s	fa4, fs3, ft8, ft9
	fsw	fa4, 32(sp)                     # 4-byte Folded Spill
	flw	fa4, 128(a2)
	flw	fa3, 132(a2)
	flw	fa2, 136(a2)
	flw	ft8, 140(a2)
	fmadd.s	fa4, fa6, fa5, fa4
	fsw	fa4, 28(sp)                     # 4-byte Folded Spill
	fmadd.s	fa4, ft7, fa5, fa3
	fsw	fa4, 24(sp)                     # 4-byte Folded Spill
	fmadd.s	fa4, ft6, fa5, fa2
	fsw	fa4, 20(sp)                     # 4-byte Folded Spill
	fmadd.s	fa4, fa7, fa5, ft8
	fsw	fa4, 16(sp)                     # 4-byte Folded Spill
	flw	fa4, 144(a2)
	flw	fa3, 148(a2)
	flw	fa2, 152(a2)
	flw	ft8, 156(a2)
	fmadd.s	fs10, ft5, fa5, fa4
	fmadd.s	fs11, ft4, fa5, fa3
	fmadd.s	fa4, ft3, fa5, fa2
	fsw	fa4, 12(sp)                     # 4-byte Folded Spill
	fmadd.s	fs8, ft2, fa5, ft8
	flw	fa4, 160(a2)
	flw	fa3, 164(a2)
	flw	fa2, 168(a2)
	flw	fs2, 172(a2)
	fmadd.s	fs5, ft1, fa5, fa4
	fmadd.s	fs6, ft0, fa5, fa3
	fmadd.s	fs7, fa0, fa5, fa2
	fmadd.s	fs2, ft10, fa5, fs2
	flw	fa4, 176(a2)
	flw	fa3, 180(a2)
	flw	fa2, 184(a2)
	flw	fa1, 188(a2)
	fmadd.s	ft9, fs1, fa5, fa4
	fmadd.s	ft11, fs0, fa5, fa3
	fmadd.s	fa2, fs4, fa5, fa2
	fmadd.s	ft8, fs3, fa5, fa1
	flw	fa1, 192(a2)
	flw	fa3, 196(a2)
	flw	fa4, 200(a2)
	flw	fa5, 204(a2)
	fmadd.s	fa6, fa6, fs9, fa1
	fmadd.s	ft7, ft7, fs9, fa3
	fmadd.s	ft6, ft6, fs9, fa4
	fmadd.s	fa7, fa7, fs9, fa5
	flw	fa5, 208(a2)
	flw	fa4, 212(a2)
	flw	fa3, 216(a2)
	flw	fa1, 220(a2)
	fmadd.s	ft5, ft5, fs9, fa5
	fmadd.s	ft4, ft4, fs9, fa4
	fmadd.s	ft3, ft3, fs9, fa3
	fmadd.s	ft2, ft2, fs9, fa1
	flw	fa5, 224(a2)
	flw	fa4, 228(a2)
	flw	fa3, 232(a2)
	flw	fa1, 236(a2)
	fmadd.s	ft1, ft1, fs9, fa5
	fmadd.s	ft0, ft0, fs9, fa4
	fmadd.s	fa0, fa0, fs9, fa3
	fmadd.s	fa1, ft10, fs9, fa1
	flw	fa5, 240(a2)
	flw	fa4, 244(a2)
	flw	fa3, 248(a2)
	flw	ft10, 252(a2)
	fmadd.s	fa5, fs1, fs9, fa5
	fmadd.s	fa4, fs0, fs9, fa4
	fmadd.s	fa3, fs4, fs9, fa3
	fmadd.s	ft10, fs3, fs9, ft10
	flw	fs0, 156(sp)                    # 4-byte Folded Reload
	fsw	fs0, 0(a2)
	flw	fs0, 152(sp)                    # 4-byte Folded Reload
	fsw	fs0, 4(a2)
	flw	fs0, 148(sp)                    # 4-byte Folded Reload
	fsw	fs0, 8(a2)
	flw	fs0, 144(sp)                    # 4-byte Folded Reload
	fsw	fs0, 12(a2)
	flw	fs0, 140(sp)                    # 4-byte Folded Reload
	fsw	fs0, 16(a2)
	flw	fs0, 136(sp)                    # 4-byte Folded Reload
	fsw	fs0, 20(a2)
	flw	fs0, 132(sp)                    # 4-byte Folded Reload
	fsw	fs0, 24(a2)
	flw	fs0, 128(sp)                    # 4-byte Folded Reload
	fsw	fs0, 28(a2)
	flw	fs0, 124(sp)                    # 4-byte Folded Reload
	fsw	fs0, 32(a2)
	flw	fs0, 120(sp)                    # 4-byte Folded Reload
	fsw	fs0, 36(a2)
	flw	fs0, 116(sp)                    # 4-byte Folded Reload
	fsw	fs0, 40(a2)
	flw	fs0, 112(sp)                    # 4-byte Folded Reload
	fsw	fs0, 44(a2)
	flw	fs0, 108(sp)                    # 4-byte Folded Reload
	fsw	fs0, 48(a2)
	flw	fs0, 104(sp)                    # 4-byte Folded Reload
	fsw	fs0, 52(a2)
	flw	fs0, 100(sp)                    # 4-byte Folded Reload
	fsw	fs0, 56(a2)
	flw	fs0, 96(sp)                     # 4-byte Folded Reload
	fsw	fs0, 60(a2)
	flw	fs0, 92(sp)                     # 4-byte Folded Reload
	fsw	fs0, 64(a2)
	flw	fs0, 88(sp)                     # 4-byte Folded Reload
	fsw	fs0, 68(a2)
	flw	fs0, 84(sp)                     # 4-byte Folded Reload
	fsw	fs0, 72(a2)
	flw	fs0, 80(sp)                     # 4-byte Folded Reload
	fsw	fs0, 76(a2)
	flw	fs0, 76(sp)                     # 4-byte Folded Reload
	fsw	fs0, 80(a2)
	flw	fs0, 72(sp)                     # 4-byte Folded Reload
	fsw	fs0, 84(a2)
	flw	fs0, 68(sp)                     # 4-byte Folded Reload
	fsw	fs0, 88(a2)
	flw	fs0, 64(sp)                     # 4-byte Folded Reload
	fsw	fs0, 92(a2)
	flw	fs0, 60(sp)                     # 4-byte Folded Reload
	fsw	fs0, 96(a2)
	flw	fs0, 56(sp)                     # 4-byte Folded Reload
	fsw	fs0, 100(a2)
	flw	fs0, 52(sp)                     # 4-byte Folded Reload
	fsw	fs0, 104(a2)
	flw	fs0, 48(sp)                     # 4-byte Folded Reload
	fsw	fs0, 108(a2)
	flw	fs0, 44(sp)                     # 4-byte Folded Reload
	fsw	fs0, 112(a2)
	flw	fs0, 40(sp)                     # 4-byte Folded Reload
	fsw	fs0, 116(a2)
	flw	fs0, 36(sp)                     # 4-byte Folded Reload
	fsw	fs0, 120(a2)
	flw	fs0, 32(sp)                     # 4-byte Folded Reload
	fsw	fs0, 124(a2)
	flw	fs0, 28(sp)                     # 4-byte Folded Reload
	fsw	fs0, 128(a2)
	flw	fs0, 24(sp)                     # 4-byte Folded Reload
	fsw	fs0, 132(a2)
	flw	fs0, 20(sp)                     # 4-byte Folded Reload
	fsw	fs0, 136(a2)
	flw	fs0, 16(sp)                     # 4-byte Folded Reload
	fsw	fs0, 140(a2)
	fsw	fs10, 144(a2)
	fsw	fs11, 148(a2)
	flw	fs0, 12(sp)                     # 4-byte Folded Reload
	fsw	fs0, 152(a2)
	fsw	fs8, 156(a2)
	fsw	fs5, 160(a2)
	fsw	fs6, 164(a2)
	fsw	fs7, 168(a2)
	fsw	fs2, 172(a2)
	fsw	ft9, 176(a2)
	fsw	ft11, 180(a2)
	fsw	fa2, 184(a2)
	fsw	ft8, 188(a2)
	fsw	fa6, 192(a2)
	fsw	ft7, 196(a2)
	fsw	ft6, 200(a2)
	fsw	fa7, 204(a2)
	fsw	ft5, 208(a2)
	fsw	ft4, 212(a2)
	fsw	ft3, 216(a2)
	fsw	ft2, 220(a2)
	fsw	ft1, 224(a2)
	fsw	ft0, 228(a2)
	fsw	fa0, 232(a2)
	fsw	fa1, 236(a2)
	fsw	fa5, 240(a2)
	fsw	fa4, 244(a2)
	fsw	fa3, 248(a2)
	fsw	ft10, 252(a2)
	fld	fs0, 248(sp)                    # 8-byte Folded Reload
	fld	fs1, 240(sp)                    # 8-byte Folded Reload
	fld	fs2, 232(sp)                    # 8-byte Folded Reload
	fld	fs3, 224(sp)                    # 8-byte Folded Reload
	fld	fs4, 216(sp)                    # 8-byte Folded Reload
	fld	fs5, 208(sp)                    # 8-byte Folded Reload
	fld	fs6, 200(sp)                    # 8-byte Folded Reload
	fld	fs7, 192(sp)                    # 8-byte Folded Reload
	fld	fs8, 184(sp)                    # 8-byte Folded Reload
	fld	fs9, 176(sp)                    # 8-byte Folded Reload
	fld	fs10, 168(sp)                   # 8-byte Folded Reload
	fld	fs11, 160(sp)                   # 8-byte Folded Reload
	.cfi_restore fs0
	.cfi_restore fs1
	.cfi_restore fs2
	.cfi_restore fs3
	.cfi_restore fs4
	.cfi_restore fs5
	.cfi_restore fs6
	.cfi_restore fs7
	.cfi_restore fs8
	.cfi_restore fs9
	.cfi_restore fs10
	.cfi_restore fs11
	addi	sp, sp, 256
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end0:
	.size	test, .Lfunc_end0-test
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
