{ lib, stdenv, fetchFromGitHub, gcc, SDL2 }:

stdenv.mkDerivation rec {
  pname = "bf16";
  version = "unstable-2026-01-22";

  src = fetchFromGitHub {
    owner = "p2r3";
    repo = pname;
    rev = "cee6e63c5a50d182257d84877944180f31c9704d";
    hash = "sha256-MJ7hslyhcxG1g/d3L8Ky15SvlSGEaCuGF9zchcmm308=";
  };

  nativeBuildInputs = [
    SDL2
    gcc
  ];

  buildPhase = ''
    make bf16
    make bf16_grayscale
  '';

  installPhase = ''
    mkdir -p $out/bin
    install -m755 bf16 $out/bin/bf16
    install -m755 bf16_grayscale $out/bin/bf16_grayscale
  '';

  meta = {
    description = "The first ever visual Brainfuck runtime built for running interactive games";
    mainProgram = "bf16";
    license = lib.licenses.gpl3Only;
  };
}
