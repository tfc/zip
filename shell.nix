let
  pkgs = import <nixpkgs> {};
  zip = pkgs.haskellPackages.callCabal2nix "zip" ./. {};
in
pkgs.haskellPackages.shellFor {
  packages = p: [ zip ];
  buildInputs = with pkgs; [
    cabal-install
    curl
    imagemagick
  ];
}
