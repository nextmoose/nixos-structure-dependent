{
  inputs = { flake-utils.url = "github:numtide/flake-utils" ; } ;
  outputs =
    { self , flake-utils } :
      flake-utils.lib.eachDefaultSystem
      (
        system :
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
