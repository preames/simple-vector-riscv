	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"aos_reduce_sum_i32.c"
	.text
	.globl	aos_reduce_sum_i32              # -- Begin function aos_reduce_sum_i32
	.p2align	1
	.type	aos_reduce_sum_i32,@function
aos_reduce_sum_i32:                     # @aos_reduce_sum_i32
.Lfunc_begin0:
	.file	0 "/home/preames/benchmarking/simple-vector-riscv" "aos_reduce_sum_i32.c" md5 0x2b06662173da0b05a35ee4908cb859b2
	.loc	0 16 0                          # aos_reduce_sum_i32.c:16:0
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -48
	.cfi_def_cfa_offset 48
	sd	ra, 40(sp)                      # 8-byte Folded Spill
	sd	s0, 32(sp)                      # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	addi	s0, sp, 48
	.cfi_def_cfa s0, 0
                                        # kill: def $x12 killed $x10
	sw	a0, -20(s0)
	sd	a1, -32(s0)
	li	a0, 0
.Ltmp0:
	.loc	0 17 7 prologue_end             # aos_reduce_sum_i32.c:17:7
	sw	a0, -36(s0)
.Ltmp1:
	.loc	0 18 17                         # aos_reduce_sum_i32.c:18:17
	sw	a0, -40(s0)
	.loc	0 18 8 is_stmt 0                # aos_reduce_sum_i32.c:18:8
	j	.LBB0_1
.LBB0_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
.Ltmp2:
	.loc	0 18 24                         # aos_reduce_sum_i32.c:18:24
	lw	a0, -40(s0)
	.loc	0 18 28                         # aos_reduce_sum_i32.c:18:28
	lw	a1, -20(s0)
.Ltmp3:
	.loc	0 18 3                          # aos_reduce_sum_i32.c:18:3
	bgeu	a0, a1, .LBB0_4
	j	.LBB0_2
.LBB0_2:                                # %for.body
                                        #   in Loop: Header=BB0_1 Depth=1
.Ltmp4:
	.loc	0 19 12 is_stmt 1               # aos_reduce_sum_i32.c:19:12
	ld	a0, -32(s0)
	.loc	0 19 14 is_stmt 0               # aos_reduce_sum_i32.c:19:14
	lwu	a1, -40(s0)
	.loc	0 19 12                         # aos_reduce_sum_i32.c:19:12
	slli	a2, a1, 3
	slli	a1, a1, 6
	sub	a1, a1, a2
	add	a0, a0, a1
	.loc	0 19 17                         # aos_reduce_sum_i32.c:19:17
	lw	a1, 48(a0)
	.loc	0 19 9                          # aos_reduce_sum_i32.c:19:9
	lw	a0, -36(s0)
	addw	a0, a0, a1
	sw	a0, -36(s0)
	.loc	0 19 5                          # aos_reduce_sum_i32.c:19:5
	j	.LBB0_3
.LBB0_3:                                # %for.inc
                                        #   in Loop: Header=BB0_1 Depth=1
	.loc	0 18 34 is_stmt 1               # aos_reduce_sum_i32.c:18:34
	lw	a0, -40(s0)
	addiw	a0, a0, 1
	sw	a0, -40(s0)
	.loc	0 18 3 is_stmt 0                # aos_reduce_sum_i32.c:18:3
	j	.LBB0_1
.Ltmp5:
.LBB0_4:                                # %for.end
	.loc	0 20 10 is_stmt 1               # aos_reduce_sum_i32.c:20:10
	lw	a0, -36(s0)
	.loc	0 20 3 epilogue_begin is_stmt 0 # aos_reduce_sum_i32.c:20:3
	addi	sp, s0, -48
	.cfi_def_cfa sp, 48
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 48
	.cfi_def_cfa_offset 0
	ret
.Ltmp6:
.Lfunc_end0:
	.size	aos_reduce_sum_i32, .Lfunc_end0-aos_reduce_sum_i32
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
	.byte	8                               # Abbreviation Code
	.byte	19                              # DW_TAG_structure_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	9                               # Abbreviation Code
	.byte	13                              # DW_TAG_member
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	56                              # DW_AT_data_member_location
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
	.byte	1                               # Abbrev [1] 0xc:0xba DW_TAG_compile_unit
	.byte	0                               # DW_AT_producer
	.half	29                              # DW_AT_language
	.byte	1                               # DW_AT_name
	.word	.Lstr_offsets_base0             # DW_AT_str_offsets_base
	.word	.Lline_table_start0             # DW_AT_stmt_list
	.byte	2                               # DW_AT_comp_dir
	.byte	0                               # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.word	.Laddr_table_base0              # DW_AT_addr_base
	.byte	2                               # Abbrev [2] 0x23:0x43 DW_TAG_subprogram
	.byte	0                               # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	88
	.byte	3                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	16                              # DW_AT_decl_line
                                        # DW_AT_prototyped
	.word	102                             # DW_AT_type
                                        # DW_AT_external
	.byte	3                               # Abbrev [3] 0x32:0xb DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	108
	.byte	5                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	16                              # DW_AT_decl_line
	.word	106                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x3d:0xb DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	96
	.byte	7                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	16                              # DW_AT_decl_line
	.word	110                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x48:0xb DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	92
	.byte	17                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	17                              # DW_AT_decl_line
	.word	102                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0x53:0x12 DW_TAG_lexical_block
	.byte	1                               # DW_AT_low_pc
	.word	.Ltmp5-.Ltmp1                   # DW_AT_high_pc
	.byte	4                               # Abbrev [4] 0x59:0xb DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	88
	.byte	18                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	18                              # DW_AT_decl_line
	.word	106                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	6                               # Abbrev [6] 0x66:0x4 DW_TAG_base_type
	.byte	4                               # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	6                               # Abbrev [6] 0x6a:0x4 DW_TAG_base_type
	.byte	6                               # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	7                               # Abbrev [7] 0x6e:0x5 DW_TAG_pointer_type
	.word	115                             # DW_AT_type
	.byte	8                               # Abbrev [8] 0x73:0x4e DW_TAG_structure_type
	.byte	16                              # DW_AT_name
	.byte	56                              # DW_AT_byte_size
	.byte	0                               # DW_AT_decl_file
	.byte	2                               # DW_AT_decl_line
	.byte	9                               # Abbrev [9] 0x78:0x9 DW_TAG_member
	.byte	7                               # DW_AT_name
	.word	193                             # DW_AT_type
	.byte	0                               # DW_AT_decl_file
	.byte	3                               # DW_AT_decl_line
	.byte	0                               # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x81:0x9 DW_TAG_member
	.byte	9                               # DW_AT_name
	.word	193                             # DW_AT_type
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.byte	8                               # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x8a:0x9 DW_TAG_member
	.byte	10                              # DW_AT_name
	.word	193                             # DW_AT_type
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
	.byte	16                              # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x93:0x9 DW_TAG_member
	.byte	11                              # DW_AT_name
	.word	193                             # DW_AT_type
	.byte	0                               # DW_AT_decl_file
	.byte	6                               # DW_AT_decl_line
	.byte	24                              # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x9c:0x9 DW_TAG_member
	.byte	12                              # DW_AT_name
	.word	193                             # DW_AT_type
	.byte	0                               # DW_AT_decl_file
	.byte	7                               # DW_AT_decl_line
	.byte	32                              # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0xa5:0x9 DW_TAG_member
	.byte	13                              # DW_AT_name
	.word	193                             # DW_AT_type
	.byte	0                               # DW_AT_decl_file
	.byte	8                               # DW_AT_decl_line
	.byte	40                              # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0xae:0x9 DW_TAG_member
	.byte	14                              # DW_AT_name
	.word	102                             # DW_AT_type
	.byte	0                               # DW_AT_decl_file
	.byte	9                               # DW_AT_decl_line
	.byte	48                              # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0xb7:0x9 DW_TAG_member
	.byte	15                              # DW_AT_name
	.word	102                             # DW_AT_type
	.byte	0                               # DW_AT_decl_file
	.byte	10                              # DW_AT_decl_line
	.byte	52                              # DW_AT_data_member_location
	.byte	0                               # End Of Children Mark
	.byte	6                               # Abbrev [6] 0xc1:0x4 DW_TAG_base_type
	.byte	8                               # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
	.byte	0                               # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_str_offsets,"",@progbits
	.word	80                              # Length of String Offsets Set
	.half	5
	.half	0
.Lstr_offsets_base0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)" # string offset=0
.Linfo_string1:
	.asciz	"aos_reduce_sum_i32.c"          # string offset=108
.Linfo_string2:
	.asciz	"/home/preames/benchmarking/simple-vector-riscv" # string offset=129
.Linfo_string3:
	.asciz	"aos_reduce_sum_i32"            # string offset=176
.Linfo_string4:
	.asciz	"int"                           # string offset=195
.Linfo_string5:
	.asciz	"len"                           # string offset=199
.Linfo_string6:
	.asciz	"unsigned int"                  # string offset=203
.Linfo_string7:
	.asciz	"a"                             # string offset=216
.Linfo_string8:
	.asciz	"long"                          # string offset=218
.Linfo_string9:
	.asciz	"b"                             # string offset=223
.Linfo_string10:
	.asciz	"c"                             # string offset=225
.Linfo_string11:
	.asciz	"d"                             # string offset=227
.Linfo_string12:
	.asciz	"e"                             # string offset=229
.Linfo_string13:
	.asciz	"f"                             # string offset=231
.Linfo_string14:
	.asciz	"g"                             # string offset=233
.Linfo_string15:
	.asciz	"h"                             # string offset=235
.Linfo_string16:
	.asciz	"T"                             # string offset=237
.Linfo_string17:
	.asciz	"sum"                           # string offset=239
.Linfo_string18:
	.asciz	"i"                             # string offset=243
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
	.word	.Linfo_string18
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
