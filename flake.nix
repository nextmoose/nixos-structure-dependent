{
  inputs = { nixpkgs.url = "github:nixos/nixpkgs" ; flake-utils.url = "github:numtide/flake-utils" } ;
  outputs =
    { self , nixpkgs , flake-utils } :
      flake-utils.lib.eachDefaultSystem
      (
        system :
          let
            pkgs = builtins.getAttr system nixpkgs.legacyPackages ;
            in
            {
              lib =
		  pkgs.writeShellScriptBin
		    "bin"
		    ''
		      WORK_DIR=$( ${ pkgs.mktemp } --directory ) &&
		        ${ pkgs.coreutils }/bin/true
		    '' ;
            }
      ) ;
}
