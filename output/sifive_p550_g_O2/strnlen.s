	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
	.file	"strnlen.c"
	.text
	.globl	my_strnlne                      # -- Begin function my_strnlne
	.p2align	1
	.type	my_strnlne,@function
my_strnlne:                             # @my_strnlne
.Lfunc_begin0:
	.file	0 "/home/preames/benchmarking/simple-vector-riscv" "strnlen.c" md5 0xc170885034f3cf80ec616b58ba725328
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: my_strnlne:len <- $x10
	#DEBUG_VALUE: my_strnlne:s <- $x11
	#DEBUG_VALUE: i <- 0
	.loc	0 4 3 prologue_end              # strnlen.c:4:3
	beqz	a0, .LBB0_19
.Ltmp0:
# %bb.1:                                # %for.body.preheader
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: my_strnlne:s <- $x11
	#DEBUG_VALUE: my_strnlne:len <- $x10
	.loc	0 4 26 is_stmt 0                # strnlen.c:4:26
	zext.w	a2, a0
	li	a6, 7
	li	t4, 6
	li	t3, 5
	li	a7, 4
.Ltmp1:
	.loc	0 4 3                           # strnlen.c:4:3
	neg	t5, a2
	li	t0, 3
	li	t1, 2
	li	t2, 1
	li	a5, 7
.Ltmp2:
.LBB0_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: my_strnlne:s <- $x11
	#DEBUG_VALUE: my_strnlne:len <- $x10
	#DEBUG_VALUE: i <- [DW_OP_constu 7, DW_OP_minus, DW_OP_stack_value] $x15
	.loc	0 5 9 is_stmt 1                 # strnlen.c:5:9
	add	a2, a1, a5
	lbu	a3, -7(a2)
	.loc	0 5 14 is_stmt 0                # strnlen.c:5:14
	beqz	a3, .LBB0_21
.Ltmp3:
# %bb.3:                                # %for.inc
                                        #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: i <- [DW_OP_constu 7, DW_OP_minus, DW_OP_stack_value] $x15
	#DEBUG_VALUE: my_strnlne:s <- $x11
	#DEBUG_VALUE: my_strnlne:len <- $x10
	#DEBUG_VALUE: i <- [DW_OP_constu 6, DW_OP_minus, DW_OP_stack_value] $x15
	.loc	0 4 26 is_stmt 1                # strnlen.c:4:26
	add	a3, t5, a5
.Ltmp4:
	.loc	0 4 3 is_stmt 0                 # strnlen.c:4:3
	beq	a3, t4, .LBB0_18
.Ltmp5:
# %bb.4:                                # %for.body.1
                                        #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: i <- [DW_OP_constu 6, DW_OP_minus, DW_OP_stack_value] $x15
	#DEBUG_VALUE: my_strnlne:s <- $x11
	#DEBUG_VALUE: my_strnlne:len <- $x10
	#DEBUG_VALUE: i <- [DW_OP_constu 6, DW_OP_minus, DW_OP_stack_value] $x15
	.loc	0 5 9 is_stmt 1                 # strnlen.c:5:9
	lbu	a4, -6(a2)
	.loc	0 5 14 is_stmt 0                # strnlen.c:5:14
	beqz	a4, .LBB0_22
.Ltmp6:
# %bb.5:                                # %for.inc.1
                                        #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: i <- [DW_OP_constu 6, DW_OP_minus, DW_OP_stack_value] $x15
	#DEBUG_VALUE: my_strnlne:s <- $x11
	#DEBUG_VALUE: my_strnlne:len <- $x10
	#DEBUG_VALUE: i <- [DW_OP_constu 5, DW_OP_minus, DW_OP_stack_value] $x15
	.loc	0 4 3 is_stmt 1                 # strnlen.c:4:3
	beq	a3, t3, .LBB0_18
.Ltmp7:
# %bb.6:                                # %for.body.2
                                        #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: i <- [DW_OP_constu 5, DW_OP_minus, DW_OP_stack_value] $x15
	#DEBUG_VALUE: my_strnlne:s <- $x11
	#DEBUG_VALUE: my_strnlne:len <- $x10
	#DEBUG_VALUE: i <- [DW_OP_constu 5, DW_OP_minus, DW_OP_stack_value] $x15
	.loc	0 5 9                           # strnlen.c:5:9
	lbu	a4, -5(a2)
	.loc	0 5 14 is_stmt 0                # strnlen.c:5:14
	beqz	a4, .LBB0_23
.Ltmp8:
# %bb.7:                                # %for.inc.2
                                        #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: i <- [DW_OP_constu 5, DW_OP_minus, DW_OP_stack_value] $x15
	#DEBUG_VALUE: my_strnlne:s <- $x11
	#DEBUG_VALUE: my_strnlne:len <- $x10
	#DEBUG_VALUE: i <- [DW_OP_constu 4, DW_OP_minus, DW_OP_stack_value] $x15
	.loc	0 4 3 is_stmt 1                 # strnlen.c:4:3
	beq	a3, a7, .LBB0_18
.Ltmp9:
# %bb.8:                                # %for.body.3
                                        #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: i <- [DW_OP_constu 4, DW_OP_minus, DW_OP_stack_value] $x15
	#DEBUG_VALUE: my_strnlne:s <- $x11
	#DEBUG_VALUE: my_strnlne:len <- $x10
	#DEBUG_VALUE: i <- [DW_OP_constu 4, DW_OP_minus, DW_OP_stack_value] $x15
	.loc	0 5 9                           # strnlen.c:5:9
	lbu	a4, -4(a2)
	.loc	0 5 14 is_stmt 0                # strnlen.c:5:14
	beqz	a4, .LBB0_24
.Ltmp10:
# %bb.9:                                # %for.inc.3
                                        #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: i <- [DW_OP_constu 4, DW_OP_minus, DW_OP_stack_value] $x15
	#DEBUG_VALUE: my_strnlne:s <- $x11
	#DEBUG_VALUE: my_strnlne:len <- $x10
	#DEBUG_VALUE: i <- [DW_OP_constu 3, DW_OP_minus, DW_OP_stack_value] $x15
	.loc	0 4 3 is_stmt 1                 # strnlen.c:4:3
	beq	a3, t0, .LBB0_18
.Ltmp11:
# %bb.10:                               # %for.body.4
                                        #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: i <- [DW_OP_constu 3, DW_OP_minus, DW_OP_stack_value] $x15
	#DEBUG_VALUE: my_strnlne:s <- $x11
	#DEBUG_VALUE: my_strnlne:len <- $x10
	#DEBUG_VALUE: i <- [DW_OP_constu 3, DW_OP_minus, DW_OP_stack_value] $x15
	.loc	0 5 9                           # strnlen.c:5:9
	lbu	a4, -3(a2)
	.loc	0 5 14 is_stmt 0                # strnlen.c:5:14
	beqz	a4, .LBB0_25
.Ltmp12:
# %bb.11:                               # %for.inc.4
                                        #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: i <- [DW_OP_constu 3, DW_OP_minus, DW_OP_stack_value] $x15
	#DEBUG_VALUE: my_strnlne:s <- $x11
	#DEBUG_VALUE: my_strnlne:len <- $x10
	#DEBUG_VALUE: i <- [DW_OP_constu 2, DW_OP_minus, DW_OP_stack_value] $x15
	.loc	0 4 3 is_stmt 1                 # strnlen.c:4:3
	beq	a3, t1, .LBB0_18
.Ltmp13:
# %bb.12:                               # %for.body.5
                                        #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: i <- [DW_OP_constu 2, DW_OP_minus, DW_OP_stack_value] $x15
	#DEBUG_VALUE: my_strnlne:s <- $x11
	#DEBUG_VALUE: my_strnlne:len <- $x10
	#DEBUG_VALUE: i <- [DW_OP_constu 2, DW_OP_minus, DW_OP_stack_value] $x15
	.loc	0 5 9                           # strnlen.c:5:9
	lbu	a4, -2(a2)
	.loc	0 5 14 is_stmt 0                # strnlen.c:5:14
	beqz	a4, .LBB0_26
.Ltmp14:
# %bb.13:                               # %for.inc.5
                                        #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: i <- [DW_OP_constu 2, DW_OP_minus, DW_OP_stack_value] $x15
	#DEBUG_VALUE: my_strnlne:s <- $x11
	#DEBUG_VALUE: my_strnlne:len <- $x10
	#DEBUG_VALUE: i <- [DW_OP_constu 1, DW_OP_minus, DW_OP_stack_value] $x15
	.loc	0 4 3 is_stmt 1                 # strnlen.c:4:3
	beq	a3, t2, .LBB0_18
.Ltmp15:
# %bb.14:                               # %for.body.6
                                        #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: i <- [DW_OP_constu 1, DW_OP_minus, DW_OP_stack_value] $x15
	#DEBUG_VALUE: my_strnlne:s <- $x11
	#DEBUG_VALUE: my_strnlne:len <- $x10
	#DEBUG_VALUE: i <- [DW_OP_constu 1, DW_OP_minus, DW_OP_stack_value] $x15
	.loc	0 5 9                           # strnlen.c:5:9
	lbu	a4, -1(a2)
	.loc	0 5 14 is_stmt 0                # strnlen.c:5:14
	beqz	a4, .LBB0_27
.Ltmp16:
# %bb.15:                               # %for.inc.6
                                        #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: i <- [DW_OP_constu 1, DW_OP_minus, DW_OP_stack_value] $x15
	#DEBUG_VALUE: my_strnlne:s <- $x11
	#DEBUG_VALUE: my_strnlne:len <- $x10
	#DEBUG_VALUE: i <- $x15
	.loc	0 4 3 is_stmt 1                 # strnlen.c:4:3
	beqz	a3, .LBB0_18
.Ltmp17:
# %bb.16:                               # %for.body.7
                                        #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: i <- $x15
	#DEBUG_VALUE: my_strnlne:s <- $x11
	#DEBUG_VALUE: my_strnlne:len <- $x10
	#DEBUG_VALUE: i <- $x15
	.loc	0 5 9                           # strnlen.c:5:9
	lbu	a2, 0(a2)
	.loc	0 5 14 is_stmt 0                # strnlen.c:5:14
	beqz	a2, .LBB0_20
.Ltmp18:
# %bb.17:                               # %for.inc.7
                                        #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: i <- $x15
	#DEBUG_VALUE: my_strnlne:s <- $x11
	#DEBUG_VALUE: my_strnlne:len <- $x10
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 1, DW_OP_stack_value] $x15
	.loc	0 4 26 is_stmt 1                # strnlen.c:4:26
	addi	a5, a5, 8
.Ltmp19:
	add	a2, t5, a5
.Ltmp20:
	.loc	0 4 3 is_stmt 0                 # strnlen.c:4:3
	bne	a2, a6, .LBB0_2
.Ltmp21:
.LBB0_18:
	#DEBUG_VALUE: my_strnlne:s <- $x11
	#DEBUG_VALUE: my_strnlne:len <- $x10
	.loc	0 0 3                           # strnlen.c:0:3
	mv	a5, a0
	.loc	0 4 3                           # strnlen.c:4:3
	j	.LBB0_20
.Ltmp22:
.LBB0_19:
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: my_strnlne:s <- $x11
	#DEBUG_VALUE: my_strnlne:len <- $x10
	.loc	0 0 3                           # strnlen.c:0:3
	li	a5, 0
.Ltmp23:
.LBB0_20:                               # %cleanup
	#DEBUG_VALUE: my_strnlne:s <- $x11
	#DEBUG_VALUE: my_strnlne:len <- $x10
	sext.w	a5, a5
	minu	a0, a5, a0
.Ltmp24:
	.loc	0 8 1 is_stmt 1                 # strnlen.c:8:1
	ret
.Ltmp25:
.LBB0_21:                               # %for.body.cleanup.loopexit.split.loop.exitsplitsplit_crit_edge
	#DEBUG_VALUE: i <- [DW_OP_constu 7, DW_OP_minus, DW_OP_stack_value] $x15
	#DEBUG_VALUE: my_strnlne:s <- $x11
	#DEBUG_VALUE: my_strnlne:len <- $x10
	.loc	0 5 14                          # strnlen.c:5:14
	addi	a5, a5, -7
.Ltmp26:
	j	.LBB0_20
.Ltmp27:
.LBB0_22:                               # %cleanup.loopexit.split.loop.exitsplitsplitsplitsplitsplitsplitsplit
	#DEBUG_VALUE: i <- [DW_OP_constu 6, DW_OP_minus, DW_OP_stack_value] $x15
	#DEBUG_VALUE: my_strnlne:s <- $x11
	#DEBUG_VALUE: my_strnlne:len <- $x10
	.loc	0 0 14 is_stmt 0                # strnlen.c:0:14
	addi	a5, a5, -6
.Ltmp28:
	j	.LBB0_20
.Ltmp29:
.LBB0_23:                               # %for.body.2.cleanup.loopexit.split.loop.exitsplitsplitsplitsplitsplitsplit_crit_edge
	#DEBUG_VALUE: i <- [DW_OP_constu 5, DW_OP_minus, DW_OP_stack_value] $x15
	#DEBUG_VALUE: my_strnlne:s <- $x11
	#DEBUG_VALUE: my_strnlne:len <- $x10
	.loc	0 5 14                          # strnlen.c:5:14
	addi	a5, a5, -5
.Ltmp30:
	j	.LBB0_20
.Ltmp31:
.LBB0_24:                               # %for.body.3.cleanup.loopexit.split.loop.exitsplitsplitsplitsplitsplit_crit_edge
	#DEBUG_VALUE: i <- [DW_OP_constu 4, DW_OP_minus, DW_OP_stack_value] $x15
	#DEBUG_VALUE: my_strnlne:s <- $x11
	#DEBUG_VALUE: my_strnlne:len <- $x10
	addi	a5, a5, -4
.Ltmp32:
	j	.LBB0_20
.Ltmp33:
.LBB0_25:                               # %for.body.4.cleanup.loopexit.split.loop.exitsplitsplitsplitsplit_crit_edge
	#DEBUG_VALUE: i <- [DW_OP_constu 3, DW_OP_minus, DW_OP_stack_value] $x15
	#DEBUG_VALUE: my_strnlne:s <- $x11
	#DEBUG_VALUE: my_strnlne:len <- $x10
	addi	a5, a5, -3
.Ltmp34:
	j	.LBB0_20
.Ltmp35:
.LBB0_26:                               # %for.body.5.cleanup.loopexit.split.loop.exitsplitsplitsplit_crit_edge
	#DEBUG_VALUE: i <- [DW_OP_constu 2, DW_OP_minus, DW_OP_stack_value] $x15
	#DEBUG_VALUE: my_strnlne:s <- $x11
	#DEBUG_VALUE: my_strnlne:len <- $x10
	addi	a5, a5, -2
.Ltmp36:
	j	.LBB0_20
.Ltmp37:
.LBB0_27:                               # %for.body.6.cleanup.loopexit.split.loop.exitsplit_crit_edge
	#DEBUG_VALUE: i <- [DW_OP_constu 1, DW_OP_minus, DW_OP_stack_value] $x15
	#DEBUG_VALUE: my_strnlne:s <- $x11
	#DEBUG_VALUE: my_strnlne:len <- $x10
	addi	a5, a5, -1
.Ltmp38:
	.loc	0 0 14                          # strnlen.c:0:14
	j	.LBB0_20
.Ltmp39:
.Lfunc_end0:
	.size	my_strnlne, .Lfunc_end0-my_strnlne
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
	.uleb128 .Ltmp24-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp25-.Lfunc_begin0          #   starting offset
	.uleb128 .Lfunc_end0-.Lfunc_begin0      #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc1:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp2-.Lfunc_begin0           #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp2-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp3-.Lfunc_begin0           #   ending offset
	.byte	3                               # Loc expr size
	.byte	127                             # DW_OP_breg15
	.byte	121                             # -7
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp3-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp6-.Lfunc_begin0           #   ending offset
	.byte	3                               # Loc expr size
	.byte	127                             # DW_OP_breg15
	.byte	122                             # -6
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp6-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp8-.Lfunc_begin0           #   ending offset
	.byte	3                               # Loc expr size
	.byte	127                             # DW_OP_breg15
	.byte	123                             # -5
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp8-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp10-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	127                             # DW_OP_breg15
	.byte	124                             # -4
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp10-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp12-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	127                             # DW_OP_breg15
	.byte	125                             # -3
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp12-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp14-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	127                             # DW_OP_breg15
	.byte	126                             # -2
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp14-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp16-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	127                             # DW_OP_breg15
	.byte	127                             # -1
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp16-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp18-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	95                              # DW_OP_reg15
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp18-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp19-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	127                             # DW_OP_breg15
	.byte	1                               # 1
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp25-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp26-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	127                             # DW_OP_breg15
	.byte	121                             # -7
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp27-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp28-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	127                             # DW_OP_breg15
	.byte	122                             # -6
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp29-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp30-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	127                             # DW_OP_breg15
	.byte	123                             # -5
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp31-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp32-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	127                             # DW_OP_breg15
	.byte	124                             # -4
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp33-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp34-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	127                             # DW_OP_breg15
	.byte	125                             # -3
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp35-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp36-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	127                             # DW_OP_breg15
	.byte	126                             # -2
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp37-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp38-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	127                             # DW_OP_breg15
	.byte	127                             # -1
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
	.byte	116                             # DW_AT_rnglists_base
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
	.byte	11                              # DW_TAG_lexical_block
	.byte	1                               # DW_CHILDREN_yes
	.byte	85                              # DW_AT_ranges
	.byte	35                              # DW_FORM_rnglistx
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	6                               # Abbreviation Code
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
	.byte	7                               # Abbreviation Code
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
	.byte	8                               # Abbreviation Code
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
	.byte	1                               # Abbrev [1] 0xc:0x60 DW_TAG_compile_unit
	.byte	0                               # DW_AT_producer
	.half	29                              # DW_AT_language
	.byte	1                               # DW_AT_name
	.word	.Lstr_offsets_base0             # DW_AT_str_offsets_base
	.word	.Lline_table_start0             # DW_AT_stmt_list
	.byte	2                               # DW_AT_comp_dir
	.byte	0                               # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.word	.Laddr_table_base0              # DW_AT_addr_base
	.word	.Lrnglists_table_base0          # DW_AT_rnglists_base
	.word	.Lloclists_table_base0          # DW_AT_loclists_base
	.byte	2                               # Abbrev [2] 0x2b:0x2f DW_TAG_subprogram
	.byte	0                               # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	82
                                        # DW_AT_call_all_calls
	.byte	3                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	3                               # DW_AT_decl_line
                                        # DW_AT_prototyped
	.word	90                              # DW_AT_type
                                        # DW_AT_external
	.byte	3                               # Abbrev [3] 0x3a:0x9 DW_TAG_formal_parameter
	.byte	0                               # DW_AT_location
	.byte	5                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	3                               # DW_AT_decl_line
	.word	94                              # DW_AT_type
	.byte	4                               # Abbrev [4] 0x43:0xa DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	91
	.byte	7                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	3                               # DW_AT_decl_line
	.word	98                              # DW_AT_type
	.byte	5                               # Abbrev [5] 0x4d:0xc DW_TAG_lexical_block
	.byte	0                               # DW_AT_ranges
	.byte	6                               # Abbrev [6] 0x4f:0x9 DW_TAG_variable
	.byte	1                               # DW_AT_location
	.byte	9                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.word	94                              # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	7                               # Abbrev [7] 0x5a:0x4 DW_TAG_base_type
	.byte	4                               # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	7                               # Abbrev [7] 0x5e:0x4 DW_TAG_base_type
	.byte	6                               # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	8                               # Abbrev [8] 0x62:0x5 DW_TAG_pointer_type
	.word	103                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x67:0x4 DW_TAG_base_type
	.byte	8                               # DW_AT_name
	.byte	8                               # DW_AT_encoding
	.byte	1                               # DW_AT_byte_size
	.byte	0                               # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_rnglists,"",@progbits
	.word	.Ldebug_list_header_end1-.Ldebug_list_header_start1 # Length
.Ldebug_list_header_start1:
	.half	5                               # Version
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
	.word	1                               # Offset entry count
.Lrnglists_table_base0:
	.word	.Ldebug_ranges0-.Lrnglists_table_base0
.Ldebug_ranges0:
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp22-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp25-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp39-.Lfunc_begin0          #   ending offset
	.byte	0                               # DW_RLE_end_of_list
.Ldebug_list_header_end1:
	.section	.debug_str_offsets,"",@progbits
	.word	44                              # Length of String Offsets Set
	.half	5
	.half	0
.Lstr_offsets_base0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)" # string offset=0
.Linfo_string1:
	.asciz	"strnlen.c"                     # string offset=108
.Linfo_string2:
	.asciz	"/home/preames/benchmarking/simple-vector-riscv" # string offset=118
.Linfo_string3:
	.asciz	"my_strnlne"                    # string offset=165
.Linfo_string4:
	.asciz	"int"                           # string offset=176
.Linfo_string5:
	.asciz	"len"                           # string offset=180
.Linfo_string6:
	.asciz	"unsigned int"                  # string offset=184
.Linfo_string7:
	.asciz	"s"                             # string offset=197
.Linfo_string8:
	.asciz	"char"                          # string offset=199
.Linfo_string9:
	.asciz	"i"                             # string offset=204
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
