{ pkgs ? (import ../. {}).pkgs }:

let
  ruststable = (pkgs.rustChannels.stable.rust.override {
    extensions = ["rust-src" "rls-preview" "rust-analysis" "rustfmt-preview"];
  });
in pkgs.mkShell {
  buildInputs = with pkgs; [ openssl nasm ruststable cmake zlib ];

  shellHook = ''
    export OPENSSL_DIR="${pkgs.openssl.dev}"
    export OPENSSL_LIB_DIR="${pkgs.openssl.out}/lib"
  '';
}
