	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zihintntl1p0_zihintpause2p0_zihpm2p0_zimop1p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zawrs1p0_zfa1p0_zfhmin1p0_zca1p0_zcb1p0_zcd1p0_zcmop1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0_zvbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfhmin1p0_zvkb1p0_zvkt1p0_zvl1024b1p0_zvl128b1p0_zvl2048b1p0_zvl256b1p0_zvl32b1p0_zvl4096b1p0_zvl512b1p0_zvl64b1p0_supm1p0"
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
	#DEBUG_VALUE: ki <- 0
	li	t0, 0
	.loc	0 5 0 prologue_end              # openblas_gepb_16x4.c:5:0
	li	a6, 4
	mv	a7, a2
.Ltmp0:
.LBB0_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
	#DEBUG_VALUE: test:C <- $x12
	#DEBUG_VALUE: test:B <- $x11
	#DEBUG_VALUE: test:A <- $x10
	sh2add	a3, t0, a1
	flw	fa5, 0(a3)
	#DEBUG_VALUE: kj <- 0
	slli	a3, t0, 6
	add	a3, a3, a2
	addi	a4, a3, 64
	#DEBUG_VALUE: ki <- $x5
	mv	a5, a0
	mv	a3, a7
.Ltmp1:
.LBB0_2:                                # %for.body4
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: ki <- $x5
	#DEBUG_VALUE: test:C <- $x12
	#DEBUG_VALUE: test:B <- $x11
	#DEBUG_VALUE: test:A <- $x10
	#DEBUG_VALUE: kj <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_minus, DW_OP_consts 64, DW_OP_div, DW_OP_stack_value] $x17, $x12
	.loc	0 8 34                          # openblas_gepb_16x4.c:8:34
	flw	fa4, 0(a5)
	.loc	0 8 31 is_stmt 0                # openblas_gepb_16x4.c:8:31
	flw	fa3, 0(a3)
	fmadd.s	fa4, fa4, fa5, fa3
	fsw	fa4, 0(a3)
.Ltmp2:
	#DEBUG_VALUE: kj <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_minus, DW_OP_consts 64, DW_OP_div, DW_OP_consts 1, DW_OP_plus, DW_OP_stack_value] $x17, $x12
	.loc	0 7 28 is_stmt 1                # openblas_gepb_16x4.c:7:28
	addi	a3, a3, 4
	addi	a5, a5, 4
.Ltmp3:
	.loc	0 7 9 is_stmt 0                 # openblas_gepb_16x4.c:7:9
	bne	a3, a4, .LBB0_2
.Ltmp4:
# %bb.3:                                # %for.cond.cleanup3
                                        #   in Loop: Header=BB0_1 Depth=1
	#DEBUG_VALUE: ki <- $x5
	#DEBUG_VALUE: test:C <- $x12
	#DEBUG_VALUE: test:B <- $x11
	#DEBUG_VALUE: test:A <- $x10
	.loc	0 6 38 is_stmt 1                # openblas_gepb_16x4.c:6:38
	addi	t0, t0, 1
.Ltmp5:
	#DEBUG_VALUE: ki <- $x5
	.loc	0 6 5 is_stmt 0                 # openblas_gepb_16x4.c:6:5
	addi	a7, a7, 64
	bne	t0, a6, .LBB0_1
.Ltmp6:
# %bb.4:                                # %for.cond.cleanup
	#DEBUG_VALUE: test:C <- $x12
	#DEBUG_VALUE: test:B <- $x11
	#DEBUG_VALUE: test:A <- $x10
	.loc	0 11 1 is_stmt 1                # openblas_gepb_16x4.c:11:1
	ret
.Ltmp7:
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
	.word	1                               # Offset entry count
.Lloclists_table_base0:
	.word	.Ldebug_loc0-.Lloclists_table_base0
.Ldebug_loc0:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp1-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp2-.Lfunc_begin0           #   ending offset
	.byte	10                              # Loc expr size
	.byte	129                             # DW_OP_breg17
	.byte	0                               # 0
	.byte	124                             # DW_OP_breg12
	.byte	0                               # 0
	.byte	28                              # DW_OP_minus
	.byte	17                              # DW_OP_consts
	.byte	192                             # 64
	.byte	0                               # 
	.byte	27                              # DW_OP_div
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp2-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp4-.Lfunc_begin0           #   ending offset
	.byte	13                              # Loc expr size
	.byte	129                             # DW_OP_breg17
	.byte	0                               # 0
	.byte	124                             # DW_OP_breg12
	.byte	0                               # 0
	.byte	28                              # DW_OP_minus
	.byte	17                              # DW_OP_consts
	.byte	192                             # 64
	.byte	0                               # 
	.byte	27                              # DW_OP_div
	.byte	17                              # DW_OP_consts
	.byte	1                               # 1
	.byte	34                              # DW_OP_plus
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
	.byte	55                              # DW_TAG_restrict_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	8                               # Abbreviation Code
	.byte	15                              # DW_TAG_pointer_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	9                               # Abbreviation Code
	.byte	38                              # DW_TAG_const_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
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
	.byte	1                               # Abbrev [1] 0xc:0x88 DW_TAG_compile_unit
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
	.byte	2                               # Abbrev [2] 0x27:0x4b DW_TAG_subprogram
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
	.word	114                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x3c:0xa DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	91
	.byte	6                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.word	114                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x46:0xa DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	92
	.byte	7                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.word	133                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x50:0x21 DW_TAG_lexical_block
	.byte	1                               # DW_AT_low_pc
	.word	.Ltmp6-.Ltmp1                   # DW_AT_high_pc
	.byte	5                               # Abbrev [5] 0x56:0xa DW_TAG_variable
	.byte	1                               # DW_AT_location
	.byte	85
	.byte	8                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	6                               # DW_AT_decl_line
	.word	143                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x60:0x10 DW_TAG_lexical_block
	.byte	1                               # DW_AT_low_pc
	.word	.Ltmp4-.Ltmp1                   # DW_AT_high_pc
	.byte	6                               # Abbrev [6] 0x66:0x9 DW_TAG_variable
	.byte	0                               # DW_AT_location
	.byte	10                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	7                               # DW_AT_decl_line
	.word	143                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	7                               # Abbrev [7] 0x72:0x5 DW_TAG_restrict_type
	.word	119                             # DW_AT_type
	.byte	8                               # Abbrev [8] 0x77:0x5 DW_TAG_pointer_type
	.word	124                             # DW_AT_type
	.byte	9                               # Abbrev [9] 0x7c:0x5 DW_TAG_const_type
	.word	129                             # DW_AT_type
	.byte	10                              # Abbrev [10] 0x81:0x4 DW_TAG_base_type
	.byte	5                               # DW_AT_name
	.byte	4                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	7                               # Abbrev [7] 0x85:0x5 DW_TAG_restrict_type
	.word	138                             # DW_AT_type
	.byte	8                               # Abbrev [8] 0x8a:0x5 DW_TAG_pointer_type
	.word	129                             # DW_AT_type
	.byte	10                              # Abbrev [10] 0x8f:0x4 DW_TAG_base_type
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
	.quad	.Ltmp1
.Ldebug_addr_end0:
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.section	.debug_line,"",@progbits
.Lline_table_start0:
