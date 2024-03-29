; ModuleID = 'strcmp.c'
source_filename = "strcmp.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-unknown"

; Function Attrs: nofree norecurse nosync nounwind memory(read, inaccessiblemem: none) vscale_range(2,1024)
define dso_local signext i32 @my_strcmp(ptr nocapture noundef readonly %a, ptr nocapture noundef readonly %b) local_unnamed_addr #0 {
entry:
  %0 = load i8, ptr %a, align 1, !tbaa !4
  %1 = load i8, ptr %b, align 1, !tbaa !4
  %cmp.not21 = icmp eq i8 %0, %1
  br i1 %cmp.not21, label %if.end, label %if.then

if.then:                                          ; preds = %if.end11, %entry
  %.lcssa19 = phi i8 [ %0, %entry ], [ %3, %if.end11 ]
  %.lcssa = phi i8 [ %1, %entry ], [ %4, %if.end11 ]
  %cmp5 = icmp ult i8 %.lcssa19, %.lcssa
  %cond = select i1 %cmp5, i32 -1, i32 1
  br label %return

if.end:                                           ; preds = %entry, %if.end11
  %2 = phi i8 [ %3, %if.end11 ], [ %0, %entry ]
  %b.addr.023 = phi ptr [ %incdec.ptr12, %if.end11 ], [ %b, %entry ]
  %a.addr.022 = phi ptr [ %incdec.ptr, %if.end11 ], [ %a, %entry ]
  %cmp8 = icmp eq i8 %2, 0
  br i1 %cmp8, label %return, label %if.end11

if.end11:                                         ; preds = %if.end
  %incdec.ptr = getelementptr inbounds i8, ptr %a.addr.022, i64 1
  %incdec.ptr12 = getelementptr inbounds i8, ptr %b.addr.023, i64 1
  %3 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %4 = load i8, ptr %incdec.ptr12, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %3, %4
  br i1 %cmp.not, label %if.end, label %if.then

return:                                           ; preds = %if.end, %if.then
  %retval.0 = phi i32 [ %cond, %if.then ], [ 0, %if.end ]
  ret i32 %retval.0
}

attributes #0 = { nofree norecurse nosync nounwind memory(read, inaccessiblemem: none) vscale_range(2,1024) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+v,+zba,+zbb,+zbc,+zbs,+zicsr,+zifencei,+zve32f,+zve32x,+zve64d,+zve64f,+zve64x,+zvl128b,+zvl32b,+zvl64b,-e,-experimental-smaia,-experimental-ssaia,-experimental-zacas,-experimental-zfa,-experimental-zfbfmin,-experimental-zicond,-experimental-zihintntl,-experimental-ztso,-experimental-zvbb,-experimental-zvbc,-experimental-zvfbfmin,-experimental-zvfbfwma,-experimental-zvkg,-experimental-zvkn,-experimental-zvknc,-experimental-zvkned,-experimental-zvkng,-experimental-zvknha,-experimental-zvknhb,-experimental-zvks,-experimental-zvksc,-experimental-zvksed,-experimental-zvksg,-experimental-zvksh,-experimental-zvkt,-h,-save-restore,-svinval,-svnapot,-svpbmt,-xcvalu,-xcvbi,-xcvbitmanip,-xcvmac,-xcvsimd,-xsfcie,-xsfvcp,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-zawrs,-zbkb,-zbkc,-zbkx,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zicbom,-zicbop,-zicboz,-zicntr,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvfh,-zvl1024b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl4096b,-zvl512b,-zvl65536b,-zvl8192b" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64d"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 18.0.0 (https://github.com/llvm/llvm-project.git 660b740e4b3c4b23dfba36940ae0fe2ad41bfedf)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
