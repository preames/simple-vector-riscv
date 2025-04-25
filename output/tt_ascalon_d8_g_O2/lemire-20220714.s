	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_h1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zifencei2p0_zihintntl1p0_zihintpause2p0_zihpm2p0_zimop1p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zawrs1p0_zfa1p0_zfbfmin1p0_zfh1p0_zfhmin1p0_zca1p0_zcb1p0_zcd1p0_zcmop1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0_zvbb1p0_zvbc1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfbfmin1p0_zvfbfwma1p0_zvfh1p0_zvfhmin1p0_zvkb1p0_zvkg1p0_zvkn1p0_zvknc1p0_zvkned1p0_zvkng1p0_zvknhb1p0_zvkt1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0_sha1p0_shcounterenw1p0_shgatpa1p0_shtvala1p0_shvsatpa1p0_shvstvala1p0_shvstvecd1p0_smaia1p0_ssaia1p0_ssccptr1p0_sscofpmf1p0_sscounterenw1p0_ssnpm1p0_ssstateen1p0_ssstrict1p0_sstc1p0_sstvala1p0_sstvecd1p0_ssu64xl1p0_supm1p0_svade1p0_svbare1p0_svinval1p0_svnapot1p0_svpbmt1p0"
	.file	"lemire-20220714.c"
	.text
	.globl	remove_negatives_scalar         # -- Begin function remove_negatives_scalar
	.p2align	1
	.type	remove_negatives_scalar,@function
remove_negatives_scalar:                # @remove_negatives_scalar
.Lfunc_begin0:
	.file	0 "/home/preames/benchmarking/simple-vector-riscv" "lemire-20220714.c" md5 0x487a42c4803e2668d0e22f6b54fd968a
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: remove_negatives_scalar:input <- $x10
	#DEBUG_VALUE: remove_negatives_scalar:count <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	#DEBUG_VALUE: remove_negatives_scalar:i <- 0
	#DEBUG_VALUE: remove_negatives_scalar:j <- 0
	.loc	0 8 3 prologue_end              # lemire-20220714.c:8:3
	blez	a1, .LBB0_21
.Ltmp0:
# %bb.1:                                # %for.body.preheader
	#DEBUG_VALUE: remove_negatives_scalar:j <- 0
	#DEBUG_VALUE: remove_negatives_scalar:i <- 0
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	#DEBUG_VALUE: remove_negatives_scalar:count <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:input <- $x10
	andi	a6, a1, 7
	srli	a3, a1, 3
	beqz	a3, .LBB0_22
.Ltmp1:
# %bb.2:                                # %for.body.preheader.new
	#DEBUG_VALUE: remove_negatives_scalar:j <- 0
	#DEBUG_VALUE: remove_negatives_scalar:i <- 0
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	#DEBUG_VALUE: remove_negatives_scalar:count <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:input <- $x10
	slli	a3, a3, 4
	li	t0, 0
	li	a1, 0
.Ltmp2:
	addi	a5, a0, 16
	srli	a3, a3, 1
	neg	a7, a3
	j	.LBB0_4
.Ltmp3:
.LBB0_3:                                # %for.inc.7
                                        #   in Loop: Header=BB0_4 Depth=1
	#DEBUG_VALUE: remove_negatives_scalar:i <- [DW_OP_constu 7, DW_OP_or, DW_OP_stack_value] $x5
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	#DEBUG_VALUE: remove_negatives_scalar:input <- $x10
	#DEBUG_VALUE: remove_negatives_scalar:i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 8, DW_OP_plus, DW_OP_stack_value] $x5
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	.loc	0 8 3                           # lemire-20220714.c:8:3
	addi	t0, t0, -8
.Ltmp4:
	addi	a5, a5, 32
	beq	a7, t0, .LBB0_20
.Ltmp5:
.LBB0_4:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	#DEBUG_VALUE: remove_negatives_scalar:input <- $x10
	#DEBUG_VALUE: remove_negatives_scalar:i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_stack_value] $x5
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	.loc	0 9 8                           # lemire-20220714.c:9:8
	lw	a3, -16(a5)
	.loc	0 9 17 is_stmt 0                # lemire-20220714.c:9:17
	bltz	a3, .LBB0_6
.Ltmp6:
# %bb.5:                                # %if.then
                                        #   in Loop: Header=BB0_4 Depth=1
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_stack_value] $x5
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	#DEBUG_VALUE: remove_negatives_scalar:input <- $x10
	.loc	0 10 7 is_stmt 1                # lemire-20220714.c:10:7
	sh2add	a4, a1, a2
	.loc	0 10 15 is_stmt 0               # lemire-20220714.c:10:15
	addi	a1, a1, 1
.Ltmp7:
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	.loc	0 10 19                         # lemire-20220714.c:10:19
	sw	a3, 0(a4)
.Ltmp8:
.LBB0_6:                                # %for.inc
                                        #   in Loop: Header=BB0_4 Depth=1
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_stack_value] $x5
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	#DEBUG_VALUE: remove_negatives_scalar:input <- $x10
	#DEBUG_VALUE: remove_negatives_scalar:i <- [DW_OP_constu 1, DW_OP_or, DW_OP_stack_value] $x5
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	.loc	0 9 8 is_stmt 1                 # lemire-20220714.c:9:8
	lw	a3, -12(a5)
	.loc	0 9 17 is_stmt 0                # lemire-20220714.c:9:17
	bltz	a3, .LBB0_8
.Ltmp9:
# %bb.7:                                # %if.then.1
                                        #   in Loop: Header=BB0_4 Depth=1
	#DEBUG_VALUE: remove_negatives_scalar:i <- [DW_OP_constu 1, DW_OP_or, DW_OP_stack_value] $x5
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	#DEBUG_VALUE: remove_negatives_scalar:input <- $x10
	.loc	0 10 7 is_stmt 1                # lemire-20220714.c:10:7
	sh2add	a4, a1, a2
	.loc	0 10 15 is_stmt 0               # lemire-20220714.c:10:15
	addi	a1, a1, 1
.Ltmp10:
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	.loc	0 10 19                         # lemire-20220714.c:10:19
	sw	a3, 0(a4)
.Ltmp11:
.LBB0_8:                                # %for.inc.1
                                        #   in Loop: Header=BB0_4 Depth=1
	#DEBUG_VALUE: remove_negatives_scalar:i <- [DW_OP_constu 1, DW_OP_or, DW_OP_stack_value] $x5
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	#DEBUG_VALUE: remove_negatives_scalar:input <- $x10
	#DEBUG_VALUE: remove_negatives_scalar:i <- [DW_OP_constu 2, DW_OP_or, DW_OP_stack_value] $x5
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	.loc	0 9 8 is_stmt 1                 # lemire-20220714.c:9:8
	lw	a3, -8(a5)
	.loc	0 9 17 is_stmt 0                # lemire-20220714.c:9:17
	bltz	a3, .LBB0_10
.Ltmp12:
# %bb.9:                                # %if.then.2
                                        #   in Loop: Header=BB0_4 Depth=1
	#DEBUG_VALUE: remove_negatives_scalar:i <- [DW_OP_constu 2, DW_OP_or, DW_OP_stack_value] $x5
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	#DEBUG_VALUE: remove_negatives_scalar:input <- $x10
	.loc	0 10 7 is_stmt 1                # lemire-20220714.c:10:7
	sh2add	a4, a1, a2
	.loc	0 10 15 is_stmt 0               # lemire-20220714.c:10:15
	addi	a1, a1, 1
.Ltmp13:
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	.loc	0 10 19                         # lemire-20220714.c:10:19
	sw	a3, 0(a4)
.Ltmp14:
.LBB0_10:                               # %for.inc.2
                                        #   in Loop: Header=BB0_4 Depth=1
	#DEBUG_VALUE: remove_negatives_scalar:i <- [DW_OP_constu 2, DW_OP_or, DW_OP_stack_value] $x5
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	#DEBUG_VALUE: remove_negatives_scalar:input <- $x10
	#DEBUG_VALUE: remove_negatives_scalar:i <- [DW_OP_constu 3, DW_OP_or, DW_OP_stack_value] $x5
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	.loc	0 9 8 is_stmt 1                 # lemire-20220714.c:9:8
	lw	a3, -4(a5)
	.loc	0 9 17 is_stmt 0                # lemire-20220714.c:9:17
	bltz	a3, .LBB0_12
.Ltmp15:
# %bb.11:                               # %if.then.3
                                        #   in Loop: Header=BB0_4 Depth=1
	#DEBUG_VALUE: remove_negatives_scalar:i <- [DW_OP_constu 3, DW_OP_or, DW_OP_stack_value] $x5
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	#DEBUG_VALUE: remove_negatives_scalar:input <- $x10
	.loc	0 10 7 is_stmt 1                # lemire-20220714.c:10:7
	sh2add	a4, a1, a2
	.loc	0 10 15 is_stmt 0               # lemire-20220714.c:10:15
	addi	a1, a1, 1
.Ltmp16:
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	.loc	0 10 19                         # lemire-20220714.c:10:19
	sw	a3, 0(a4)
.Ltmp17:
.LBB0_12:                               # %for.inc.3
                                        #   in Loop: Header=BB0_4 Depth=1
	#DEBUG_VALUE: remove_negatives_scalar:i <- [DW_OP_constu 3, DW_OP_or, DW_OP_stack_value] $x5
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	#DEBUG_VALUE: remove_negatives_scalar:input <- $x10
	#DEBUG_VALUE: remove_negatives_scalar:i <- [DW_OP_constu 4, DW_OP_or, DW_OP_stack_value] $x5
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	.loc	0 9 8 is_stmt 1                 # lemire-20220714.c:9:8
	lw	a3, 0(a5)
	.loc	0 9 17 is_stmt 0                # lemire-20220714.c:9:17
	bltz	a3, .LBB0_14
.Ltmp18:
# %bb.13:                               # %if.then.4
                                        #   in Loop: Header=BB0_4 Depth=1
	#DEBUG_VALUE: remove_negatives_scalar:i <- [DW_OP_constu 4, DW_OP_or, DW_OP_stack_value] $x5
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	#DEBUG_VALUE: remove_negatives_scalar:input <- $x10
	.loc	0 10 7 is_stmt 1                # lemire-20220714.c:10:7
	sh2add	a4, a1, a2
	.loc	0 10 15 is_stmt 0               # lemire-20220714.c:10:15
	addi	a1, a1, 1
.Ltmp19:
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	.loc	0 10 19                         # lemire-20220714.c:10:19
	sw	a3, 0(a4)
.Ltmp20:
.LBB0_14:                               # %for.inc.4
                                        #   in Loop: Header=BB0_4 Depth=1
	#DEBUG_VALUE: remove_negatives_scalar:i <- [DW_OP_constu 4, DW_OP_or, DW_OP_stack_value] $x5
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	#DEBUG_VALUE: remove_negatives_scalar:input <- $x10
	#DEBUG_VALUE: remove_negatives_scalar:i <- [DW_OP_constu 5, DW_OP_or, DW_OP_stack_value] $x5
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	.loc	0 9 8 is_stmt 1                 # lemire-20220714.c:9:8
	lw	a3, 4(a5)
	.loc	0 9 17 is_stmt 0                # lemire-20220714.c:9:17
	bltz	a3, .LBB0_16
.Ltmp21:
# %bb.15:                               # %if.then.5
                                        #   in Loop: Header=BB0_4 Depth=1
	#DEBUG_VALUE: remove_negatives_scalar:i <- [DW_OP_constu 5, DW_OP_or, DW_OP_stack_value] $x5
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	#DEBUG_VALUE: remove_negatives_scalar:input <- $x10
	.loc	0 10 7 is_stmt 1                # lemire-20220714.c:10:7
	sh2add	a4, a1, a2
	.loc	0 10 15 is_stmt 0               # lemire-20220714.c:10:15
	addi	a1, a1, 1
.Ltmp22:
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	.loc	0 10 19                         # lemire-20220714.c:10:19
	sw	a3, 0(a4)
.Ltmp23:
.LBB0_16:                               # %for.inc.5
                                        #   in Loop: Header=BB0_4 Depth=1
	#DEBUG_VALUE: remove_negatives_scalar:i <- [DW_OP_constu 5, DW_OP_or, DW_OP_stack_value] $x5
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	#DEBUG_VALUE: remove_negatives_scalar:input <- $x10
	#DEBUG_VALUE: remove_negatives_scalar:i <- [DW_OP_constu 6, DW_OP_or, DW_OP_stack_value] $x5
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	.loc	0 9 8 is_stmt 1                 # lemire-20220714.c:9:8
	lw	a3, 8(a5)
	.loc	0 9 17 is_stmt 0                # lemire-20220714.c:9:17
	bltz	a3, .LBB0_18
.Ltmp24:
# %bb.17:                               # %if.then.6
                                        #   in Loop: Header=BB0_4 Depth=1
	#DEBUG_VALUE: remove_negatives_scalar:i <- [DW_OP_constu 6, DW_OP_or, DW_OP_stack_value] $x5
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	#DEBUG_VALUE: remove_negatives_scalar:input <- $x10
	.loc	0 10 7 is_stmt 1                # lemire-20220714.c:10:7
	sh2add	a4, a1, a2
	.loc	0 10 15 is_stmt 0               # lemire-20220714.c:10:15
	addi	a1, a1, 1
.Ltmp25:
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	.loc	0 10 19                         # lemire-20220714.c:10:19
	sw	a3, 0(a4)
.Ltmp26:
.LBB0_18:                               # %for.inc.6
                                        #   in Loop: Header=BB0_4 Depth=1
	#DEBUG_VALUE: remove_negatives_scalar:i <- [DW_OP_constu 6, DW_OP_or, DW_OP_stack_value] $x5
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	#DEBUG_VALUE: remove_negatives_scalar:input <- $x10
	#DEBUG_VALUE: remove_negatives_scalar:i <- [DW_OP_constu 7, DW_OP_or, DW_OP_stack_value] $x5
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	.loc	0 9 8 is_stmt 1                 # lemire-20220714.c:9:8
	lw	a3, 12(a5)
	.loc	0 9 17 is_stmt 0                # lemire-20220714.c:9:17
	bltz	a3, .LBB0_3
.Ltmp27:
# %bb.19:                               # %if.then.7
                                        #   in Loop: Header=BB0_4 Depth=1
	#DEBUG_VALUE: remove_negatives_scalar:i <- [DW_OP_constu 7, DW_OP_or, DW_OP_stack_value] $x5
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	#DEBUG_VALUE: remove_negatives_scalar:input <- $x10
	.loc	0 10 7 is_stmt 1                # lemire-20220714.c:10:7
	sh2add	a4, a1, a2
	.loc	0 10 15 is_stmt 0               # lemire-20220714.c:10:15
	addi	a1, a1, 1
.Ltmp28:
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	.loc	0 10 19                         # lemire-20220714.c:10:19
	sw	a3, 0(a4)
	j	.LBB0_3
.Ltmp29:
.LBB0_20:                               # %for.end.loopexit.unr-lcssa.loopexit
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	#DEBUG_VALUE: remove_negatives_scalar:input <- $x10
	.loc	0 9 17 is_stmt 1                # lemire-20220714.c:9:17
	neg	a3, t0
	bnez	a6, .LBB0_23
.Ltmp30:
.LBB0_21:                               # %for.end
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	.loc	0 13 1                          # lemire-20220714.c:13:1
	ret
.Ltmp31:
.LBB0_22:
	#DEBUG_VALUE: remove_negatives_scalar:j <- 0
	#DEBUG_VALUE: remove_negatives_scalar:i <- 0
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	#DEBUG_VALUE: remove_negatives_scalar:count <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:input <- $x10
	.loc	0 0 1 is_stmt 0                 # lemire-20220714.c:0:1
	li	a1, 0
.Ltmp32:
	.loc	0 9 17 is_stmt 1                # lemire-20220714.c:9:17
	beqz	a6, .LBB0_21
.Ltmp33:
.LBB0_23:                               # %for.body.epil
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	#DEBUG_VALUE: remove_negatives_scalar:input <- $x10
	#DEBUG_VALUE: remove_negatives_scalar:i <- $x13
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	.loc	0 9 8 is_stmt 0                 # lemire-20220714.c:9:8
	sh2add	a0, a3, a0
.Ltmp34:
	lw	a3, 0(a0)
.Ltmp35:
	.loc	0 9 17                          # lemire-20220714.c:9:17
	bltz	a3, .LBB0_25
.Ltmp36:
# %bb.24:                               # %if.then.epil
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	.loc	0 10 7 is_stmt 1                # lemire-20220714.c:10:7
	sh2add	a4, a1, a2
	.loc	0 10 15 is_stmt 0               # lemire-20220714.c:10:15
	addi	a1, a1, 1
.Ltmp37:
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	.loc	0 10 19                         # lemire-20220714.c:10:19
	sw	a3, 0(a4)
.Ltmp38:
.LBB0_25:                               # %for.inc.epil
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	#DEBUG_VALUE: remove_negatives_scalar:i <- [DW_OP_plus_uconst 1, DW_OP_stack_value] undef
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	.loc	0 0 19                          # lemire-20220714.c:0:19
	li	a3, 1
	.loc	0 8 3 is_stmt 1                 # lemire-20220714.c:8:3
	beq	a6, a3, .LBB0_21
.Ltmp39:
# %bb.26:                               # %for.body.epil.1
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	#DEBUG_VALUE: remove_negatives_scalar:i <- [DW_OP_plus_uconst 1, DW_OP_stack_value] undef
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	.loc	0 9 8                           # lemire-20220714.c:9:8
	lw	a3, 4(a0)
	.loc	0 9 17 is_stmt 0                # lemire-20220714.c:9:17
	bltz	a3, .LBB0_28
.Ltmp40:
# %bb.27:                               # %if.then.epil.1
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	.loc	0 10 7 is_stmt 1                # lemire-20220714.c:10:7
	sh2add	a4, a1, a2
	.loc	0 10 15 is_stmt 0               # lemire-20220714.c:10:15
	addi	a1, a1, 1
.Ltmp41:
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	.loc	0 10 19                         # lemire-20220714.c:10:19
	sw	a3, 0(a4)
.Ltmp42:
.LBB0_28:                               # %for.inc.epil.1
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	#DEBUG_VALUE: remove_negatives_scalar:i <- [DW_OP_plus_uconst 2, DW_OP_stack_value] undef
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	.loc	0 0 19                          # lemire-20220714.c:0:19
	li	a3, 2
	.loc	0 8 3 is_stmt 1                 # lemire-20220714.c:8:3
	beq	a6, a3, .LBB0_21
.Ltmp43:
# %bb.29:                               # %for.body.epil.2
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	#DEBUG_VALUE: remove_negatives_scalar:i <- [DW_OP_plus_uconst 2, DW_OP_stack_value] undef
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	.loc	0 9 8                           # lemire-20220714.c:9:8
	lw	a3, 8(a0)
	.loc	0 9 17 is_stmt 0                # lemire-20220714.c:9:17
	bltz	a3, .LBB0_31
.Ltmp44:
# %bb.30:                               # %if.then.epil.2
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	.loc	0 10 7 is_stmt 1                # lemire-20220714.c:10:7
	sh2add	a4, a1, a2
	.loc	0 10 15 is_stmt 0               # lemire-20220714.c:10:15
	addi	a1, a1, 1
.Ltmp45:
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	.loc	0 10 19                         # lemire-20220714.c:10:19
	sw	a3, 0(a4)
.Ltmp46:
.LBB0_31:                               # %for.inc.epil.2
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	#DEBUG_VALUE: remove_negatives_scalar:i <- [DW_OP_plus_uconst 3, DW_OP_stack_value] undef
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	.loc	0 0 19                          # lemire-20220714.c:0:19
	li	a3, 3
	.loc	0 8 3 is_stmt 1                 # lemire-20220714.c:8:3
	beq	a6, a3, .LBB0_21
.Ltmp47:
# %bb.32:                               # %for.body.epil.3
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	#DEBUG_VALUE: remove_negatives_scalar:i <- [DW_OP_plus_uconst 3, DW_OP_stack_value] undef
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	.loc	0 9 8                           # lemire-20220714.c:9:8
	lw	a3, 12(a0)
	.loc	0 9 17 is_stmt 0                # lemire-20220714.c:9:17
	bltz	a3, .LBB0_34
.Ltmp48:
# %bb.33:                               # %if.then.epil.3
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	.loc	0 10 7 is_stmt 1                # lemire-20220714.c:10:7
	sh2add	a4, a1, a2
	.loc	0 10 15 is_stmt 0               # lemire-20220714.c:10:15
	addi	a1, a1, 1
.Ltmp49:
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	.loc	0 10 19                         # lemire-20220714.c:10:19
	sw	a3, 0(a4)
.Ltmp50:
.LBB0_34:                               # %for.inc.epil.3
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	#DEBUG_VALUE: remove_negatives_scalar:i <- [DW_OP_plus_uconst 4, DW_OP_stack_value] undef
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	.loc	0 0 19                          # lemire-20220714.c:0:19
	li	a3, 4
	.loc	0 8 3 is_stmt 1                 # lemire-20220714.c:8:3
	beq	a6, a3, .LBB0_21
.Ltmp51:
# %bb.35:                               # %for.body.epil.4
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	#DEBUG_VALUE: remove_negatives_scalar:i <- [DW_OP_plus_uconst 4, DW_OP_stack_value] undef
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	.loc	0 9 8                           # lemire-20220714.c:9:8
	lw	a3, 16(a0)
	.loc	0 9 17 is_stmt 0                # lemire-20220714.c:9:17
	bltz	a3, .LBB0_37
.Ltmp52:
# %bb.36:                               # %if.then.epil.4
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	.loc	0 10 7 is_stmt 1                # lemire-20220714.c:10:7
	sh2add	a4, a1, a2
	.loc	0 10 15 is_stmt 0               # lemire-20220714.c:10:15
	addi	a1, a1, 1
.Ltmp53:
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	.loc	0 10 19                         # lemire-20220714.c:10:19
	sw	a3, 0(a4)
.Ltmp54:
.LBB0_37:                               # %for.inc.epil.4
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	#DEBUG_VALUE: remove_negatives_scalar:i <- [DW_OP_plus_uconst 5, DW_OP_stack_value] undef
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	.loc	0 0 19                          # lemire-20220714.c:0:19
	li	a3, 5
	.loc	0 8 3 is_stmt 1                 # lemire-20220714.c:8:3
	beq	a6, a3, .LBB0_21
.Ltmp55:
# %bb.38:                               # %for.body.epil.5
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	#DEBUG_VALUE: remove_negatives_scalar:i <- [DW_OP_plus_uconst 5, DW_OP_stack_value] undef
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	.loc	0 9 8                           # lemire-20220714.c:9:8
	lw	a3, 20(a0)
	.loc	0 9 17 is_stmt 0                # lemire-20220714.c:9:17
	bltz	a3, .LBB0_40
.Ltmp56:
# %bb.39:                               # %if.then.epil.5
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	.loc	0 10 7 is_stmt 1                # lemire-20220714.c:10:7
	sh2add	a4, a1, a2
	.loc	0 10 15 is_stmt 0               # lemire-20220714.c:10:15
	addi	a1, a1, 1
.Ltmp57:
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	.loc	0 10 19                         # lemire-20220714.c:10:19
	sw	a3, 0(a4)
.Ltmp58:
.LBB0_40:                               # %for.inc.epil.5
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	#DEBUG_VALUE: remove_negatives_scalar:i <- [DW_OP_plus_uconst 6, DW_OP_stack_value] undef
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	.loc	0 0 19                          # lemire-20220714.c:0:19
	li	a3, 6
	.loc	0 8 3 is_stmt 1                 # lemire-20220714.c:8:3
	beq	a6, a3, .LBB0_21
.Ltmp59:
# %bb.41:                               # %for.body.epil.6
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	#DEBUG_VALUE: remove_negatives_scalar:i <- [DW_OP_plus_uconst 6, DW_OP_stack_value] undef
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	.loc	0 9 8                           # lemire-20220714.c:9:8
	lw	a0, 24(a0)
	.loc	0 9 17 is_stmt 0                # lemire-20220714.c:9:17
	bltz	a0, .LBB0_21
.Ltmp60:
# %bb.42:                               # %if.then.epil.6
	#DEBUG_VALUE: remove_negatives_scalar:j <- $x11
	#DEBUG_VALUE: remove_negatives_scalar:output <- $x12
	#DEBUG_VALUE: remove_negatives_scalar:j <- [DW_OP_plus_uconst 1, DW_OP_stack_value] $x11
	.loc	0 10 7 is_stmt 1                # lemire-20220714.c:10:7
	sh2add	a1, a1, a2
.Ltmp61:
	.loc	0 10 19 is_stmt 0               # lemire-20220714.c:10:19
	sw	a0, 0(a1)
.Ltmp62:
	.loc	0 13 1 is_stmt 1                # lemire-20220714.c:13:1
	ret
.Ltmp63:
.Lfunc_end0:
	.size	remove_negatives_scalar, .Lfunc_end0-remove_negatives_scalar
	.cfi_endproc
                                        # -- End function
	.section	.debug_loclists,"",@progbits
	.word	.Ldebug_list_header_end0-.Ldebug_list_header_start0 # Length
.Ldebug_list_header_start0:
	.half	5                               # Version
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
	.word	4                               # Offset entry count
.Lloclists_table_base0:
	.word	.Ldebug_loc0-.Lloclists_table_base0
	.word	.Ldebug_loc1-.Lloclists_table_base0
	.word	.Ldebug_loc2-.Lloclists_table_base0
	.word	.Ldebug_loc3-.Lloclists_table_base0
.Ldebug_loc0:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp30-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp31-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp34-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc1:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp2-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	91                              # DW_OP_reg11
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp31-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp32-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	91                              # DW_OP_reg11
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc2:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp3-.Lfunc_begin0           #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp3-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp4-.Lfunc_begin0           #   ending offset
	.byte	12                              # Loc expr size
	.byte	117                             # DW_OP_breg5
	.byte	0                               # 0
	.byte	17                              # DW_OP_consts
	.byte	120                             # -8
	.byte	27                              # DW_OP_div
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	30                              # DW_OP_mul
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	34                              # DW_OP_plus
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp5-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp8-.Lfunc_begin0           #   ending offset
	.byte	9                               # Loc expr size
	.byte	117                             # DW_OP_breg5
	.byte	0                               # 0
	.byte	17                              # DW_OP_consts
	.byte	120                             # -8
	.byte	27                              # DW_OP_div
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	30                              # DW_OP_mul
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp8-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp11-.Lfunc_begin0          #   ending offset
	.byte	5                               # Loc expr size
	.byte	117                             # DW_OP_breg5
	.byte	0                               # 0
	.byte	49                              # DW_OP_lit1
	.byte	33                              # DW_OP_or
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp11-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp14-.Lfunc_begin0          #   ending offset
	.byte	5                               # Loc expr size
	.byte	117                             # DW_OP_breg5
	.byte	0                               # 0
	.byte	50                              # DW_OP_lit2
	.byte	33                              # DW_OP_or
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp14-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp17-.Lfunc_begin0          #   ending offset
	.byte	5                               # Loc expr size
	.byte	117                             # DW_OP_breg5
	.byte	0                               # 0
	.byte	51                              # DW_OP_lit3
	.byte	33                              # DW_OP_or
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp17-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp20-.Lfunc_begin0          #   ending offset
	.byte	5                               # Loc expr size
	.byte	117                             # DW_OP_breg5
	.byte	0                               # 0
	.byte	52                              # DW_OP_lit4
	.byte	33                              # DW_OP_or
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp20-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp23-.Lfunc_begin0          #   ending offset
	.byte	5                               # Loc expr size
	.byte	117                             # DW_OP_breg5
	.byte	0                               # 0
	.byte	53                              # DW_OP_lit5
	.byte	33                              # DW_OP_or
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp23-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp26-.Lfunc_begin0          #   ending offset
	.byte	5                               # Loc expr size
	.byte	117                             # DW_OP_breg5
	.byte	0                               # 0
	.byte	54                              # DW_OP_lit6
	.byte	33                              # DW_OP_or
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp26-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp29-.Lfunc_begin0          #   ending offset
	.byte	5                               # Loc expr size
	.byte	117                             # DW_OP_breg5
	.byte	0                               # 0
	.byte	55                              # DW_OP_lit7
	.byte	33                              # DW_OP_or
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp31-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp33-.Lfunc_begin0          #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp33-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp35-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	93                              # DW_OP_reg13
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc3:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp3-.Lfunc_begin0           #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp3-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp30-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	91                              # DW_OP_reg11
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp31-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp33-.Lfunc_begin0          #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp33-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp60-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	91                              # DW_OP_reg11
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp60-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp61-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	123                             # DW_OP_breg11
	.byte	1                               # 1
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
	.byte	4                               # Abbreviation Code
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
	.byte	22                              # DW_TAG_typedef
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	10                              # Abbreviation Code
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
	.byte	2                               # Abbrev [2] 0x27:0x3a DW_TAG_subprogram
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
	.byte	3                               # Abbrev [3] 0x32:0x9 DW_TAG_formal_parameter
	.byte	0                               # DW_AT_location
	.byte	4                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.word	97                              # DW_AT_type
	.byte	3                               # Abbrev [3] 0x3b:0x9 DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	7                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
	.word	124                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x44:0xa DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	92
	.byte	10                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
	.word	136                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0x4e:0x9 DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	11                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	6                               # DW_AT_decl_line
	.word	124                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0x57:0x9 DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	12                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	7                               # DW_AT_decl_line
	.word	124                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	6                               # Abbrev [6] 0x61:0x5 DW_TAG_restrict_type
	.word	102                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x66:0x5 DW_TAG_pointer_type
	.word	107                             # DW_AT_type
	.byte	8                               # Abbrev [8] 0x6b:0x5 DW_TAG_const_type
	.word	112                             # DW_AT_type
	.byte	9                               # Abbrev [9] 0x70:0x8 DW_TAG_typedef
	.word	120                             # DW_AT_type
	.byte	6                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	3                               # DW_AT_decl_line
	.byte	10                              # Abbrev [10] 0x78:0x4 DW_TAG_base_type
	.byte	5                               # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	9                               # Abbrev [9] 0x7c:0x8 DW_TAG_typedef
	.word	132                             # DW_AT_type
	.byte	9                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	2                               # DW_AT_decl_line
	.byte	10                              # Abbrev [10] 0x84:0x4 DW_TAG_base_type
	.byte	8                               # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
	.byte	6                               # Abbrev [6] 0x88:0x5 DW_TAG_restrict_type
	.word	141                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x8d:0x5 DW_TAG_pointer_type
	.word	112                             # DW_AT_type
	.byte	0                               # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_str_offsets,"",@progbits
	.word	56                              # Length of String Offsets Set
	.half	5
	.half	0
.Lstr_offsets_base0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)" # string offset=0
.Linfo_string1:
	.asciz	"lemire-20220714.c"             # string offset=108
.Linfo_string2:
	.asciz	"/home/preames/benchmarking/simple-vector-riscv" # string offset=126
.Linfo_string3:
	.asciz	"remove_negatives_scalar"       # string offset=173
.Linfo_string4:
	.asciz	"input"                         # string offset=197
.Linfo_string5:
	.asciz	"int"                           # string offset=203
.Linfo_string6:
	.asciz	"int32_t"                       # string offset=207
.Linfo_string7:
	.asciz	"count"                         # string offset=215
.Linfo_string8:
	.asciz	"long"                          # string offset=221
.Linfo_string9:
	.asciz	"int64_t"                       # string offset=226
.Linfo_string10:
	.asciz	"output"                        # string offset=234
.Linfo_string11:
	.asciz	"i"                             # string offset=241
.Linfo_string12:
	.asciz	"j"                             # string offset=243
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
	.word	.Linfo_string11
	.word	.Linfo_string12
	.section	.debug_addr,"",@progbits
	.word	.Ldebug_addr_end0-.Ldebug_addr_start0 # Length of contribution
.Ldebug_addr_start0:
	.half	5                               # DWARF version number
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
.Laddr_table_base0:
	.quad	.Lfunc_begin0
.Ldebug_addr_end0:
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.section	.debug_line,"",@progbits
.Lline_table_start0:
