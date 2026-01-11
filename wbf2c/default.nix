{ lib, stdenv, fetchFromGitHub, autoreconfHook }:

stdenv.mkDerivation rec {
  pname = "wbf2c";
  version = "unstable-2017-12-10";

  src = fetchFromGitHub {
    owner = "skeeto";
    repo = "bfc";
    rev = "45de468f7691704116de2733de5b658b325a6cf4";
    hash = "sha256-kD9EkK3NQyuvoj3SJR2I7Dt9l69AlGUY1FC2DyCrheo=";
  };

  nativeBuildInputs = [autoreconfHook];
  NIX_CFLAGS_COMPILE = "-Wno-format-security";

  installPhase = ''
    mkdir -p $out/bin
    cp wbf2c $out/bin/
  '';

  meta = {
    description = "Multi-threading brainfuck compiler";
    mainProgram = "wbf2c";
    license = lib.licenses.unlicense;
  };
}
