{
  inputs = { nixpkgs.url = "github:nixos/nixpkgs" ; flake-utils.url = "github:numtide/flake-utils" ; nixos-structure-utils.url = "github:nextmoose/nixos-structure-utils" ; } ;
  outputs =
    { self , nixpkgs , flake-utils , nixos-structure-utils } :
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
		        cleanup ( )
		          {
			    ${ pkgs.find }/bin/find ${ nixos-structure-utils.dollar "WORK_DIR" } -type f -exec ${ pkgs.coreutils }/bin/shred --force --remove=wipesync {} \; &&
			      rm --recursive --force ${ nixos-structure-utils.dollar "WORK_DIR" } &&
			      cd $( ${ pkgs.mktemp }/bin/mktemp --directory ${ nixos-structure-utils.dollar "WORK_DIR" }/XXXXXXXX )
		          } &&
			trap CLEANUP exit
		    '' ;
            }
      ) ;
}
