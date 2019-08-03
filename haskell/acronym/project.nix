{ mkDerivation, base, hpack, hspec, stdenv }:
mkDerivation {
  pname = "acronym";
  version = "1.6.0.9";
  src = ./.;
  libraryHaskellDepends = [ base ];
  libraryToolDepends = [ hpack ];
  testHaskellDepends = [ base hspec ];
  prePatch = "hpack";
  license = "unknown";
  hydraPlatforms = stdenv.lib.platforms.none;
}
