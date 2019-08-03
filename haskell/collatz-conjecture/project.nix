{ mkDerivation, base, hpack, hspec, stdenv }:
mkDerivation {
  pname = "collatz-conjecture";
  version = "1.2.1.3";
  src = ./.;
  libraryHaskellDepends = [ base ];
  libraryToolDepends = [ hpack ];
  testHaskellDepends = [ base hspec ];
  prePatch = "hpack";
  license = "unknown";
  hydraPlatforms = stdenv.lib.platforms.none;
}
