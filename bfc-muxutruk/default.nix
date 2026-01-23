{ lib, rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage {
  pname = "bfc-muxutruk";
  version = "unstable-2025-01-10";

  src = fetchFromGitHub {
    owner = "Muxutruk2";
    repo = "bfc";
    rev = "543e59345f554d93c560dc173ed20ed4e937480c";
    hash = "sha256-jSbcW1JdmTAwtysspA6rQYdzMRKkAM9zF38r1GUJH24=";
  };

  cargoHash = "sha256-xjnLlG+3REsi0nRTeo4BjOt99yw8EiH5scw8xGVsUfU=";

  meta = {
    description = "Brainfuck compiler written in rust";
    mainProgram = "bfc";
    license = lib.licenses.unfree;
  };
}
