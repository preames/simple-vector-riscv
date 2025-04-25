	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zfh1p0_zfhmin1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfh1p0_zvfhmin1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl512b1p0_zvl64b1p0"
	.file	"lemire-20221223.c"
	.text
	.globl	encode_byte_table               # -- Begin function encode_byte_table
	.p2align	1
	.type	encode_byte_table,@function
encode_byte_table:                      # @encode_byte_table
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a1, .LBB0_3
# %bb.1:                                # %for.body.preheader
.Lpcrel_hi0:
	auipc	a3, %pcrel_hi(.L__const.encode_byte_table.table)
	sh1add	a1, a1, a2
	addi	a3, a3, %pcrel_lo(.Lpcrel_hi0)
.LBB0_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lbu	a4, 0(a0)
	addi	a0, a0, 1
	sh1add	a4, a4, a3
	lh	a4, 0(a4)
	srli	a5, a4, 8
	sb	a4, 0(a2)
	sb	a5, 1(a2)
	addi	a2, a2, 2
	bne	a2, a1, .LBB0_2
.LBB0_3:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	encode_byte_table, .Lfunc_end0-encode_byte_table
	.cfi_endproc
                                        # -- End function
	.globl	encode_nibble_table             # -- Begin function encode_nibble_table
	.p2align	1
	.type	encode_nibble_table,@function
encode_nibble_table:                    # @encode_nibble_table
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a1, .LBB1_3
# %bb.1:                                # %for.body.preheader
.Lpcrel_hi1:
	auipc	a3, %pcrel_hi(.L__const.encode_nibble_table.table)
	sh2add	a6, a1, a2
	addi	a3, a3, %pcrel_lo(.Lpcrel_hi1)
.LBB1_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lbu	a4, 0(a0)
	addi	a0, a0, 1
	andi	a5, a4, 15
	srli	a4, a4, 3
	srliw	a4, a4, 1
	sh1add	a5, a5, a3
	sh1add	a4, a4, a3
	lhu	a5, 0(a5)
	lh	a4, 0(a4)
	srli	a1, a5, 8
	sb	a5, 0(a2)
	sb	a1, 1(a2)
	srli	a1, a4, 8
	sb	a4, 2(a2)
	sb	a1, 3(a2)
	addi	a2, a2, 4
	bne	a2, a6, .LBB1_2
.LBB1_3:                                # %for.cond.cleanup
	ret
.Lfunc_end1:
	.size	encode_nibble_table, .Lfunc_end1-encode_nibble_table
	.cfi_endproc
                                        # -- End function
	.type	.L__const.encode_byte_table.table,@object # @__const.encode_byte_table.table
	.section	.rodata,"a",@progbits
	.p2align	1, 0x0
.L__const.encode_byte_table.table:
	.half	12336                           # 0x3030
	.half	12592                           # 0x3130
	.half	12848                           # 0x3230
	.half	13104                           # 0x3330
	.half	13360                           # 0x3430
	.half	13616                           # 0x3530
	.half	13872                           # 0x3630
	.half	14128                           # 0x3730
	.half	14384                           # 0x3830
	.half	14640                           # 0x3930
	.half	24880                           # 0x6130
	.half	25136                           # 0x6230
	.half	25392                           # 0x6330
	.half	25648                           # 0x6430
	.half	25904                           # 0x6530
	.half	26160                           # 0x6630
	.half	12337                           # 0x3031
	.half	12593                           # 0x3131
	.half	12849                           # 0x3231
	.half	13105                           # 0x3331
	.half	13361                           # 0x3431
	.half	13617                           # 0x3531
	.half	13873                           # 0x3631
	.half	14129                           # 0x3731
	.half	14385                           # 0x3831
	.half	14641                           # 0x3931
	.half	24881                           # 0x6131
	.half	25137                           # 0x6231
	.half	25393                           # 0x6331
	.half	25649                           # 0x6431
	.half	25905                           # 0x6531
	.half	26161                           # 0x6631
	.half	12338                           # 0x3032
	.half	12594                           # 0x3132
	.half	12850                           # 0x3232
	.half	13106                           # 0x3332
	.half	13362                           # 0x3432
	.half	13618                           # 0x3532
	.half	13874                           # 0x3632
	.half	14130                           # 0x3732
	.half	14386                           # 0x3832
	.half	14642                           # 0x3932
	.half	24882                           # 0x6132
	.half	25138                           # 0x6232
	.half	25394                           # 0x6332
	.half	25650                           # 0x6432
	.half	25906                           # 0x6532
	.half	26162                           # 0x6632
	.half	12339                           # 0x3033
	.half	12595                           # 0x3133
	.half	12851                           # 0x3233
	.half	13107                           # 0x3333
	.half	13363                           # 0x3433
	.half	13619                           # 0x3533
	.half	13875                           # 0x3633
	.half	14131                           # 0x3733
	.half	14387                           # 0x3833
	.half	14643                           # 0x3933
	.half	24883                           # 0x6133
	.half	25139                           # 0x6233
	.half	25395                           # 0x6333
	.half	25651                           # 0x6433
	.half	25907                           # 0x6533
	.half	26163                           # 0x6633
	.half	12340                           # 0x3034
	.half	12596                           # 0x3134
	.half	12852                           # 0x3234
	.half	13108                           # 0x3334
	.half	13364                           # 0x3434
	.half	13620                           # 0x3534
	.half	13876                           # 0x3634
	.half	14132                           # 0x3734
	.half	14388                           # 0x3834
	.half	14644                           # 0x3934
	.half	24884                           # 0x6134
	.half	25140                           # 0x6234
	.half	25396                           # 0x6334
	.half	25652                           # 0x6434
	.half	25908                           # 0x6534
	.half	26164                           # 0x6634
	.half	12341                           # 0x3035
	.half	12597                           # 0x3135
	.half	12853                           # 0x3235
	.half	13109                           # 0x3335
	.half	13365                           # 0x3435
	.half	13621                           # 0x3535
	.half	13877                           # 0x3635
	.half	14133                           # 0x3735
	.half	14389                           # 0x3835
	.half	14645                           # 0x3935
	.half	24885                           # 0x6135
	.half	25141                           # 0x6235
	.half	25397                           # 0x6335
	.half	25653                           # 0x6435
	.half	25909                           # 0x6535
	.half	26165                           # 0x6635
	.half	12342                           # 0x3036
	.half	12598                           # 0x3136
	.half	12854                           # 0x3236
	.half	13110                           # 0x3336
	.half	13366                           # 0x3436
	.half	13622                           # 0x3536
	.half	13878                           # 0x3636
	.half	14134                           # 0x3736
	.half	14390                           # 0x3836
	.half	14646                           # 0x3936
	.half	24886                           # 0x6136
	.half	25142                           # 0x6236
	.half	25398                           # 0x6336
	.half	25654                           # 0x6436
	.half	25910                           # 0x6536
	.half	26166                           # 0x6636
	.half	12343                           # 0x3037
	.half	12599                           # 0x3137
	.half	12855                           # 0x3237
	.half	13111                           # 0x3337
	.half	13367                           # 0x3437
	.half	13623                           # 0x3537
	.half	13879                           # 0x3637
	.half	14135                           # 0x3737
	.half	14391                           # 0x3837
	.half	14647                           # 0x3937
	.half	24887                           # 0x6137
	.half	25143                           # 0x6237
	.half	25399                           # 0x6337
	.half	25655                           # 0x6437
	.half	25911                           # 0x6537
	.half	26167                           # 0x6637
	.half	12344                           # 0x3038
	.half	12600                           # 0x3138
	.half	12856                           # 0x3238
	.half	13112                           # 0x3338
	.half	13368                           # 0x3438
	.half	13624                           # 0x3538
	.half	13880                           # 0x3638
	.half	14136                           # 0x3738
	.half	14392                           # 0x3838
	.half	14648                           # 0x3938
	.half	24888                           # 0x6138
	.half	25144                           # 0x6238
	.half	25400                           # 0x6338
	.half	25656                           # 0x6438
	.half	25912                           # 0x6538
	.half	26168                           # 0x6638
	.half	12345                           # 0x3039
	.half	12601                           # 0x3139
	.half	12857                           # 0x3239
	.half	13113                           # 0x3339
	.half	13369                           # 0x3439
	.half	13625                           # 0x3539
	.half	13881                           # 0x3639
	.half	14137                           # 0x3739
	.half	14393                           # 0x3839
	.half	14649                           # 0x3939
	.half	24889                           # 0x6139
	.half	25145                           # 0x6239
	.half	25401                           # 0x6339
	.half	25657                           # 0x6439
	.half	25913                           # 0x6539
	.half	26169                           # 0x6639
	.half	12385                           # 0x3061
	.half	12641                           # 0x3161
	.half	12897                           # 0x3261
	.half	13153                           # 0x3361
	.half	13409                           # 0x3461
	.half	13665                           # 0x3561
	.half	13921                           # 0x3661
	.half	14177                           # 0x3761
	.half	14433                           # 0x3861
	.half	14689                           # 0x3961
	.half	24929                           # 0x6161
	.half	25185                           # 0x6261
	.half	25441                           # 0x6361
	.half	25697                           # 0x6461
	.half	25953                           # 0x6561
	.half	26209                           # 0x6661
	.half	12386                           # 0x3062
	.half	12642                           # 0x3162
	.half	12898                           # 0x3262
	.half	13154                           # 0x3362
	.half	13410                           # 0x3462
	.half	13666                           # 0x3562
	.half	13922                           # 0x3662
	.half	14178                           # 0x3762
	.half	14434                           # 0x3862
	.half	14690                           # 0x3962
	.half	24930                           # 0x6162
	.half	25186                           # 0x6262
	.half	25442                           # 0x6362
	.half	25698                           # 0x6462
	.half	25954                           # 0x6562
	.half	26210                           # 0x6662
	.half	12387                           # 0x3063
	.half	12643                           # 0x3163
	.half	12899                           # 0x3263
	.half	13155                           # 0x3363
	.half	13411                           # 0x3463
	.half	13667                           # 0x3563
	.half	13923                           # 0x3663
	.half	14179                           # 0x3763
	.half	14435                           # 0x3863
	.half	14691                           # 0x3963
	.half	24931                           # 0x6163
	.half	25187                           # 0x6263
	.half	25443                           # 0x6363
	.half	25699                           # 0x6463
	.half	25955                           # 0x6563
	.half	26211                           # 0x6663
	.half	12388                           # 0x3064
	.half	12644                           # 0x3164
	.half	12900                           # 0x3264
	.half	13156                           # 0x3364
	.half	13412                           # 0x3464
	.half	13668                           # 0x3564
	.half	13924                           # 0x3664
	.half	14180                           # 0x3764
	.half	14436                           # 0x3864
	.half	14692                           # 0x3964
	.half	24932                           # 0x6164
	.half	25188                           # 0x6264
	.half	25444                           # 0x6364
	.half	25700                           # 0x6464
	.half	25956                           # 0x6564
	.half	26212                           # 0x6664
	.half	12389                           # 0x3065
	.half	12645                           # 0x3165
	.half	12901                           # 0x3265
	.half	13157                           # 0x3365
	.half	13413                           # 0x3465
	.half	13669                           # 0x3565
	.half	13925                           # 0x3665
	.half	14181                           # 0x3765
	.half	14437                           # 0x3865
	.half	14693                           # 0x3965
	.half	24933                           # 0x6165
	.half	25189                           # 0x6265
	.half	25445                           # 0x6365
	.half	25701                           # 0x6465
	.half	25957                           # 0x6565
	.half	26213                           # 0x6665
	.half	12390                           # 0x3066
	.half	12646                           # 0x3166
	.half	12902                           # 0x3266
	.half	13158                           # 0x3366
	.half	13414                           # 0x3466
	.half	13670                           # 0x3566
	.half	13926                           # 0x3666
	.half	14182                           # 0x3766
	.half	14438                           # 0x3866
	.half	14694                           # 0x3966
	.half	24934                           # 0x6166
	.half	25190                           # 0x6266
	.half	25446                           # 0x6366
	.half	25702                           # 0x6466
	.half	25958                           # 0x6566
	.half	26214                           # 0x6666
	.size	.L__const.encode_byte_table.table, 512

	.type	.L__const.encode_nibble_table.table,@object # @__const.encode_nibble_table.table
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	1, 0x0
.L__const.encode_nibble_table.table:
	.half	102                             # 0x66
	.half	101                             # 0x65
	.half	100                             # 0x64
	.half	99                              # 0x63
	.half	98                              # 0x62
	.half	97                              # 0x61
	.half	57                              # 0x39
	.half	56                              # 0x38
	.half	55                              # 0x37
	.half	54                              # 0x36
	.half	53                              # 0x35
	.half	52                              # 0x34
	.half	51                              # 0x33
	.half	50                              # 0x32
	.half	49                              # 0x31
	.half	48                              # 0x30
	.size	.L__const.encode_nibble_table.table, 32

	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
