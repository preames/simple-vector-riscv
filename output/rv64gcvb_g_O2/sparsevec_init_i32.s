	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"sparsevec_init_i32.c"
	.text
	.globl	sparsevec_init_i32              # -- Begin function sparsevec_init_i32
	.p2align	1
	.type	sparsevec_init_i32,@function
sparsevec_init_i32:                     # @sparsevec_init_i32
.Lfunc_begin0:
	.file	0 "/home/preames/benchmarking/simple-vector-riscv" "sparsevec_init_i32.c" md5 0x2295d027641b61dbcecd06ee41ab3ede
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: sparsevec_init_i32:len <- $x10
	#DEBUG_VALUE: sparsevec_init_i32:a <- $x11
	#DEBUG_VALUE: sparsevec_init_i32:aidx <- $x12
	#DEBUG_VALUE: i <- 0
	.loc	0 5 3 prologue_end              # sparsevec_init_i32.c:5:3
	beqz	a0, .LBB0_8
.Ltmp0:
# %bb.1:                                # %for.body.preheader
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: sparsevec_init_i32:aidx <- $x12
	#DEBUG_VALUE: sparsevec_init_i32:a <- $x11
	#DEBUG_VALUE: sparsevec_init_i32:len <- $x10
	.loc	0 5 26 is_stmt 0                # sparsevec_init_i32.c:5:26
	zext.w	a6, a0
.Ltmp1:
	.loc	0 5 3                           # sparsevec_init_i32.c:5:3
	csrr	a0, vlenb
.Ltmp2:
	srli	a7, a0, 1
	bgeu	a6, a7, .LBB0_3
.Ltmp3:
# %bb.2:
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: sparsevec_init_i32:aidx <- $x12
	#DEBUG_VALUE: sparsevec_init_i32:a <- $x11
	.loc	0 0 3                           # sparsevec_init_i32.c:0:3
	li	a0, 0
	.loc	0 5 3                           # sparsevec_init_i32.c:5:3
	j	.LBB0_6
.Ltmp4:
.LBB0_3:                                # %vector.ph
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: sparsevec_init_i32:aidx <- $x12
	#DEBUG_VALUE: sparsevec_init_i32:a <- $x11
	srli	a3, a0, 3
	slli	a0, a3, 2
	neg	a0, a0
	and	a0, a0, a6
	sub	a4, a0, a7
	divu	a5, a4, a7
	vsetvli	a4, zero, e32, m2, ta, ma
	vid.v	v8
	slli	a4, a3, 3
	slli	a5, a5, 3
	addi	a5, a5, 8
	mul	a3, a5, a3
	add	a3, a3, a2
	mv	a5, a2
.Ltmp5:
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: sparsevec_init_i32:aidx <- $x12
	#DEBUG_VALUE: sparsevec_init_i32:a <- $x11
	.loc	0 6 7 is_stmt 1                 # sparsevec_init_i32.c:6:7
	vl1re16.v	v10, (a5)
	.loc	0 5 34                          # sparsevec_init_i32.c:5:34
	add	a5, a5, a4
	.loc	0 6 5                           # sparsevec_init_i32.c:6:5
	vsetvli	zero, zero, e64, m4, ta, ma
	vsext.vf4	v12, v10
	vsll.vi	v12, v12, 2
	.loc	0 6 16 is_stmt 0                # sparsevec_init_i32.c:6:16
	vsetvli	zero, zero, e32, m2, ta, ma
	vsoxei64.v	v8, (a1), v12
	vadd.vx	v8, v8, a7
	.loc	0 5 34 is_stmt 1                # sparsevec_init_i32.c:5:34
	bne	a5, a3, .LBB0_4
.Ltmp6:
# %bb.5:                                # %middle.block
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: sparsevec_init_i32:aidx <- $x12
	#DEBUG_VALUE: sparsevec_init_i32:a <- $x11
	.loc	0 5 3 is_stmt 0                 # sparsevec_init_i32.c:5:3
	beq	a0, a6, .LBB0_8
.Ltmp7:
.LBB0_6:                                # %for.body.preheader8
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: sparsevec_init_i32:aidx <- $x12
	#DEBUG_VALUE: sparsevec_init_i32:a <- $x11
	sh1add	a3, a0, a2
	sh1add	a2, a6, a2
.Ltmp8:
.LBB0_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: sparsevec_init_i32:a <- $x11
	#DEBUG_VALUE: i <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 0, DW_OP_LLVM_convert 32 7, DW_OP_minus, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_stack_value] $x10
	.loc	0 6 7 is_stmt 1                 # sparsevec_init_i32.c:6:7
	lh	a4, 0(a3)
	.loc	0 5 26                          # sparsevec_init_i32.c:5:26
	addi	a3, a3, 2
	.loc	0 6 5                           # sparsevec_init_i32.c:6:5
	sh2add	a4, a4, a1
	.loc	0 6 16 is_stmt 0                # sparsevec_init_i32.c:6:16
	sw	a0, 0(a4)
.Ltmp9:
	#DEBUG_VALUE: i <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 0, DW_OP_LLVM_convert 32 7, DW_OP_minus, DW_OP_consts 1, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_plus, DW_OP_stack_value] $x10
	.loc	0 5 26 is_stmt 1                # sparsevec_init_i32.c:5:26
	addi	a0, a0, 1
.Ltmp10:
	.loc	0 5 3 is_stmt 0                 # sparsevec_init_i32.c:5:3
	bne	a3, a2, .LBB0_7
.Ltmp11:
.LBB0_8:                                # %for.cond.cleanup
	#DEBUG_VALUE: sparsevec_init_i32:a <- $x11
	.loc	0 7 1 is_stmt 1                 # sparsevec_init_i32.c:7:1
	ret
.Ltmp12:
.Lfunc_end0:
	.size	sparsevec_init_i32, .Lfunc_end0-sparsevec_init_i32
	.cfi_endproc
                                        # -- End function
	.section	.debug_loclists,"",@progbits
	.word	.Ldebug_list_header_end0-.Ldebug_list_header_start0 # Length
.Ldebug_list_header_start0:
	.half	5                               # Version
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
	.word	3                               # Offset entry count
.Lloclists_table_base0:
	.word	.Ldebug_loc0-.Lloclists_table_base0
	.word	.Ldebug_loc1-.Lloclists_table_base0
	.word	.Ldebug_loc2-.Lloclists_table_base0
.Ldebug_loc0:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp2-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc1:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp8-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	92                              # DW_OP_reg12
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc2:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp8-.Lfunc_begin0           #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp8-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp9-.Lfunc_begin0           #   ending offset
	.byte	14                              # Loc expr size
	.byte	122                             # DW_OP_breg10
	.byte	0                               # 0
	.byte	122                             # DW_OP_breg10
	.byte	0                               # 0
	.byte	168                             # DW_OP_convert
	.asciz	"\247\200\200"                  # 
	.byte	28                              # DW_OP_minus
	.byte	122                             # DW_OP_breg10
	.byte	0                               # 0
	.byte	34                              # DW_OP_plus
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp9-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp10-.Lfunc_begin0          #   ending offset
	.byte	17                              # Loc expr size
	.byte	122                             # DW_OP_breg10
	.byte	0                               # 0
	.byte	122                             # DW_OP_breg10
	.byte	0                               # 0
	.byte	168                             # DW_OP_convert
	.asciz	"\247\200\200"                  # 
	.byte	28                              # DW_OP_minus
	.byte	17                              # DW_OP_consts
	.byte	1                               # 1
	.byte	122                             # DW_OP_breg10
	.byte	0                               # 0
	.byte	34                              # DW_OP_plus
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
	.byte	3                               # Abbreviation Code
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
	.byte	4                               # Abbreviation Code
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
	.byte	11                              # DW_TAG_lexical_block
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	7                               # Abbreviation Code
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
	.byte	1                               # Abbrev [1] 0xc:0x6e DW_TAG_compile_unit
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
	.byte	2                               # Abbrev [2] 0x27:0x4 DW_TAG_base_type
	.byte	3                               # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	3                               # Abbrev [3] 0x2b:0x38 DW_TAG_subprogram
	.byte	0                               # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	82
                                        # DW_AT_call_all_calls
	.byte	4                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	4                               # Abbrev [4] 0x36:0x9 DW_TAG_formal_parameter
	.byte	0                               # DW_AT_location
	.byte	5                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.word	99                              # DW_AT_type
	.byte	5                               # Abbrev [5] 0x3f:0xa DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	91
	.byte	7                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.word	103                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x49:0x9 DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	9                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.word	112                             # DW_AT_type
	.byte	6                               # Abbrev [6] 0x52:0x10 DW_TAG_lexical_block
	.byte	0                               # DW_AT_low_pc
	.word	.Ltmp11-.Lfunc_begin0           # DW_AT_high_pc
	.byte	7                               # Abbrev [7] 0x58:0x9 DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	11                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
	.word	99                              # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	2                               # Abbrev [2] 0x63:0x4 DW_TAG_base_type
	.byte	6                               # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	8                               # Abbrev [8] 0x67:0x5 DW_TAG_pointer_type
	.word	108                             # DW_AT_type
	.byte	2                               # Abbrev [2] 0x6c:0x4 DW_TAG_base_type
	.byte	8                               # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	8                               # Abbrev [8] 0x70:0x5 DW_TAG_pointer_type
	.word	117                             # DW_AT_type
	.byte	2                               # Abbrev [2] 0x75:0x4 DW_TAG_base_type
	.byte	10                              # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	2                               # DW_AT_byte_size
	.byte	0                               # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_str_offsets,"",@progbits
	.word	52                              # Length of String Offsets Set
	.half	5
	.half	0
.Lstr_offsets_base0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)" # string offset=0
.Linfo_string1:
	.asciz	"sparsevec_init_i32.c"          # string offset=108
.Linfo_string2:
	.asciz	"/home/preames/benchmarking/simple-vector-riscv" # string offset=129
.Linfo_string3:
	.asciz	"DW_ATE_unsigned_32"            # string offset=176
.Linfo_string4:
	.asciz	"sparsevec_init_i32"            # string offset=195
.Linfo_string5:
	.asciz	"len"                           # string offset=214
.Linfo_string6:
	.asciz	"unsigned int"                  # string offset=218
.Linfo_string7:
	.asciz	"a"                             # string offset=231
.Linfo_string8:
	.asciz	"int"                           # string offset=233
.Linfo_string9:
	.asciz	"aidx"                          # string offset=237
.Linfo_string10:
	.asciz	"short"                         # string offset=242
.Linfo_string11:
	.asciz	"i"                             # string offset=248
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
