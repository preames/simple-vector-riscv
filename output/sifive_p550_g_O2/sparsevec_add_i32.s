	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
	.file	"sparsevec_add_i32.c"
	.text
	.globl	sparsevec_add_i32               # -- Begin function sparsevec_add_i32
	.p2align	1
	.type	sparsevec_add_i32,@function
sparsevec_add_i32:                      # @sparsevec_add_i32
.Lfunc_begin0:
	.file	0 "/home/preames/benchmarking/simple-vector-riscv" "sparsevec_add_i32.c" md5 0x73928bb71272c5766b42d0164bc31a05
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: sparsevec_add_i32:len <- $x10
	#DEBUG_VALUE: sparsevec_add_i32:a <- $x11
	#DEBUG_VALUE: sparsevec_add_i32:aidx <- $x12
	#DEBUG_VALUE: sparsevec_add_i32:b <- $x13
	#DEBUG_VALUE: sparsevec_add_i32:bidx <- $x14
	#DEBUG_VALUE: i <- 0
	.loc	0 6 3 prologue_end              # sparsevec_add_i32.c:6:3
	beqz	a0, .LBB0_3
.Ltmp0:
# %bb.1:                                # %for.body.preheader
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: sparsevec_add_i32:bidx <- $x14
	#DEBUG_VALUE: sparsevec_add_i32:b <- $x13
	#DEBUG_VALUE: sparsevec_add_i32:aidx <- $x12
	#DEBUG_VALUE: sparsevec_add_i32:a <- $x11
	#DEBUG_VALUE: sparsevec_add_i32:len <- $x10
	andi	a6, a0, 7
	li	a5, 8
	bgeu	a0, a5, .LBB0_4
.Ltmp1:
# %bb.2:
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: sparsevec_add_i32:bidx <- $x14
	#DEBUG_VALUE: sparsevec_add_i32:b <- $x13
	#DEBUG_VALUE: sparsevec_add_i32:aidx <- $x12
	#DEBUG_VALUE: sparsevec_add_i32:a <- $x11
	#DEBUG_VALUE: sparsevec_add_i32:len <- $x10
	.loc	0 0 3 is_stmt 0                 # sparsevec_add_i32.c:0:3
	li	a5, 0
	.loc	0 6 3                           # sparsevec_add_i32.c:6:3
	bnez	a6, .LBB0_7
.Ltmp2:
.LBB0_3:                                # %for.cond.cleanup
	#DEBUG_VALUE: sparsevec_add_i32:b <- $x13
	#DEBUG_VALUE: sparsevec_add_i32:a <- $x11
	.loc	0 8 1 is_stmt 1                 # sparsevec_add_i32.c:8:1
	ret
.Ltmp3:
.LBB0_4:                                # %for.body.preheader.new
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: sparsevec_add_i32:bidx <- $x14
	#DEBUG_VALUE: sparsevec_add_i32:b <- $x13
	#DEBUG_VALUE: sparsevec_add_i32:aidx <- $x12
	#DEBUG_VALUE: sparsevec_add_i32:a <- $x11
	#DEBUG_VALUE: sparsevec_add_i32:len <- $x10
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sd	s0, 24(sp)                      # 8-byte Folded Spill
	sd	s1, 16(sp)                      # 8-byte Folded Spill
	sd	s2, 8(sp)                       # 8-byte Folded Spill
	sd	s3, 0(sp)                       # 8-byte Folded Spill
	.cfi_offset s0, -8
	.cfi_offset s1, -16
	.cfi_offset s2, -24
	.cfi_offset s3, -32
.Ltmp4:
	.loc	0 6 0                           # sparsevec_add_i32.c:6
	zext.w	a0, a0
.Ltmp5:
	.loc	0 0 0 is_stmt 0                 # sparsevec_add_i32.c:0:0
	li	t0, 0
	.loc	0 6 3                           # sparsevec_add_i32.c:6:3
	addi	a5, a4, 8
	andi	a0, a0, -8
	neg	a7, a0
	addi	a0, a2, 8
.Ltmp6:
.LBB0_5:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: sparsevec_add_i32:bidx <- $x14
	#DEBUG_VALUE: sparsevec_add_i32:b <- $x13
	#DEBUG_VALUE: sparsevec_add_i32:aidx <- $x12
	#DEBUG_VALUE: sparsevec_add_i32:a <- $x11
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_stack_value] $x5
	.loc	0 7 21 is_stmt 1                # sparsevec_add_i32.c:7:21
	lh	t1, -8(a5)
	lh	t2, -6(a5)
	lh	t3, -4(a5)
	lh	t4, -2(a5)
.Ltmp7:
	.loc	0 6 3                           # sparsevec_add_i32.c:6:3
	addi	t0, t0, -8
.Ltmp8:
	.loc	0 7 19                          # sparsevec_add_i32.c:7:19
	sh2add	t1, t1, a3
	.loc	0 7 7 is_stmt 0                 # sparsevec_add_i32.c:7:7
	lh	t5, -8(a0)
	lh	t6, -6(a0)
	lh	s3, -4(a0)
	lh	s2, -2(a0)
	.loc	0 7 5                           # sparsevec_add_i32.c:7:5
	sh2add	s0, t5, a1
	.loc	0 7 19                          # sparsevec_add_i32.c:7:19
	lw	t1, 0(t1)
	.loc	0 7 16                          # sparsevec_add_i32.c:7:16
	lw	s1, 0(s0)
	add	t1, t1, s1
	.loc	0 7 19                          # sparsevec_add_i32.c:7:19
	sh2add	s1, t2, a3
	.loc	0 7 16                          # sparsevec_add_i32.c:7:16
	sw	t1, 0(s0)
.Ltmp9:
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 1, DW_OP_plus, DW_OP_stack_value] $x5
	.loc	0 7 5                           # sparsevec_add_i32.c:7:5
	sh2add	s0, t6, a1
	sh2add	t6, s2, a1
	.loc	0 7 21                          # sparsevec_add_i32.c:7:21
	lh	t2, 0(a5)
	.loc	0 7 19                          # sparsevec_add_i32.c:7:19
	lw	t1, 0(s1)
	.loc	0 7 16                          # sparsevec_add_i32.c:7:16
	lw	s1, 0(s0)
	add	t1, t1, s1
	.loc	0 7 19                          # sparsevec_add_i32.c:7:19
	sh2add	s1, t3, a3
	.loc	0 7 21                          # sparsevec_add_i32.c:7:21
	lh	t3, 2(a5)
	.loc	0 7 16                          # sparsevec_add_i32.c:7:16
	sw	t1, 0(s0)
.Ltmp10:
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 2, DW_OP_plus, DW_OP_stack_value] $x5
	.loc	0 7 5                           # sparsevec_add_i32.c:7:5
	sh2add	s0, s3, a1
	.loc	0 7 19                          # sparsevec_add_i32.c:7:19
	lw	t1, 0(s1)
	.loc	0 7 16                          # sparsevec_add_i32.c:7:16
	lw	s1, 0(s0)
	add	t1, t1, s1
	.loc	0 7 19                          # sparsevec_add_i32.c:7:19
	sh2add	s1, t4, a3
	.loc	0 7 21                          # sparsevec_add_i32.c:7:21
	lh	t4, 4(a5)
	lh	t5, 6(a5)
.Ltmp11:
	.loc	0 6 3 is_stmt 1                 # sparsevec_add_i32.c:6:3
	addi	a5, a5, 16
.Ltmp12:
	.loc	0 7 16                          # sparsevec_add_i32.c:7:16
	sw	t1, 0(s0)
.Ltmp13:
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 3, DW_OP_plus, DW_OP_stack_value] $x5
	.loc	0 7 19 is_stmt 0                # sparsevec_add_i32.c:7:19
	sh2add	s0, t2, a3
	lw	t1, 0(s1)
	.loc	0 7 16                          # sparsevec_add_i32.c:7:16
	lw	s1, 0(t6)
	add	t1, t1, s1
	.loc	0 7 7                           # sparsevec_add_i32.c:7:7
	lh	s1, 0(a0)
	lh	t2, 2(a0)
	lh	s2, 4(a0)
	.loc	0 7 16                          # sparsevec_add_i32.c:7:16
	sw	t1, 0(t6)
.Ltmp14:
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 4, DW_OP_plus, DW_OP_stack_value] $x5
	.loc	0 7 7                           # sparsevec_add_i32.c:7:7
	lh	t1, 6(a0)
.Ltmp15:
	.loc	0 6 3 is_stmt 1                 # sparsevec_add_i32.c:6:3
	addi	a0, a0, 16
.Ltmp16:
	.loc	0 7 19                          # sparsevec_add_i32.c:7:19
	lw	t6, 0(s0)
	.loc	0 7 5 is_stmt 0                 # sparsevec_add_i32.c:7:5
	sh2add	s1, s1, a1
	.loc	0 7 16                          # sparsevec_add_i32.c:7:16
	lw	s0, 0(s1)
	add	t6, t6, s0
	.loc	0 7 5                           # sparsevec_add_i32.c:7:5
	sh2add	s0, t2, a1
	.loc	0 7 16                          # sparsevec_add_i32.c:7:16
	sw	t6, 0(s1)
.Ltmp17:
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 5, DW_OP_plus, DW_OP_stack_value] $x5
	.loc	0 7 19                          # sparsevec_add_i32.c:7:19
	sh2add	s1, t3, a3
	lw	t2, 0(s1)
	.loc	0 7 16                          # sparsevec_add_i32.c:7:16
	lw	s1, 0(s0)
	add	t2, t2, s1
	.loc	0 7 19                          # sparsevec_add_i32.c:7:19
	sh2add	s1, t4, a3
	.loc	0 7 16                          # sparsevec_add_i32.c:7:16
	sw	t2, 0(s0)
.Ltmp18:
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 6, DW_OP_plus, DW_OP_stack_value] $x5
	.loc	0 7 5                           # sparsevec_add_i32.c:7:5
	sh2add	s0, s2, a1
	.loc	0 7 19                          # sparsevec_add_i32.c:7:19
	lw	t2, 0(s1)
	.loc	0 7 16                          # sparsevec_add_i32.c:7:16
	lw	s1, 0(s0)
	add	t2, t2, s1
	.loc	0 7 19                          # sparsevec_add_i32.c:7:19
	sh2add	s1, t5, a3
	.loc	0 7 16                          # sparsevec_add_i32.c:7:16
	sw	t2, 0(s0)
.Ltmp19:
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 7, DW_OP_plus, DW_OP_stack_value] $x5
	.loc	0 7 5                           # sparsevec_add_i32.c:7:5
	sh2add	s0, t1, a1
	.loc	0 7 19                          # sparsevec_add_i32.c:7:19
	lw	t1, 0(s1)
	.loc	0 7 16                          # sparsevec_add_i32.c:7:16
	lw	s1, 0(s0)
	add	t1, t1, s1
	sw	t1, 0(s0)
.Ltmp20:
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 8, DW_OP_plus, DW_OP_stack_value] $x5
	.loc	0 6 3 is_stmt 1                 # sparsevec_add_i32.c:6:3
	bne	a7, t0, .LBB0_5
.Ltmp21:
# %bb.6:                                # %for.cond.cleanup.loopexit.unr-lcssa.loopexit
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 8, DW_OP_plus, DW_OP_stack_value] $x5
	#DEBUG_VALUE: sparsevec_add_i32:bidx <- $x14
	#DEBUG_VALUE: sparsevec_add_i32:b <- $x13
	#DEBUG_VALUE: sparsevec_add_i32:aidx <- $x12
	#DEBUG_VALUE: sparsevec_add_i32:a <- $x11
	.loc	0 0 3 is_stmt 0                 # sparsevec_add_i32.c:0:3
	ld	s0, 24(sp)                      # 8-byte Folded Reload
	.loc	0 6 3                           # sparsevec_add_i32.c:6:3
	neg	a5, t0
	ld	s1, 16(sp)                      # 8-byte Folded Reload
	ld	s2, 8(sp)                       # 8-byte Folded Reload
	ld	s3, 0(sp)                       # 8-byte Folded Reload
	.cfi_restore s0
	.cfi_restore s1
	.cfi_restore s2
	.cfi_restore s3
	addi	sp, sp, 32
	.cfi_def_cfa_offset 0
	beqz	a6, .LBB0_3
.Ltmp22:
.LBB0_7:                                # %for.body.epil
	#DEBUG_VALUE: sparsevec_add_i32:bidx <- $x14
	#DEBUG_VALUE: sparsevec_add_i32:b <- $x13
	#DEBUG_VALUE: sparsevec_add_i32:aidx <- $x12
	#DEBUG_VALUE: sparsevec_add_i32:a <- $x11
	#DEBUG_VALUE: i <- $x15
	.loc	0 7 21 is_stmt 1                # sparsevec_add_i32.c:7:21
	sh1add	a7, a5, a4
	.loc	0 7 7 is_stmt 0                 # sparsevec_add_i32.c:7:7
	sh1add	a2, a5, a2
.Ltmp23:
	.loc	0 7 21                          # sparsevec_add_i32.c:7:21
	lh	a4, 0(a7)
.Ltmp24:
	.loc	0 7 7                           # sparsevec_add_i32.c:7:7
	lh	a5, 0(a2)
.Ltmp25:
	.loc	0 7 19                          # sparsevec_add_i32.c:7:19
	sh2add	a4, a4, a3
	.loc	0 7 5                           # sparsevec_add_i32.c:7:5
	sh2add	a5, a5, a1
	.loc	0 7 19                          # sparsevec_add_i32.c:7:19
	lw	a4, 0(a4)
	.loc	0 7 16                          # sparsevec_add_i32.c:7:16
	lw	a0, 0(a5)
	add	a0, a0, a4
	sw	a0, 0(a5)
	li	a0, 1
.Ltmp26:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 1, DW_OP_stack_value] undef
	.loc	0 6 3 is_stmt 1                 # sparsevec_add_i32.c:6:3
	beq	a6, a0, .LBB0_3
.Ltmp27:
# %bb.8:                                # %for.body.epil.1
	#DEBUG_VALUE: sparsevec_add_i32:b <- $x13
	#DEBUG_VALUE: sparsevec_add_i32:a <- $x11
	#DEBUG_VALUE: i <- undef
	.loc	0 7 21                          # sparsevec_add_i32.c:7:21
	lh	a0, 2(a7)
	.loc	0 7 19 is_stmt 0                # sparsevec_add_i32.c:7:19
	sh2add	a0, a0, a3
	.loc	0 7 7                           # sparsevec_add_i32.c:7:7
	lh	a4, 2(a2)
	.loc	0 7 5                           # sparsevec_add_i32.c:7:5
	sh2add	a4, a4, a1
	.loc	0 7 19                          # sparsevec_add_i32.c:7:19
	lw	a0, 0(a0)
	.loc	0 7 16                          # sparsevec_add_i32.c:7:16
	lw	a5, 0(a4)
	add	a0, a0, a5
	sw	a0, 0(a4)
	li	a0, 2
.Ltmp28:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 2, DW_OP_stack_value] undef
	.loc	0 6 3 is_stmt 1                 # sparsevec_add_i32.c:6:3
	beq	a6, a0, .LBB0_3
.Ltmp29:
# %bb.9:                                # %for.body.epil.2
	#DEBUG_VALUE: sparsevec_add_i32:b <- $x13
	#DEBUG_VALUE: sparsevec_add_i32:a <- $x11
	#DEBUG_VALUE: i <- undef
	.loc	0 7 21                          # sparsevec_add_i32.c:7:21
	lh	a0, 4(a7)
	.loc	0 7 19 is_stmt 0                # sparsevec_add_i32.c:7:19
	sh2add	a0, a0, a3
	.loc	0 7 7                           # sparsevec_add_i32.c:7:7
	lh	a4, 4(a2)
	.loc	0 7 5                           # sparsevec_add_i32.c:7:5
	sh2add	a4, a4, a1
	.loc	0 7 19                          # sparsevec_add_i32.c:7:19
	lw	a0, 0(a0)
	.loc	0 7 16                          # sparsevec_add_i32.c:7:16
	lw	a5, 0(a4)
	add	a0, a0, a5
	sw	a0, 0(a4)
	li	a0, 3
.Ltmp30:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 3, DW_OP_stack_value] undef
	.loc	0 6 3 is_stmt 1                 # sparsevec_add_i32.c:6:3
	beq	a6, a0, .LBB0_3
.Ltmp31:
# %bb.10:                               # %for.body.epil.3
	#DEBUG_VALUE: sparsevec_add_i32:b <- $x13
	#DEBUG_VALUE: sparsevec_add_i32:a <- $x11
	#DEBUG_VALUE: i <- undef
	.loc	0 7 21                          # sparsevec_add_i32.c:7:21
	lh	a0, 6(a7)
	.loc	0 7 19 is_stmt 0                # sparsevec_add_i32.c:7:19
	sh2add	a0, a0, a3
	.loc	0 7 7                           # sparsevec_add_i32.c:7:7
	lh	a4, 6(a2)
	.loc	0 7 5                           # sparsevec_add_i32.c:7:5
	sh2add	a4, a4, a1
	.loc	0 7 19                          # sparsevec_add_i32.c:7:19
	lw	a0, 0(a0)
	.loc	0 7 16                          # sparsevec_add_i32.c:7:16
	lw	a5, 0(a4)
	add	a0, a0, a5
	sw	a0, 0(a4)
	li	a0, 4
.Ltmp32:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 4, DW_OP_stack_value] undef
	.loc	0 6 3 is_stmt 1                 # sparsevec_add_i32.c:6:3
	beq	a6, a0, .LBB0_3
.Ltmp33:
# %bb.11:                               # %for.body.epil.4
	#DEBUG_VALUE: sparsevec_add_i32:b <- $x13
	#DEBUG_VALUE: sparsevec_add_i32:a <- $x11
	#DEBUG_VALUE: i <- undef
	.loc	0 7 21                          # sparsevec_add_i32.c:7:21
	lh	a0, 8(a7)
	.loc	0 7 19 is_stmt 0                # sparsevec_add_i32.c:7:19
	sh2add	a0, a0, a3
	.loc	0 7 7                           # sparsevec_add_i32.c:7:7
	lh	a4, 8(a2)
	.loc	0 7 5                           # sparsevec_add_i32.c:7:5
	sh2add	a4, a4, a1
	.loc	0 7 19                          # sparsevec_add_i32.c:7:19
	lw	a0, 0(a0)
	.loc	0 7 16                          # sparsevec_add_i32.c:7:16
	lw	a5, 0(a4)
	add	a0, a0, a5
	sw	a0, 0(a4)
	li	a0, 5
.Ltmp34:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 5, DW_OP_stack_value] undef
	.loc	0 6 3 is_stmt 1                 # sparsevec_add_i32.c:6:3
	beq	a6, a0, .LBB0_3
.Ltmp35:
# %bb.12:                               # %for.body.epil.5
	#DEBUG_VALUE: sparsevec_add_i32:b <- $x13
	#DEBUG_VALUE: sparsevec_add_i32:a <- $x11
	#DEBUG_VALUE: i <- undef
	.loc	0 7 21                          # sparsevec_add_i32.c:7:21
	lh	a0, 10(a7)
	.loc	0 7 19 is_stmt 0                # sparsevec_add_i32.c:7:19
	sh2add	a0, a0, a3
	.loc	0 7 7                           # sparsevec_add_i32.c:7:7
	lh	a4, 10(a2)
	.loc	0 7 5                           # sparsevec_add_i32.c:7:5
	sh2add	a4, a4, a1
	.loc	0 7 19                          # sparsevec_add_i32.c:7:19
	lw	a0, 0(a0)
	.loc	0 7 16                          # sparsevec_add_i32.c:7:16
	lw	a5, 0(a4)
	add	a0, a0, a5
	sw	a0, 0(a4)
	li	a0, 6
.Ltmp36:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 6, DW_OP_stack_value] undef
	.loc	0 6 3 is_stmt 1                 # sparsevec_add_i32.c:6:3
	beq	a6, a0, .LBB0_3
.Ltmp37:
# %bb.13:                               # %for.body.epil.6
	#DEBUG_VALUE: sparsevec_add_i32:b <- $x13
	#DEBUG_VALUE: sparsevec_add_i32:a <- $x11
	#DEBUG_VALUE: i <- undef
	.loc	0 7 21                          # sparsevec_add_i32.c:7:21
	lh	a0, 12(a7)
	.loc	0 7 19 is_stmt 0                # sparsevec_add_i32.c:7:19
	sh2add	a0, a0, a3
	.loc	0 7 7                           # sparsevec_add_i32.c:7:7
	lh	a2, 12(a2)
	.loc	0 7 5                           # sparsevec_add_i32.c:7:5
	sh2add	a1, a2, a1
.Ltmp38:
	.loc	0 7 19                          # sparsevec_add_i32.c:7:19
	lw	a0, 0(a0)
	.loc	0 7 16                          # sparsevec_add_i32.c:7:16
	lw	a2, 0(a1)
	add	a0, a0, a2
	sw	a0, 0(a1)
.Ltmp39:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 7, DW_OP_stack_value] undef
	.loc	0 8 1 is_stmt 1                 # sparsevec_add_i32.c:8:1
	ret
.Ltmp40:
.Lfunc_end0:
	.size	sparsevec_add_i32, .Lfunc_end0-sparsevec_add_i32
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
	.uleb128 .Ltmp2-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp3-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp5-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc1:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp38-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	91                              # DW_OP_reg11
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc2:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp2-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	92                              # DW_OP_reg12
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp3-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp23-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	92                              # DW_OP_reg12
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc3:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp2-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	94                              # DW_OP_reg14
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp3-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp24-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	94                              # DW_OP_reg14
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc4:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp2-.Lfunc_begin0           #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp3-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp6-.Lfunc_begin0           #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp6-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp8-.Lfunc_begin0           #   ending offset
	.byte	9                               # Loc expr size
	.byte	117                             # DW_OP_breg5
	.byte	0                               # 0
	.byte	17                              # DW_OP_consts
	.byte	120                             # -8
	.byte	27                              # DW_OP_div
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	30                              # DW_OP_mul
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp9-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp10-.Lfunc_begin0          #   ending offset
	.byte	12                              # Loc expr size
	.byte	117                             # DW_OP_breg5
	.byte	0                               # 0
	.byte	17                              # DW_OP_consts
	.byte	120                             # -8
	.byte	27                              # DW_OP_div
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	30                              # DW_OP_mul
	.byte	17                              # DW_OP_consts
	.byte	1                               # 1
	.byte	34                              # DW_OP_plus
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp10-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp13-.Lfunc_begin0          #   ending offset
	.byte	12                              # Loc expr size
	.byte	117                             # DW_OP_breg5
	.byte	0                               # 0
	.byte	17                              # DW_OP_consts
	.byte	120                             # -8
	.byte	27                              # DW_OP_div
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	30                              # DW_OP_mul
	.byte	17                              # DW_OP_consts
	.byte	2                               # 2
	.byte	34                              # DW_OP_plus
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp13-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp14-.Lfunc_begin0          #   ending offset
	.byte	12                              # Loc expr size
	.byte	117                             # DW_OP_breg5
	.byte	0                               # 0
	.byte	17                              # DW_OP_consts
	.byte	120                             # -8
	.byte	27                              # DW_OP_div
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	30                              # DW_OP_mul
	.byte	17                              # DW_OP_consts
	.byte	3                               # 3
	.byte	34                              # DW_OP_plus
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp14-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp17-.Lfunc_begin0          #   ending offset
	.byte	12                              # Loc expr size
	.byte	117                             # DW_OP_breg5
	.byte	0                               # 0
	.byte	17                              # DW_OP_consts
	.byte	120                             # -8
	.byte	27                              # DW_OP_div
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	30                              # DW_OP_mul
	.byte	17                              # DW_OP_consts
	.byte	4                               # 4
	.byte	34                              # DW_OP_plus
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp17-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp18-.Lfunc_begin0          #   ending offset
	.byte	12                              # Loc expr size
	.byte	117                             # DW_OP_breg5
	.byte	0                               # 0
	.byte	17                              # DW_OP_consts
	.byte	120                             # -8
	.byte	27                              # DW_OP_div
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	30                              # DW_OP_mul
	.byte	17                              # DW_OP_consts
	.byte	5                               # 5
	.byte	34                              # DW_OP_plus
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp18-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp19-.Lfunc_begin0          #   ending offset
	.byte	12                              # Loc expr size
	.byte	117                             # DW_OP_breg5
	.byte	0                               # 0
	.byte	17                              # DW_OP_consts
	.byte	120                             # -8
	.byte	27                              # DW_OP_div
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	30                              # DW_OP_mul
	.byte	17                              # DW_OP_consts
	.byte	6                               # 6
	.byte	34                              # DW_OP_plus
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp19-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp20-.Lfunc_begin0          #   ending offset
	.byte	12                              # Loc expr size
	.byte	117                             # DW_OP_breg5
	.byte	0                               # 0
	.byte	17                              # DW_OP_consts
	.byte	120                             # -8
	.byte	27                              # DW_OP_div
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	30                              # DW_OP_mul
	.byte	17                              # DW_OP_consts
	.byte	7                               # 7
	.byte	34                              # DW_OP_plus
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp20-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp22-.Lfunc_begin0          #   ending offset
	.byte	12                              # Loc expr size
	.byte	117                             # DW_OP_breg5
	.byte	0                               # 0
	.byte	17                              # DW_OP_consts
	.byte	120                             # -8
	.byte	27                              # DW_OP_div
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	30                              # DW_OP_mul
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	34                              # DW_OP_plus
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp22-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp25-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	95                              # DW_OP_reg15
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
	.byte	1                               # Abbrev [1] 0xc:0x7c DW_TAG_compile_unit
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
	.byte	2                               # Abbrev [2] 0x2b:0x46 DW_TAG_subprogram
	.byte	0                               # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	82
                                        # DW_AT_call_all_calls
	.byte	3                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	3                               # Abbrev [3] 0x36:0x9 DW_TAG_formal_parameter
	.byte	0                               # DW_AT_location
	.byte	4                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
	.word	113                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x3f:0x9 DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	6                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
	.word	117                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x48:0x9 DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	8                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
	.word	126                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x51:0xa DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	93
	.byte	10                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
	.word	117                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x5b:0x9 DW_TAG_formal_parameter
	.byte	3                               # DW_AT_location
	.byte	11                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
	.word	126                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0x64:0xc DW_TAG_lexical_block
	.byte	0                               # DW_AT_ranges
	.byte	6                               # Abbrev [6] 0x66:0x9 DW_TAG_variable
	.byte	4                               # DW_AT_location
	.byte	12                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	6                               # DW_AT_decl_line
	.word	113                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	7                               # Abbrev [7] 0x71:0x4 DW_TAG_base_type
	.byte	5                               # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	8                               # Abbrev [8] 0x75:0x5 DW_TAG_pointer_type
	.word	122                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x7a:0x4 DW_TAG_base_type
	.byte	7                               # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	8                               # Abbrev [8] 0x7e:0x5 DW_TAG_pointer_type
	.word	131                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x83:0x4 DW_TAG_base_type
	.byte	9                               # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	2                               # DW_AT_byte_size
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
	.uleb128 .Ltmp2-.Lfunc_begin0           #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp4-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp39-.Lfunc_begin0          #   ending offset
	.byte	0                               # DW_RLE_end_of_list
.Ldebug_list_header_end1:
	.section	.debug_str_offsets,"",@progbits
	.word	56                              # Length of String Offsets Set
	.half	5
	.half	0
.Lstr_offsets_base0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)" # string offset=0
.Linfo_string1:
	.asciz	"sparsevec_add_i32.c"           # string offset=108
.Linfo_string2:
	.asciz	"/home/preames/benchmarking/simple-vector-riscv" # string offset=128
.Linfo_string3:
	.asciz	"sparsevec_add_i32"             # string offset=175
.Linfo_string4:
	.asciz	"len"                           # string offset=193
.Linfo_string5:
	.asciz	"unsigned int"                  # string offset=197
.Linfo_string6:
	.asciz	"a"                             # string offset=210
.Linfo_string7:
	.asciz	"int"                           # string offset=212
.Linfo_string8:
	.asciz	"aidx"                          # string offset=216
.Linfo_string9:
	.asciz	"short"                         # string offset=221
.Linfo_string10:
	.asciz	"b"                             # string offset=227
.Linfo_string11:
	.asciz	"bidx"                          # string offset=229
.Linfo_string12:
	.asciz	"i"                             # string offset=234
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
