	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zbs1p0_zve32x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"openblas_gepb_16x4.c"
	.text
	.globl	test                            # -- Begin function test
	.p2align	1
	.type	test,@function
test:                                   # @test
.Lfunc_begin0:
	.file	0 "/home/preames/benchmarking/simple-vector-riscv" "openblas_gepb_16x4.c" md5 0xd8686e7109744cf94f07a7a2da3a108c
	.loc	0 5 0                           # openblas_gepb_16x4.c:5:0
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: test:A <- $x10
	#DEBUG_VALUE: test:B <- $x11
	#DEBUG_VALUE: test:C <- $x12
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
.Ltmp0:
	#DEBUG_VALUE: ki <- 0
	.loc	0 8 34 prologue_end             # openblas_gepb_16x4.c:8:34
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
	.loc	0 8 31 is_stmt 0                # openblas_gepb_16x4.c:8:31
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
.Ltmp1:
	#DEBUG_VALUE: kj <- 0
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	ft8, 4(a1)
	flw	fa5, 8(a1)
	flw	fs9, 12(a1)
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
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
.Ltmp2:
	#DEBUG_VALUE: kj <- 1
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	fs0, 152(sp)                    # 4-byte Folded Reload
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fs0, 4(a2)
.Ltmp3:
	#DEBUG_VALUE: kj <- 2
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	fs0, 148(sp)                    # 4-byte Folded Reload
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fs0, 8(a2)
.Ltmp4:
	#DEBUG_VALUE: kj <- 3
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	fs0, 144(sp)                    # 4-byte Folded Reload
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fs0, 12(a2)
.Ltmp5:
	#DEBUG_VALUE: kj <- 4
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	fs0, 140(sp)                    # 4-byte Folded Reload
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fs0, 16(a2)
.Ltmp6:
	#DEBUG_VALUE: kj <- 5
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	fs0, 136(sp)                    # 4-byte Folded Reload
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fs0, 20(a2)
.Ltmp7:
	#DEBUG_VALUE: kj <- 6
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	fs0, 132(sp)                    # 4-byte Folded Reload
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fs0, 24(a2)
.Ltmp8:
	#DEBUG_VALUE: kj <- 7
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	fs0, 128(sp)                    # 4-byte Folded Reload
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fs0, 28(a2)
.Ltmp9:
	#DEBUG_VALUE: kj <- 8
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	fs0, 124(sp)                    # 4-byte Folded Reload
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fs0, 32(a2)
.Ltmp10:
	#DEBUG_VALUE: kj <- 9
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	fs0, 120(sp)                    # 4-byte Folded Reload
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fs0, 36(a2)
.Ltmp11:
	#DEBUG_VALUE: kj <- 10
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	fs0, 116(sp)                    # 4-byte Folded Reload
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fs0, 40(a2)
.Ltmp12:
	#DEBUG_VALUE: kj <- 11
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	fs0, 112(sp)                    # 4-byte Folded Reload
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fs0, 44(a2)
.Ltmp13:
	#DEBUG_VALUE: kj <- 12
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	fs0, 108(sp)                    # 4-byte Folded Reload
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fs0, 48(a2)
.Ltmp14:
	#DEBUG_VALUE: kj <- 13
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	fs0, 104(sp)                    # 4-byte Folded Reload
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fs0, 52(a2)
.Ltmp15:
	#DEBUG_VALUE: kj <- 14
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	fs0, 100(sp)                    # 4-byte Folded Reload
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fs0, 56(a2)
.Ltmp16:
	#DEBUG_VALUE: kj <- 15
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	fs0, 96(sp)                     # 4-byte Folded Reload
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fs0, 60(a2)
.Ltmp17:
	#DEBUG_VALUE: ki <- 1
	#DEBUG_VALUE: kj <- 16
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	fs0, 92(sp)                     # 4-byte Folded Reload
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fs0, 64(a2)
.Ltmp18:
	#DEBUG_VALUE: kj <- 1
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	fs0, 88(sp)                     # 4-byte Folded Reload
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fs0, 68(a2)
.Ltmp19:
	#DEBUG_VALUE: kj <- 2
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	fs0, 84(sp)                     # 4-byte Folded Reload
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fs0, 72(a2)
.Ltmp20:
	#DEBUG_VALUE: kj <- 3
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	fs0, 80(sp)                     # 4-byte Folded Reload
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fs0, 76(a2)
.Ltmp21:
	#DEBUG_VALUE: kj <- 4
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	fs0, 76(sp)                     # 4-byte Folded Reload
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fs0, 80(a2)
.Ltmp22:
	#DEBUG_VALUE: kj <- 5
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	fs0, 72(sp)                     # 4-byte Folded Reload
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fs0, 84(a2)
.Ltmp23:
	#DEBUG_VALUE: kj <- 6
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	fs0, 68(sp)                     # 4-byte Folded Reload
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fs0, 88(a2)
.Ltmp24:
	#DEBUG_VALUE: kj <- 7
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	fs0, 64(sp)                     # 4-byte Folded Reload
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fs0, 92(a2)
.Ltmp25:
	#DEBUG_VALUE: kj <- 8
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	fs0, 60(sp)                     # 4-byte Folded Reload
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fs0, 96(a2)
.Ltmp26:
	#DEBUG_VALUE: kj <- 9
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	fs0, 56(sp)                     # 4-byte Folded Reload
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fs0, 100(a2)
.Ltmp27:
	#DEBUG_VALUE: kj <- 10
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	fs0, 52(sp)                     # 4-byte Folded Reload
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fs0, 104(a2)
.Ltmp28:
	#DEBUG_VALUE: kj <- 11
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	fs0, 48(sp)                     # 4-byte Folded Reload
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fs0, 108(a2)
.Ltmp29:
	#DEBUG_VALUE: kj <- 12
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	fs0, 44(sp)                     # 4-byte Folded Reload
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fs0, 112(a2)
.Ltmp30:
	#DEBUG_VALUE: kj <- 13
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	fs0, 40(sp)                     # 4-byte Folded Reload
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fs0, 116(a2)
.Ltmp31:
	#DEBUG_VALUE: kj <- 14
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	fs0, 36(sp)                     # 4-byte Folded Reload
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fs0, 120(a2)
.Ltmp32:
	#DEBUG_VALUE: kj <- 15
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	fs0, 32(sp)                     # 4-byte Folded Reload
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fs0, 124(a2)
.Ltmp33:
	#DEBUG_VALUE: ki <- 2
	#DEBUG_VALUE: kj <- 16
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	fs0, 28(sp)                     # 4-byte Folded Reload
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fs0, 128(a2)
.Ltmp34:
	#DEBUG_VALUE: kj <- 1
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	fs0, 24(sp)                     # 4-byte Folded Reload
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fs0, 132(a2)
.Ltmp35:
	#DEBUG_VALUE: kj <- 2
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	fs0, 20(sp)                     # 4-byte Folded Reload
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fs0, 136(a2)
.Ltmp36:
	#DEBUG_VALUE: kj <- 3
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	fs0, 16(sp)                     # 4-byte Folded Reload
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fs0, 140(a2)
.Ltmp37:
	#DEBUG_VALUE: kj <- 4
	fsw	fs10, 144(a2)
.Ltmp38:
	#DEBUG_VALUE: kj <- 5
	fsw	fs11, 148(a2)
.Ltmp39:
	#DEBUG_VALUE: kj <- 6
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	fs0, 12(sp)                     # 4-byte Folded Reload
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fs0, 152(a2)
.Ltmp40:
	#DEBUG_VALUE: kj <- 7
	fsw	fs8, 156(a2)
.Ltmp41:
	#DEBUG_VALUE: kj <- 8
	fsw	fs5, 160(a2)
.Ltmp42:
	#DEBUG_VALUE: kj <- 9
	fsw	fs6, 164(a2)
.Ltmp43:
	#DEBUG_VALUE: kj <- 10
	fsw	fs7, 168(a2)
.Ltmp44:
	#DEBUG_VALUE: kj <- 11
	fsw	fs2, 172(a2)
.Ltmp45:
	#DEBUG_VALUE: kj <- 12
	fsw	ft9, 176(a2)
.Ltmp46:
	#DEBUG_VALUE: kj <- 13
	fsw	ft11, 180(a2)
.Ltmp47:
	#DEBUG_VALUE: kj <- 14
	fsw	fa2, 184(a2)
.Ltmp48:
	#DEBUG_VALUE: kj <- 15
	fsw	ft8, 188(a2)
.Ltmp49:
	#DEBUG_VALUE: ki <- 3
	#DEBUG_VALUE: kj <- 16
	fsw	fa6, 192(a2)
.Ltmp50:
	#DEBUG_VALUE: kj <- 1
	fsw	ft7, 196(a2)
.Ltmp51:
	#DEBUG_VALUE: kj <- 2
	fsw	ft6, 200(a2)
.Ltmp52:
	#DEBUG_VALUE: kj <- 3
	fsw	fa7, 204(a2)
.Ltmp53:
	#DEBUG_VALUE: kj <- 4
	fsw	ft5, 208(a2)
.Ltmp54:
	#DEBUG_VALUE: kj <- 5
	fsw	ft4, 212(a2)
.Ltmp55:
	#DEBUG_VALUE: kj <- 6
	fsw	ft3, 216(a2)
.Ltmp56:
	#DEBUG_VALUE: kj <- 7
	fsw	ft2, 220(a2)
.Ltmp57:
	#DEBUG_VALUE: kj <- 8
	fsw	ft1, 224(a2)
.Ltmp58:
	#DEBUG_VALUE: kj <- 9
	fsw	ft0, 228(a2)
.Ltmp59:
	#DEBUG_VALUE: kj <- 10
	fsw	fa0, 232(a2)
.Ltmp60:
	#DEBUG_VALUE: kj <- 11
	fsw	fa1, 236(a2)
.Ltmp61:
	#DEBUG_VALUE: kj <- 12
	fsw	fa5, 240(a2)
.Ltmp62:
	#DEBUG_VALUE: kj <- 13
	fsw	fa4, 244(a2)
.Ltmp63:
	#DEBUG_VALUE: kj <- 14
	fsw	fa3, 248(a2)
.Ltmp64:
	#DEBUG_VALUE: kj <- 15
	fsw	ft10, 252(a2)
.Ltmp65:
	#DEBUG_VALUE: ki <- 4
	#DEBUG_VALUE: kj <- 16
	.loc	0 11 1 epilogue_begin is_stmt 1 # openblas_gepb_16x4.c:11:1
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
.Ltmp66:
.Lfunc_end0:
	.size	test, .Lfunc_end0-test
	.cfi_endproc
                                        # -- End function
	.section	.debug_loclists,"",@progbits
	.word	.Ldebug_list_header_end0-.Ldebug_list_header_start0 # Length
.Ldebug_list_header_start0:
	.half	5                               # Version
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
	.word	2                               # Offset entry count
.Lloclists_table_base0:
	.word	.Ldebug_loc0-.Lloclists_table_base0
	.word	.Ldebug_loc1-.Lloclists_table_base0
.Ldebug_loc0:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp0-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp17-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	0                               # 0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp17-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp33-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	1                               # 1
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp33-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp49-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	2                               # 2
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp49-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp65-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	3                               # 3
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp65-.Lfunc_begin0          #   starting offset
	.uleb128 .Lfunc_end0-.Lfunc_begin0      #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	4                               # 4
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc1:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp1-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp2-.Lfunc_begin0           #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	0                               # 0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp2-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp3-.Lfunc_begin0           #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	1                               # 1
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp3-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp4-.Lfunc_begin0           #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	2                               # 2
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp4-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp5-.Lfunc_begin0           #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	3                               # 3
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp5-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp6-.Lfunc_begin0           #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	4                               # 4
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp6-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp7-.Lfunc_begin0           #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	5                               # 5
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp7-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp8-.Lfunc_begin0           #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	6                               # 6
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp8-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp9-.Lfunc_begin0           #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	7                               # 7
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp9-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp10-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp10-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp11-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	9                               # 9
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp11-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp12-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	10                              # 10
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp12-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp13-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	11                              # 11
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp13-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp14-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	12                              # 12
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp14-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp15-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	13                              # 13
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp15-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp16-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	14                              # 14
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp16-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp17-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	15                              # 15
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp17-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp18-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	16                              # 16
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp18-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp19-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	1                               # 1
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp19-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp20-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	2                               # 2
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp20-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp21-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	3                               # 3
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp21-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp22-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	4                               # 4
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp22-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp23-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	5                               # 5
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp23-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp24-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	6                               # 6
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp24-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp25-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	7                               # 7
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp25-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp26-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp26-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp27-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	9                               # 9
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp27-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp28-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	10                              # 10
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp28-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp29-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	11                              # 11
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp29-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp30-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	12                              # 12
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp30-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp31-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	13                              # 13
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp31-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp32-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	14                              # 14
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp32-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp33-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	15                              # 15
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp33-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp34-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	16                              # 16
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp34-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp35-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	1                               # 1
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp35-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp36-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	2                               # 2
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp36-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp37-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	3                               # 3
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp37-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp38-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	4                               # 4
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp38-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp39-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	5                               # 5
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp39-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp40-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	6                               # 6
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp40-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp41-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	7                               # 7
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp41-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp42-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp42-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp43-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	9                               # 9
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp43-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp44-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	10                              # 10
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp44-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp45-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	11                              # 11
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp45-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp46-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	12                              # 12
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp46-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp47-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	13                              # 13
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp47-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp48-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	14                              # 14
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp48-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp49-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	15                              # 15
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp49-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp50-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	16                              # 16
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp50-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp51-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	1                               # 1
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp51-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp52-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	2                               # 2
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp52-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp53-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	3                               # 3
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp53-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp54-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	4                               # 4
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp54-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp55-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	5                               # 5
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp55-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp56-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	6                               # 6
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp56-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp57-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	7                               # 7
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp57-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp58-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp58-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp59-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	9                               # 9
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp59-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp60-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	10                              # 10
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp60-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp61-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	11                              # 11
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp61-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp62-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	12                              # 12
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp62-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp63-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	13                              # 13
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp63-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp64-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	14                              # 14
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp64-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp65-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	15                              # 15
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp65-.Lfunc_begin0          #   starting offset
	.uleb128 .Lfunc_end0-.Lfunc_begin0      #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	16                              # 16
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_list_header_end0:
	.section	.debug_abbrev,"",@progbits
	.byte	1                               # Abbreviation Code
	.byte	17                              # DW_TAG_compile_unit
	.byte	1                               # DW_CHILDREN_yes
	.byte	37                              # DW_AT_producer
	.byte	37                              # DW_FORM_strx1
	.byte	19                              # DW_AT_language
	.byte	5                               # DW_FORM_data2
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	114                             # DW_AT_str_offsets_base
	.byte	23                              # DW_FORM_sec_offset
	.byte	16                              # DW_AT_stmt_list
	.byte	23                              # DW_FORM_sec_offset
	.byte	27                              # DW_AT_comp_dir
	.byte	37                              # DW_FORM_strx1
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	115                             # DW_AT_addr_base
	.byte	23                              # DW_FORM_sec_offset
	.ascii	"\214\001"                      # DW_AT_loclists_base
	.byte	23                              # DW_FORM_sec_offset
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	2                               # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	64                              # DW_AT_frame_base
	.byte	24                              # DW_FORM_exprloc
	.byte	122                             # DW_AT_call_all_calls
	.byte	25                              # DW_FORM_flag_present
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	39                              # DW_AT_prototyped
	.byte	25                              # DW_FORM_flag_present
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	3                               # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	4                               # Abbreviation Code
	.byte	11                              # DW_TAG_lexical_block
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	5                               # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	34                              # DW_FORM_loclistx
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	6                               # Abbreviation Code
	.byte	55                              # DW_TAG_restrict_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	7                               # Abbreviation Code
	.byte	15                              # DW_TAG_pointer_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	8                               # Abbreviation Code
	.byte	38                              # DW_TAG_const_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	9                               # Abbreviation Code
	.byte	36                              # DW_TAG_base_type
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	62                              # DW_AT_encoding
	.byte	11                              # DW_FORM_data1
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	0                               # EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.word	.Ldebug_info_end0-.Ldebug_info_start0 # Length of Unit
.Ldebug_info_start0:
	.half	5                               # DWARF version number
	.byte	1                               # DWARF Unit Type
	.byte	8                               # Address Size (in bytes)
	.word	.debug_abbrev                   # Offset Into Abbrev. Section
	.byte	1                               # Abbrev [1] 0xc:0x87 DW_TAG_compile_unit
	.byte	0                               # DW_AT_producer
	.half	29                              # DW_AT_language
	.byte	1                               # DW_AT_name
	.word	.Lstr_offsets_base0             # DW_AT_str_offsets_base
	.word	.Lline_table_start0             # DW_AT_stmt_list
	.byte	2                               # DW_AT_comp_dir
	.byte	0                               # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.word	.Laddr_table_base0              # DW_AT_addr_base
	.word	.Lloclists_table_base0          # DW_AT_loclists_base
	.byte	2                               # Abbrev [2] 0x27:0x4a DW_TAG_subprogram
	.byte	0                               # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	82
                                        # DW_AT_call_all_calls
	.byte	3                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	3                               # Abbrev [3] 0x32:0xa DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	90
	.byte	4                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.word	113                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x3c:0xa DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	91
	.byte	6                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.word	113                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x46:0xa DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	92
	.byte	7                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.word	132                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x50:0x20 DW_TAG_lexical_block
	.byte	1                               # DW_AT_low_pc
	.word	.Ltmp65-.Ltmp0                  # DW_AT_high_pc
	.byte	5                               # Abbrev [5] 0x56:0x9 DW_TAG_variable
	.byte	0                               # DW_AT_location
	.byte	8                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	6                               # DW_AT_decl_line
	.word	142                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x5f:0x10 DW_TAG_lexical_block
	.byte	1                               # DW_AT_low_pc
	.word	.Ltmp65-.Ltmp0                  # DW_AT_high_pc
	.byte	5                               # Abbrev [5] 0x65:0x9 DW_TAG_variable
	.byte	1                               # DW_AT_location
	.byte	10                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	7                               # DW_AT_decl_line
	.word	142                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	6                               # Abbrev [6] 0x71:0x5 DW_TAG_restrict_type
	.word	118                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x76:0x5 DW_TAG_pointer_type
	.word	123                             # DW_AT_type
	.byte	8                               # Abbrev [8] 0x7b:0x5 DW_TAG_const_type
	.word	128                             # DW_AT_type
	.byte	9                               # Abbrev [9] 0x80:0x4 DW_TAG_base_type
	.byte	5                               # DW_AT_name
	.byte	4                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	6                               # Abbrev [6] 0x84:0x5 DW_TAG_restrict_type
	.word	137                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x89:0x5 DW_TAG_pointer_type
	.word	128                             # DW_AT_type
	.byte	9                               # Abbrev [9] 0x8e:0x4 DW_TAG_base_type
	.byte	9                               # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	0                               # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_str_offsets,"",@progbits
	.word	48                              # Length of String Offsets Set
	.half	5
	.half	0
.Lstr_offsets_base0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)" # string offset=0
.Linfo_string1:
	.asciz	"openblas_gepb_16x4.c"          # string offset=108
.Linfo_string2:
	.asciz	"/home/preames/benchmarking/simple-vector-riscv" # string offset=129
.Linfo_string3:
	.asciz	"test"                          # string offset=176
.Linfo_string4:
	.asciz	"A"                             # string offset=181
.Linfo_string5:
	.asciz	"float"                         # string offset=183
.Linfo_string6:
	.asciz	"B"                             # string offset=189
.Linfo_string7:
	.asciz	"C"                             # string offset=191
.Linfo_string8:
	.asciz	"ki"                            # string offset=193
.Linfo_string9:
	.asciz	"int"                           # string offset=196
.Linfo_string10:
	.asciz	"kj"                            # string offset=200
	.section	.debug_str_offsets,"",@progbits
	.word	.Linfo_string0
	.word	.Linfo_string1
	.word	.Linfo_string2
	.word	.Linfo_string3
	.word	.Linfo_string4
	.word	.Linfo_string5
	.word	.Linfo_string6
	.word	.Linfo_string7
	.word	.Linfo_string8
	.word	.Linfo_string9
	.word	.Linfo_string10
	.section	.debug_addr,"",@progbits
	.word	.Ldebug_addr_end0-.Ldebug_addr_start0 # Length of contribution
.Ldebug_addr_start0:
	.half	5                               # DWARF version number
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
.Laddr_table_base0:
	.quad	.Lfunc_begin0
	.quad	.Ltmp0
.Ldebug_addr_end0:
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.section	.debug_line,"",@progbits
.Lline_table_start0:
