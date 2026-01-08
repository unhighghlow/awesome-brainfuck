{ lib, stdenv, clang }:

stdenv.mkDerivation rec {
  name = "none1bf";

  src = ./none1bf.cpp;
  unpackPhase = "cp $src none1bf.cpp";

  nativeBuildInputs = [
    clang
  ];

  buildPhase = ''
    mkdir -p $out/bin
    clang++ -O3 none1bf.cpp -o $out/bin/none1bf
  '';

  meta = {
    description = "An optimizing brainfuck interpreter by None1 in C++, it has 1000000 8-bit cells and EOF results in -1";
    mainProgram = "none1bf";
    license = lib.licenses.cc0;
  };
}
