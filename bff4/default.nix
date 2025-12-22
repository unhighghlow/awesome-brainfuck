{ lib, stdenv, gcc }:

stdenv.mkDerivation rec {
  name = "bff";

  src = ./bff4.c;
  unpackPhase = "cp $src bff4.c";

  nativeBuildInputs = [
    gcc
  ];

  buildPhase = ''
    mkdir -p $out/bin
    gcc -O3 bff4.c -o $out/bin/bff4
  '';

  meta = {
    description = "Optimizing brainfuck implementation of dialect based on Daniel's dbfi";
    mainProgram = "bff4";

    /* No license provided */
    license = lib.licenses.unfree;
  };
}
