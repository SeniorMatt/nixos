{
  flake.nixosModules.videos = { pkgs, ... }: {
    programs.kdeconnect.enable = true;
    environment.systemPackages = with pkgs; [
      davinci-resolve 
      handbrake
      video-trimmer
    ];
  };
}
