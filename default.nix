let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-25.11";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in
{
  original = pkgs.callPackage ./original { };
  bff = pkgs.callPackage ./bff { };
  bff4 = pkgs.callPackage ./bff4 { };
  bffsree = pkgs.callPackage ./bffsree { };
  esotope-bfc-3 = pkgs.callPackage ./esotope-bfc/3.nix { };
  reb = pkgs.callPackage ./reb { };
  tritium = pkgs.callPackage ./tritium { };
  brainforked = pkgs.callPackage ./brainforked { };
  none1bf = pkgs.callPackage ./none1bf { };
  bf-x86 = pkgs.callPackage ./bf-x86 { };
  bfdb = pkgs.callPackage ./bfdb { };
  wbf2c = pkgs.callPackage ./bfdb { };
  qdb = pkgs.callPackage ./qdb { };
  bf-li = pkgs.callPackage ./bf-li { };
  bcci = pkgs.callPackage ./bcci { };
  bfc-wilfred = throw "You have to use the flake to evaluate bfc-wilfred";
  bfc-muxutruk = pkgs.callPackage ./bfc-muxutruk { };
  bfcc = pkgs.callPackage ./bfcc { };
} // import ./awib pkgs
