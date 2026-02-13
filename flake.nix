{
  description = "Dev shell for local Whisper transcription on macOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells.default = pkgs.mkShell {

        buildInputs = [
          pkgs.sox
          pkgs.ffmpeg
          pkgs.python310   # Use python310 (not python310Full)
          pkgs.python310Packages.uv
        ];

        shellHook = ''
          export PYTHONNOUSERSITE=1
          export UV_PYTHON="${pkgs.python310}/bin/python"

          # Create and activate virtual env
          test -d .venv || "${pkgs.python310Packages.uv}/bin/uv" venv .venv
          source .venv/bin/activate
        '';
      };
    }
  );
}

