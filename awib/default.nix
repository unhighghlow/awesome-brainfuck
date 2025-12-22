{ lib, stdenv, fetchFromGitHub, gcc, python3 }:

let mkAwib = ({
  enableC ? true,
  enableTcl ? false,
  enableBash ? false,
}:
  stdenv.mkDerivation rec {
    pname = "awib";
    version = "unstable-2025-12-16";

    src = fetchFromGitHub {
      owner = "matslina";
      repo = pname;
      rev = "f9f43a0092b6c4ba77c6d2d9e21db3b3b37cd706";
      hash = "sha256-uzXQpsHLJazsxSz05e3Fx8C+AUX8yPWCazR4N1eZ8qk=";
    };

    nativeBuildInputs = [
      python3
    ] ++ (lib.optionals enableC [
      gcc
    ]);

    buildPhase = ''
      python3 util/bfpp.py --interpreter --format formats/awib-0.3 --width 79 awib-skeleton.b > awib.b
    '' + (lib.optionalString enableC ''
      cp awib.b awib.c
      gcc -std=c99 awib.c -o awib-c
    '');

    installPhase = ''
      mkdir -p $out/bin
    '' + (lib.optionalString enableC ''
      install -m775 awib-c $out/bin/awib-c
    '') + ''
      ln -s $out/bin/${
        if enableC then
          "awib-c"
        else if enableTcl then
          "awib-tcl"
        else if enableBash then
          "awib-bash"
        else throw "One of the languages must be enabled"
      } $out/bin/awib
    '';

    meta = {
      description = "a brainfuck compiler written in brainfuck";
      mainProgram = "awib";

      license = lib.licenses.gpl3Only;
    };
  }
); in rec {
  awib-c = mkAwib {};
  awib-tcl = mkAwib { enableC = false; enableTcl = true; };
  awib-bash = mkAwib { enableC = false; enableBash = true; };
  awib-full = mkAwib { enableC = true; enableTcl = true; enableBash = true; };
  awib = awib-c;
}
