{
  lib,
  mkKdeDerivation,
  fetchurl,
  qtdeclarative,
  qtsvg,
  qtwayland,
}:
mkKdeDerivation rec {
  pname = "marknote";
  version = "1.2.1";

  src = fetchurl {
    url = "mirror://kde/stable/marknote/marknote-${version}.tar.xz";
    hash = "sha256-HzImkm8l8Rqiuyq2QezfdqJ1hxIdLZhiIGVM9xzpyaA=";
  };

  extraBuildInputs = [
    qtdeclarative
    qtsvg
    qtwayland
  ];

  meta.license = [ lib.licenses.gpl2Plus ];
}
