{ lib, stdenv, fetchFromGitHub, gcc }:

stdenv.mkDerivation rec {
  pname = "bff";
  version = "1.0.7";

  src = fetchFromGitHub {
    owner = "apankrat";
    repo = pname;
    tag = "v${version}";
    hash = "sha256-SElJfZ2UMZzg2xJqpvUYwfD7pBDdy+Z+nqDldtS4qnk=";
  };

  nativeBuildInputs = [
    gcc
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp bff $out/bin/bff
  '';

  meta = {
    description = "Moderately-optimizing brainfuck interpreter";
    mainProgram = "bff";
    license = lib.licenses.bsd2;
  };
}
