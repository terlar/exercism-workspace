{
  imports = [../common.nix];

  enterShell = ''
    echo "zig $(zig version)"

    echo
    echo Run the tests with:
    echo 'zig test test_*.zig'
  '';
  scripts.exercism-test.exec = "zig test test_*.zig";

  languages.zig.enable = true;
}
