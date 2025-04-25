	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_h1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zifencei2p0_zihintntl1p0_zihintpause2p0_zihpm2p0_zimop1p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zawrs1p0_zfa1p0_zfbfmin1p0_zfh1p0_zfhmin1p0_zca1p0_zcb1p0_zcd1p0_zcmop1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0_zvbb1p0_zvbc1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfbfmin1p0_zvfbfwma1p0_zvfh1p0_zvfhmin1p0_zvkb1p0_zvkg1p0_zvkn1p0_zvknc1p0_zvkned1p0_zvkng1p0_zvknhb1p0_zvkt1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0_sha1p0_shcounterenw1p0_shgatpa1p0_shtvala1p0_shvsatpa1p0_shvstvala1p0_shvstvecd1p0_smaia1p0_ssaia1p0_ssccptr1p0_sscofpmf1p0_sscounterenw1p0_ssnpm1p0_ssstateen1p0_ssstrict1p0_sstc1p0_sstvala1p0_sstvecd1p0_ssu64xl1p0_supm1p0_svade1p0_svbare1p0_svinval1p0_svnapot1p0_svpbmt1p0"
	.file	"vector_reduce_max_i32.c"
	.text
	.globl	vector_reduce_max_i32           # -- Begin function vector_reduce_max_i32
	.p2align	1
	.type	vector_reduce_max_i32,@function
vector_reduce_max_i32:                  # @vector_reduce_max_i32
.Lfunc_begin0:
	.file	0 "/home/preames/benchmarking/simple-vector-riscv" "vector_reduce_max_i32.c" md5 0x44cec6698acc09995693a54af2e6215f
	.loc	0 1 0                           # vector_reduce_max_i32.c:1:0
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: vector_reduce_max_i32:a <- $x10
	#DEBUG_VALUE: vector_reduce_max_i32:a_len <- $x11
	lui	a4, 807449
.Ltmp0:
	#DEBUG_VALUE: vector_reduce_max_i32:max <- -987654321
	#DEBUG_VALUE: i <- 0
	.loc	0 3 3 prologue_end              # vector_reduce_max_i32.c:3:3
	beqz	a1, .LBB0_3
.Ltmp1:
# %bb.1:                                # %for.body.preheader
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: vector_reduce_max_i32:max <- -987654321
	#DEBUG_VALUE: vector_reduce_max_i32:a_len <- $x11
	#DEBUG_VALUE: vector_reduce_max_i32:a <- $x10
	.loc	0 3 26 is_stmt 0                # vector_reduce_max_i32.c:3:26
	zext.w	a2, a1
.Ltmp2:
	.loc	0 3 3                           # vector_reduce_max_i32.c:3:3
	csrr	a1, vlenb
.Ltmp3:
	srli	a5, a1, 1
	bgeu	a2, a5, .LBB0_4
.Ltmp4:
# %bb.2:
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: vector_reduce_max_i32:max <- -987654321
	#DEBUG_VALUE: vector_reduce_max_i32:a <- $x10
	.loc	0 0 3                           # vector_reduce_max_i32.c:0:3
	li	a6, 0
	addiw	a1, a4, 1871
	.loc	0 3 3                           # vector_reduce_max_i32.c:3:3
	j	.LBB0_7
.Ltmp5:
.LBB0_3:
	#DEBUG_VALUE: vector_reduce_max_i32:max <- -987654321
	#DEBUG_VALUE: vector_reduce_max_i32:a_len <- $x11
	#DEBUG_VALUE: vector_reduce_max_i32:a <- $x10
	.loc	0 0 3                           # vector_reduce_max_i32.c:0:3
	addiw	a0, a4, 1871
.Ltmp6:
	.loc	0 5 3 is_stmt 1                 # vector_reduce_max_i32.c:5:3
	ret
.Ltmp7:
.LBB0_4:                                # %vector.ph
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: vector_reduce_max_i32:max <- -987654321
	#DEBUG_VALUE: vector_reduce_max_i32:a <- $x10
	.loc	0 3 3                           # vector_reduce_max_i32.c:3:3
	srli	a4, a1, 3
	slli	a1, a4, 2
	neg	a3, a1
	slli	a1, a4, 4
	and	a6, a3, a2
	sub	a3, a6, a5
	divu	a3, a3, a5
	vsetvli	a5, zero, e32, m2, ta, ma
	mv	a5, a0
	slli	a3, a3, 4
	addi	a3, a3, 16
	mul	a3, a3, a4
	add	a4, a0, a3
	lui	a3, 807449
	addi	a3, a3, 1871
	vmv.v.x	v8, a3
.Ltmp8:
.LBB0_5:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: vector_reduce_max_i32:max <- -987654321
	#DEBUG_VALUE: vector_reduce_max_i32:a <- $x10
	.loc	0 4 12                          # vector_reduce_max_i32.c:4:12
	vl2re32.v	v10, (a5)
	.loc	0 3 36                          # vector_reduce_max_i32.c:3:36
	add	a5, a5, a1
	.loc	0 4 11                          # vector_reduce_max_i32.c:4:11
	vmax.vv	v8, v10, v8
	.loc	0 3 36                          # vector_reduce_max_i32.c:3:36
	bne	a5, a4, .LBB0_5
.Ltmp9:
# %bb.6:                                # %middle.block
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: vector_reduce_max_i32:max <- -987654321
	#DEBUG_VALUE: vector_reduce_max_i32:a <- $x10
	.loc	0 3 3 is_stmt 0                 # vector_reduce_max_i32.c:3:3
	vredmax.vs	v8, v8, v8
	vmv.x.s	a1, v8
	beq	a6, a2, .LBB0_9
.Ltmp10:
.LBB0_7:                                # %for.body.preheader13
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: vector_reduce_max_i32:max <- -987654321
	#DEBUG_VALUE: vector_reduce_max_i32:a <- $x10
	sh2add	a3, a6, a0
	sh2add	a0, a2, a0
.Ltmp11:
.LBB0_8:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: vector_reduce_max_i32:max <- $x11
	#DEBUG_VALUE: i <- [DW_OP_LLVM_arg 0, DW_OP_consts 4, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_minus, DW_OP_consts 4, DW_OP_div, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 4 12 is_stmt 1                # vector_reduce_max_i32.c:4:12
	lw	a2, 0(a3)
	.loc	0 3 26                          # vector_reduce_max_i32.c:3:26
	addi	a3, a3, 4
	.loc	0 4 11                          # vector_reduce_max_i32.c:4:11
	max	a1, a2, a1
.Ltmp12:
	#DEBUG_VALUE: vector_reduce_max_i32:max <- $x11
	#DEBUG_VALUE: i <- [DW_OP_LLVM_arg 0, DW_OP_consts 4, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_minus, DW_OP_consts 4, DW_OP_div, DW_OP_consts 1, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 3 3                           # vector_reduce_max_i32.c:3:3
	bne	a3, a0, .LBB0_8
.Ltmp13:
.LBB0_9:                                # %for.cond.cleanup
	.loc	0 5 3                           # vector_reduce_max_i32.c:5:3
	mv	a0, a1
	ret
.Ltmp14:
.Lfunc_end0:
	.size	vector_reduce_max_i32, .Lfunc_end0-vector_reduce_max_i32
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
	.uleb128 .Ltmp6-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp7-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp11-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc1:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp3-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	91                              # DW_OP_reg11
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp5-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp7-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	91                              # DW_OP_reg11
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc2:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp0-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp11-.Lfunc_begin0          #   ending offset
	.byte	7                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	207                             # -987654321
	.byte	174                             # 
	.byte	134                             # 
	.byte	169                             # 
	.byte	124                             # 
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp11-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp13-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	91                              # DW_OP_reg11
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc3:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp0-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp5-.Lfunc_begin0           #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp7-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp11-.Lfunc_begin0          #   ending offset
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
	.byte	5                               # Abbreviation Code
	.byte	11                              # DW_TAG_lexical_block
	.byte	1                               # DW_CHILDREN_yes
	.byte	85                              # DW_AT_ranges
	.byte	35                              # DW_FORM_rnglistx
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
	.byte	1                               # Abbrev [1] 0xc:0x64 DW_TAG_compile_unit
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
	.byte	2                               # Abbrev [2] 0x2b:0x37 DW_TAG_subprogram
	.byte	0                               # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	82
                                        # DW_AT_call_all_calls
	.byte	3                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	1                               # DW_AT_decl_line
                                        # DW_AT_prototyped
	.word	98                              # DW_AT_type
                                        # DW_AT_external
	.byte	3                               # Abbrev [3] 0x3a:0x9 DW_TAG_formal_parameter
	.byte	0                               # DW_AT_location
	.byte	5                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	1                               # DW_AT_decl_line
	.word	102                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x43:0x9 DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	6                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	1                               # DW_AT_decl_line
	.word	107                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x4c:0x9 DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	8                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	2                               # DW_AT_decl_line
	.word	98                              # DW_AT_type
	.byte	5                               # Abbrev [5] 0x55:0xc DW_TAG_lexical_block
	.byte	0                               # DW_AT_ranges
	.byte	4                               # Abbrev [4] 0x57:0x9 DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	9                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	3                               # DW_AT_decl_line
	.word	107                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	6                               # Abbrev [6] 0x62:0x4 DW_TAG_base_type
	.byte	4                               # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	7                               # Abbrev [7] 0x66:0x5 DW_TAG_pointer_type
	.word	98                              # DW_AT_type
	.byte	6                               # Abbrev [6] 0x6b:0x4 DW_TAG_base_type
	.byte	7                               # DW_AT_name
	.byte	7                               # DW_AT_encoding
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
	.uleb128 .Ltmp5-.Lfunc_begin0           #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp7-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp13-.Lfunc_begin0          #   ending offset
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
	.asciz	"vector_reduce_max_i32.c"       # string offset=108
.Linfo_string2:
	.asciz	"/home/preames/benchmarking/simple-vector-riscv" # string offset=132
.Linfo_string3:
	.asciz	"vector_reduce_max_i32"         # string offset=179
.Linfo_string4:
	.asciz	"int"                           # string offset=201
.Linfo_string5:
	.asciz	"a"                             # string offset=205
.Linfo_string6:
	.asciz	"a_len"                         # string offset=207
.Linfo_string7:
	.asciz	"unsigned int"                  # string offset=213
.Linfo_string8:
	.asciz	"max"                           # string offset=226
.Linfo_string9:
	.asciz	"i"                             # string offset=230
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
