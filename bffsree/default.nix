{ lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation {
  name = "bffrsee";

  src = fetchFromGitHub {
    owner = "sreekotay";
    repo = "bffsree";
    rev = "38f0eef78978193da9fa985965379e8dbf4a2d9b";
    hash = "sha256-OdPS7puvZVFA1NC7cSiS9vSNixXFzZLfQvZDWFzto5U=";
  };

  buildPhase = ''
    make release
  '';

  installPhase = ''
    mkdir -p $out/bin
    install -m755 bffsree $out/bin/bffsree
  '';

  meta = {
    description = "Sree Kotay's brainfuck interpreter";
    mainProgram = "bffsree";

    /* No license provided */
    license = lib.licenses.unfree;
  };
}
