{ lib, python3Packages, fetchFromGitHub }:

python3Packages.buildPythonPackage rec {
  pname = "jitbf";
  version = "unstable-2024-09-01";

  src = fetchFromGitHub {
    owner = "none-None1";
    repo = pname;
    rev = "fbd7cdd6eb299dfe0424afbdc45101c0657c0f8a";
    hash = "sha256-44dWCIgsiIOicaw7MeLInbAxYfOrvAjZ/AYh0KFCRa0=";
  };

  patches = [ ./00-remove-initialize.patch ];

  propagatedBuildInputs = [ python3Packages.llvmlite ];

  pyproject = true;
  build-system = [ python3Packages.setuptools ];

  meta = {
    description = "Brainfuck JIT interpreter in Python";
    mainProgram = "jitbf";

    license = lib.licenses.cc0;
  };
}
