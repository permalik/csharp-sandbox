{ lib, buildDotnetModule }:

buildDotnetModule {
    pname = "csharp_curricula";
    version = "0.0.1";
    src = lib.sources.cleanSource ./.;
    projectFile = "csharp_construct.csproj";
}
