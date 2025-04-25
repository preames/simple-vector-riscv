	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_h1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zifencei2p0_zihintntl1p0_zihintpause2p0_zihpm2p0_zimop1p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zawrs1p0_zfa1p0_zfbfmin1p0_zfh1p0_zfhmin1p0_zca1p0_zcb1p0_zcd1p0_zcmop1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0_zvbb1p0_zvbc1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfbfmin1p0_zvfbfwma1p0_zvfh1p0_zvfhmin1p0_zvkb1p0_zvkg1p0_zvkn1p0_zvknc1p0_zvkned1p0_zvkng1p0_zvknhb1p0_zvkt1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0_sha1p0_shcounterenw1p0_shgatpa1p0_shtvala1p0_shvsatpa1p0_shvstvala1p0_shvstvecd1p0_smaia1p0_ssaia1p0_ssccptr1p0_sscofpmf1p0_sscounterenw1p0_ssnpm1p0_ssstateen1p0_ssstrict1p0_sstc1p0_sstvala1p0_sstvecd1p0_ssu64xl1p0_supm1p0_svade1p0_svbare1p0_svinval1p0_svnapot1p0_svpbmt1p0"
	.file	"riscv_vspec_example_a5.c"
	.text
	.globl	saxpy                           # -- Begin function saxpy
	.p2align	1
	.type	saxpy,@function
saxpy:                                  # @saxpy
.Lfunc_begin0:
	.file	0 "/home/preames/benchmarking/simple-vector-riscv" "riscv_vspec_example_a5.c" md5 0xba6b96ab101e730324eb097b45ae3b3b
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: saxpy:n <- $x10
	#DEBUG_VALUE: saxpy:a <- $f10_f
	#DEBUG_VALUE: saxpy:x <- $x11
	#DEBUG_VALUE: saxpy:y <- $x12
	#DEBUG_VALUE: saxpy:i <- 0
	.loc	0 6 3 prologue_end              # riscv_vspec_example_a5.c:6:3
	blez	a0, .LBB0_7
.Ltmp0:
# %bb.1:                                # %for.body.preheader
	#DEBUG_VALUE: saxpy:i <- 0
	#DEBUG_VALUE: saxpy:y <- $x12
	#DEBUG_VALUE: saxpy:x <- $x11
	#DEBUG_VALUE: saxpy:a <- $f10_f
	#DEBUG_VALUE: saxpy:n <- $x10
	csrr	a3, vlenb
	li	a4, 16
	sh2add	t0, a0, a2
	srli	a5, a3, 1
	maxu	a4, a5, a4
	bltu	a0, a4, .LBB0_4
.Ltmp1:
# %bb.2:                                # %vector.memcheck
	#DEBUG_VALUE: saxpy:i <- 0
	#DEBUG_VALUE: saxpy:y <- $x12
	#DEBUG_VALUE: saxpy:x <- $x11
	#DEBUG_VALUE: saxpy:a <- $f10_f
	#DEBUG_VALUE: saxpy:n <- $x10
	sh2add	a4, a0, a1
	bgeu	a2, a4, .LBB0_8
.Ltmp2:
# %bb.3:                                # %vector.memcheck
	#DEBUG_VALUE: saxpy:i <- 0
	#DEBUG_VALUE: saxpy:y <- $x12
	#DEBUG_VALUE: saxpy:x <- $x11
	#DEBUG_VALUE: saxpy:a <- $f10_f
	#DEBUG_VALUE: saxpy:n <- $x10
	bgeu	a1, t0, .LBB0_8
.Ltmp3:
.LBB0_4:
	#DEBUG_VALUE: saxpy:i <- 0
	#DEBUG_VALUE: saxpy:y <- $x12
	#DEBUG_VALUE: saxpy:x <- $x11
	#DEBUG_VALUE: saxpy:a <- $f10_f
	#DEBUG_VALUE: saxpy:n <- $x10
	.loc	0 0 3 is_stmt 0                 # riscv_vspec_example_a5.c:0:3
	li	a6, 0
.Ltmp4:
.LBB0_5:                                # %for.body.preheader12
	#DEBUG_VALUE: saxpy:i <- 0
	#DEBUG_VALUE: saxpy:y <- $x12
	#DEBUG_VALUE: saxpy:x <- $x11
	#DEBUG_VALUE: saxpy:a <- $f10_f
	#DEBUG_VALUE: saxpy:n <- $x10
	.loc	0 6 3 is_stmt 1                 # riscv_vspec_example_a5.c:6:3
	sh2add	a0, a6, a2
.Ltmp5:
	sh2add	a1, a6, a1
.Ltmp6:
.LBB0_6:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: saxpy:y <- $x12
	#DEBUG_VALUE: saxpy:a <- $f10_f
	#DEBUG_VALUE: saxpy:i <- undef
	.loc	0 7 16                          # riscv_vspec_example_a5.c:7:16
	flw	fa5, 0(a1)
	.loc	0 7 23 is_stmt 0                # riscv_vspec_example_a5.c:7:23
	flw	fa4, 0(a0)
	.loc	0 6 14 is_stmt 1                # riscv_vspec_example_a5.c:6:14
	addi	a1, a1, 4
	.loc	0 7 21                          # riscv_vspec_example_a5.c:7:21
	fmadd.s	fa5, fa0, fa5, fa4
	.loc	0 7 10 is_stmt 0                # riscv_vspec_example_a5.c:7:10
	fsw	fa5, 0(a0)
	.loc	0 6 14 is_stmt 1                # riscv_vspec_example_a5.c:6:14
	addi	a0, a0, 4
.Ltmp7:
	.loc	0 6 3 is_stmt 0                 # riscv_vspec_example_a5.c:6:3
	bne	a0, t0, .LBB0_6
.Ltmp8:
.LBB0_7:                                # %for.end
	#DEBUG_VALUE: saxpy:y <- $x12
	#DEBUG_VALUE: saxpy:a <- $f10_f
	.loc	0 8 1 is_stmt 1                 # riscv_vspec_example_a5.c:8:1
	ret
.Ltmp9:
.LBB0_8:                                # %vector.ph
	#DEBUG_VALUE: saxpy:i <- 0
	#DEBUG_VALUE: saxpy:y <- $x12
	#DEBUG_VALUE: saxpy:x <- $x11
	#DEBUG_VALUE: saxpy:a <- $f10_f
	#DEBUG_VALUE: saxpy:n <- $x10
	.loc	0 0 1 is_stmt 0                 # riscv_vspec_example_a5.c:0:1
	srli	a7, a3, 3
.Ltmp10:
	.loc	0 6 3 is_stmt 1                 # riscv_vspec_example_a5.c:6:3
	neg	a3, a5
	and	a6, a0, a3
	slli	t1, a7, 4
	vsetvli	a3, zero, e32, m2, ta, ma
	sub	a4, a6, a5
	divu	a4, a4, a5
	mv	a5, a1
	slli	a4, a4, 4
	addi	a4, a4, 16
	mul	a7, a4, a7
	mv	a4, a2
	add	a7, a7, a2
.Ltmp11:
.LBB0_9:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: saxpy:i <- 0
	#DEBUG_VALUE: saxpy:y <- $x12
	#DEBUG_VALUE: saxpy:x <- $x11
	#DEBUG_VALUE: saxpy:a <- $f10_f
	#DEBUG_VALUE: saxpy:n <- $x10
	.loc	0 7 16                          # riscv_vspec_example_a5.c:7:16
	vl2re32.v	v8, (a5)
	.loc	0 7 23 is_stmt 0                # riscv_vspec_example_a5.c:7:23
	vl2re32.v	v10, (a4)
	.loc	0 6 19 is_stmt 1                # riscv_vspec_example_a5.c:6:19
	add	a5, a5, t1
	.loc	0 7 21                          # riscv_vspec_example_a5.c:7:21
	vfmacc.vf	v10, fa0, v8
	.loc	0 7 10 is_stmt 0                # riscv_vspec_example_a5.c:7:10
	vs2r.v	v10, (a4)
	.loc	0 6 19 is_stmt 1                # riscv_vspec_example_a5.c:6:19
	add	a4, a4, t1
	bne	a4, a7, .LBB0_9
.Ltmp12:
# %bb.10:                               # %middle.block
	#DEBUG_VALUE: saxpy:i <- 0
	#DEBUG_VALUE: saxpy:y <- $x12
	#DEBUG_VALUE: saxpy:x <- $x11
	#DEBUG_VALUE: saxpy:a <- $f10_f
	#DEBUG_VALUE: saxpy:n <- $x10
	.loc	0 6 3 is_stmt 0                 # riscv_vspec_example_a5.c:6:3
	beq	a0, a6, .LBB0_7
	j	.LBB0_5
.Ltmp13:
.Lfunc_end0:
	.size	saxpy, .Lfunc_end0-saxpy
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
	.uleb128 .Ltmp5-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp9-.Lfunc_begin0           #   starting offset
	.uleb128 .Lfunc_end0-.Lfunc_begin0      #   ending offset
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
	.uleb128 .Ltmp9-.Lfunc_begin0           #   starting offset
	.uleb128 .Lfunc_end0-.Lfunc_begin0      #   ending offset
	.byte	1                               # Loc expr size
	.byte	91                              # DW_OP_reg11
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc2:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp6-.Lfunc_begin0           #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	0                               # 0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp9-.Lfunc_begin0           #   starting offset
	.uleb128 .Lfunc_end0-.Lfunc_begin0      #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	0                               # 0
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
	.byte	38                              # DW_TAG_const_type
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
	.byte	0                               # EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.word	.Ldebug_info_end0-.Ldebug_info_start0 # Length of Unit
.Ldebug_info_start0:
	.half	5                               # DWARF version number
	.byte	1                               # DWARF Unit Type
	.byte	8                               # Address Size (in bytes)
	.word	.debug_abbrev                   # Offset Into Abbrev. Section
	.byte	1                               # Abbrev [1] 0xc:0x6f DW_TAG_compile_unit
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
	.byte	2                               # Abbrev [2] 0x27:0x3c DW_TAG_subprogram
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
	.word	99                              # DW_AT_type
	.byte	4                               # Abbrev [4] 0x3b:0xb DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	144
	.byte	42
	.byte	6                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.word	103                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x46:0x9 DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	8                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.word	112                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x4f:0xa DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	92
	.byte	9                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.word	117                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0x59:0x9 DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	10                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
	.word	99                              # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	6                               # Abbrev [6] 0x63:0x4 DW_TAG_base_type
	.byte	5                               # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
	.byte	7                               # Abbrev [7] 0x67:0x5 DW_TAG_const_type
	.word	108                             # DW_AT_type
	.byte	6                               # Abbrev [6] 0x6c:0x4 DW_TAG_base_type
	.byte	7                               # DW_AT_name
	.byte	4                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	8                               # Abbrev [8] 0x70:0x5 DW_TAG_pointer_type
	.word	103                             # DW_AT_type
	.byte	8                               # Abbrev [8] 0x75:0x5 DW_TAG_pointer_type
	.word	108                             # DW_AT_type
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
	.asciz	"riscv_vspec_example_a5.c"      # string offset=108
.Linfo_string2:
	.asciz	"/home/preames/benchmarking/simple-vector-riscv" # string offset=133
.Linfo_string3:
	.asciz	"saxpy"                         # string offset=180
.Linfo_string4:
	.asciz	"n"                             # string offset=186
.Linfo_string5:
	.asciz	"long"                          # string offset=188
.Linfo_string6:
	.asciz	"a"                             # string offset=193
.Linfo_string7:
	.asciz	"float"                         # string offset=195
.Linfo_string8:
	.asciz	"x"                             # string offset=201
.Linfo_string9:
	.asciz	"y"                             # string offset=203
.Linfo_string10:
	.asciz	"i"                             # string offset=205
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
