{
  description = "csharp_curricula";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        allowUnfree = false;
      };
    in {
      devShells.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          alejandra
          dotnetCorePackages.sdk_9_0
          omnisharp-roslyn
        ];

        DOTNET_BIN = "${pkgs.dotnetCorePackages.sdk_9_0}/bin/dotnet";
        shellHook = ''
          # Custom Prompt
          export PS1="\n\[\e[1;32m\][devshell](dotnet) \w\n❯ \[\e[0m\]"
        '';
      };
    });
}
