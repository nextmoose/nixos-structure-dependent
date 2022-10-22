{
  inputs = { flake-utils.url = "github:numtide/flake-utils" ; } ;
  outputs =
    { self , nixpkgs , flake-utils } :
      let
	in
          flake-utils.lib.eachDefaultSystem
            (
              system :
                {
                  lib =
                    pkgs : script :
                      {
                        devShell =
                          pkgs.mkShell
                            {
                              shellHook =
                                ''
                                  ${ script }
                                '' ;
                            } ;
                      } ;
                }
            ) ;
}