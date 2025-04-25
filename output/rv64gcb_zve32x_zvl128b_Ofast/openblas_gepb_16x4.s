	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zbs1p0_zve32x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"openblas_gepb_16x4.c"
	.text
	.globl	test                            # -- Begin function test
	.p2align	1
	.type	test,@function
test:                                   # @test
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -272
	.cfi_def_cfa_offset 272
	fsd	fs0, 264(sp)                    # 8-byte Folded Spill
	fsd	fs1, 256(sp)                    # 8-byte Folded Spill
	fsd	fs2, 248(sp)                    # 8-byte Folded Spill
	fsd	fs3, 240(sp)                    # 8-byte Folded Spill
	fsd	fs4, 232(sp)                    # 8-byte Folded Spill
	fsd	fs5, 224(sp)                    # 8-byte Folded Spill
	fsd	fs6, 216(sp)                    # 8-byte Folded Spill
	fsd	fs7, 208(sp)                    # 8-byte Folded Spill
	fsd	fs8, 200(sp)                    # 8-byte Folded Spill
	fsd	fs9, 192(sp)                    # 8-byte Folded Spill
	fsd	fs10, 184(sp)                   # 8-byte Folded Spill
	fsd	fs11, 176(sp)                   # 8-byte Folded Spill
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
	flw	fa5, 0(a0)
	flw	fs9, 0(a0)
	flw	fa4, 0(a0)
	fsw	fa4, 172(sp)                    # 4-byte Folded Spill
	flw	fa4, 4(a0)
	flw	fa3, 0(a2)
	flw	fa2, 4(a2)
	flw	ft0, 8(a2)
	flw	ft2, 12(a2)
	flw	ft4, 16(a0)
	flw	fs8, 16(a0)
	flw	fa1, 16(a0)
	fsw	fa1, 168(sp)                    # 4-byte Folded Spill
	flw	ft6, 20(a0)
	flw	ft7, 16(a2)
	flw	fa6, 20(a2)
	flw	ft8, 24(a2)
	flw	ft10, 28(a2)
	flw	ft11, 32(a0)
	flw	ft9, 32(a0)
	flw	fa1, 32(a0)
	fsw	fa1, 152(sp)                    # 4-byte Folded Spill
	flw	fs0, 36(a0)
	flw	fs1, 32(a2)
	flw	fs2, 36(a2)
	flw	fs3, 40(a2)
	flw	fs4, 44(a2)
	flw	ft5, 8(a0)
	flw	fa1, 8(a0)
	flw	fs5, 24(a0)
	flw	ft1, 24(a0)
	flw	fs7, 0(a1)
	flw	ft3, 4(a1)
	flw	fs6, 8(a1)
	flw	fa0, 12(a1)
	fmadd.s	fa5, fs7, fa5, fa3
	fsw	fa5, 164(sp)                    # 4-byte Folded Spill
	fmadd.s	fa5, fs7, fa4, fa2
	fsw	fa5, 160(sp)                    # 4-byte Folded Spill
	flw	fa5, 12(a0)
	fmadd.s	fa4, fs7, ft5, ft0
	fsw	fa4, 156(sp)                    # 4-byte Folded Spill
	flw	ft5, 12(a0)
	flw	fa4, 12(a0)
	fsw	fa4, 88(sp)                     # 4-byte Folded Spill
	fmadd.s	fa5, fs7, fa5, ft2
	fsw	fa5, 148(sp)                    # 4-byte Folded Spill
	fmadd.s	fa5, fs7, ft4, ft7
	fsw	fa5, 144(sp)                    # 4-byte Folded Spill
	fmadd.s	fa5, fs7, ft6, fa6
	fsw	fa5, 140(sp)                    # 4-byte Folded Spill
	flw	fa5, 28(a0)
	flw	fa3, 28(a0)
	flw	fa4, 28(a0)
	fsw	fa4, 104(sp)                    # 4-byte Folded Spill
	fmadd.s	fa4, fs7, fs5, ft8
	fsw	fa4, 136(sp)                    # 4-byte Folded Spill
	fmadd.s	fa5, fs7, fa5, ft10
	fsw	fa5, 132(sp)                    # 4-byte Folded Spill
	flw	fa5, 40(a0)
	flw	fa2, 40(a0)
	fmadd.s	fa4, fs7, ft11, fs1
	fsw	fa4, 128(sp)                    # 4-byte Folded Spill
	fmadd.s	fa4, fs7, fs0, fs2
	fsw	fa4, 124(sp)                    # 4-byte Folded Spill
	flw	ft0, 44(a0)
	fmadd.s	fa5, fs7, fa5, fs3
	fsw	fa5, 120(sp)                    # 4-byte Folded Spill
	flw	fa4, 44(a0)
	flw	fa5, 44(a0)
	fsw	fa5, 76(sp)                     # 4-byte Folded Spill
	fmadd.s	fa5, fs7, ft0, fs4
	fsw	fa5, 116(sp)                    # 4-byte Folded Spill
	flw	ft0, 48(a0)
	flw	fa5, 48(a0)
	flw	ft2, 48(a0)
	fsw	ft2, 80(sp)                     # 4-byte Folded Spill
	flw	ft2, 52(a0)
	flw	ft4, 48(a2)
	flw	ft6, 52(a2)
	flw	ft7, 56(a2)
	flw	fa6, 60(a2)
	flw	ft8, 56(a0)
	fmadd.s	ft0, fs7, ft0, ft4
	fsw	ft0, 100(sp)                    # 4-byte Folded Spill
	fmadd.s	ft0, fs7, ft2, ft6
	fsw	ft0, 96(sp)                     # 4-byte Folded Spill
	flw	ft4, 56(a0)
	fmadd.s	ft0, fs7, ft8, ft7
	fsw	ft0, 92(sp)                     # 4-byte Folded Spill
	flw	ft2, 60(a0)
	flw	ft6, 120(a2)
	flw	ft7, 124(a2)
	flw	ft0, 60(a0)
	fmadd.s	fa6, fs7, ft2, fa6
	fsw	fa6, 84(sp)                     # 4-byte Folded Spill
	fmadd.s	ft6, ft3, ft8, ft6
	fsw	ft6, 112(sp)                    # 4-byte Folded Spill
	fmadd.s	ft2, ft3, ft2, ft7
	fsw	ft2, 108(sp)                    # 4-byte Folded Spill
	flw	ft8, 4(a0)
	flw	ft2, 64(a2)
	flw	ft6, 68(a2)
	flw	ft7, 72(a2)
	flw	ft10, 76(a2)
	fmadd.s	ft2, ft3, fs9, ft2
	fsw	ft2, 72(sp)                     # 4-byte Folded Spill
	flw	fa6, 4(a0)
	fmadd.s	ft2, ft3, ft8, ft6
	fsw	ft2, 68(sp)                     # 4-byte Folded Spill
	fmadd.s	ft2, ft3, fa1, ft7
	fsw	ft2, 64(sp)                     # 4-byte Folded Spill
	fmadd.s	ft2, ft3, ft5, ft10
	fsw	ft2, 60(sp)                     # 4-byte Folded Spill
	flw	ft10, 20(a0)
	flw	ft2, 80(a2)
	flw	ft6, 84(a2)
	flw	ft11, 88(a2)
	flw	fs0, 92(a2)
	fmadd.s	ft2, ft3, fs8, ft2
	fsw	ft2, 56(sp)                     # 4-byte Folded Spill
	flw	ft7, 20(a0)
	fmadd.s	ft2, ft3, ft10, ft6
	fsw	ft2, 52(sp)                     # 4-byte Folded Spill
	fmadd.s	ft2, ft3, ft1, ft11
	fsw	ft2, 48(sp)                     # 4-byte Folded Spill
	fmadd.s	ft2, ft3, fa3, fs0
	fsw	ft2, 44(sp)                     # 4-byte Folded Spill
	flw	ft11, 36(a0)
	flw	ft2, 96(a2)
	flw	ft6, 100(a2)
	flw	fs0, 104(a2)
	flw	fs1, 108(a2)
	fmadd.s	ft2, ft3, ft9, ft2
	fsw	ft2, 40(sp)                     # 4-byte Folded Spill
	flw	ft2, 36(a0)
	fmadd.s	ft6, ft3, ft11, ft6
	fsw	ft6, 36(sp)                     # 4-byte Folded Spill
	fmadd.s	ft6, ft3, fa2, fs0
	fsw	ft6, 32(sp)                     # 4-byte Folded Spill
	flw	ft6, 112(a2)
	flw	fs0, 116(a2)
	flw	fa7, 52(a0)
	fmadd.s	fs1, ft3, fa4, fs1
	fsw	fs1, 28(sp)                     # 4-byte Folded Spill
	fmadd.s	ft6, ft3, fa5, ft6
	fsw	ft6, 24(sp)                     # 4-byte Folded Spill
	flw	ft6, 52(a0)
	fmadd.s	ft3, ft3, fa7, fs0
	fsw	ft3, 20(sp)                     # 4-byte Folded Spill
	flw	ft3, 128(a2)
	flw	fs0, 132(a2)
	flw	fs1, 136(a2)
	flw	fs2, 140(a2)
	fmadd.s	ft3, fs6, fs9, ft3
	fsw	ft3, 16(sp)                     # 4-byte Folded Spill
	fmadd.s	ft3, fs6, ft8, fs0
	fsw	ft3, 12(sp)                     # 4-byte Folded Spill
	fmadd.s	fa1, fs6, fa1, fs1
	fsw	fa1, 8(sp)                      # 4-byte Folded Spill
	fmadd.s	fa1, fs6, ft5, fs2
	fsw	fa1, 4(sp)                      # 4-byte Folded Spill
	flw	fa1, 144(a2)
	flw	ft3, 148(a2)
	flw	ft5, 152(a2)
	flw	ft8, 156(a2)
	fmadd.s	fs11, fs6, fs8, fa1
	fmadd.s	fa1, fs6, ft10, ft3
	fsw	fa1, 0(sp)                      # 4-byte Folded Spill
	fmadd.s	fs9, fs6, ft1, ft5
	fmadd.s	fs10, fs6, fa3, ft8
	flw	fa3, 160(a2)
	flw	fa1, 164(a2)
	flw	ft1, 168(a2)
	flw	ft3, 172(a2)
	fmadd.s	fs5, fs6, ft9, fa3
	fmadd.s	fs7, fs6, ft11, fa1
	fmadd.s	fs3, fs6, fa2, ft1
	fmadd.s	fs4, fs6, fa4, ft3
	flw	fa4, 176(a2)
	flw	fa3, 180(a2)
	flw	fa2, 184(a2)
	flw	fa1, 188(a2)
	fmadd.s	fs1, fs6, fa5, fa4
	fmadd.s	fs2, fs6, fa7, fa3
	fmadd.s	fs0, fs6, ft4, fa2
	fmadd.s	fs6, fs6, ft0, fa1
	flw	fa5, 8(a0)
	flw	fa4, 192(a2)
	flw	fa3, 196(a2)
	flw	fa2, 200(a2)
	flw	fa1, 204(a2)
	flw	ft1, 172(sp)                    # 4-byte Folded Reload
	fmadd.s	ft8, fa0, ft1, fa4
	fmadd.s	ft11, fa0, fa6, fa3
	fmadd.s	ft9, fa0, fa5, fa2
	flw	fa5, 88(sp)                     # 4-byte Folded Reload
	fmadd.s	ft10, fa0, fa5, fa1
	flw	fa5, 24(a0)
	flw	fa4, 208(a2)
	flw	fa3, 212(a2)
	flw	fa2, 216(a2)
	flw	ft5, 220(a2)
	flw	fa1, 168(sp)                    # 4-byte Folded Reload
	fmadd.s	fa6, fa0, fa1, fa4
	fmadd.s	fa7, fa0, ft7, fa3
	fmadd.s	ft3, fa0, fa5, fa2
	flw	fa5, 104(sp)                    # 4-byte Folded Reload
	fmadd.s	ft5, fa0, fa5, ft5
	flw	fa3, 40(a0)
	flw	fa5, 224(a2)
	flw	fa4, 228(a2)
	flw	fa2, 232(a2)
	flw	ft7, 236(a2)
	flw	fa1, 152(sp)                    # 4-byte Folded Reload
	fmadd.s	fa1, fa0, fa1, fa5
	fmadd.s	ft1, fa0, ft2, fa4
	fmadd.s	fa3, fa0, fa3, fa2
	flw	fa5, 76(sp)                     # 4-byte Folded Reload
	fmadd.s	fa2, fa0, fa5, ft7
	flw	ft2, 240(a2)
	flw	ft7, 244(a2)
	flw	fa4, 248(a2)
	flw	fa5, 252(a2)
	flw	fs8, 80(sp)                     # 4-byte Folded Reload
	fmadd.s	ft2, fa0, fs8, ft2
	fmadd.s	ft6, fa0, ft6, ft7
	fmadd.s	fa4, fa0, ft4, fa4
	fmadd.s	fa5, fa0, ft0, fa5
	flw	fa0, 164(sp)                    # 4-byte Folded Reload
	fsw	fa0, 0(a2)
	flw	fa0, 160(sp)                    # 4-byte Folded Reload
	fsw	fa0, 4(a2)
	flw	fa0, 156(sp)                    # 4-byte Folded Reload
	fsw	fa0, 8(a2)
	flw	fa0, 148(sp)                    # 4-byte Folded Reload
	fsw	fa0, 12(a2)
	flw	fa0, 144(sp)                    # 4-byte Folded Reload
	fsw	fa0, 16(a2)
	flw	fa0, 140(sp)                    # 4-byte Folded Reload
	fsw	fa0, 20(a2)
	flw	fa0, 136(sp)                    # 4-byte Folded Reload
	fsw	fa0, 24(a2)
	flw	fa0, 132(sp)                    # 4-byte Folded Reload
	fsw	fa0, 28(a2)
	flw	fa0, 128(sp)                    # 4-byte Folded Reload
	fsw	fa0, 32(a2)
	flw	fa0, 124(sp)                    # 4-byte Folded Reload
	fsw	fa0, 36(a2)
	flw	fa0, 120(sp)                    # 4-byte Folded Reload
	fsw	fa0, 40(a2)
	flw	fa0, 116(sp)                    # 4-byte Folded Reload
	fsw	fa0, 44(a2)
	flw	fa0, 100(sp)                    # 4-byte Folded Reload
	fsw	fa0, 48(a2)
	flw	fa0, 96(sp)                     # 4-byte Folded Reload
	fsw	fa0, 52(a2)
	flw	fa0, 92(sp)                     # 4-byte Folded Reload
	fsw	fa0, 56(a2)
	flw	fa0, 84(sp)                     # 4-byte Folded Reload
	fsw	fa0, 60(a2)
	flw	fa0, 72(sp)                     # 4-byte Folded Reload
	fsw	fa0, 64(a2)
	flw	fa0, 68(sp)                     # 4-byte Folded Reload
	fsw	fa0, 68(a2)
	flw	fa0, 64(sp)                     # 4-byte Folded Reload
	fsw	fa0, 72(a2)
	flw	fa0, 60(sp)                     # 4-byte Folded Reload
	fsw	fa0, 76(a2)
	flw	fa0, 56(sp)                     # 4-byte Folded Reload
	fsw	fa0, 80(a2)
	flw	fa0, 52(sp)                     # 4-byte Folded Reload
	fsw	fa0, 84(a2)
	flw	fa0, 48(sp)                     # 4-byte Folded Reload
	fsw	fa0, 88(a2)
	flw	fa0, 44(sp)                     # 4-byte Folded Reload
	fsw	fa0, 92(a2)
	flw	fa0, 40(sp)                     # 4-byte Folded Reload
	fsw	fa0, 96(a2)
	flw	fa0, 36(sp)                     # 4-byte Folded Reload
	fsw	fa0, 100(a2)
	flw	fa0, 32(sp)                     # 4-byte Folded Reload
	fsw	fa0, 104(a2)
	flw	fa0, 28(sp)                     # 4-byte Folded Reload
	fsw	fa0, 108(a2)
	flw	fa0, 24(sp)                     # 4-byte Folded Reload
	fsw	fa0, 112(a2)
	flw	fa0, 20(sp)                     # 4-byte Folded Reload
	fsw	fa0, 116(a2)
	flw	fa0, 112(sp)                    # 4-byte Folded Reload
	fsw	fa0, 120(a2)
	flw	fa0, 108(sp)                    # 4-byte Folded Reload
	fsw	fa0, 124(a2)
	flw	fa0, 16(sp)                     # 4-byte Folded Reload
	fsw	fa0, 128(a2)
	flw	fa0, 12(sp)                     # 4-byte Folded Reload
	fsw	fa0, 132(a2)
	flw	fa0, 8(sp)                      # 4-byte Folded Reload
	fsw	fa0, 136(a2)
	flw	fa0, 4(sp)                      # 4-byte Folded Reload
	fsw	fa0, 140(a2)
	fsw	fs11, 144(a2)
	flw	fa0, 0(sp)                      # 4-byte Folded Reload
	fsw	fa0, 148(a2)
	fsw	fs9, 152(a2)
	fsw	fs10, 156(a2)
	fsw	fs5, 160(a2)
	fsw	fs7, 164(a2)
	fsw	fs3, 168(a2)
	fsw	fs4, 172(a2)
	fsw	fs1, 176(a2)
	fsw	fs2, 180(a2)
	fsw	fs0, 184(a2)
	fsw	fs6, 188(a2)
	fsw	ft8, 192(a2)
	fsw	ft11, 196(a2)
	fsw	ft9, 200(a2)
	fsw	ft10, 204(a2)
	fsw	fa6, 208(a2)
	fsw	fa7, 212(a2)
	fsw	ft3, 216(a2)
	fsw	ft5, 220(a2)
	fsw	fa1, 224(a2)
	fsw	ft1, 228(a2)
	fsw	fa3, 232(a2)
	fsw	fa2, 236(a2)
	fsw	ft2, 240(a2)
	fsw	ft6, 244(a2)
	fsw	fa4, 248(a2)
	fsw	fa5, 252(a2)
	fld	fs0, 264(sp)                    # 8-byte Folded Reload
	fld	fs1, 256(sp)                    # 8-byte Folded Reload
	fld	fs2, 248(sp)                    # 8-byte Folded Reload
	fld	fs3, 240(sp)                    # 8-byte Folded Reload
	fld	fs4, 232(sp)                    # 8-byte Folded Reload
	fld	fs5, 224(sp)                    # 8-byte Folded Reload
	fld	fs6, 216(sp)                    # 8-byte Folded Reload
	fld	fs7, 208(sp)                    # 8-byte Folded Reload
	fld	fs8, 200(sp)                    # 8-byte Folded Reload
	fld	fs9, 192(sp)                    # 8-byte Folded Reload
	fld	fs10, 184(sp)                   # 8-byte Folded Reload
	fld	fs11, 176(sp)                   # 8-byte Folded Reload
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
	addi	sp, sp, 272
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end0:
	.size	test, .Lfunc_end0-test
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
