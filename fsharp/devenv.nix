{pkgs, ...}: {
  imports = [../common.nix];

  enterShell = ''
    echo "dotnet $(dotnet --version)"

    echo
    echo Run the tests with:
    echo 'dotnet test'
  '';
  scripts.test-all.exec = "dotnet test";

  # languages.dotnet.enable = true;
  packages = [
    pkgs.dotnet-sdk_7
  ];
}
