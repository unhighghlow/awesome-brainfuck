{ lib, python3Packages, fetchFromGitea }:

python3Packages.buildPythonPackage rec {
  pname = "esotope-bfc";
  version = "3";

  src = fetchFromGitea {
    domain = "codeberg.org";
    owner = "highghlow";
    repo = pname;
    rev = "6f60a0742913fbc38f16566a61ae1f3d322adf8b";
    hash = "sha256-deSYV6sYFyt4K1AdMNA/3zUuLybMxQf7cWTg06BsyLs=";
  };

  patches = [./00-add-setup-py.patch];

  postFixup = "mv $out/bin/esotope-bfc.py $out/bin/esotope-bfc";

  pyproject = true;
  build-system = [ python3Packages.setuptools ];

  meta = {
    description = "This is the Esotope Brainfuck Compiler: the world's most optimizing Brainfuck-to-something compiler. Updated to Python 3";
    mainProgram = "esotope-bfc";

    license = lib.licenses.mit;
  };
}
