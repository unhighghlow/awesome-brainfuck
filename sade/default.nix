{ lib, stdenv, makeWrapper, fetchFromGitHub, sbcl }:

stdenv.mkDerivation rec {
  pname = "sade";
  version = "unstable-2023-06-18";

  src = fetchFromGitHub {
    owner = "aartaka";
    repo = pname;
    rev = "cdf646b0f6d13b846345a02851f1f98286b3e07e";
    hash = "sha256-AlG6i7p4ANckP19H2B+CUPap4MhAr2DRal2HGj05nbk=";
  };

  nativeBuildInputs = [
    makeWrapper
  ];

  propagatedBuildInputs = [
    sbcl
  ];

  buildPhase = ''
    mkdir temp
    export HOME=$temp
    make sade
  '';

  installPhase = ''
    mkdir -p $out/bin/
    install -m755 sade $out/bin
    wrapProgram $out/bin/sade \
      --prefix PATH : ${lib.makeBinPath propagatedBuildInputs} \
      --set SBCL_HOME ${sbcl}/lib/sbcl
  '';

  meta = {
    description = "An infinitely optimizable Brainfuck-to-Lisp compiler";
    mainProgram = "sade";
    license = lib.licenses.bsd2;
  };
}
