{ lib, stdenv, fetchurl, lhasa, gcc }:

stdenv.mkDerivation {
  pname = "brainfuck";
  version = "2";

  src = fetchurl {
    url = "https://aminet.net/dev/lang/brainfuck-2.lha";
    hash = "sha256-f6rzebGHJr0mmlJruMAC/SGDh5etgwWX5ZHfd2+QJ3s=";
  };

  unpackPhase = ''
    ${lhasa}/bin/lha x $src
  '';

  patches = [./00-add-stdlib.patch ./01-removed-chkabort.patch ./02-add-main-type.patch];

  nativeBuildInputs = [
    gcc
  ];

  buildPhase = ''
    mkdir -p $out/bin
    gcc -O3 bfi.c -o $out/bin/bfi
  '';

  meta = {
    description = "240 byte compiler. Fun, with src.";
    longDescription = ''
      This is the original implementation of the Brainfuck programming language
    '';
    mainProgram = "bfi";

    /* While the files on Aminet are freely downloadable,
       they are not neccessarily freely distributable and
       the collection as a whole is copyright 1992- the
       Aminet team. Distributing the archive on physical
       media or mirroring it on a regular basis, either
       partially or in whole, requires permission from
       the administrators. */
    license = lib.licenses.unfree;
  };
}
