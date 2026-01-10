{ lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "bf-x86";
  version = "unstable-2025-12-07";

  src = fetchFromGitHub {
    owner = "skeeto";
    repo = pname;
    rev = "3a2feb241f484036a95c7b5f5123b33f4dc8fd0c";
    hash = "sha256-t3Mu6/+ouUP4WCHvgd+F5OBK9k2q9BWGY2lA6P0ocXo=";
  };

  installPhase = ''
    mkdir -p $out/bin
    cp bf-x86 $out/bin/bf-x86
  '';

  meta = {
    description = "x86_64 Brainfuck Compiler";
    mainProgram = "bf-x86";
    license = lib.licenses.unlicense;
  };
}
