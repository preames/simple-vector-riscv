	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_xmipscmov1p0_xmipslsp1p0"
	.file	"openblas_gepb_16x4.c"
	.text
	.globl	test                            # -- Begin function test
	.p2align	1
	.type	test,@function
test:                                   # @test
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -112
	.cfi_def_cfa_offset 112
	fsd	fs0, 104(sp)                    # 8-byte Folded Spill
	fsd	fs1, 96(sp)                     # 8-byte Folded Spill
	fsd	fs2, 88(sp)                     # 8-byte Folded Spill
	fsd	fs3, 80(sp)                     # 8-byte Folded Spill
	fsd	fs4, 72(sp)                     # 8-byte Folded Spill
	fsd	fs5, 64(sp)                     # 8-byte Folded Spill
	fsd	fs6, 56(sp)                     # 8-byte Folded Spill
	fsd	fs7, 48(sp)                     # 8-byte Folded Spill
	fsd	fs8, 40(sp)                     # 8-byte Folded Spill
	fsd	fs9, 32(sp)                     # 8-byte Folded Spill
	fsd	fs10, 24(sp)                    # 8-byte Folded Spill
	fsd	fs11, 16(sp)                    # 8-byte Folded Spill
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
	flw	fa2, 0(a0)
	flw	fa5, 0(a0)
	flw	fa4, 0(a0)
	fsw	fa4, 12(sp)                     # 4-byte Folded Spill
	flw	fa0, 4(a0)
	flw	ft0, 0(a2)
	flw	ft1, 4(a2)
	flw	ft2, 8(a2)
	flw	ft7, 12(a2)
	flw	fs3, 0(a1)
	flw	ft5, 4(a1)
	flw	fa1, 8(a1)
	flw	fa4, 12(a1)
	fmadd.s	ft0, fs3, fa2, ft0
	fmadd.s	ft1, fs3, fa0, ft1
	flw	ft3, 4(a0)
	flw	fa3, 4(a0)
	fsw	fa3, 8(sp)                      # 4-byte Folded Spill
	flw	fa0, 8(a0)
	flw	ft4, 8(a0)
	fmadd.s	ft2, fs3, fa0, ft2
	flw	fa6, 12(a0)
	flw	ft6, 12(a0)
	flw	fa0, 12(a0)
	fmadd.s	ft7, fs3, fa6, ft7
	fsw	ft0, 0(a2)
	fsw	ft1, 4(a2)
	fsw	ft2, 8(a2)
	fsw	ft7, 12(a2)
	flw	ft1, 16(a0)
	flw	fa6, 16(a0)
	flw	ft0, 16(a0)
	flw	ft2, 20(a0)
	flw	ft7, 16(a2)
	flw	fa7, 20(a2)
	flw	ft8, 24(a2)
	flw	ft9, 28(a2)
	fmadd.s	ft7, fs3, ft1, ft7
	fmadd.s	ft2, fs3, ft2, fa7
	flw	ft1, 24(a0)
	flw	ft10, 24(a0)
	fmadd.s	fa7, fs3, ft1, ft8
	flw	ft8, 28(a0)
	flw	ft11, 28(a0)
	flw	ft1, 28(a0)
	fmadd.s	ft8, fs3, ft8, ft9
	fsw	ft7, 16(a2)
	fsw	ft2, 20(a2)
	fsw	fa7, 24(a2)
	fsw	ft8, 28(a2)
	flw	ft7, 32(a0)
	flw	fs0, 32(a0)
	flw	ft2, 32(a0)
	flw	fa7, 36(a0)
	flw	ft8, 32(a2)
	flw	ft9, 36(a2)
	flw	fs2, 40(a2)
	flw	fs4, 44(a2)
	fmadd.s	ft7, fs3, ft7, ft8
	fmadd.s	ft8, fs3, fa7, ft9
	flw	fa7, 40(a0)
	flw	fs1, 40(a0)
	fmadd.s	ft9, fs3, fa7, fs2
	flw	fs5, 44(a0)
	flw	fs2, 44(a0)
	flw	fa7, 44(a0)
	fmadd.s	fs4, fs3, fs5, fs4
	fsw	ft7, 32(a2)
	fsw	ft8, 36(a2)
	fsw	ft9, 40(a2)
	fsw	fs4, 44(a2)
	flw	ft8, 48(a0)
	flw	fs4, 48(a0)
	flw	ft7, 48(a0)
	flw	ft9, 52(a0)
	flw	fs5, 48(a2)
	flw	fs6, 52(a2)
	flw	fs7, 56(a2)
	flw	fs8, 60(a2)
	fmadd.s	fs5, fs3, ft8, fs5
	fmadd.s	fs6, fs3, ft9, fs6
	flw	fs9, 56(a0)
	flw	ft8, 56(a0)
	fmadd.s	fs10, fs3, fs9, fs7
	flw	fs11, 60(a0)
	flw	ft9, 60(a0)
	fmadd.s	fs8, fs3, fs11, fs8
	flw	fs7, 20(a0)
	flw	fs3, 20(a0)
	fsw	fs5, 48(a2)
	fsw	fs6, 52(a2)
	fsw	fs10, 56(a2)
	fsw	fs8, 60(a2)
	flw	fs5, 64(a2)
	flw	fs6, 68(a2)
	flw	fs8, 72(a2)
	flw	fs10, 76(a2)
	fmv.s	fa3, fa5
	fmadd.s	fs5, ft5, fa5, fs5
	fmadd.s	fs6, ft5, ft3, fs6
	fmadd.s	fs8, ft5, ft4, fs8
	fmadd.s	fs10, ft5, ft6, fs10
	fsw	fs5, 64(a2)
	fsw	fs6, 68(a2)
	fsw	fs8, 72(a2)
	fsw	fs10, 76(a2)
	flw	fs5, 80(a2)
	flw	fs6, 84(a2)
	flw	fs8, 88(a2)
	flw	fs10, 92(a2)
	fmadd.s	fs5, ft5, fa6, fs5
	fmadd.s	fs6, ft5, fs7, fs6
	fmadd.s	fs8, ft5, ft10, fs8
	fmadd.s	fs10, ft5, ft11, fs10
	fsw	fs5, 80(a2)
	fsw	fs6, 84(a2)
	fsw	fs8, 88(a2)
	fsw	fs10, 92(a2)
	flw	fs5, 96(a2)
	flw	fs6, 100(a2)
	flw	fs8, 104(a2)
	flw	fs10, 108(a2)
	fmadd.s	fa5, ft5, fs0, fs5
	flw	fa2, 36(a0)
	flw	fs5, 36(a0)
	fmadd.s	fs6, ft5, fa2, fs6
	fsw	fa5, 96(a2)
	fmadd.s	fa5, ft5, fs1, fs8
	fsw	fs6, 100(a2)
	fmadd.s	fs6, ft5, fs2, fs10
	fsw	fa5, 104(a2)
	fsw	fs6, 108(a2)
	flw	fa5, 120(a2)
	flw	fs6, 124(a2)
	fmadd.s	fa5, ft5, fs9, fa5
	fmadd.s	fs8, ft5, fs11, fs6
	flw	fs6, 112(a2)
	flw	fs9, 116(a2)
	fmadd.s	fs10, ft5, fs4, fs6
	flw	fs11, 52(a0)
	flw	fs6, 52(a0)
	fmadd.s	ft5, ft5, fs11, fs9
	fsw	fs10, 112(a2)
	fsw	ft5, 116(a2)
	fsw	fa5, 120(a2)
	fsw	fs8, 124(a2)
	flw	fa5, 128(a2)
	flw	ft5, 132(a2)
	flw	fs8, 136(a2)
	flw	fs9, 140(a2)
	fmadd.s	fs10, fa1, fa3, fa5
	fmadd.s	ft3, fa1, ft3, ft5
	flw	ft5, 8(a0)
	fmadd.s	ft4, fa1, ft4, fs8
	flw	fs8, 24(a0)
	fmadd.s	ft6, fa1, ft6, fs9
	flw	fa5, 40(a0)
	fsw	fs10, 128(a2)
	fsw	ft3, 132(a2)
	fsw	ft4, 136(a2)
	fsw	ft6, 140(a2)
	flw	ft3, 144(a2)
	flw	ft4, 148(a2)
	flw	ft6, 152(a2)
	flw	fs9, 156(a2)
	fmadd.s	ft3, fa1, fa6, ft3
	fmadd.s	ft4, fa1, fs7, ft4
	fmadd.s	ft6, fa1, ft10, ft6
	fmadd.s	fa6, fa1, ft11, fs9
	fsw	ft3, 144(a2)
	fsw	ft4, 148(a2)
	fsw	ft6, 152(a2)
	fsw	fa6, 156(a2)
	flw	ft3, 160(a2)
	flw	ft4, 164(a2)
	flw	ft6, 168(a2)
	flw	fa6, 172(a2)
	fmadd.s	ft3, fa1, fs0, ft3
	fmadd.s	fa3, fa1, fa2, ft4
	fmadd.s	ft4, fa1, fs1, ft6
	fmadd.s	ft6, fa1, fs2, fa6
	fsw	ft3, 160(a2)
	fsw	fa3, 164(a2)
	fsw	ft4, 168(a2)
	fsw	ft6, 172(a2)
	flw	fa3, 176(a2)
	flw	ft3, 180(a2)
	flw	ft4, 184(a2)
	flw	ft6, 188(a2)
	fmadd.s	fa3, fa1, fs4, fa3
	fmadd.s	ft3, fa1, fs11, ft3
	fmadd.s	ft4, fa1, ft8, ft4
	fmadd.s	fa1, fa1, ft9, ft6
	fsw	fa3, 176(a2)
	fsw	ft3, 180(a2)
	fsw	ft4, 184(a2)
	fsw	fa1, 188(a2)
	flw	fa3, 192(a2)
	flw	fa1, 196(a2)
	flw	ft3, 200(a2)
	flw	ft4, 204(a2)
	flw	fa2, 12(sp)                     # 4-byte Folded Reload
	fmadd.s	fa3, fa4, fa2, fa3
	flw	fa2, 8(sp)                      # 4-byte Folded Reload
	fmadd.s	fa2, fa4, fa2, fa1
	fmadd.s	fa1, fa4, ft5, ft3
	fmadd.s	fa0, fa4, fa0, ft4
	fsw	fa3, 192(a2)
	fsw	fa2, 196(a2)
	fsw	fa1, 200(a2)
	fsw	fa0, 204(a2)
	flw	fa3, 208(a2)
	flw	fa2, 212(a2)
	flw	fa1, 216(a2)
	flw	fa0, 220(a2)
	fmadd.s	fa3, fa4, ft0, fa3
	fmadd.s	fa2, fa4, fs3, fa2
	fmadd.s	fa1, fa4, fs8, fa1
	fmadd.s	fa0, fa4, ft1, fa0
	fsw	fa3, 208(a2)
	fsw	fa2, 212(a2)
	fsw	fa1, 216(a2)
	fsw	fa0, 220(a2)
	flw	fa3, 224(a2)
	flw	fa2, 228(a2)
	flw	fa1, 232(a2)
	flw	fa0, 236(a2)
	fmadd.s	fa3, fa4, ft2, fa3
	fmadd.s	fa2, fa4, fs5, fa2
	fmadd.s	fa5, fa4, fa5, fa1
	fmadd.s	fa1, fa4, fa7, fa0
	fsw	fa3, 224(a2)
	fsw	fa2, 228(a2)
	fsw	fa5, 232(a2)
	fsw	fa1, 236(a2)
	flw	fa5, 240(a2)
	flw	fa3, 244(a2)
	flw	fa2, 248(a2)
	flw	fa1, 252(a2)
	fmadd.s	fa5, fa4, ft7, fa5
	fmadd.s	fa3, fa4, fs6, fa3
	fmadd.s	fa2, fa4, ft8, fa2
	fmadd.s	fa4, fa4, ft9, fa1
	fsw	fa5, 240(a2)
	fsw	fa3, 244(a2)
	fsw	fa2, 248(a2)
	fsw	fa4, 252(a2)
	fld	fs0, 104(sp)                    # 8-byte Folded Reload
	fld	fs1, 96(sp)                     # 8-byte Folded Reload
	fld	fs2, 88(sp)                     # 8-byte Folded Reload
	fld	fs3, 80(sp)                     # 8-byte Folded Reload
	fld	fs4, 72(sp)                     # 8-byte Folded Reload
	fld	fs5, 64(sp)                     # 8-byte Folded Reload
	fld	fs6, 56(sp)                     # 8-byte Folded Reload
	fld	fs7, 48(sp)                     # 8-byte Folded Reload
	fld	fs8, 40(sp)                     # 8-byte Folded Reload
	fld	fs9, 32(sp)                     # 8-byte Folded Reload
	fld	fs10, 24(sp)                    # 8-byte Folded Reload
	fld	fs11, 16(sp)                    # 8-byte Folded Reload
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
	addi	sp, sp, 112
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end0:
	.size	test, .Lfunc_end0-test
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
