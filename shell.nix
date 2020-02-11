let overlay = self: super:
{
  testu01 = self.callPackage ./TestU01 { };
};

in

{ nixpkgs ? import <nixpkgs> { overlays = [ overlay ]; }, compiler ? "default", doBenchmark ? false }:

nixpkgs.stdenv.mkDerivation {
  name = "env";
  buildInputs = [
    nixpkgs.testu01
  ];
}

