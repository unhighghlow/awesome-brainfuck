{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { nixpkgs, ... }: {
    packages = nixpkgs.lib.genAttrs [
      "x86_64-linux"
      "aarch64-linux"
      "i686-linux"
    ] (system: let pkgs = import nixpkgs {inherit system;}; in {
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
    } // import ./awib pkgs);
  };
}
