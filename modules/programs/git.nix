{ self, ... }:
{
  flake.nixosModules.git = {
    home-manager.users.${self.user} = {
      programs.git = {
      	enable = true;
	settings = {
	  user = {
	    name = "SeniorMatt";
	    email = "matthew.prakhov@gmail.com";
	  };
	};
      };
    };
  };
}
