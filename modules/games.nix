{
  flake.nixosModules.games = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [ prismlauncher ];
    programs.steam.enable = true;
    programs.gamemode.enable = true;
    programs.gamescope.enable = true;
  };
}
