{
  lib,
  buildPythonPackage,
  linien-common,
  setuptools,
  fabric,
  typing-extensions,
  numpy,
  scipy,
}:

buildPythonPackage rec {
  pname = "linien-client";
  pyproject = true;

  inherit (linien-common) src version;

  sourceRoot = "${src.name}/linien-client";

  preBuild = ''
    export HOME=$(mktemp -d)
  '';

  nativeBuildInputs = [ setuptools ];

  propagatedBuildInputs = [
    fabric
    typing-extensions
    numpy
    scipy
    linien-common
  ];

  pythonImportsCheck = [ "linien_client" ];

  meta = with lib; {
    description = "Client components of the Linien spectroscopy lock application";
    homepage = "https://github.com/linien-org/linien/tree/develop/linien-client";
    changelog = "https://github.com/linien-org/linien/blob/v${version}/CHANGELOG.md";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [
      fsagbuya
      doronbehar
    ];
  };
}
