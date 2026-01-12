{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-llvm14.url = "github:nixos/nixpkgs/372d9eeeafa5b15913201e2b92e8e539ac7c64d1";
  };

  outputs = { nixpkgs, nixpkgs-llvm14, ... }: {
    packages = nixpkgs.lib.genAttrs [
      "x86_64-linux"
      "aarch64-linux"
      "i686-linux"
    ] (system: let
      pkgs = import nixpkgs {inherit system;};
      pkgs-llvm14 = import nixpkgs-llvm14 {inherit system;};
    in {
      original = pkgs.callPackage ./original {};
      bff = pkgs.callPackage ./bff {};
      bff4 = pkgs.callPackage ./bff4 {};
      bffsree = pkgs.callPackage ./bffsree {};
      esotope-bfc-3 = pkgs.callPackage ./esotope-bfc/3.nix {};
      reb = pkgs.callPackage ./reb { };
      tritium = pkgs.callPackage ./tritium { };
      brainforked = pkgs.callPackage ./brainforked { };
      none1bf = pkgs.callPackage ./none1bf { };
      bf-x86 = pkgs.callPackage ./bf-x86 { };
      bfdb = pkgs.callPackage ./bfdb { };
      wbf2c = pkgs.callPackage ./wbf2c { };
      qdb = pkgs.callPackage ./qdb { };
      bf-li = pkgs.callPackage ./bf-li { };
      bcci = pkgs.callPackage ./bcci { };
      bfc-wilfred = pkgs.callPackage ./bfc-wilfred { llvmPackages_14 = pkgs-llvm14.llvmPackages_14; };
    } // import ./awib pkgs);
  };
}
