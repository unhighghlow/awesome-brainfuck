{
  lib,

  runCommand,
  clang,
  makeWrapper,

  fetchFromGitHub,
  rustPlatform,
  llvmPackages_14,
  zlib,
  libxml2,
  libtinfo,
  pkg-config
}:

let unwrapped = rustPlatform.buildRustPackage (finalAttrs: rec {
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
    ./00-fix-pointers.patch
  ];

  src = fetchFromGitHub {
    owner = "Wilfred";
    repo = "bfc";
    rev = "2cd6a755578191d84e536ae2de1dcd75a635a7dc";
    hash = "sha256-J/1AihG4iuZXBcox5fWf2DuCj0Pj/hoYYPXoSjamWjQ=";
  };

  doCheck = false; # Tests are flaky

  cargoHash = "sha256-iItDwdXWPgeWUWDqCGKCU/tiDMdZuGiz7aaQei5NlGs=";

  meta = {
    description = "An industrial-grade brainfuck compiler";
    license = lib.licenses.gpl2;
    maintainers = [ ];
  };
}); in
runCommand "bfc-wilfred-wrapped" {
  nativeBuildInputs = [ makeWrapper ];
  meta = unwrapped.meta;
} ''
  mkdir -p $out/bin
  install -m755 ${unwrapped}/bin/bfc $out/bin/bfc
  wrapProgram $out/bin/bfc \
    --prefix PATH : ${lib.makeBinPath [clang]}
''
