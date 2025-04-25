	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_h1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zifencei2p0_zihintntl1p0_zihintpause2p0_zihpm2p0_zimop1p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zawrs1p0_zfa1p0_zfbfmin1p0_zfh1p0_zfhmin1p0_zca1p0_zcb1p0_zcd1p0_zcmop1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0_zvbb1p0_zvbc1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfbfmin1p0_zvfbfwma1p0_zvfh1p0_zvfhmin1p0_zvkb1p0_zvkg1p0_zvkn1p0_zvknc1p0_zvkned1p0_zvkng1p0_zvknhb1p0_zvkt1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0_sha1p0_shcounterenw1p0_shgatpa1p0_shtvala1p0_shvsatpa1p0_shvstvala1p0_shvstvecd1p0_smaia1p0_ssaia1p0_ssccptr1p0_sscofpmf1p0_sscounterenw1p0_ssnpm1p0_ssstateen1p0_ssstrict1p0_sstc1p0_sstvala1p0_sstvecd1p0_ssu64xl1p0_supm1p0_svade1p0_svbare1p0_svinval1p0_svnapot1p0_svpbmt1p0"
	.file	"strcmp.c"
	.text
	.globl	my_strcmp                       # -- Begin function my_strcmp
	.p2align	1
	.type	my_strcmp,@function
my_strcmp:                              # @my_strcmp
.Lfunc_begin0:
	.file	0 "/home/preames/benchmarking/simple-vector-riscv" "strcmp.c" md5 0x8569924188dcc282575e183c82d084ab
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: my_strcmp:a <- $x10
	#DEBUG_VALUE: my_strcmp:b <- $x11
	.loc	0 5 9 prologue_end              # strcmp.c:5:9
	lbu	a2, 0(a0)
	.loc	0 5 15 is_stmt 0                # strcmp.c:5:15
	lbu	a3, 0(a1)
	.loc	0 5 12                          # strcmp.c:5:12
	bne	a2, a3, .LBB0_18
.Ltmp0:
# %bb.1:                                # %if.end.preheader
	#DEBUG_VALUE: my_strcmp:b <- $x11
	#DEBUG_VALUE: my_strcmp:a <- $x10
	.loc	0 4 3 is_stmt 1                 # strcmp.c:4:3
	addi	a0, a0, 4
.Ltmp1:
	addi	a1, a1, 4
.Ltmp2:
.LBB0_2:                                # %if.end
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: my_strcmp:a <- [DW_OP_constu 4, DW_OP_minus, DW_OP_stack_value] $x10
	#DEBUG_VALUE: my_strcmp:b <- [DW_OP_LLVM_arg 0, DW_OP_consts 4, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_minus, DW_OP_consts 8, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 7 12                          # strcmp.c:7:12
	beqz	a2, .LBB0_19
.Ltmp3:
# %bb.3:                                # %if.end11
                                        #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: my_strcmp:a <- [DW_OP_constu 4, DW_OP_minus, DW_OP_stack_value] $x10
	#DEBUG_VALUE: my_strcmp:a <- [DW_OP_constu 3, DW_OP_minus, DW_OP_stack_value] $x10
	#DEBUG_VALUE: my_strcmp:b <- [DW_OP_LLVM_arg 0, DW_OP_consts 4, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_minus, DW_OP_consts 8, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 1, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 5 9                           # strcmp.c:5:9
	lbu	a2, -3(a0)
	.loc	0 5 15 is_stmt 0                # strcmp.c:5:15
	lbu	a3, -3(a1)
	.loc	0 5 12                          # strcmp.c:5:12
	bne	a2, a3, .LBB0_18
.Ltmp4:
# %bb.4:                                # %if.end.1
                                        #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: my_strcmp:a <- [DW_OP_constu 3, DW_OP_minus, DW_OP_stack_value] $x10
	#DEBUG_VALUE: my_strcmp:a <- [DW_OP_constu 3, DW_OP_minus, DW_OP_stack_value] $x10
	#DEBUG_VALUE: my_strcmp:b <- [DW_OP_LLVM_arg 0, DW_OP_consts 4, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_minus, DW_OP_consts 8, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 1, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 7 12 is_stmt 1                # strcmp.c:7:12
	beqz	a2, .LBB0_19
.Ltmp5:
# %bb.5:                                # %if.end11.1
                                        #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: my_strcmp:a <- [DW_OP_constu 3, DW_OP_minus, DW_OP_stack_value] $x10
	#DEBUG_VALUE: my_strcmp:a <- [DW_OP_constu 2, DW_OP_minus, DW_OP_stack_value] $x10
	#DEBUG_VALUE: my_strcmp:b <- [DW_OP_LLVM_arg 0, DW_OP_consts 4, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_minus, DW_OP_consts 8, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 2, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 5 9                           # strcmp.c:5:9
	lbu	a2, -2(a0)
	.loc	0 5 15 is_stmt 0                # strcmp.c:5:15
	lbu	a3, -2(a1)
	.loc	0 5 12                          # strcmp.c:5:12
	bne	a2, a3, .LBB0_18
.Ltmp6:
# %bb.6:                                # %if.end.2
                                        #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: my_strcmp:a <- [DW_OP_constu 2, DW_OP_minus, DW_OP_stack_value] $x10
	#DEBUG_VALUE: my_strcmp:a <- [DW_OP_constu 2, DW_OP_minus, DW_OP_stack_value] $x10
	#DEBUG_VALUE: my_strcmp:b <- [DW_OP_LLVM_arg 0, DW_OP_consts 4, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_minus, DW_OP_consts 8, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 2, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 7 12 is_stmt 1                # strcmp.c:7:12
	beqz	a2, .LBB0_19
.Ltmp7:
# %bb.7:                                # %if.end11.2
                                        #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: my_strcmp:a <- [DW_OP_constu 2, DW_OP_minus, DW_OP_stack_value] $x10
	#DEBUG_VALUE: my_strcmp:a <- [DW_OP_constu 1, DW_OP_minus, DW_OP_stack_value] $x10
	#DEBUG_VALUE: my_strcmp:b <- [DW_OP_LLVM_arg 0, DW_OP_consts 4, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_minus, DW_OP_consts 8, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 3, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 5 9                           # strcmp.c:5:9
	lbu	a2, -1(a0)
	.loc	0 5 15 is_stmt 0                # strcmp.c:5:15
	lbu	a3, -1(a1)
	.loc	0 5 12                          # strcmp.c:5:12
	bne	a2, a3, .LBB0_18
.Ltmp8:
# %bb.8:                                # %if.end.3
                                        #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: my_strcmp:a <- [DW_OP_constu 1, DW_OP_minus, DW_OP_stack_value] $x10
	#DEBUG_VALUE: my_strcmp:a <- [DW_OP_constu 1, DW_OP_minus, DW_OP_stack_value] $x10
	#DEBUG_VALUE: my_strcmp:b <- [DW_OP_LLVM_arg 0, DW_OP_consts 4, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_minus, DW_OP_consts 8, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 3, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 7 12 is_stmt 1                # strcmp.c:7:12
	beqz	a2, .LBB0_19
.Ltmp9:
# %bb.9:                                # %if.end11.3
                                        #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: my_strcmp:a <- [DW_OP_constu 1, DW_OP_minus, DW_OP_stack_value] $x10
	#DEBUG_VALUE: my_strcmp:a <- $x10
	#DEBUG_VALUE: my_strcmp:b <- [DW_OP_LLVM_arg 0, DW_OP_consts 4, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_minus, DW_OP_consts 8, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 4, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 5 9                           # strcmp.c:5:9
	lbu	a2, 0(a0)
	.loc	0 5 15 is_stmt 0                # strcmp.c:5:15
	lbu	a3, 0(a1)
	.loc	0 5 12                          # strcmp.c:5:12
	bne	a2, a3, .LBB0_18
.Ltmp10:
# %bb.10:                               # %if.end.4
                                        #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: my_strcmp:a <- $x10
	#DEBUG_VALUE: my_strcmp:a <- $x10
	#DEBUG_VALUE: my_strcmp:b <- [DW_OP_LLVM_arg 0, DW_OP_consts 4, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_minus, DW_OP_consts 8, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 4, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 7 12 is_stmt 1                # strcmp.c:7:12
	beqz	a2, .LBB0_19
.Ltmp11:
# %bb.11:                               # %if.end11.4
                                        #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: my_strcmp:a <- $x10
	#DEBUG_VALUE: my_strcmp:a <- [DW_OP_plus_uconst 1, DW_OP_stack_value] $x10
	#DEBUG_VALUE: my_strcmp:b <- [DW_OP_LLVM_arg 0, DW_OP_consts 4, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_minus, DW_OP_consts 8, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 5, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 5 9                           # strcmp.c:5:9
	lbu	a2, 1(a0)
	.loc	0 5 15 is_stmt 0                # strcmp.c:5:15
	lbu	a3, 1(a1)
	.loc	0 5 12                          # strcmp.c:5:12
	bne	a2, a3, .LBB0_18
.Ltmp12:
# %bb.12:                               # %if.end.5
                                        #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: my_strcmp:a <- [DW_OP_plus_uconst 1, DW_OP_stack_value] $x10
	#DEBUG_VALUE: my_strcmp:a <- [DW_OP_plus_uconst 1, DW_OP_stack_value] $x10
	#DEBUG_VALUE: my_strcmp:b <- [DW_OP_LLVM_arg 0, DW_OP_consts 4, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_minus, DW_OP_consts 8, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 5, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 7 12 is_stmt 1                # strcmp.c:7:12
	beqz	a2, .LBB0_19
.Ltmp13:
# %bb.13:                               # %if.end11.5
                                        #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: my_strcmp:a <- [DW_OP_plus_uconst 1, DW_OP_stack_value] $x10
	#DEBUG_VALUE: my_strcmp:a <- [DW_OP_plus_uconst 2, DW_OP_stack_value] $x10
	#DEBUG_VALUE: my_strcmp:b <- [DW_OP_LLVM_arg 0, DW_OP_consts 4, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_minus, DW_OP_consts 8, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 6, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 5 9                           # strcmp.c:5:9
	lbu	a2, 2(a0)
	.loc	0 5 15 is_stmt 0                # strcmp.c:5:15
	lbu	a3, 2(a1)
	.loc	0 5 12                          # strcmp.c:5:12
	bne	a2, a3, .LBB0_18
.Ltmp14:
# %bb.14:                               # %if.end.6
                                        #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: my_strcmp:a <- [DW_OP_plus_uconst 2, DW_OP_stack_value] $x10
	#DEBUG_VALUE: my_strcmp:a <- [DW_OP_plus_uconst 2, DW_OP_stack_value] $x10
	#DEBUG_VALUE: my_strcmp:b <- [DW_OP_LLVM_arg 0, DW_OP_consts 4, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_minus, DW_OP_consts 8, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 6, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 7 12 is_stmt 1                # strcmp.c:7:12
	beqz	a2, .LBB0_19
.Ltmp15:
# %bb.15:                               # %if.end11.6
                                        #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: my_strcmp:a <- [DW_OP_plus_uconst 2, DW_OP_stack_value] $x10
	#DEBUG_VALUE: my_strcmp:a <- [DW_OP_plus_uconst 3, DW_OP_stack_value] $x10
	#DEBUG_VALUE: my_strcmp:b <- [DW_OP_LLVM_arg 0, DW_OP_consts 4, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_minus, DW_OP_consts 8, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 7, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 5 9                           # strcmp.c:5:9
	lbu	a2, 3(a0)
	.loc	0 5 15 is_stmt 0                # strcmp.c:5:15
	lbu	a3, 3(a1)
	.loc	0 5 12                          # strcmp.c:5:12
	bne	a2, a3, .LBB0_18
.Ltmp16:
# %bb.16:                               # %if.end.7
                                        #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: my_strcmp:a <- [DW_OP_plus_uconst 3, DW_OP_stack_value] $x10
	#DEBUG_VALUE: my_strcmp:a <- [DW_OP_plus_uconst 3, DW_OP_stack_value] $x10
	#DEBUG_VALUE: my_strcmp:b <- [DW_OP_LLVM_arg 0, DW_OP_consts 4, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_minus, DW_OP_consts 8, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 7, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 7 12 is_stmt 1                # strcmp.c:7:12
	beqz	a2, .LBB0_19
.Ltmp17:
# %bb.17:                               # %if.end11.7
                                        #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: my_strcmp:a <- [DW_OP_plus_uconst 3, DW_OP_stack_value] $x10
	#DEBUG_VALUE: my_strcmp:a <- [DW_OP_plus_uconst 4, DW_OP_stack_value] $x10
	#DEBUG_VALUE: my_strcmp:b <- [DW_OP_LLVM_arg 0, DW_OP_consts 4, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_minus, DW_OP_consts 8, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 8, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 5 9                           # strcmp.c:5:9
	lbu	a2, 4(a0)
	.loc	0 5 15 is_stmt 0                # strcmp.c:5:15
	lbu	a3, 4(a1)
	.loc	0 5 12                          # strcmp.c:5:12
	addi	a0, a0, 8
.Ltmp18:
	addi	a1, a1, 8
	beq	a2, a3, .LBB0_2
.Ltmp19:
.LBB0_18:                               # %if.then
	.loc	0 6 18 is_stmt 1                # strcmp.c:6:18
	sltu	a0, a2, a3
	.loc	0 6 14 is_stmt 0                # strcmp.c:6:14
	neg	a0, a0
	ori	a0, a0, 1
.Ltmp20:
	.loc	0 12 1 is_stmt 1                # strcmp.c:12:1
	ret
.LBB0_19:
	.loc	0 0 1 is_stmt 0                 # strcmp.c:0:1
	li	a0, 0
	.loc	0 12 1 is_stmt 1                # strcmp.c:12:1
	ret
.Ltmp21:
.Lfunc_end0:
	.size	my_strcmp, .Lfunc_end0-my_strcmp
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
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp1-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp2-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp3-.Lfunc_begin0           #   ending offset
	.byte	3                               # Loc expr size
	.byte	122                             # DW_OP_breg10
	.byte	124                             # -4
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp3-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp5-.Lfunc_begin0           #   ending offset
	.byte	3                               # Loc expr size
	.byte	122                             # DW_OP_breg10
	.byte	125                             # -3
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp5-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp7-.Lfunc_begin0           #   ending offset
	.byte	3                               # Loc expr size
	.byte	122                             # DW_OP_breg10
	.byte	126                             # -2
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp7-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp9-.Lfunc_begin0           #   ending offset
	.byte	3                               # Loc expr size
	.byte	122                             # DW_OP_breg10
	.byte	127                             # -1
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp9-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp11-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp11-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp13-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	122                             # DW_OP_breg10
	.byte	1                               # 1
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp13-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp15-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	122                             # DW_OP_breg10
	.byte	2                               # 2
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp15-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp17-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	122                             # DW_OP_breg10
	.byte	3                               # 3
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp17-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp18-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	122                             # DW_OP_breg10
	.byte	4                               # 4
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc1:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp2-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	91                              # DW_OP_reg11
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
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
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
	.byte	5                               # Abbreviation Code
	.byte	15                              # DW_TAG_pointer_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
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
	.byte	1                               # Abbrev [1] 0xc:0x4b DW_TAG_compile_unit
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
	.byte	2                               # Abbrev [2] 0x27:0x22 DW_TAG_subprogram
	.byte	0                               # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	82
                                        # DW_AT_call_all_calls
	.byte	3                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	3                               # DW_AT_decl_line
                                        # DW_AT_prototyped
	.word	73                              # DW_AT_type
                                        # DW_AT_external
	.byte	3                               # Abbrev [3] 0x36:0x9 DW_TAG_formal_parameter
	.byte	0                               # DW_AT_location
	.byte	5                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	3                               # DW_AT_decl_line
	.word	77                              # DW_AT_type
	.byte	3                               # Abbrev [3] 0x3f:0x9 DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	7                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	3                               # DW_AT_decl_line
	.word	77                              # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	4                               # Abbrev [4] 0x49:0x4 DW_TAG_base_type
	.byte	4                               # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	5                               # Abbrev [5] 0x4d:0x5 DW_TAG_pointer_type
	.word	82                              # DW_AT_type
	.byte	4                               # Abbrev [4] 0x52:0x4 DW_TAG_base_type
	.byte	6                               # DW_AT_name
	.byte	8                               # DW_AT_encoding
	.byte	1                               # DW_AT_byte_size
	.byte	0                               # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_str_offsets,"",@progbits
	.word	36                              # Length of String Offsets Set
	.half	5
	.half	0
.Lstr_offsets_base0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)" # string offset=0
.Linfo_string1:
	.asciz	"strcmp.c"                      # string offset=108
.Linfo_string2:
	.asciz	"/home/preames/benchmarking/simple-vector-riscv" # string offset=117
.Linfo_string3:
	.asciz	"my_strcmp"                     # string offset=164
.Linfo_string4:
	.asciz	"int"                           # string offset=174
.Linfo_string5:
	.asciz	"a"                             # string offset=178
.Linfo_string6:
	.asciz	"char"                          # string offset=180
.Linfo_string7:
	.asciz	"b"                             # string offset=185
	.section	.debug_str_offsets,"",@progbits
	.word	.Linfo_string0
	.word	.Linfo_string1
	.word	.Linfo_string2
	.word	.Linfo_string3
	.word	.Linfo_string4
	.word	.Linfo_string5
	.word	.Linfo_string6
	.word	.Linfo_string7
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
