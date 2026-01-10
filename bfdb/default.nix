{ lib, stdenv, fetchurl, gmp }:

stdenv.mkDerivation rec {
  pname = "bfdb";
  version = "0.03";

  src = fetchurl {
    url = "https://djm.cc/bfdb-0.03.tgz";
    hash = "sha256-QkazPCj0NCf+nklKhT7f3dhTmAn2fb04wfAivo8QbHc=";
  };

  unpackPhase = ''
    tar -xf $src
  '';

  nativeBuildInputs = [ gmp ];

  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/share/man/man1

    function pkg {
      cp $1 $out/bin
      gzip $1.1
      cp $1.1.gz $out/share/man/man1
    }

    pkg bfdb
    pkg bfref
    pkg bflen
  '';

  meta = {
    description = "Optimizing interpreter, debugger, and compiler for the BF programming language";
    mainProgram = "bfdb";
    license = lib.licenses.gpl2;
  };
}
