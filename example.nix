with import <nixpkgs> {};

stdenv.mkDerivation rec {
  name = "test-environment";

  src = ./src;

  buildInputs = [ bash ];

  phases = [ "unpackPhase" "buildPhase" ];

  buildPhase = ''
    mkdir -p $out
    echo '#!${bash}/bin/bash' > $out/script.sh
    cat $src/script.sh >> $out/script.sh
    chmod +x $out/script.sh
  '';

}
