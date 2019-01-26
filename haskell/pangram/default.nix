{ mkDerivation, base, hpack, hspec, stdenv }:
mkDerivation {
  pname = "pangram";
  version = "1.4.1.10";
  src = ./.;
  libraryHaskellDepends = [ base ];
  libraryToolDepends = [ hpack ];
  testHaskellDepends = [ base hspec ];
  preConfigure = "hpack";
  license = "unknown";
  hydraPlatforms = stdenv.lib.platforms.none;
}
