{ lib, stdenv, fetchurl }:

stdenv.mkDerivation {
  pname = "bcci";
  version = "unstable-2004-12-19";

  src = fetchurl {
    url = "https://brainfuck.org/bcci.c";
    hash = "sha256-4XD/ppUvcZIWolFdJLI9OTSE2Q+Ki416BUqtP8LBQ34=";
  };
  unpackPhase = "cp $src bcci.c";

  buildPhase = ''
    cc bcci.c -o bcci 
  '';

  patchPhase = ''
    mv bcci.c _bcci.c
    echo "#include <stdlib.h>" > bcci.c
    cat _bcci.c >> bcci.c
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp bcci $out/bin/
  '';

  meta = {
    description = "The unreasonably restrictive, score-computing interpreter used for BFCC";
    mainProgram = "bcci";

    /* Make any use you like of this software. I can't stop you anyway. :)*/
    license = lib.licenses.publicDomain;
  };
}
