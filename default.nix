{ pkgs ? import <nixpkgs> {}
, mkDerivation ? pkgs.stdenv.mkDerivation
}:
mkDerivation rec {
    name = "stregsystem-cli";
    src = ./.;

	python = pkgs.python39.withPackages (pypkgs: [ pypkgs.requests ]);

	nativeBuildInputs = [
    	python
	];

    dontBuild = true;
    installPhase = ''
    	mkdir -p $out/bin
    	substituteInPlace ./main.py \
    		--replace "#!/usr/bin/env python3" "#!${python}/bin/python"
		cp ./main.py $out/bin/sts
		chmod +x $out/bin/sts
	'';
}
