{
  flake.nixosModules.videos = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      davinci-resolve 
      handbrake
      video-trimmer
    ];
  };
}
