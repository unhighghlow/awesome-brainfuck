pkgs:

let awib-pkg = ({
  lib,
  stdenv,
  fetchFromGitHub,
  gcc,
  bash,
  tcl,
  python3,
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
    '') + (lib.optionalString enableTcl ''
      echo "#!${tcl}/bin/tclsh" > awib-tcl
      cat awib.b >> awib-tcl
      chmod +x awib-tcl
    '') + (lib.optionalString enableBash ''
      echo "#!${bash}/bin/bash" > awib-bash
      cat awib.b >> awib-bash
      chmod +x awib-bash
    '');

    installPhase = ''
      mkdir -p $out/bin
    '' + (lib.optionalString enableC ''
      install -m775 awib-c $out/bin/awib-c
    '') + (lib.optionalString enableBash ''
      install -m775 awib-bash $out/bin/awib-bash
    '') + (lib.optionalString enableTcl ''
      install -m775 awib-tcl $out/bin/awib-tcl
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
      description = "A brainfuck compiler written in brainfuck";
      mainProgram = "awib";

      license = lib.licenses.gpl3Only;
    };
  }
); in rec {
  awib = pkgs.callPackage awib-pkg { };
  awib-c = awib;
  awib-tcl = awib.override { enableC = false; enableTcl = true; };
  awib-bash = awib.override { enableC = false; enableBash = true; };
  awib-full = awib.override { enableC = true; enableTcl = true; enableBash = true; };
}
