{
  inputs = { nixpkgs.url = "github:nixos/nixpkgs" ; flake-utils.url = "github:numtide/flake-utils" ; } ;
  outputs =
    { self , nixpkgs , flake-utils } :
      flake-utils.lib.eachDefaultSystem
      (
        system :
          let
            pkgs = builtins.getAttr system nixpkgs.legacyPackages ;
            in
	      script :
		{
		  devShell =
		    pkgs.mkShell
		      {
		        shellHook =
		          ''
	  	            ${ builtins.toString script }
		    	  '' ;
		      } ;
		 }
      ) ;
}
