{ pkgs ? import <nixpkgs> {} }:

{
  s3s = pkgs.callPackage ./derivation.nix {};
}
