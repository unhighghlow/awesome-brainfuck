{
  lib,
  fetchFromGitHub,
  rustPlatform,
  llvmPackages_14,
  zlib,
  libxml2,
  libtinfo,
  pkg-config
}:

rustPlatform.buildRustPackage (finalAttrs: rec {
  pname = "bfc-wilfred";
  version = "unstable-2024-04-17";

  nativeBuildInputs = [
    llvmPackages_14.libllvm
    pkg-config
  ];
  buildInputs = [
    zlib.dev
    libxml2.dev
    libtinfo.dev
  ];

  patches = [
    #./00-fix-pointers.patch
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
