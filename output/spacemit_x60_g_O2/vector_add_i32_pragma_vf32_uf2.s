	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zifencei2p0_zihintpause2p0_zihpm2p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zfh1p0_zfhmin1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zbc1p0_zbkc1p0_zbs1p0_zkt1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfh1p0_zvfhmin1p0_zvkt1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0_ssccptr1p0_sscofpmf1p0_sscounterenw1p0_sstc1p0_sstvala1p0_sstvecd1p0_svade1p0_svbare1p0_svinval1p0_svnapot1p0_svpbmt1p0"
	.file	"vector_add_i32_pragma_vf32_uf2.c"
	.text
	.globl	vector_add_i32                  # -- Begin function vector_add_i32
	.p2align	1
	.type	vector_add_i32,@function
vector_add_i32:                         # @vector_add_i32
.Lfunc_begin0:
	.file	0 "/home/preames/benchmarking/simple-vector-riscv" "vector_add_i32_pragma_vf32_uf2.c" md5 0x0e4a68832f62fdf1796b5dac847edd06
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: vector_add_i32:a <- $x10
	#DEBUG_VALUE: vector_add_i32:a_len <- $x11
	#DEBUG_VALUE: vector_add_i32:b <- $x12
	#DEBUG_VALUE: i <- 0
	.loc	0 7 3 prologue_end              # vector_add_i32_pragma_vf32_uf2.c:7:3
	beqz	a1, .LBB0_8
.Ltmp0:
# %bb.1:                                # %for.body.preheader
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: vector_add_i32:b <- $x12
	#DEBUG_VALUE: vector_add_i32:a_len <- $x11
	#DEBUG_VALUE: vector_add_i32:a <- $x10
	.loc	0 7 26 is_stmt 0                # vector_add_i32_pragma_vf32_uf2.c:7:26
	zext.w	a7, a1
.Ltmp1:
	.loc	0 7 3                           # vector_add_i32_pragma_vf32_uf2.c:7:3
	csrr	t3, vlenb
	slli	a1, t3, 3
.Ltmp2:
	bgeu	a7, a1, .LBB0_3
.Ltmp3:
# %bb.2:
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: vector_add_i32:b <- $x12
	#DEBUG_VALUE: vector_add_i32:a <- $x10
	.loc	0 0 3                           # vector_add_i32_pragma_vf32_uf2.c:0:3
	li	a6, 0
	.loc	0 7 3                           # vector_add_i32_pragma_vf32_uf2.c:7:3
	j	.LBB0_6
.Ltmp4:
.LBB0_3:                                # %vector.ph
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: vector_add_i32:b <- $x12
	#DEBUG_VALUE: vector_add_i32:a <- $x10
	neg	a3, a1
	and	a6, a3, a7
	sub	a3, a6, a1
	divu	a1, a3, a1
	srli	a3, t3, 3
	slli	t0, t3, 4
	slli	t1, a3, 8
	slli	a1, a1, 8
	addi	a1, a1, 256
	mul	a1, a1, a3
	add	t2, a0, a1
	mv	a3, a0
	vsetvli	a5, zero, e32, m8, ta, ma
.Ltmp5:
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: vector_add_i32:b <- $x12
	#DEBUG_VALUE: vector_add_i32:a <- $x10
	.loc	0 8 10 is_stmt 1                # vector_add_i32_pragma_vf32_uf2.c:8:10
	add	a5, a3, t0
	sh3add	a1, t3, a3
	vl8re32.v	v8, (a3)
	vl8re32.v	v16, (a1)
	vl8re32.v	v24, (a5)
	sh3add	a4, t3, a5
	vl8re32.v	v0, (a4)
	vadd.vx	v8, v8, a2
	vadd.vx	v16, v16, a2
	vadd.vx	v24, v24, a2
	vs8r.v	v8, (a3)
	vadd.vx	v8, v0, a2
	vs8r.v	v16, (a1)
	vs8r.v	v24, (a5)
	.loc	0 7 36                          # vector_add_i32_pragma_vf32_uf2.c:7:36
	add	a3, a3, t1
	.loc	0 8 10                          # vector_add_i32_pragma_vf32_uf2.c:8:10
	vs8r.v	v8, (a4)
	.loc	0 7 36                          # vector_add_i32_pragma_vf32_uf2.c:7:36
	bne	a3, t2, .LBB0_4
.Ltmp6:
# %bb.5:                                # %middle.block
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: vector_add_i32:b <- $x12
	#DEBUG_VALUE: vector_add_i32:a <- $x10
	.loc	0 7 3 is_stmt 0                 # vector_add_i32_pragma_vf32_uf2.c:7:3
	beq	a6, a7, .LBB0_8
.Ltmp7:
.LBB0_6:                                # %for.body.preheader7
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: vector_add_i32:b <- $x12
	#DEBUG_VALUE: vector_add_i32:a <- $x10
	sh2add	a1, a6, a0
	sh2add	a0, a7, a0
.Ltmp8:
.LBB0_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: vector_add_i32:b <- $x12
	#DEBUG_VALUE: i <- [DW_OP_LLVM_arg 0, DW_OP_consts 4, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_minus, DW_OP_consts 4, DW_OP_div, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 8 10 is_stmt 1                # vector_add_i32_pragma_vf32_uf2.c:8:10
	lw	a3, 0(a1)
	add	a3, a3, a2
	sw	a3, 0(a1)
.Ltmp9:
	#DEBUG_VALUE: i <- [DW_OP_LLVM_arg 0, DW_OP_consts 4, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_minus, DW_OP_consts 4, DW_OP_div, DW_OP_consts 1, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 7 26                          # vector_add_i32_pragma_vf32_uf2.c:7:26
	addi	a1, a1, 4
.Ltmp10:
	.loc	0 7 3 is_stmt 0                 # vector_add_i32_pragma_vf32_uf2.c:7:3
	bne	a1, a0, .LBB0_7
.Ltmp11:
.LBB0_8:                                # %for.cond.cleanup
	#DEBUG_VALUE: vector_add_i32:b <- $x12
	.loc	0 9 1 is_stmt 1                 # vector_add_i32_pragma_vf32_uf2.c:9:1
	ret
.Ltmp12:
.Lfunc_end0:
	.size	vector_add_i32, .Lfunc_end0-vector_add_i32
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
	.uleb128 .Ltmp8-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc1:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp2-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	91                              # DW_OP_reg11
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc2:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp8-.Lfunc_begin0           #   ending offset
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
	.byte	11                              # DW_TAG_lexical_block
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
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
	.byte	15                              # DW_TAG_pointer_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	8                               # Abbreviation Code
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
	.byte	1                               # Abbrev [1] 0xc:0x61 DW_TAG_compile_unit
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
	.byte	2                               # Abbrev [2] 0x27:0x38 DW_TAG_subprogram
	.byte	0                               # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	82
                                        # DW_AT_call_all_calls
	.byte	3                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	1                               # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	3                               # Abbrev [3] 0x32:0x9 DW_TAG_formal_parameter
	.byte	0                               # DW_AT_location
	.byte	4                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	1                               # DW_AT_decl_line
	.word	95                              # DW_AT_type
	.byte	3                               # Abbrev [3] 0x3b:0x9 DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	6                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	1                               # DW_AT_decl_line
	.word	104                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x44:0xa DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	92
	.byte	8                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	1                               # DW_AT_decl_line
	.word	100                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0x4e:0x10 DW_TAG_lexical_block
	.byte	0                               # DW_AT_low_pc
	.word	.Ltmp11-.Lfunc_begin0           # DW_AT_high_pc
	.byte	6                               # Abbrev [6] 0x54:0x9 DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	9                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	7                               # DW_AT_decl_line
	.word	104                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	7                               # Abbrev [7] 0x5f:0x5 DW_TAG_pointer_type
	.word	100                             # DW_AT_type
	.byte	8                               # Abbrev [8] 0x64:0x4 DW_TAG_base_type
	.byte	5                               # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	8                               # Abbrev [8] 0x68:0x4 DW_TAG_base_type
	.byte	7                               # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	0                               # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_str_offsets,"",@progbits
	.word	44                              # Length of String Offsets Set
	.half	5
	.half	0
.Lstr_offsets_base0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)" # string offset=0
.Linfo_string1:
	.asciz	"vector_add_i32_pragma_vf32_uf2.c" # string offset=108
.Linfo_string2:
	.asciz	"/home/preames/benchmarking/simple-vector-riscv" # string offset=141
.Linfo_string3:
	.asciz	"vector_add_i32"                # string offset=188
.Linfo_string4:
	.asciz	"a"                             # string offset=203
.Linfo_string5:
	.asciz	"int"                           # string offset=205
.Linfo_string6:
	.asciz	"a_len"                         # string offset=209
.Linfo_string7:
	.asciz	"unsigned int"                  # string offset=215
.Linfo_string8:
	.asciz	"b"                             # string offset=228
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
