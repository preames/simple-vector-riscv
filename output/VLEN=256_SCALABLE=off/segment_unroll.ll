; ModuleID = 'segment_unroll.c'
source_filename = "segment_unroll.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64-unknown-unknown"

; Function Attrs: argmemonly nofree nosync nounwind vscale_range(4,1024)
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
  %broadcast.splatinsert = insertelement <4 x float> poison, float %2, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert36 = insertelement <4 x float> poison, float %1, i64 0
  %broadcast.splat37 = shufflevector <4 x float> %broadcast.splatinsert36, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert39 = insertelement <4 x float> poison, float %0, i64 0
  %broadcast.splat40 = shufflevector <4 x float> %broadcast.splatinsert39, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert42 = insertelement <4 x float> poison, float %.pre, i64 0
  %broadcast.splat43 = shufflevector <4 x float> %broadcast.splatinsert42, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert45 = insertelement <4 x float> poison, float %.pre23, i64 0
  %broadcast.splat46 = shufflevector <4 x float> %broadcast.splatinsert45, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert48 = insertelement <4 x float> poison, float %.pre24, i64 0
  %broadcast.splat49 = shufflevector <4 x float> %broadcast.splatinsert48, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert51 = insertelement <4 x float> poison, float %.pre25, i64 0
  %broadcast.splat52 = shufflevector <4 x float> %broadcast.splatinsert51, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert54 = insertelement <4 x float> poison, float %.pre26, i64 0
  %broadcast.splat55 = shufflevector <4 x float> %broadcast.splatinsert54, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert57 = insertelement <4 x float> poison, float %.pre27, i64 0
  %broadcast.splat58 = shufflevector <4 x float> %broadcast.splatinsert57, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert60 = insertelement <4 x float> poison, float %.pre28, i64 0
  %broadcast.splat61 = shufflevector <4 x float> %broadcast.splatinsert60, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert63 = insertelement <4 x float> poison, float %.pre29, i64 0
  %broadcast.splat64 = shufflevector <4 x float> %broadcast.splatinsert63, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert66 = insertelement <4 x float> poison, float %.pre30, i64 0
  %broadcast.splat67 = shufflevector <4 x float> %broadcast.splatinsert66, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert69 = insertelement <4 x float> poison, float %.pre31, i64 0
  %broadcast.splat70 = shufflevector <4 x float> %broadcast.splatinsert69, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert72 = insertelement <4 x float> poison, float %.pre32, i64 0
  %broadcast.splat73 = shufflevector <4 x float> %broadcast.splatinsert72, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert75 = insertelement <4 x float> poison, float %.pre33, i64 0
  %broadcast.splat76 = shufflevector <4 x float> %broadcast.splatinsert75, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert78 = insertelement <4 x float> poison, float %.pre34, i64 0
  %broadcast.splat79 = shufflevector <4 x float> %broadcast.splatinsert78, <4 x float> poison, <4 x i32> zeroinitializer
  %wide.load = load <4 x float>, ptr %B, align 4, !tbaa !4
  %3 = getelementptr inbounds float, ptr %C, <4 x i64> <i64 0, i64 16, i64 32, i64 48>
  %wide.masked.gather = tail call <4 x float> @llvm.masked.gather.v4f32.v4p0(<4 x ptr> %3, i32 4, <4 x i1> <i1 true, i1 true, i1 true, i1 true>, <4 x float> poison), !tbaa !4
  %4 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat, <4 x float> %wide.load, <4 x float> %wide.masked.gather)
  tail call void @llvm.masked.scatter.v4f32.v4p0(<4 x float> %4, <4 x ptr> %3, i32 4, <4 x i1> <i1 true, i1 true, i1 true, i1 true>), !tbaa !4
  %5 = getelementptr inbounds float, ptr %C, <4 x i64> <i64 1, i64 17, i64 33, i64 49>
  %wide.masked.gather35 = tail call <4 x float> @llvm.masked.gather.v4f32.v4p0(<4 x ptr> %5, i32 4, <4 x i1> <i1 true, i1 true, i1 true, i1 true>, <4 x float> poison), !tbaa !4
  %6 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat37, <4 x float> %wide.load, <4 x float> %wide.masked.gather35)
  tail call void @llvm.masked.scatter.v4f32.v4p0(<4 x float> %6, <4 x ptr> %5, i32 4, <4 x i1> <i1 true, i1 true, i1 true, i1 true>), !tbaa !4
  %7 = getelementptr inbounds float, ptr %C, <4 x i64> <i64 2, i64 18, i64 34, i64 50>
  %wide.masked.gather38 = tail call <4 x float> @llvm.masked.gather.v4f32.v4p0(<4 x ptr> %7, i32 4, <4 x i1> <i1 true, i1 true, i1 true, i1 true>, <4 x float> poison), !tbaa !4
  %8 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat40, <4 x float> %wide.load, <4 x float> %wide.masked.gather38)
  tail call void @llvm.masked.scatter.v4f32.v4p0(<4 x float> %8, <4 x ptr> %7, i32 4, <4 x i1> <i1 true, i1 true, i1 true, i1 true>), !tbaa !4
  %9 = getelementptr inbounds float, ptr %C, <4 x i64> <i64 3, i64 19, i64 35, i64 51>
  %wide.masked.gather41 = tail call <4 x float> @llvm.masked.gather.v4f32.v4p0(<4 x ptr> %9, i32 4, <4 x i1> <i1 true, i1 true, i1 true, i1 true>, <4 x float> poison), !tbaa !4
  %10 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat43, <4 x float> %wide.load, <4 x float> %wide.masked.gather41)
  tail call void @llvm.masked.scatter.v4f32.v4p0(<4 x float> %10, <4 x ptr> %9, i32 4, <4 x i1> <i1 true, i1 true, i1 true, i1 true>), !tbaa !4
  %11 = getelementptr inbounds float, ptr %C, <4 x i64> <i64 4, i64 20, i64 36, i64 52>
  %wide.masked.gather44 = tail call <4 x float> @llvm.masked.gather.v4f32.v4p0(<4 x ptr> %11, i32 4, <4 x i1> <i1 true, i1 true, i1 true, i1 true>, <4 x float> poison), !tbaa !4
  %12 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat46, <4 x float> %wide.load, <4 x float> %wide.masked.gather44)
  tail call void @llvm.masked.scatter.v4f32.v4p0(<4 x float> %12, <4 x ptr> %11, i32 4, <4 x i1> <i1 true, i1 true, i1 true, i1 true>), !tbaa !4
  %13 = getelementptr inbounds float, ptr %C, <4 x i64> <i64 5, i64 21, i64 37, i64 53>
  %wide.masked.gather47 = tail call <4 x float> @llvm.masked.gather.v4f32.v4p0(<4 x ptr> %13, i32 4, <4 x i1> <i1 true, i1 true, i1 true, i1 true>, <4 x float> poison), !tbaa !4
  %14 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat49, <4 x float> %wide.load, <4 x float> %wide.masked.gather47)
  tail call void @llvm.masked.scatter.v4f32.v4p0(<4 x float> %14, <4 x ptr> %13, i32 4, <4 x i1> <i1 true, i1 true, i1 true, i1 true>), !tbaa !4
  %15 = getelementptr inbounds float, ptr %C, <4 x i64> <i64 6, i64 22, i64 38, i64 54>
  %wide.masked.gather50 = tail call <4 x float> @llvm.masked.gather.v4f32.v4p0(<4 x ptr> %15, i32 4, <4 x i1> <i1 true, i1 true, i1 true, i1 true>, <4 x float> poison), !tbaa !4
  %16 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat52, <4 x float> %wide.load, <4 x float> %wide.masked.gather50)
  tail call void @llvm.masked.scatter.v4f32.v4p0(<4 x float> %16, <4 x ptr> %15, i32 4, <4 x i1> <i1 true, i1 true, i1 true, i1 true>), !tbaa !4
  %17 = getelementptr inbounds float, ptr %C, <4 x i64> <i64 7, i64 23, i64 39, i64 55>
  %wide.masked.gather53 = tail call <4 x float> @llvm.masked.gather.v4f32.v4p0(<4 x ptr> %17, i32 4, <4 x i1> <i1 true, i1 true, i1 true, i1 true>, <4 x float> poison), !tbaa !4
  %18 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat55, <4 x float> %wide.load, <4 x float> %wide.masked.gather53)
  tail call void @llvm.masked.scatter.v4f32.v4p0(<4 x float> %18, <4 x ptr> %17, i32 4, <4 x i1> <i1 true, i1 true, i1 true, i1 true>), !tbaa !4
  %19 = getelementptr inbounds float, ptr %C, <4 x i64> <i64 8, i64 24, i64 40, i64 56>
  %wide.masked.gather56 = tail call <4 x float> @llvm.masked.gather.v4f32.v4p0(<4 x ptr> %19, i32 4, <4 x i1> <i1 true, i1 true, i1 true, i1 true>, <4 x float> poison), !tbaa !4
  %20 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat58, <4 x float> %wide.load, <4 x float> %wide.masked.gather56)
  tail call void @llvm.masked.scatter.v4f32.v4p0(<4 x float> %20, <4 x ptr> %19, i32 4, <4 x i1> <i1 true, i1 true, i1 true, i1 true>), !tbaa !4
  %21 = getelementptr inbounds float, ptr %C, <4 x i64> <i64 9, i64 25, i64 41, i64 57>
  %wide.masked.gather59 = tail call <4 x float> @llvm.masked.gather.v4f32.v4p0(<4 x ptr> %21, i32 4, <4 x i1> <i1 true, i1 true, i1 true, i1 true>, <4 x float> poison), !tbaa !4
  %22 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat61, <4 x float> %wide.load, <4 x float> %wide.masked.gather59)
  tail call void @llvm.masked.scatter.v4f32.v4p0(<4 x float> %22, <4 x ptr> %21, i32 4, <4 x i1> <i1 true, i1 true, i1 true, i1 true>), !tbaa !4
  %23 = getelementptr inbounds float, ptr %C, <4 x i64> <i64 10, i64 26, i64 42, i64 58>
  %wide.masked.gather62 = tail call <4 x float> @llvm.masked.gather.v4f32.v4p0(<4 x ptr> %23, i32 4, <4 x i1> <i1 true, i1 true, i1 true, i1 true>, <4 x float> poison), !tbaa !4
  %24 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat64, <4 x float> %wide.load, <4 x float> %wide.masked.gather62)
  tail call void @llvm.masked.scatter.v4f32.v4p0(<4 x float> %24, <4 x ptr> %23, i32 4, <4 x i1> <i1 true, i1 true, i1 true, i1 true>), !tbaa !4
  %25 = getelementptr inbounds float, ptr %C, <4 x i64> <i64 11, i64 27, i64 43, i64 59>
  %wide.masked.gather65 = tail call <4 x float> @llvm.masked.gather.v4f32.v4p0(<4 x ptr> %25, i32 4, <4 x i1> <i1 true, i1 true, i1 true, i1 true>, <4 x float> poison), !tbaa !4
  %26 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat67, <4 x float> %wide.load, <4 x float> %wide.masked.gather65)
  tail call void @llvm.masked.scatter.v4f32.v4p0(<4 x float> %26, <4 x ptr> %25, i32 4, <4 x i1> <i1 true, i1 true, i1 true, i1 true>), !tbaa !4
  %27 = getelementptr inbounds float, ptr %C, <4 x i64> <i64 12, i64 28, i64 44, i64 60>
  %wide.masked.gather68 = tail call <4 x float> @llvm.masked.gather.v4f32.v4p0(<4 x ptr> %27, i32 4, <4 x i1> <i1 true, i1 true, i1 true, i1 true>, <4 x float> poison), !tbaa !4
  %28 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat70, <4 x float> %wide.load, <4 x float> %wide.masked.gather68)
  tail call void @llvm.masked.scatter.v4f32.v4p0(<4 x float> %28, <4 x ptr> %27, i32 4, <4 x i1> <i1 true, i1 true, i1 true, i1 true>), !tbaa !4
  %29 = getelementptr inbounds float, ptr %C, <4 x i64> <i64 13, i64 29, i64 45, i64 61>
  %wide.masked.gather71 = tail call <4 x float> @llvm.masked.gather.v4f32.v4p0(<4 x ptr> %29, i32 4, <4 x i1> <i1 true, i1 true, i1 true, i1 true>, <4 x float> poison), !tbaa !4
  %30 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat73, <4 x float> %wide.load, <4 x float> %wide.masked.gather71)
  tail call void @llvm.masked.scatter.v4f32.v4p0(<4 x float> %30, <4 x ptr> %29, i32 4, <4 x i1> <i1 true, i1 true, i1 true, i1 true>), !tbaa !4
  %31 = getelementptr inbounds float, ptr %C, <4 x i64> <i64 14, i64 30, i64 46, i64 62>
  %wide.masked.gather74 = tail call <4 x float> @llvm.masked.gather.v4f32.v4p0(<4 x ptr> %31, i32 4, <4 x i1> <i1 true, i1 true, i1 true, i1 true>, <4 x float> poison), !tbaa !4
  %32 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat76, <4 x float> %wide.load, <4 x float> %wide.masked.gather74)
  tail call void @llvm.masked.scatter.v4f32.v4p0(<4 x float> %32, <4 x ptr> %31, i32 4, <4 x i1> <i1 true, i1 true, i1 true, i1 true>), !tbaa !4
  %33 = getelementptr inbounds float, ptr %C, <4 x i64> <i64 15, i64 31, i64 47, i64 63>
  %wide.masked.gather77 = tail call <4 x float> @llvm.masked.gather.v4f32.v4p0(<4 x ptr> %33, i32 4, <4 x i1> <i1 true, i1 true, i1 true, i1 true>, <4 x float> poison), !tbaa !4
  %34 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat79, <4 x float> %wide.load, <4 x float> %wide.masked.gather77)
  tail call void @llvm.masked.scatter.v4f32.v4p0(<4 x float> %34, <4 x ptr> %33, i32 4, <4 x i1> <i1 true, i1 true, i1 true, i1 true>), !tbaa !4
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind readonly willreturn
declare <4 x float> @llvm.masked.gather.v4f32.v4p0(<4 x ptr>, i32 immarg, <4 x i1>, <4 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare <4 x float> @llvm.fmuladd.v4f32(<4 x float>, <4 x float>, <4 x float>) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn writeonly
declare void @llvm.masked.scatter.v4f32.v4p0(<4 x float>, <4 x ptr>, i32 immarg, <4 x i1>) #3

attributes #0 = { argmemonly nofree nosync nounwind vscale_range(4,1024) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+v,+zba,+zbb,+zbc,+zbs,+zve32f,+zve32x,+zve64d,+zve64f,+zve64x,+zvl128b,+zvl256b,+zvl32b,+zvl64b,-save-restore" }
attributes #1 = { nocallback nofree nosync nounwind readonly willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind willreturn writeonly }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64d"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 269bc684e7a0c3f727ea5e74270112585acaf55d)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
