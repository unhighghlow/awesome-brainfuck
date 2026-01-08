{ lib, stdenv, fetchFromGitHub, clang }:

stdenv.mkDerivation rec {
  pname = "brainforked";
  version = "unstable-2020-08-30";

  src = fetchFromGitHub {
    owner = "JohnCGriffin";
    repo = "BrainForked";
    rev = "ab96b84a7c3371b6b168dcaac79166488f3712ae";
    hash = "sha256-gZmHh8quFAaU+OLh9ixRaNeHc1bNbKGuxouzygr6MBo=";
  };

  nativeBuildInputs = [
    clang
  ];

  installPhase = ''
    mkdir -p $out/bin
    install bf $out/bin/brainforked
  '';

  meta = {
    description = "Fast BF interpreter in C++11";
    mainProgram = "brainforked";
    license = lib.licenses.mit;
  };
}
