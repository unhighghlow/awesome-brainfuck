{ lib, stdenv, fetchurl, unzip, callPackage }:

let lightning = callPackage ./lightning-1.2.nix { };
in
stdenv.mkDerivation {
  pname = "bf-li";
  version = "unstable-2013-10-11";

  src = fetchurl {
    url = "http://lvogel.free.fr/bf/bf-lightning-131011.zip";
    hash = "sha256-XLQB/EgvlmPmACBFT1M+QlAhdkjrImmynnXl2Rr1aDk=";
  };
  
  nativeBuildInputs = [ lightning ];

  unpackPhase = ''
    ${unzip}/bin/unzip $src
    mv bf-lightning/* .
  '';

  patches = [ ./00-remove-compiler-switch.patch ];


  buildPhase = ''
    export CFLAGS="$(pkg-config --cflags lightning) -Wall -Wno-format-security -O2"
    export CC=cc
    make
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp bfli $out/bin/bf-li
  '';

  meta = {
    description = "Optimizing interpreter, debugger, and compiler for the BF programming language";
    mainProgram = "bf-li";
    license = lib.licenses.gpl2;
  };
}
