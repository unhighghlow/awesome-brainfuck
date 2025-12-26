{ lib, stdenv, fetchFromGitHub, gcc }:

stdenv.mkDerivation rec {
  pname = "reb";
  version = "unstable-2025-03-27";

  src = fetchFromGitHub {
    owner = "aartaka";
    repo = pname;
    rev = "e4ddf318ef11b94d3242ce418327bbdb2481e8c6";
    hash = "sha256-sTSVy+eBYjTOxg6if4S/tsTAL0F/6KGJNzXeOlKu+K4=";
  };

  nativeBuildInputs = [
    gcc
  ];

  installPhase = ''
    mkdir -p $out/bin
    install -m755 reb $out/bin/reb
  '';

  meta = {
    description = "Regex-based toolchain for minification, compilation, optimization, and interpretation of Brainfuck code";
    mainProgram = "bff";
    license = lib.licenses.wtfpl;
  };
}
