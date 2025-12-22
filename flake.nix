{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
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
      awibPackages = import ./awib pkgs;
    });
  };
}
