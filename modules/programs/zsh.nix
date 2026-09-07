{ self, ... }:
{
  flake.nixosModules.zsh = { pkgs, ... }: {
    environment.shellAliases = {
      nrb = "sudo nixos-rebuild boot --flake ~/.nixos";
      nrs = "sudo nixos-rebuild switch --flake ~/.nixos";
      nrt = "sudo nixos-rebuild test --flake ~/.nixos";
    };

    users.users.${self.user}.shell = pkgs.zsh;
    programs.zsh.enable = true;

    home-manager.users.${self.user} = {
      programs.zsh = {
      	enable = true;
	autosuggestion.enable = true;
	enableCompletion = true;
	syntaxHighlighting.enable = true;
	oh-my-zsh = {
	  enable = true;
	  plugins = [ "sudo" ]; # Allows to double press escape to add 'sudo'.
	};
      };
    };
  };
}
