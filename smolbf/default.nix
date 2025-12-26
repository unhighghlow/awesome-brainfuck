{ lib, stdenv, gcc, fetchurl }:

stdenv.mkDerivation rec {
  name = "smolbf";

  src = fetchurl {
    url = "https://gist.githubusercontent.com/lifthrasiir/596667/raw/9b0f11969960153c71ca530dff893d29de23dcde/bf.c";
    hash = "sha256-LwEf+O2D/PVv+cr4XNbHvxABkGbCj4fhSS+Ll9HH2ss=";
  };
  unpackPhase = "cp $src ./smolbf.c";

  nativeBuildInputs = [
    gcc
  ];

  buildPhase = ''
    gcc -std=c90 -w smolbf.c -o smolbf
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp smolbf $out/bin/smolbf
  '';

  meta = {
    description = "World's smallest brainfuck interpreter";
    mainProgram = "smolbf";

    platforms = ["i686-linux"];

    /* No license specified */
    license = lib.licenses.unfree;
  };
}
