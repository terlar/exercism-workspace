{pkgs, ...}: let
  cobol-check = pkgs.stdenv.mkDerivation rec {
    name = "cobol-check";
    version = "0.2.8";

    src = pkgs.fetchzip {
      url = "https://github.com/openmainframeproject/cobol-check/raw/abd6292096e93798bce2ca0e6305b5b55e0e5dee/build/distributions/cobol-check-${version}.zip";
      stripRoot = false;
      sha256 = "sha256-TB0xonmu7ujTK+wWIBBB2mAJ9sMudbqjSHfrgeq4Cl8=";
    };

    installPhase = ''
      mkdir -p $out
      cp -r bin $out/bin
      echo '#!${pkgs.runtimeShell}' > "$out/bin/cobolcheck"
      echo "${pkgs.jre}/bin/java -jar '$out/bin/cobol-check-${version}.jar' \"\$@\"" >> "$out/bin/cobolcheck"
      chmod a+x "$out/bin/cobolcheck"
    '';
  };
in {
  imports = [../common.nix];

  enterShell = ''
    cobc --version | head -n1

    echo
    echo Run the tests with:
    echo 'bash test.sh'
  '';
  scripts.exercism-test.exec = "bash test.sh";

  packages = [
    pkgs.gnu-cobol
    pkgs.gcc
    pkgs.gmp
    cobol-check
  ];
}
