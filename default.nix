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
  awibPackages = import ./awib pkgs;
  reb = pkgs.callPackage ./reb { };
}
