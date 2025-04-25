	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zifencei2p0_zihintpause2p0_zihpm2p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zfh1p0_zfhmin1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zbc1p0_zbkc1p0_zbs1p0_zkt1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfh1p0_zvfhmin1p0_zvkt1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0_ssccptr1p0_sscofpmf1p0_sscounterenw1p0_sstc1p0_sstvala1p0_sstvecd1p0_svade1p0_svbare1p0_svinval1p0_svnapot1p0_svpbmt1p0"
	.file	"vector_sum_abs_diff.c"
	.file	0 "/home/preames/benchmarking/simple-vector-riscv" "vector_sum_abs_diff.c" md5 0x35ff705e57d886c9c8cd065d825c538b
	.text
	.globl	sub                             # -- Begin function sub
	.p2align	1
	.type	sub,@function
sub:                                    # @sub
.Lfunc_begin0:
	.loc	0 5 0                           # vector_sum_abs_diff.c:5:0
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sd	ra, 24(sp)                      # 8-byte Folded Spill
	sd	s0, 16(sp)                      # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
                                        # kill: def $x12 killed $x11
                                        # kill: def $x12 killed $x10
	sb	a0, -17(s0)
	sb	a1, -18(s0)
.Ltmp0:
	.loc	0 6 19 prologue_end             # vector_sum_abs_diff.c:6:19
	lbu	a0, -17(s0)
	.loc	0 6 28 is_stmt 0                # vector_sum_abs_diff.c:6:28
	lbu	a1, -18(s0)
	.loc	0 6 26                          # vector_sum_abs_diff.c:6:26
	subw	a0, a0, a1
	.loc	0 6 3                           # vector_sum_abs_diff.c:6:3
	sext.b	a0, a0
	.loc	0 6 3 epilogue_begin            # vector_sum_abs_diff.c:6:3
	addi	sp, s0, -32
	.cfi_def_cfa sp, 32
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 32
	.cfi_def_cfa_offset 0
	ret
.Ltmp1:
.Lfunc_end0:
	.size	sub, .Lfunc_end0-sub
	.cfi_endproc
                                        # -- End function
	.globl	myabs                           # -- Begin function myabs
	.p2align	1
	.type	myabs,@function
myabs:                                  # @myabs
.Lfunc_begin1:
	.loc	0 9 0 is_stmt 1                 # vector_sum_abs_diff.c:9:0
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sd	ra, 24(sp)                      # 8-byte Folded Spill
	sd	s0, 16(sp)                      # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
                                        # kill: def $x11 killed $x10
	sb	a0, -17(s0)
.Ltmp2:
	.loc	0 11 11 prologue_end            # vector_sum_abs_diff.c:11:11
	lb	a0, -17(s0)
	.loc	0 11 10 is_stmt 0               # vector_sum_abs_diff.c:11:10
	bgez	a0, .LBB1_2
	j	.LBB1_1
.LBB1_1:                                # %cond.true
	.loc	0 11 26                         # vector_sum_abs_diff.c:11:26
	lb	a1, -17(s0)
	li	a0, 0
	.loc	0 11 20                         # vector_sum_abs_diff.c:11:20
	call	sub
	sd	a0, -32(s0)                     # 8-byte Folded Spill
	.loc	0 11 10                         # vector_sum_abs_diff.c:11:10
	j	.LBB1_3
.LBB1_2:                                # %cond.false
	.loc	0 11 31                         # vector_sum_abs_diff.c:11:31
	lb	a0, -17(s0)
	sd	a0, -32(s0)                     # 8-byte Folded Spill
	.loc	0 11 10                         # vector_sum_abs_diff.c:11:10
	j	.LBB1_3
.LBB1_3:                                # %cond.end
	.loc	0 0 10                          # vector_sum_abs_diff.c:0:10
	ld	a0, -32(s0)                     # 8-byte Folded Reload
	.loc	0 11 3                          # vector_sum_abs_diff.c:11:3
	sext.b	a0, a0
	.loc	0 11 3 epilogue_begin           # vector_sum_abs_diff.c:11:3
	addi	sp, s0, -32
	.cfi_def_cfa sp, 32
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 32
	.cfi_def_cfa_offset 0
	ret
.Ltmp3:
.Lfunc_end1:
	.size	myabs, .Lfunc_end1-myabs
	.cfi_endproc
                                        # -- End function
	.globl	vector_sum_abs_diff             # -- Begin function vector_sum_abs_diff
	.p2align	1
	.type	vector_sum_abs_diff,@function
vector_sum_abs_diff:                    # @vector_sum_abs_diff
.Lfunc_begin2:
	.loc	0 14 0 is_stmt 1                # vector_sum_abs_diff.c:14:0
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -64
	.cfi_def_cfa_offset 64
	sd	ra, 56(sp)                      # 8-byte Folded Spill
	sd	s0, 48(sp)                      # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	addi	s0, sp, 64
	.cfi_def_cfa s0, 0
                                        # kill: def $x14 killed $x13
	sd	a0, -24(s0)
	sd	a1, -32(s0)
	sd	a2, -40(s0)
	sw	a3, -44(s0)
	li	a0, 0
.Ltmp4:
	.loc	0 15 17 prologue_end            # vector_sum_abs_diff.c:15:17
	sw	a0, -48(s0)
	.loc	0 15 8 is_stmt 0                # vector_sum_abs_diff.c:15:8
	j	.LBB2_1
.LBB2_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_3 Depth 2
.Ltmp5:
	.loc	0 15 24                         # vector_sum_abs_diff.c:15:24
	lw	a0, -48(s0)
	.loc	0 15 28                         # vector_sum_abs_diff.c:15:28
	lwu	a1, -44(s0)
	.loc	0 15 29                         # vector_sum_abs_diff.c:15:29
	srli	a1, a1, 3
.Ltmp6:
	.loc	0 15 3                          # vector_sum_abs_diff.c:15:3
	bgeu	a0, a1, .LBB2_8
	j	.LBB2_2
.LBB2_2:                                # %for.body
                                        #   in Loop: Header=BB2_1 Depth=1
	.loc	0 0 3                           # vector_sum_abs_diff.c:0:3
	li	a0, 0
.Ltmp7:
	.loc	0 16 9 is_stmt 1                # vector_sum_abs_diff.c:16:9
	sw	a0, -52(s0)
.Ltmp8:
	.loc	0 17 19                         # vector_sum_abs_diff.c:17:19
	sw	a0, -56(s0)
	.loc	0 17 10 is_stmt 0               # vector_sum_abs_diff.c:17:10
	j	.LBB2_3
.LBB2_3:                                # %for.cond1
                                        #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp9:
	.loc	0 17 26                         # vector_sum_abs_diff.c:17:26
	lw	a1, -56(s0)
	li	a0, 7
.Ltmp10:
	.loc	0 17 5                          # vector_sum_abs_diff.c:17:5
	bltu	a0, a1, .LBB2_6
	j	.LBB2_4
.LBB2_4:                                # %for.body3
                                        #   in Loop: Header=BB2_3 Depth=2
.Ltmp11:
	.loc	0 18 22 is_stmt 1               # vector_sum_abs_diff.c:18:22
	lw	a0, -48(s0)
	.loc	0 18 30 is_stmt 0               # vector_sum_abs_diff.c:18:30
	lw	a1, -56(s0)
	.loc	0 18 28                         # vector_sum_abs_diff.c:18:28
	sh3add	a0, a0, a1
	.loc	0 18 16                         # vector_sum_abs_diff.c:18:16
	sw	a0, -60(s0)
	.loc	0 19 22 is_stmt 1               # vector_sum_abs_diff.c:19:22
	ld	a0, -32(s0)
	.loc	0 19 24 is_stmt 0               # vector_sum_abs_diff.c:19:24
	lwu	a2, -60(s0)
	.loc	0 19 22                         # vector_sum_abs_diff.c:19:22
	add	a0, a0, a2
	lbu	a0, 0(a0)
	.loc	0 19 31                         # vector_sum_abs_diff.c:19:31
	ld	a1, -40(s0)
	add	a1, a1, a2
	lbu	a1, 0(a1)
	.loc	0 19 29                         # vector_sum_abs_diff.c:19:29
	subw	a0, a0, a1
	.loc	0 19 16                         # vector_sum_abs_diff.c:19:16
	sext.b	a0, a0
	call	myabs
	mv	a1, a0
	.loc	0 19 13                         # vector_sum_abs_diff.c:19:13
	lw	a0, -52(s0)
	addw	a0, a0, a1
	sw	a0, -52(s0)
	.loc	0 20 5 is_stmt 1                # vector_sum_abs_diff.c:20:5
	j	.LBB2_5
.Ltmp12:
.LBB2_5:                                # %for.inc
                                        #   in Loop: Header=BB2_3 Depth=2
	.loc	0 17 34                         # vector_sum_abs_diff.c:17:34
	lw	a0, -56(s0)
	addiw	a0, a0, 1
	sw	a0, -56(s0)
	.loc	0 17 5 is_stmt 0                # vector_sum_abs_diff.c:17:5
	j	.LBB2_3
.Ltmp13:
.LBB2_6:                                # %for.end
                                        #   in Loop: Header=BB2_1 Depth=1
	.loc	0 21 12 is_stmt 1               # vector_sum_abs_diff.c:21:12
	lw	a0, -52(s0)
	.loc	0 21 5 is_stmt 0                # vector_sum_abs_diff.c:21:5
	ld	a2, -24(s0)
	.loc	0 21 7                          # vector_sum_abs_diff.c:21:7
	lwu	a1, -48(s0)
	.loc	0 21 5                          # vector_sum_abs_diff.c:21:5
	sh2add	a1, a1, a2
	.loc	0 21 10                         # vector_sum_abs_diff.c:21:10
	sw	a0, 0(a1)
	.loc	0 22 3 is_stmt 1                # vector_sum_abs_diff.c:22:3
	j	.LBB2_7
.Ltmp14:
.LBB2_7:                                # %for.inc12
                                        #   in Loop: Header=BB2_1 Depth=1
	.loc	0 15 34                         # vector_sum_abs_diff.c:15:34
	lw	a0, -48(s0)
	addiw	a0, a0, 1
	sw	a0, -48(s0)
	.loc	0 15 3 is_stmt 0                # vector_sum_abs_diff.c:15:3
	j	.LBB2_1
.Ltmp15:
.LBB2_8:                                # %for.end14
	.loc	0 23 1 epilogue_begin is_stmt 1 # vector_sum_abs_diff.c:23:1
	addi	sp, s0, -64
	.cfi_def_cfa sp, 64
	ld	ra, 56(sp)                      # 8-byte Folded Reload
	ld	s0, 48(sp)                      # 8-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 64
	.cfi_def_cfa_offset 0
	ret
.Ltmp16:
.Lfunc_end2:
	.size	vector_sum_abs_diff, .Lfunc_end2-vector_sum_abs_diff
	.cfi_endproc
                                        # -- End function
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
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	2                               # Abbreviation Code
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
	.byte	3                               # Abbreviation Code
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
	.byte	4                               # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	64                              # DW_AT_frame_base
	.byte	24                              # DW_FORM_exprloc
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
	.byte	5                               # Abbreviation Code
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
	.byte	6                               # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	64                              # DW_AT_frame_base
	.byte	24                              # DW_FORM_exprloc
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
	.byte	7                               # Abbreviation Code
	.byte	11                              # DW_TAG_lexical_block
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	8                               # Abbreviation Code
	.byte	52                              # DW_TAG_variable
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
	.byte	9                               # Abbreviation Code
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
	.byte	1                               # Abbrev [1] 0xc:0xf7 DW_TAG_compile_unit
	.byte	0                               # DW_AT_producer
	.half	29                              # DW_AT_language
	.byte	1                               # DW_AT_name
	.word	.Lstr_offsets_base0             # DW_AT_str_offsets_base
	.word	.Lline_table_start0             # DW_AT_stmt_list
	.byte	2                               # DW_AT_comp_dir
	.byte	0                               # DW_AT_low_pc
	.word	.Lfunc_end2-.Lfunc_begin0       # DW_AT_high_pc
	.word	.Laddr_table_base0              # DW_AT_addr_base
	.byte	2                               # Abbrev [2] 0x23:0x8 DW_TAG_typedef
	.word	43                              # DW_AT_type
	.byte	4                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	2                               # DW_AT_decl_line
	.byte	3                               # Abbrev [3] 0x2b:0x4 DW_TAG_base_type
	.byte	3                               # DW_AT_name
	.byte	6                               # DW_AT_encoding
	.byte	1                               # DW_AT_byte_size
	.byte	3                               # Abbrev [3] 0x2f:0x4 DW_TAG_base_type
	.byte	5                               # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	4                               # Abbrev [4] 0x33:0x26 DW_TAG_subprogram
	.byte	0                               # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	88
	.byte	6                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
                                        # DW_AT_prototyped
	.word	35                              # DW_AT_type
                                        # DW_AT_external
	.byte	5                               # Abbrev [5] 0x42:0xb DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	111
	.byte	9                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
	.word	35                              # DW_AT_type
	.byte	5                               # Abbrev [5] 0x4d:0xb DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	110
	.byte	10                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
	.word	35                              # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	4                               # Abbrev [4] 0x59:0x1b DW_TAG_subprogram
	.byte	1                               # DW_AT_low_pc
	.word	.Lfunc_end1-.Lfunc_begin1       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	88
	.byte	7                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	9                               # DW_AT_decl_line
                                        # DW_AT_prototyped
	.word	35                              # DW_AT_type
                                        # DW_AT_external
	.byte	5                               # Abbrev [5] 0x68:0xb DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	111
	.byte	11                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	9                               # DW_AT_decl_line
	.word	35                              # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	6                               # Abbrev [6] 0x74:0x80 DW_TAG_subprogram
	.byte	2                               # DW_AT_low_pc
	.word	.Lfunc_end2-.Lfunc_begin2       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	88
	.byte	8                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	14                              # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	5                               # Abbrev [5] 0x7f:0xb DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	104
	.byte	11                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	14                              # DW_AT_decl_line
	.word	244                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0x8a:0xb DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	96
	.byte	9                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	14                              # DW_AT_decl_line
	.word	249                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0x95:0xb DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	88
	.byte	10                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	14                              # DW_AT_decl_line
	.word	249                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0xa0:0xb DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	84
	.byte	12                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	14                              # DW_AT_decl_line
	.word	254                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0xab:0x48 DW_TAG_lexical_block
	.byte	3                               # DW_AT_low_pc
	.word	.Ltmp15-.Ltmp4                  # DW_AT_high_pc
	.byte	8                               # Abbrev [8] 0xb1:0xb DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	80
	.byte	14                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	15                              # DW_AT_decl_line
	.word	254                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0xbc:0x36 DW_TAG_lexical_block
	.byte	4                               # DW_AT_low_pc
	.word	.Ltmp14-.Ltmp7                  # DW_AT_high_pc
	.byte	8                               # Abbrev [8] 0xc2:0xb DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	76
	.byte	15                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	16                              # DW_AT_decl_line
	.word	47                              # DW_AT_type
	.byte	7                               # Abbrev [7] 0xcd:0x24 DW_TAG_lexical_block
	.byte	5                               # DW_AT_low_pc
	.word	.Ltmp13-.Ltmp8                  # DW_AT_high_pc
	.byte	8                               # Abbrev [8] 0xd3:0xb DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	72
	.byte	16                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	17                              # DW_AT_decl_line
	.word	254                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0xde:0x12 DW_TAG_lexical_block
	.byte	6                               # DW_AT_low_pc
	.word	.Ltmp12-.Ltmp11                 # DW_AT_high_pc
	.byte	8                               # Abbrev [8] 0xe4:0xb DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	68
	.byte	17                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	18                              # DW_AT_decl_line
	.word	254                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	9                               # Abbrev [9] 0xf4:0x5 DW_TAG_pointer_type
	.word	47                              # DW_AT_type
	.byte	9                               # Abbrev [9] 0xf9:0x5 DW_TAG_pointer_type
	.word	35                              # DW_AT_type
	.byte	3                               # Abbrev [3] 0xfe:0x4 DW_TAG_base_type
	.byte	13                              # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	0                               # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_str_offsets,"",@progbits
	.word	76                              # Length of String Offsets Set
	.half	5
	.half	0
.Lstr_offsets_base0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)" # string offset=0
.Linfo_string1:
	.asciz	"vector_sum_abs_diff.c"         # string offset=108
.Linfo_string2:
	.asciz	"/home/preames/benchmarking/simple-vector-riscv" # string offset=130
.Linfo_string3:
	.asciz	"signed char"                   # string offset=177
.Linfo_string4:
	.asciz	"int8_t"                        # string offset=189
.Linfo_string5:
	.asciz	"int"                           # string offset=196
.Linfo_string6:
	.asciz	"sub"                           # string offset=200
.Linfo_string7:
	.asciz	"myabs"                         # string offset=204
.Linfo_string8:
	.asciz	"vector_sum_abs_diff"           # string offset=210
.Linfo_string9:
	.asciz	"a"                             # string offset=230
.Linfo_string10:
	.asciz	"b"                             # string offset=232
.Linfo_string11:
	.asciz	"c"                             # string offset=234
.Linfo_string12:
	.asciz	"N"                             # string offset=236
.Linfo_string13:
	.asciz	"unsigned int"                  # string offset=238
.Linfo_string14:
	.asciz	"i"                             # string offset=251
.Linfo_string15:
	.asciz	"accum"                         # string offset=253
.Linfo_string16:
	.asciz	"j"                             # string offset=259
.Linfo_string17:
	.asciz	"idx"                           # string offset=261
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
	.word	.Linfo_string13
	.word	.Linfo_string14
	.word	.Linfo_string15
	.word	.Linfo_string16
	.word	.Linfo_string17
	.section	.debug_addr,"",@progbits
	.word	.Ldebug_addr_end0-.Ldebug_addr_start0 # Length of contribution
.Ldebug_addr_start0:
	.half	5                               # DWARF version number
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
.Laddr_table_base0:
	.quad	.Lfunc_begin0
	.quad	.Lfunc_begin1
	.quad	.Lfunc_begin2
	.quad	.Ltmp4
	.quad	.Ltmp7
	.quad	.Ltmp8
	.quad	.Ltmp11
.Ldebug_addr_end0:
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym sub
	.addrsig_sym myabs
	.section	.debug_line,"",@progbits
.Lline_table_start0:
