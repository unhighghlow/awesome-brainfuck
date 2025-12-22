{ lib, stdenv, fetchurl, patchelf }:

stdenv.mkDerivation {
  name = "bffrsee";

  src = fetchurl {
    urls = [
      "https://www.kotay.com/sree/bf/bffsree"
      "https://archive.org/download/bffsree/bffsree"
    ];
    hash = "sha256-i8BQU7bZwvLoZYCFdvyvcxvCaJqmkaKqdOAC1lihXEY=";
  };

  nativeBuildInputs = [ patchelf ];

  unpackPhase = ''
    cp $src bffsree
  '';

  buildPhase = ''
    chmod +x bffsree
  '';

  installPhase = ''
    mkdir -p $out/bin
    install -m755 bffsree $out/bin/bffsree

    patchelf \
      --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
      $out/bin/bffsree
  '';

  meta = {
    description = "Sree Kotay's brainfuck interpreter";
    mainProgram = "bffsree";
    platforms = ["i686-linux"];

    /* No license provided */
    license = lib.licenses.unfree;
  };
}
