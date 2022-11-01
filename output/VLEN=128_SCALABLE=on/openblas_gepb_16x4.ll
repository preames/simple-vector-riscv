; ModuleID = 'openblas_gepb_16x4.c'
source_filename = "openblas_gepb_16x4.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-unknown"

; Function Attrs: argmemonly nofree nosync nounwind vscale_range(2,1024)
define dso_local void @test(ptr noalias nocapture noundef readonly %A, ptr noalias nocapture noundef readonly %B, ptr noalias nocapture noundef %C) local_unnamed_addr #0 {
entry:
  %arrayidx.2 = getelementptr inbounds float, ptr %A, i64 2
  %0 = load float, ptr %arrayidx.2, align 4, !tbaa !4
  %arrayidx.1 = getelementptr inbounds float, ptr %A, i64 1
  %1 = load float, ptr %arrayidx.1, align 4, !tbaa !4
  %2 = load float, ptr %A, align 4, !tbaa !4
  %arrayidx.15.phi.trans.insert = getelementptr inbounds float, ptr %A, i64 15
  %.pre34 = load float, ptr %arrayidx.15.phi.trans.insert, align 4, !tbaa !4
  %arrayidx.14.phi.trans.insert = getelementptr inbounds float, ptr %A, i64 14
  %.pre33 = load float, ptr %arrayidx.14.phi.trans.insert, align 4, !tbaa !4
  %arrayidx.13.phi.trans.insert = getelementptr inbounds float, ptr %A, i64 13
  %.pre32 = load float, ptr %arrayidx.13.phi.trans.insert, align 4, !tbaa !4
  %arrayidx.12.phi.trans.insert = getelementptr inbounds float, ptr %A, i64 12
  %.pre31 = load float, ptr %arrayidx.12.phi.trans.insert, align 4, !tbaa !4
  %arrayidx.11.phi.trans.insert = getelementptr inbounds float, ptr %A, i64 11
  %.pre30 = load float, ptr %arrayidx.11.phi.trans.insert, align 4, !tbaa !4
  %arrayidx.10.phi.trans.insert = getelementptr inbounds float, ptr %A, i64 10
  %.pre29 = load float, ptr %arrayidx.10.phi.trans.insert, align 4, !tbaa !4
  %arrayidx.9.phi.trans.insert = getelementptr inbounds float, ptr %A, i64 9
  %.pre28 = load float, ptr %arrayidx.9.phi.trans.insert, align 4, !tbaa !4
  %arrayidx.8.phi.trans.insert = getelementptr inbounds float, ptr %A, i64 8
  %.pre27 = load float, ptr %arrayidx.8.phi.trans.insert, align 4, !tbaa !4
  %arrayidx.7.phi.trans.insert = getelementptr inbounds float, ptr %A, i64 7
  %.pre26 = load float, ptr %arrayidx.7.phi.trans.insert, align 4, !tbaa !4
  %arrayidx.6.phi.trans.insert = getelementptr inbounds float, ptr %A, i64 6
  %.pre25 = load float, ptr %arrayidx.6.phi.trans.insert, align 4, !tbaa !4
  %arrayidx.5.phi.trans.insert = getelementptr inbounds float, ptr %A, i64 5
  %.pre24 = load float, ptr %arrayidx.5.phi.trans.insert, align 4, !tbaa !4
  %arrayidx.4.phi.trans.insert = getelementptr inbounds float, ptr %A, i64 4
  %.pre23 = load float, ptr %arrayidx.4.phi.trans.insert, align 4, !tbaa !4
  %arrayidx.3.phi.trans.insert = getelementptr inbounds float, ptr %A, i64 3
  %.pre = load float, ptr %arrayidx.3.phi.trans.insert, align 4, !tbaa !4
  %3 = tail call i64 @llvm.vscale.i64()
  %4 = shl nuw nsw i64 %3, 1
  %5 = tail call i64 @llvm.vscale.i64()
  %6 = shl nuw nsw i64 %5, 1
  %n.rnd.up = add nuw nsw i64 %6, 3
  %n.mod.vf = urem i64 %n.rnd.up, %4
  %n.vec = sub nsw i64 %n.rnd.up, %n.mod.vf
  %7 = tail call <vscale x 2 x i64> @llvm.experimental.stepvector.nxv2i64()
  %8 = tail call i64 @llvm.vscale.i64()
  %9 = shl nuw nsw i64 %8, 1
  %.splatinsert = insertelement <vscale x 2 x i64> poison, i64 %9, i64 0
  %.splat = shufflevector <vscale x 2 x i64> %.splatinsert, <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer
  %broadcast.splatinsert = insertelement <vscale x 2 x float> poison, float %2, i64 0
  %broadcast.splat = shufflevector <vscale x 2 x float> %broadcast.splatinsert, <vscale x 2 x float> poison, <vscale x 2 x i32> zeroinitializer
  %broadcast.splatinsert36 = insertelement <vscale x 2 x float> poison, float %1, i64 0
  %broadcast.splat37 = shufflevector <vscale x 2 x float> %broadcast.splatinsert36, <vscale x 2 x float> poison, <vscale x 2 x i32> zeroinitializer
  %broadcast.splatinsert39 = insertelement <vscale x 2 x float> poison, float %0, i64 0
  %broadcast.splat40 = shufflevector <vscale x 2 x float> %broadcast.splatinsert39, <vscale x 2 x float> poison, <vscale x 2 x i32> zeroinitializer
  %broadcast.splatinsert42 = insertelement <vscale x 2 x float> poison, float %.pre, i64 0
  %broadcast.splat43 = shufflevector <vscale x 2 x float> %broadcast.splatinsert42, <vscale x 2 x float> poison, <vscale x 2 x i32> zeroinitializer
  %broadcast.splatinsert45 = insertelement <vscale x 2 x float> poison, float %.pre23, i64 0
  %broadcast.splat46 = shufflevector <vscale x 2 x float> %broadcast.splatinsert45, <vscale x 2 x float> poison, <vscale x 2 x i32> zeroinitializer
  %broadcast.splatinsert48 = insertelement <vscale x 2 x float> poison, float %.pre24, i64 0
  %broadcast.splat49 = shufflevector <vscale x 2 x float> %broadcast.splatinsert48, <vscale x 2 x float> poison, <vscale x 2 x i32> zeroinitializer
  %broadcast.splatinsert51 = insertelement <vscale x 2 x float> poison, float %.pre25, i64 0
  %broadcast.splat52 = shufflevector <vscale x 2 x float> %broadcast.splatinsert51, <vscale x 2 x float> poison, <vscale x 2 x i32> zeroinitializer
  %broadcast.splatinsert54 = insertelement <vscale x 2 x float> poison, float %.pre26, i64 0
  %broadcast.splat55 = shufflevector <vscale x 2 x float> %broadcast.splatinsert54, <vscale x 2 x float> poison, <vscale x 2 x i32> zeroinitializer
  %broadcast.splatinsert57 = insertelement <vscale x 2 x float> poison, float %.pre27, i64 0
  %broadcast.splat58 = shufflevector <vscale x 2 x float> %broadcast.splatinsert57, <vscale x 2 x float> poison, <vscale x 2 x i32> zeroinitializer
  %broadcast.splatinsert60 = insertelement <vscale x 2 x float> poison, float %.pre28, i64 0
  %broadcast.splat61 = shufflevector <vscale x 2 x float> %broadcast.splatinsert60, <vscale x 2 x float> poison, <vscale x 2 x i32> zeroinitializer
  %broadcast.splatinsert63 = insertelement <vscale x 2 x float> poison, float %.pre29, i64 0
  %broadcast.splat64 = shufflevector <vscale x 2 x float> %broadcast.splatinsert63, <vscale x 2 x float> poison, <vscale x 2 x i32> zeroinitializer
  %broadcast.splatinsert66 = insertelement <vscale x 2 x float> poison, float %.pre30, i64 0
  %broadcast.splat67 = shufflevector <vscale x 2 x float> %broadcast.splatinsert66, <vscale x 2 x float> poison, <vscale x 2 x i32> zeroinitializer
  %broadcast.splatinsert69 = insertelement <vscale x 2 x float> poison, float %.pre31, i64 0
  %broadcast.splat70 = shufflevector <vscale x 2 x float> %broadcast.splatinsert69, <vscale x 2 x float> poison, <vscale x 2 x i32> zeroinitializer
  %broadcast.splatinsert72 = insertelement <vscale x 2 x float> poison, float %.pre32, i64 0
  %broadcast.splat73 = shufflevector <vscale x 2 x float> %broadcast.splatinsert72, <vscale x 2 x float> poison, <vscale x 2 x i32> zeroinitializer
  %broadcast.splatinsert75 = insertelement <vscale x 2 x float> poison, float %.pre33, i64 0
  %broadcast.splat76 = shufflevector <vscale x 2 x float> %broadcast.splatinsert75, <vscale x 2 x float> poison, <vscale x 2 x i32> zeroinitializer
  %broadcast.splatinsert78 = insertelement <vscale x 2 x float> poison, float %.pre34, i64 0
  %broadcast.splat79 = shufflevector <vscale x 2 x float> %broadcast.splatinsert78, <vscale x 2 x float> poison, <vscale x 2 x i32> zeroinitializer
  %10 = tail call i64 @llvm.vscale.i64()
  %11 = shl nuw nsw i64 %10, 1
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %entry
  %index = phi i64 [ 0, %entry ], [ %index.next, %vector.body ]
  %vec.ind = phi <vscale x 2 x i64> [ %7, %entry ], [ %vec.ind.next, %vector.body ]
  %active.lane.mask = tail call <vscale x 2 x i1> @llvm.get.active.lane.mask.nxv2i1.i64(i64 %index, i64 4)
  %12 = getelementptr inbounds float, ptr %B, i64 %index
  %wide.masked.load = tail call <vscale x 2 x float> @llvm.masked.load.nxv2f32.p0(ptr %12, i32 4, <vscale x 2 x i1> %active.lane.mask, <vscale x 2 x float> poison), !tbaa !4
  %13 = shl nsw <vscale x 2 x i64> %vec.ind, shufflevector (<vscale x 2 x i64> insertelement (<vscale x 2 x i64> poison, i64 4, i32 0), <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer)
  %14 = getelementptr inbounds float, ptr %C, <vscale x 2 x i64> %13
  %wide.masked.gather = tail call <vscale x 2 x float> @llvm.masked.gather.nxv2f32.nxv2p0(<vscale x 2 x ptr> %14, i32 4, <vscale x 2 x i1> %active.lane.mask, <vscale x 2 x float> poison), !tbaa !4
  %15 = tail call <vscale x 2 x float> @llvm.fmuladd.nxv2f32(<vscale x 2 x float> %broadcast.splat, <vscale x 2 x float> %wide.masked.load, <vscale x 2 x float> %wide.masked.gather)
  tail call void @llvm.masked.scatter.nxv2f32.nxv2p0(<vscale x 2 x float> %15, <vscale x 2 x ptr> %14, i32 4, <vscale x 2 x i1> %active.lane.mask), !tbaa !4
  %16 = or <vscale x 2 x i64> %13, shufflevector (<vscale x 2 x i64> insertelement (<vscale x 2 x i64> poison, i64 1, i32 0), <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer)
  %17 = getelementptr inbounds float, ptr %C, <vscale x 2 x i64> %16
  %wide.masked.gather35 = tail call <vscale x 2 x float> @llvm.masked.gather.nxv2f32.nxv2p0(<vscale x 2 x ptr> %17, i32 4, <vscale x 2 x i1> %active.lane.mask, <vscale x 2 x float> poison), !tbaa !4
  %18 = tail call <vscale x 2 x float> @llvm.fmuladd.nxv2f32(<vscale x 2 x float> %broadcast.splat37, <vscale x 2 x float> %wide.masked.load, <vscale x 2 x float> %wide.masked.gather35)
  tail call void @llvm.masked.scatter.nxv2f32.nxv2p0(<vscale x 2 x float> %18, <vscale x 2 x ptr> %17, i32 4, <vscale x 2 x i1> %active.lane.mask), !tbaa !4
  %19 = or <vscale x 2 x i64> %13, shufflevector (<vscale x 2 x i64> insertelement (<vscale x 2 x i64> poison, i64 2, i32 0), <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer)
  %20 = getelementptr inbounds float, ptr %C, <vscale x 2 x i64> %19
  %wide.masked.gather38 = tail call <vscale x 2 x float> @llvm.masked.gather.nxv2f32.nxv2p0(<vscale x 2 x ptr> %20, i32 4, <vscale x 2 x i1> %active.lane.mask, <vscale x 2 x float> poison), !tbaa !4
  %21 = tail call <vscale x 2 x float> @llvm.fmuladd.nxv2f32(<vscale x 2 x float> %broadcast.splat40, <vscale x 2 x float> %wide.masked.load, <vscale x 2 x float> %wide.masked.gather38)
  tail call void @llvm.masked.scatter.nxv2f32.nxv2p0(<vscale x 2 x float> %21, <vscale x 2 x ptr> %20, i32 4, <vscale x 2 x i1> %active.lane.mask), !tbaa !4
  %22 = or <vscale x 2 x i64> %13, shufflevector (<vscale x 2 x i64> insertelement (<vscale x 2 x i64> poison, i64 3, i32 0), <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer)
  %23 = getelementptr inbounds float, ptr %C, <vscale x 2 x i64> %22
  %wide.masked.gather41 = tail call <vscale x 2 x float> @llvm.masked.gather.nxv2f32.nxv2p0(<vscale x 2 x ptr> %23, i32 4, <vscale x 2 x i1> %active.lane.mask, <vscale x 2 x float> poison), !tbaa !4
  %24 = tail call <vscale x 2 x float> @llvm.fmuladd.nxv2f32(<vscale x 2 x float> %broadcast.splat43, <vscale x 2 x float> %wide.masked.load, <vscale x 2 x float> %wide.masked.gather41)
  tail call void @llvm.masked.scatter.nxv2f32.nxv2p0(<vscale x 2 x float> %24, <vscale x 2 x ptr> %23, i32 4, <vscale x 2 x i1> %active.lane.mask), !tbaa !4
  %25 = or <vscale x 2 x i64> %13, shufflevector (<vscale x 2 x i64> insertelement (<vscale x 2 x i64> poison, i64 4, i32 0), <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer)
  %26 = getelementptr inbounds float, ptr %C, <vscale x 2 x i64> %25
  %wide.masked.gather44 = tail call <vscale x 2 x float> @llvm.masked.gather.nxv2f32.nxv2p0(<vscale x 2 x ptr> %26, i32 4, <vscale x 2 x i1> %active.lane.mask, <vscale x 2 x float> poison), !tbaa !4
  %27 = tail call <vscale x 2 x float> @llvm.fmuladd.nxv2f32(<vscale x 2 x float> %broadcast.splat46, <vscale x 2 x float> %wide.masked.load, <vscale x 2 x float> %wide.masked.gather44)
  tail call void @llvm.masked.scatter.nxv2f32.nxv2p0(<vscale x 2 x float> %27, <vscale x 2 x ptr> %26, i32 4, <vscale x 2 x i1> %active.lane.mask), !tbaa !4
  %28 = or <vscale x 2 x i64> %13, shufflevector (<vscale x 2 x i64> insertelement (<vscale x 2 x i64> poison, i64 5, i32 0), <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer)
  %29 = getelementptr inbounds float, ptr %C, <vscale x 2 x i64> %28
  %wide.masked.gather47 = tail call <vscale x 2 x float> @llvm.masked.gather.nxv2f32.nxv2p0(<vscale x 2 x ptr> %29, i32 4, <vscale x 2 x i1> %active.lane.mask, <vscale x 2 x float> poison), !tbaa !4
  %30 = tail call <vscale x 2 x float> @llvm.fmuladd.nxv2f32(<vscale x 2 x float> %broadcast.splat49, <vscale x 2 x float> %wide.masked.load, <vscale x 2 x float> %wide.masked.gather47)
  tail call void @llvm.masked.scatter.nxv2f32.nxv2p0(<vscale x 2 x float> %30, <vscale x 2 x ptr> %29, i32 4, <vscale x 2 x i1> %active.lane.mask), !tbaa !4
  %31 = or <vscale x 2 x i64> %13, shufflevector (<vscale x 2 x i64> insertelement (<vscale x 2 x i64> poison, i64 6, i32 0), <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer)
  %32 = getelementptr inbounds float, ptr %C, <vscale x 2 x i64> %31
  %wide.masked.gather50 = tail call <vscale x 2 x float> @llvm.masked.gather.nxv2f32.nxv2p0(<vscale x 2 x ptr> %32, i32 4, <vscale x 2 x i1> %active.lane.mask, <vscale x 2 x float> poison), !tbaa !4
  %33 = tail call <vscale x 2 x float> @llvm.fmuladd.nxv2f32(<vscale x 2 x float> %broadcast.splat52, <vscale x 2 x float> %wide.masked.load, <vscale x 2 x float> %wide.masked.gather50)
  tail call void @llvm.masked.scatter.nxv2f32.nxv2p0(<vscale x 2 x float> %33, <vscale x 2 x ptr> %32, i32 4, <vscale x 2 x i1> %active.lane.mask), !tbaa !4
  %34 = or <vscale x 2 x i64> %13, shufflevector (<vscale x 2 x i64> insertelement (<vscale x 2 x i64> poison, i64 7, i32 0), <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer)
  %35 = getelementptr inbounds float, ptr %C, <vscale x 2 x i64> %34
  %wide.masked.gather53 = tail call <vscale x 2 x float> @llvm.masked.gather.nxv2f32.nxv2p0(<vscale x 2 x ptr> %35, i32 4, <vscale x 2 x i1> %active.lane.mask, <vscale x 2 x float> poison), !tbaa !4
  %36 = tail call <vscale x 2 x float> @llvm.fmuladd.nxv2f32(<vscale x 2 x float> %broadcast.splat55, <vscale x 2 x float> %wide.masked.load, <vscale x 2 x float> %wide.masked.gather53)
  tail call void @llvm.masked.scatter.nxv2f32.nxv2p0(<vscale x 2 x float> %36, <vscale x 2 x ptr> %35, i32 4, <vscale x 2 x i1> %active.lane.mask), !tbaa !4
  %37 = or <vscale x 2 x i64> %13, shufflevector (<vscale x 2 x i64> insertelement (<vscale x 2 x i64> poison, i64 8, i32 0), <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer)
  %38 = getelementptr inbounds float, ptr %C, <vscale x 2 x i64> %37
  %wide.masked.gather56 = tail call <vscale x 2 x float> @llvm.masked.gather.nxv2f32.nxv2p0(<vscale x 2 x ptr> %38, i32 4, <vscale x 2 x i1> %active.lane.mask, <vscale x 2 x float> poison), !tbaa !4
  %39 = tail call <vscale x 2 x float> @llvm.fmuladd.nxv2f32(<vscale x 2 x float> %broadcast.splat58, <vscale x 2 x float> %wide.masked.load, <vscale x 2 x float> %wide.masked.gather56)
  tail call void @llvm.masked.scatter.nxv2f32.nxv2p0(<vscale x 2 x float> %39, <vscale x 2 x ptr> %38, i32 4, <vscale x 2 x i1> %active.lane.mask), !tbaa !4
  %40 = or <vscale x 2 x i64> %13, shufflevector (<vscale x 2 x i64> insertelement (<vscale x 2 x i64> poison, i64 9, i32 0), <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer)
  %41 = getelementptr inbounds float, ptr %C, <vscale x 2 x i64> %40
  %wide.masked.gather59 = tail call <vscale x 2 x float> @llvm.masked.gather.nxv2f32.nxv2p0(<vscale x 2 x ptr> %41, i32 4, <vscale x 2 x i1> %active.lane.mask, <vscale x 2 x float> poison), !tbaa !4
  %42 = tail call <vscale x 2 x float> @llvm.fmuladd.nxv2f32(<vscale x 2 x float> %broadcast.splat61, <vscale x 2 x float> %wide.masked.load, <vscale x 2 x float> %wide.masked.gather59)
  tail call void @llvm.masked.scatter.nxv2f32.nxv2p0(<vscale x 2 x float> %42, <vscale x 2 x ptr> %41, i32 4, <vscale x 2 x i1> %active.lane.mask), !tbaa !4
  %43 = or <vscale x 2 x i64> %13, shufflevector (<vscale x 2 x i64> insertelement (<vscale x 2 x i64> poison, i64 10, i32 0), <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer)
  %44 = getelementptr inbounds float, ptr %C, <vscale x 2 x i64> %43
  %wide.masked.gather62 = tail call <vscale x 2 x float> @llvm.masked.gather.nxv2f32.nxv2p0(<vscale x 2 x ptr> %44, i32 4, <vscale x 2 x i1> %active.lane.mask, <vscale x 2 x float> poison), !tbaa !4
  %45 = tail call <vscale x 2 x float> @llvm.fmuladd.nxv2f32(<vscale x 2 x float> %broadcast.splat64, <vscale x 2 x float> %wide.masked.load, <vscale x 2 x float> %wide.masked.gather62)
  tail call void @llvm.masked.scatter.nxv2f32.nxv2p0(<vscale x 2 x float> %45, <vscale x 2 x ptr> %44, i32 4, <vscale x 2 x i1> %active.lane.mask), !tbaa !4
  %46 = or <vscale x 2 x i64> %13, shufflevector (<vscale x 2 x i64> insertelement (<vscale x 2 x i64> poison, i64 11, i32 0), <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer)
  %47 = getelementptr inbounds float, ptr %C, <vscale x 2 x i64> %46
  %wide.masked.gather65 = tail call <vscale x 2 x float> @llvm.masked.gather.nxv2f32.nxv2p0(<vscale x 2 x ptr> %47, i32 4, <vscale x 2 x i1> %active.lane.mask, <vscale x 2 x float> poison), !tbaa !4
  %48 = tail call <vscale x 2 x float> @llvm.fmuladd.nxv2f32(<vscale x 2 x float> %broadcast.splat67, <vscale x 2 x float> %wide.masked.load, <vscale x 2 x float> %wide.masked.gather65)
  tail call void @llvm.masked.scatter.nxv2f32.nxv2p0(<vscale x 2 x float> %48, <vscale x 2 x ptr> %47, i32 4, <vscale x 2 x i1> %active.lane.mask), !tbaa !4
  %49 = or <vscale x 2 x i64> %13, shufflevector (<vscale x 2 x i64> insertelement (<vscale x 2 x i64> poison, i64 12, i32 0), <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer)
  %50 = getelementptr inbounds float, ptr %C, <vscale x 2 x i64> %49
  %wide.masked.gather68 = tail call <vscale x 2 x float> @llvm.masked.gather.nxv2f32.nxv2p0(<vscale x 2 x ptr> %50, i32 4, <vscale x 2 x i1> %active.lane.mask, <vscale x 2 x float> poison), !tbaa !4
  %51 = tail call <vscale x 2 x float> @llvm.fmuladd.nxv2f32(<vscale x 2 x float> %broadcast.splat70, <vscale x 2 x float> %wide.masked.load, <vscale x 2 x float> %wide.masked.gather68)
  tail call void @llvm.masked.scatter.nxv2f32.nxv2p0(<vscale x 2 x float> %51, <vscale x 2 x ptr> %50, i32 4, <vscale x 2 x i1> %active.lane.mask), !tbaa !4
  %52 = or <vscale x 2 x i64> %13, shufflevector (<vscale x 2 x i64> insertelement (<vscale x 2 x i64> poison, i64 13, i32 0), <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer)
  %53 = getelementptr inbounds float, ptr %C, <vscale x 2 x i64> %52
  %wide.masked.gather71 = tail call <vscale x 2 x float> @llvm.masked.gather.nxv2f32.nxv2p0(<vscale x 2 x ptr> %53, i32 4, <vscale x 2 x i1> %active.lane.mask, <vscale x 2 x float> poison), !tbaa !4
  %54 = tail call <vscale x 2 x float> @llvm.fmuladd.nxv2f32(<vscale x 2 x float> %broadcast.splat73, <vscale x 2 x float> %wide.masked.load, <vscale x 2 x float> %wide.masked.gather71)
  tail call void @llvm.masked.scatter.nxv2f32.nxv2p0(<vscale x 2 x float> %54, <vscale x 2 x ptr> %53, i32 4, <vscale x 2 x i1> %active.lane.mask), !tbaa !4
  %55 = or <vscale x 2 x i64> %13, shufflevector (<vscale x 2 x i64> insertelement (<vscale x 2 x i64> poison, i64 14, i32 0), <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer)
  %56 = getelementptr inbounds float, ptr %C, <vscale x 2 x i64> %55
  %wide.masked.gather74 = tail call <vscale x 2 x float> @llvm.masked.gather.nxv2f32.nxv2p0(<vscale x 2 x ptr> %56, i32 4, <vscale x 2 x i1> %active.lane.mask, <vscale x 2 x float> poison), !tbaa !4
  %57 = tail call <vscale x 2 x float> @llvm.fmuladd.nxv2f32(<vscale x 2 x float> %broadcast.splat76, <vscale x 2 x float> %wide.masked.load, <vscale x 2 x float> %wide.masked.gather74)
  tail call void @llvm.masked.scatter.nxv2f32.nxv2p0(<vscale x 2 x float> %57, <vscale x 2 x ptr> %56, i32 4, <vscale x 2 x i1> %active.lane.mask), !tbaa !4
  %58 = or <vscale x 2 x i64> %13, shufflevector (<vscale x 2 x i64> insertelement (<vscale x 2 x i64> poison, i64 15, i32 0), <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer)
  %59 = getelementptr inbounds float, ptr %C, <vscale x 2 x i64> %58
  %wide.masked.gather77 = tail call <vscale x 2 x float> @llvm.masked.gather.nxv2f32.nxv2p0(<vscale x 2 x ptr> %59, i32 4, <vscale x 2 x i1> %active.lane.mask, <vscale x 2 x float> poison), !tbaa !4
  %60 = tail call <vscale x 2 x float> @llvm.fmuladd.nxv2f32(<vscale x 2 x float> %broadcast.splat79, <vscale x 2 x float> %wide.masked.load, <vscale x 2 x float> %wide.masked.gather77)
  tail call void @llvm.masked.scatter.nxv2f32.nxv2p0(<vscale x 2 x float> %60, <vscale x 2 x ptr> %59, i32 4, <vscale x 2 x i1> %active.lane.mask), !tbaa !4
  %index.next = add i64 %index, %11
  %vec.ind.next = add <vscale x 2 x i64> %vec.ind, %.splat
  %61 = icmp eq i64 %index.next, %n.vec
  br i1 %61, label %for.cond.cleanup, label %vector.body, !llvm.loop !8

for.cond.cleanup:                                 ; preds = %vector.body
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i64 @llvm.vscale.i64() #1

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare <vscale x 2 x i64> @llvm.experimental.stepvector.nxv2i64() #1

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare <vscale x 2 x i1> @llvm.get.active.lane.mask.nxv2i1.i64(i64, i64) #1

; Function Attrs: argmemonly nocallback nofree nosync nounwind readonly willreturn
declare <vscale x 2 x float> @llvm.masked.load.nxv2f32.p0(ptr nocapture, i32 immarg, <vscale x 2 x i1>, <vscale x 2 x float>) #2

; Function Attrs: nocallback nofree nosync nounwind readonly willreturn
declare <vscale x 2 x float> @llvm.masked.gather.nxv2f32.nxv2p0(<vscale x 2 x ptr>, i32 immarg, <vscale x 2 x i1>, <vscale x 2 x float>) #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare <vscale x 2 x float> @llvm.fmuladd.nxv2f32(<vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>) #4

; Function Attrs: nocallback nofree nosync nounwind willreturn writeonly
declare void @llvm.masked.scatter.nxv2f32.nxv2p0(<vscale x 2 x float>, <vscale x 2 x ptr>, i32 immarg, <vscale x 2 x i1>) #5

attributes #0 = { argmemonly nofree nosync nounwind vscale_range(2,1024) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+v,+zba,+zbb,+zbc,+zbs,+zve32f,+zve32x,+zve64d,+zve64f,+zve64x,+zvl128b,+zvl32b,+zvl64b,-save-restore" }
attributes #1 = { nocallback nofree nosync nounwind readnone willreturn }
attributes #2 = { argmemonly nocallback nofree nosync nounwind readonly willreturn }
attributes #3 = { nocallback nofree nosync nounwind readonly willreturn }
attributes #4 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { nocallback nofree nosync nounwind willreturn writeonly }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64d"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 9472a810ed33bc9e655484f43047eed07d50bc16)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.mustprogress"}
!10 = !{!"llvm.loop.isvectorized", i32 1}
