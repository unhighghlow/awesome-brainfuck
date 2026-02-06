{ lib, stdenv, fetchFromGitea }:

stdenv.mkDerivation rec {
  pname = "bcci-ng";
  version = "unstable-2026-02-06";

  src = fetchFromGitea {
    domain = "codeberg.org";
    owner = "highghlow";
    repo = pname;
    rev = "cdc6068f530f82baf58faf4981c264a4688dce34";
    hash = "sha256-j4wVdWySvMndCGKVZz8XpiGAXLZ66IjUzpo0MR94SDQ=";
  };

  installPhase = ''
    mkdir -p $out/bin
    cp bcci $out/bin/
  '';

  meta = {
    description = "The unreasonably restrictive, score-computing interpreter used for BFCC (revised)";
    mainProgram = "bcci";

    /* Make any use you like of this software. I can't stop you anyway. :)*/
    license = lib.licenses.publicDomain;
  };
}
