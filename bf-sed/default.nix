{ fetchurl, runCommand }:

let bf-sed = fetchurl {
  url = "https://raw.githubusercontent.com/rdebath/Brainfuck/refs/heads/master/extras/bf.sed";
  hash = "sha256-29UPAsiDZFLDWexhTiC+vGmK8PQt/mqZczW3j90Q1e0=";
}; in
runCommand "bf-sed" {} ''
  mkdir -p $out/bin
  install -m755 ${bf-sed} $out/bin/bf.sed
  patchShebangs $out/bin/bf.sed
''
