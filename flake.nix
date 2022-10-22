{
  inputs = { flake-utils.url = "github:numtide/flake-utils" ; } ;
  outputs =
    { self , flake-utils } :
      flake-utils.lib.eachDefaultSystem
      (
        system :
          let
            in
	      pkgs : script :
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
