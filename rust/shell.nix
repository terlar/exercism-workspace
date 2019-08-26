let
  moz_overlay = import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz);
in with import <nixpkgs> {
  overlays = [ moz_overlay ];
};

let
  ruststable = (rustChannels.stable.rust.override {
    extensions = ["rust-src" "rls-preview" "rust-analysis" "rustfmt-preview"];
  });
in mkShell {
  buildInputs = [ openssl nasm ruststable cmake zlib ];

  shellHook = ''
    export OPENSSL_DIR="${openssl.dev}"
    export OPENSSL_LIB_DIR="${openssl.out}/lib"
  '';
}
