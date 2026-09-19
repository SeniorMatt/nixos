{ inputs, ... }:
{
  flake.nixosModules.nvim-pywal =
    { pkgs, ... }:
    let
      # This neopywal package has been written by AI.
      # It just compiles neopywal plugin from the source,
      # because it is yet to be added in to nixpkgs.
      neopywal = pkgs.vimUtils.buildVimPlugin {
        pname = "neopywal.nvim";
        version = "unstable-2026-09-06";
        src = pkgs.fetchFromGitHub {
          owner = "RedsXDD";
          repo = "neopywal.nvim";
          rev = "master";
          hash = "sha256-Ytkt4WngDA7zlTUomr/BcyW+B6uULWE9OHm5aQE+mOM";
        };
        nvimSkipModules = [
          "barbecue.theme.neopywal"
          "neopywal.theme.plugins.airline"
          "neopywal.theme.plugins.barbecue"
          "neopywal.theme.plugins.bufferline"
          "neopywal.theme.plugins.clap"
          "neopywal.theme.plugins.feline"
          "neopywal.theme.plugins.lightline"
          "neopywal.theme.plugins.lualine"
          "neopywal.theme.plugins.reactive"
          "neopywal.utils.kinds"
          "reactive.presets.neopywal-cursor"
          "reactive.presets.neopywal-cursorline"
        ];
      };
    in
    {
      imports = [ inputs.nixvim.nixosModules.nixvim ];

      programs.nixvim = {
        extraPlugins = [ neopywal ];
        colorscheme = "neopywal";
      };
    };
}
