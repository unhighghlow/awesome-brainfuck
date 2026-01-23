{ lib, stdenv, fetchurl }:

stdenv.mkDerivation {
  name = "bfcc";

  src = fetchurl {
    url = "https://esoteric.sange.fi/brainfuck/impl/compilers/bfcc.c";
    hash = "sha256-cVq9g1XQlhYpf08AN8QC5/GQBycRCvwuedDDxbNyF/Q=";
  };

  unpackPhase = ''
    cp $src bfcc.c
  '';

  buildPhase = ''
    cc bfcc.c -Wno-implicit-int -o bfcc
  '';

  installPhase = ''
    mkdir -p $out/bin
    install -m755 bfcc $out/bin/bfcc
  '';

  meta = {
    description = "BrainFuck compiler to MS-DOS";
    mainProgram = "bfcc";
    license = lib.licenses.gpl2;
  };
}
