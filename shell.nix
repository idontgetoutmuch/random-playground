let overlay = self: super:
{
  testu01 = self.callPackage ./TestU01 { };
  practrand = self.callPackage ./PractRand { };
};

in

{ nixpkgs ? import <nixpkgs> { overlays = [ overlay ]; }, compiler ? "default", doBenchmark ? false }:

nixpkgs.stdenv.mkDerivation {
  name = "env";
  buildInputs = [
    nixpkgs.libiconv
    nixpkgs.testu01
    nixpkgs.practrand
    nixpkgs.gcc
  ];
}

