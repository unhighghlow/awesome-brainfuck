{ lib, stdenv, fetchFromGitHub, gcc }:

stdenv.mkDerivation {
  pname = "tritium";
  version = "unstable-2023-07-23";

  src = "${fetchFromGitHub {
    owner = "rdebath";
    repo = "Brainfuck";
    rev = "14a729dd263b6c611b6696e6c06badc35402076a";
    hash = "sha256-FLaM54wGK7YV2pTfNKXx5At6Oxr7R4IvClO5930kS/8=";
  }}/tritium";

  installPhase = ''
    mkdir -p $out/bin
    install -p -s bfi.out $out/bin/tritium
  '';

  nativeBuildInputs = [
    gcc
  ];

  meta = {
    description = "The fastest brainfuck interpreter around";
    mainProgram = "tritium";
    license = lib.licenses.gpl2;
  };
}
