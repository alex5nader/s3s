{ stdenv, fetchFromGitHub
, python38 }:

stdenv.mkDerivation rec {
  pname = "s3s";
  version = "0.1.1-dev";

  format = "other";
  src = ./src;

  buildInputs = [
    (python38.withPackages (ps: with ps; [
      beautifulsoup4
      requests
      msgpack
      packaging
      pillow
      appdirs
    ]))
  ];

  unpackPhase = ''
    cp $src/*.py .
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp * $out/bin
    mv $out/bin/s3s.py $out/bin/s3s
    chmod a+x $out/bin/s3s
  '';
}
