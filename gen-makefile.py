
import glob

# Combinations are ordered to produce 128, O2, on first since that's most
# likely to give useful coverage
opt_levels = ["-O2", "-O1", "-O0", "-g -O0", "-g -O1", "-g -O2", "-Ofast"]
marchs = ["rv64gc", "rv64gcvb", "rva22u64", "rva22u64_v", "rva23u64", "rv64gcb_zve32x_zvl128b", "rva23u64_zvl256b", "rva23u64_zvl512b", "rva23u64_zvl4096b"]
mcpus = ["spacemit-x60", "sifive-p550", "sifive-x280", "veyron-v1", "tt-ascalon-d8", "mips-p8700"]

print ("default: all")

def normalize_target(target):
    return target.replace("-", "_").replace(" ","").replace("__","_")

targets = []
for f in glob.glob("*.c"):
    for opt_level in opt_levels:
        for arch in marchs:
            subdir  = "output/" + normalize_target(arch + opt_level)
            target = subdir + "/" + f.replace(".c", ".s")
            print (target + ":")
            print (f"\tmkdir -p {subdir}")
            print (f"\t$(CC) -march={arch} {opt_level} {f} -S -o {target}")
            print ("")
            targets.append(target)
            pass
        for cpu in mcpus:
            subdir  = "output/" + normalize_target(cpu + opt_level)
            target = subdir + "/" + f.replace(".c", ".s")
            print (target + ":")
            print (f"\tmkdir -p {subdir}")
            print (f"\t$(CC) -mcpu={cpu} {opt_level} {f} -S -o {target}")
            print ("")
            targets.append(target)
            pass
        pass
    pass

print("all: " + " ".join(targets))
