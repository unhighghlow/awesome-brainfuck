{
  lib,
  fetchFromGitHub,
  rustPlatform,
  llvmPackages_18,
  zlib,
  xml2,
  libtinfo
}:

rustPlatform.buildRustPackage (finalAttrs: rec {
  pname = "bfc-wilfred";
  version = "unstable-2024-04-17";

  nativeBuildInputs = [
    llvmPackages_18.libllvm
    zlib
    xml2
    libtinfo
  ];
  LD_LIBRARY_PATH = lib.makeLibraryPath nativeBuildInputs;

  patches = [
    ./00-fix-pointers.patch
  ];

  src = fetchFromGitHub {
    owner = "Wilfred";
    repo = "bfc";
    rev = "2cd6a755578191d84e536ae2de1dcd75a635a7dc";
    hash = "sha256-J/1AihG4iuZXBcox5fWf2DuCj0Pj/hoYYPXoSjamWjQ=";
  };

  cargoHash = "sha256-iItDwdXWPgeWUWDqCGKCU/tiDMdZuGiz7aaQei5NlGs=";

  meta = {
    description = "An industrial-grade brainfuck compiler";
    license = lib.licenses.gpl2;
    maintainers = [ ];
  };
})
