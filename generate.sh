
CLANG=~/llvm-dev/build/bin/clang-15
BASE_TARGET_OPTS="--target=riscv64 -Xclang -target-feature -Xclang +v,+f,+m,+c,+d,+zba"
#TARGET_OPTS="-target riscv64 -march=rv64gcv_zvl128b -mllvm -riscv-v-vector-bits-min=-1"
echo $TARGET_OPTS

# uncmment if you want command lines
#set -x
base_output_dir="./output"
for VLEN in 128 0 256 512 1024 4096
do
    for SCALABLE in "on" "off"
    do
        config_dir=$(echo "VLEN=$VLEN _SCALABLE=$SCALABLE" | sed 's/-//g'| sed 's/ //g')
        output_dir="$base_output_dir/$config_dir"
        mkdir -p "$output_dir"
        CONFIG_OPTS="-mllvm -riscv-v-vector-bits-min=$VLEN -mllvm -scalable-vectorization=$SCALABLE"
        for f in *.c; do
            echo "Building VLEN=$VLEN, SCALABLE=$SCALABLE $f"
            filename=$(basename -- "$f")
            filename="${filename%.*}"
            output_filename="$output_dir/$filename"

            $CLANG -S $BASE_TARGET_OPTS $CONFIG_OPTS -O2 -o $output_filename.s $f
            $CLANG -S $BASE_TARGET_OPTS $CONFIG_OPTS -O2 -emit-llvm -o $output_filename.ll $f

        done
    done
done
