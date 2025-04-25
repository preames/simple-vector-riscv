	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"pairwise_dotproduct_fp32.c"
	.text
	.globl	pairwise_dotproduct_fp32        # -- Begin function pairwise_dotproduct_fp32
	.p2align	1
	.type	pairwise_dotproduct_fp32,@function
pairwise_dotproduct_fp32:               # @pairwise_dotproduct_fp32
.Lfunc_begin0:
	.file	0 "/home/preames/benchmarking/simple-vector-riscv" "pairwise_dotproduct_fp32.c" md5 0x157f68deef6870fe3a4a394dad819d71
	.loc	0 3 0                           # pairwise_dotproduct_fp32.c:3:0
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: pairwise_dotproduct_fp32:len <- $x10
	#DEBUG_VALUE: pairwise_dotproduct_fp32:a <- $x11
	#DEBUG_VALUE: pairwise_dotproduct_fp32:b <- $x12
	#DEBUG_VALUE: pairwise_dotproduct_fp32:c <- $x13
	#DEBUG_VALUE: i <- 0
	andi	a0, a0, -2
.Ltmp0:
	.loc	0 4 3 prologue_end              # pairwise_dotproduct_fp32.c:4:3
	beqz	a0, .LBB0_5
.Ltmp1:
# %bb.1:                                # %for.body.preheader
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: pairwise_dotproduct_fp32:c <- $x13
	#DEBUG_VALUE: pairwise_dotproduct_fp32:b <- $x12
	#DEBUG_VALUE: pairwise_dotproduct_fp32:a <- $x11
	zext.w	t1, a0
	csrr	a0, vlenb
	li	a4, 16
	addi	a5, t1, -1
	srli	a7, a0, 1
	srli	a5, a5, 1
	addi	a6, a5, 1
	maxu	a4, a7, a4
	bgeu	a6, a4, .LBB0_6
.Ltmp2:
# %bb.2:
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: pairwise_dotproduct_fp32:c <- $x13
	#DEBUG_VALUE: pairwise_dotproduct_fp32:b <- $x12
	#DEBUG_VALUE: pairwise_dotproduct_fp32:a <- $x11
	.loc	0 0 3 is_stmt 0                 # pairwise_dotproduct_fp32.c:0:3
	li	a4, 0
.Ltmp3:
.LBB0_3:                                # %for.body.preheader35
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: pairwise_dotproduct_fp32:c <- $x13
	#DEBUG_VALUE: pairwise_dotproduct_fp32:b <- $x12
	#DEBUG_VALUE: pairwise_dotproduct_fp32:a <- $x11
	.loc	0 4 3 is_stmt 1                 # pairwise_dotproduct_fp32.c:4:3
	sh2add	a3, a4, a3
.Ltmp4:
	sh2add	a0, a4, a2
	srli	a5, a4, 1
	addi	a0, a0, 4
	addi	a2, a3, 4
.Ltmp5:
	sh2add	a1, a5, a1
.Ltmp6:
.LBB0_4:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: i <- $x14
	.loc	0 5 15                          # pairwise_dotproduct_fp32.c:5:15
	flw	fa5, -4(a0)
	.loc	0 5 31 is_stmt 0                # pairwise_dotproduct_fp32.c:5:31
	flw	fa4, 0(a0)
	.loc	0 5 22                          # pairwise_dotproduct_fp32.c:5:22
	flw	fa3, -4(a2)
	.loc	0 5 40                          # pairwise_dotproduct_fp32.c:5:40
	flw	fa2, 0(a2)
	.loc	0 4 41 is_stmt 1                # pairwise_dotproduct_fp32.c:4:41
	addi	a4, a4, 2
.Ltmp7:
	#DEBUG_VALUE: i <- $x14
	.loc	0 4 26 is_stmt 0                # pairwise_dotproduct_fp32.c:4:26
	addi	a0, a0, 8
	addi	a2, a2, 8
	.loc	0 5 38 is_stmt 1                # pairwise_dotproduct_fp32.c:5:38
	fmul.s	fa4, fa4, fa2
	.loc	0 5 28 is_stmt 0                # pairwise_dotproduct_fp32.c:5:28
	fmadd.s	fa5, fa5, fa3, fa4
	.loc	0 5 12                          # pairwise_dotproduct_fp32.c:5:12
	fsw	fa5, 0(a1)
	.loc	0 4 26 is_stmt 1                # pairwise_dotproduct_fp32.c:4:26
	addi	a1, a1, 4
.Ltmp8:
	.loc	0 4 3 is_stmt 0                 # pairwise_dotproduct_fp32.c:4:3
	bltu	a4, t1, .LBB0_4
.Ltmp9:
.LBB0_5:                                # %for.cond.cleanup
	.loc	0 6 1 is_stmt 1                 # pairwise_dotproduct_fp32.c:6:1
	ret
.LBB0_6:                                # %vector.memcheck
.Ltmp10:
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: pairwise_dotproduct_fp32:c <- $x13
	#DEBUG_VALUE: pairwise_dotproduct_fp32:b <- $x12
	#DEBUG_VALUE: pairwise_dotproduct_fp32:a <- $x11
	.loc	0 4 3                           # pairwise_dotproduct_fp32.c:4:3
	sh2add	t0, a5, a1
	sh3add	a4, a5, a2
	addi	t0, t0, 4
	addi	a4, a4, 8
	sltu	t2, a1, a4
	sltu	a4, a2, t0
	and	t2, t2, a4
	li	a4, 0
	bnez	t2, .LBB0_3
.Ltmp11:
# %bb.7:                                # %vector.memcheck
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: pairwise_dotproduct_fp32:c <- $x13
	#DEBUG_VALUE: pairwise_dotproduct_fp32:b <- $x12
	#DEBUG_VALUE: pairwise_dotproduct_fp32:a <- $x11
	sh3add	a5, a5, a3
	addi	a5, a5, 8
	sltu	t2, a1, a5
	sltu	a5, a3, t0
	and	a5, t2, a5
	bnez	a5, .LBB0_3
.Ltmp12:
# %bb.8:                                # %vector.ph
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: pairwise_dotproduct_fp32:c <- $x13
	#DEBUG_VALUE: pairwise_dotproduct_fp32:b <- $x12
	#DEBUG_VALUE: pairwise_dotproduct_fp32:a <- $x11
	.loc	0 0 3 is_stmt 0                 # pairwise_dotproduct_fp32.c:0:3
	li	t3, 0
	srli	a0, a0, 3
	.loc	0 4 3                           # pairwise_dotproduct_fp32.c:4:3
	neg	a4, a7
	and	t0, a6, a4
	slli	a4, t0, 1
	slli	t2, a0, 5
	mv	t4, a3
	mv	a5, a2
	vsetvli	a0, zero, e32, m2, ta, ma
.Ltmp13:
.LBB0_9:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: pairwise_dotproduct_fp32:c <- $x13
	#DEBUG_VALUE: pairwise_dotproduct_fp32:b <- $x12
	#DEBUG_VALUE: pairwise_dotproduct_fp32:a <- $x11
	.loc	0 5 15 is_stmt 1                # pairwise_dotproduct_fp32.c:5:15
	vlseg2e32.v	v8, (a5)
	.loc	0 5 22 is_stmt 0                # pairwise_dotproduct_fp32.c:5:22
	vlseg2e32.v	v12, (t4)
	.loc	0 5 8                           # pairwise_dotproduct_fp32.c:5:8
	andi	a0, t3, -4
	add	t3, t3, a7
	add	a5, a5, t2
	.loc	0 5 5                           # pairwise_dotproduct_fp32.c:5:5
	sh2add	a0, a0, a1
	.loc	0 5 38                          # pairwise_dotproduct_fp32.c:5:38
	vfmul.vv	v10, v10, v14
	.loc	0 5 28                          # pairwise_dotproduct_fp32.c:5:28
	vfmacc.vv	v10, v8, v12
	.loc	0 5 12                          # pairwise_dotproduct_fp32.c:5:12
	vs2r.v	v10, (a0)
	add	t4, t4, t2
	bne	t0, t3, .LBB0_9
.Ltmp14:
# %bb.10:                               # %middle.block
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: pairwise_dotproduct_fp32:c <- $x13
	#DEBUG_VALUE: pairwise_dotproduct_fp32:b <- $x12
	#DEBUG_VALUE: pairwise_dotproduct_fp32:a <- $x11
	.loc	0 4 3 is_stmt 1                 # pairwise_dotproduct_fp32.c:4:3
	bne	a6, t0, .LBB0_3
	j	.LBB0_5
.Ltmp15:
.Lfunc_end0:
	.size	pairwise_dotproduct_fp32, .Lfunc_end0-pairwise_dotproduct_fp32
	.cfi_endproc
                                        # -- End function
	.section	.debug_loclists,"",@progbits
	.word	.Ldebug_list_header_end0-.Ldebug_list_header_start0 # Length
.Ldebug_list_header_start0:
	.half	5                               # Version
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
	.word	5                               # Offset entry count
.Lloclists_table_base0:
	.word	.Ldebug_loc0-.Lloclists_table_base0
	.word	.Ldebug_loc1-.Lloclists_table_base0
	.word	.Ldebug_loc2-.Lloclists_table_base0
	.word	.Ldebug_loc3-.Lloclists_table_base0
	.word	.Ldebug_loc4-.Lloclists_table_base0
.Ldebug_loc0:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp0-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc1:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp6-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	91                              # DW_OP_reg11
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp10-.Lfunc_begin0          #   starting offset
	.uleb128 .Lfunc_end0-.Lfunc_begin0      #   ending offset
	.byte	1                               # Loc expr size
	.byte	91                              # DW_OP_reg11
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc2:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp5-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	92                              # DW_OP_reg12
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp10-.Lfunc_begin0          #   starting offset
	.uleb128 .Lfunc_end0-.Lfunc_begin0      #   ending offset
	.byte	1                               # Loc expr size
	.byte	92                              # DW_OP_reg12
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc3:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp4-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	93                              # DW_OP_reg13
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp10-.Lfunc_begin0          #   starting offset
	.uleb128 .Lfunc_end0-.Lfunc_begin0      #   ending offset
	.byte	1                               # Loc expr size
	.byte	93                              # DW_OP_reg13
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc4:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp6-.Lfunc_begin0           #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp6-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp9-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	94                              # DW_OP_reg14
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp10-.Lfunc_begin0          #   starting offset
	.uleb128 .Lfunc_end0-.Lfunc_begin0      #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
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
	.byte	11                              # DW_TAG_lexical_block
	.byte	1                               # DW_CHILDREN_yes
	.byte	85                              # DW_AT_ranges
	.byte	35                              # DW_FORM_rnglistx
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
	.byte	7                               # Abbreviation Code
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
	.byte	1                               # Abbrev [1] 0xc:0x69 DW_TAG_compile_unit
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
	.byte	2                               # Abbrev [2] 0x2b:0x3c DW_TAG_subprogram
	.byte	0                               # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	82
                                        # DW_AT_call_all_calls
	.byte	3                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	3                               # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	3                               # Abbrev [3] 0x36:0x9 DW_TAG_formal_parameter
	.byte	0                               # DW_AT_location
	.byte	4                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	3                               # DW_AT_decl_line
	.word	103                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x3f:0x9 DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	6                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	3                               # DW_AT_decl_line
	.word	107                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x48:0x9 DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	8                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	3                               # DW_AT_decl_line
	.word	107                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x51:0x9 DW_TAG_formal_parameter
	.byte	3                               # DW_AT_location
	.byte	9                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	3                               # DW_AT_decl_line
	.word	107                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x5a:0xc DW_TAG_lexical_block
	.byte	0                               # DW_AT_ranges
	.byte	5                               # Abbrev [5] 0x5c:0x9 DW_TAG_variable
	.byte	4                               # DW_AT_location
	.byte	10                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.word	103                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	6                               # Abbrev [6] 0x67:0x4 DW_TAG_base_type
	.byte	5                               # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	7                               # Abbrev [7] 0x6b:0x5 DW_TAG_pointer_type
	.word	112                             # DW_AT_type
	.byte	6                               # Abbrev [6] 0x70:0x4 DW_TAG_base_type
	.byte	7                               # DW_AT_name
	.byte	4                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
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
	.uleb128 .Ltmp0-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp9-.Lfunc_begin0           #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp10-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp15-.Lfunc_begin0          #   ending offset
	.byte	0                               # DW_RLE_end_of_list
.Ldebug_list_header_end1:
	.section	.debug_str_offsets,"",@progbits
	.word	48                              # Length of String Offsets Set
	.half	5
	.half	0
.Lstr_offsets_base0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)" # string offset=0
.Linfo_string1:
	.asciz	"pairwise_dotproduct_fp32.c"    # string offset=108
.Linfo_string2:
	.asciz	"/home/preames/benchmarking/simple-vector-riscv" # string offset=135
.Linfo_string3:
	.asciz	"pairwise_dotproduct_fp32"      # string offset=182
.Linfo_string4:
	.asciz	"len"                           # string offset=207
.Linfo_string5:
	.asciz	"unsigned int"                  # string offset=211
.Linfo_string6:
	.asciz	"a"                             # string offset=224
.Linfo_string7:
	.asciz	"float"                         # string offset=226
.Linfo_string8:
	.asciz	"b"                             # string offset=232
.Linfo_string9:
	.asciz	"c"                             # string offset=234
.Linfo_string10:
	.asciz	"i"                             # string offset=236
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
.Ldebug_addr_end0:
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.section	.debug_line,"",@progbits
.Lline_table_start0:
