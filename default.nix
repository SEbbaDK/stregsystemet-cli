{ pkgs ? import <nixpkgs> {}
, python ? pkgs.python39
, mkDerivation ? pkgs.stdenv.mkDerivation
}:
mkDerivation rec {
    name = "stregsystem-cli";
    src = ./main.py;

	python = python.withPackages (pypkgs: [ pypkgs.requests ])
	buildInputs = [
    	python
	];

    dontUnpack = true;
    dontBuild = true;
    installPhase = ''
    	mkdir -p $out/bin
		cp $src $out/bin/sts
		chmod +x $out/bin/sts
	'';
}
