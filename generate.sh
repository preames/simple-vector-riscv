
CLANG=~/llvm-dev/build/bin/clang-15
TARGET_OPTS="--target=riscv64 -mllvm -riscv-v-vector-bits-min=128 -Xclang -target-feature -Xclang +v,+f,+m,+c,+d,+zba"
#TARGET_OPTS="-target riscv64 -march=rv64gcv_zvl128b -mllvm -riscv-v-vector-bits-min=-1"
echo $TARGET_OPTS

# uncmment if you want command lines
#set -x
    output_dir="./output/"
    mkdir -p $output_dir
for f in *.c; do
    echo "Compiling $f..";
    filename=$(basename -- "$f")
    filename="${filename%.*}"
    output_filename=$output_dir$filename

    $CLANG -S $f $TARGET_OPTS -O2 -o $output_filename.s
    $CLANG -S $f $TARGET_OPTS -O2 -emit-llvm -o $output_filename.ll
done
