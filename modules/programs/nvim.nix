{ inputs, ... }:
{
  flake.nixosModules.neovim = { pkgs, config, ... }: let
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
  in {
    imports = [ inputs.nixvim.nixosModules.nixvim ];

    programs.nixvim = {
      nixpkgs.config.allowUnfree = true;
      enable = true;
      opts = {
        number = true;
        relativenumber = true;
        shiftwidth = 2;
      };

      globals.mapleader = " ";
      keymaps = [
        # Manage windows:
        { mode = "n"; key = "<C-h>"; action = "<C-w>h"; }
        { mode = "n"; key = "<C-j>"; action = "<C-w>j"; }
        { mode = "n"; key = "<C-k>"; action = "<C-w>k"; }
        { mode = "n"; key = "<C-l>"; action = "<C-w>l"; }

        # Neotree:
        { mode = "n"; key = "<leader>n"; action.__raw = "vim.cmd.Ex"; }
        { mode = "n"; key = "<C-n>"; action = "<cmd>Neotree toggle left<CR>"; options.desc = "Toggle file tree"; }

        # Barbar:
        { mode = "n"; key = "<S-h>"; action = "<cmd>BufferPrevious<CR>"; options.desc = "Previous buffer"; }
        { mode = "n"; key = "<S-l>"; action = "<cmd>BufferNext<CR>"; options.desc = "Next buffer"; }
        { mode = "n"; key = "<leader>h"; action = "<cmd>BufferMovePrevious<CR>"; options.desc = "Move buffer left"; }
        { mode = "n"; key = "<leader>l"; action = "<cmd>BufferMoveNext<CR>"; options.desc = "Move buffer right"; }
        { mode = "n"; key = "<leader>x"; action = "<cmd>BufferClose<CR>"; options.desc = "Close buffer"; }
        { mode = "n"; key = "<leader>r"; action = "<cmd>BufferRestore<CR>"; options.desc = "Restore buffer"; }

        # Telescope:
        { mode = "n"; key = "<leader>ff"; action.__raw = "require('telescope.builtin').find_files"; options.desc = "Telescope find files"; }
        { mode = "n"; key = "<leader>fg"; action.__raw = "require('telescope.builtin').live_grep"; options.desc = "Telescope live grep"; }
        { mode = "n"; key = "<leader>fb"; action.__raw = "require('telescope.builtin').buffers"; options.desc = "Telescope buffers"; }
        { mode = "n"; key = "<leader>fh"; action.__raw = "require('telescope.builtin').help_tags"; options.desc = "Telescope help tags"; }

        # LSP:
        { mode = "n"; key = "K";  action = "<cmd>lua vim.lsp.buf.hover()<cr>"; }
        { mode = "n"; key = "gd"; action = "<cmd>lua vim.lsp.buf.definition()<cr>"; }
        { mode = "n"; key = "gD"; action = "<cmd>lua vim.lsp.buf.declaration()<cr>"; }
        { mode = "n"; key = "gi"; action = "<cmd>lua vim.lsp.buf.implementation()<cr>"; }
        { mode = "n"; key = "go"; action = "<cmd>lua vim.lsp.buf.type_definition()<cr>"; }
        { mode = "n"; key = "gr"; action = "<cmd>lua vim.lsp.buf.references()<cr>"; }
        { mode = "n"; key = "gs"; action = "<cmd>lua vim.lsp.buf.signature_help()<cr>"; }
        { mode = "n"; key = "gl"; action = "<cmd>lua vim.diagnostic.open_float()<cr>"; }
        { mode = "n"; key = "<F2>"; action = "<cmd>lua vim.lsp.buf.rename()<cr>"; }
        { mode = [ "n" "x" ]; key = "<F3>"; action = "<cmd>lua vim.lsp.buf.format({async = true})<cr>"; }
        { mode = "n"; key = "<F4>"; action = "<cmd>lua vim.lsp.buf.code_action()<cr>"; }
      ];

      extraPackages = with pkgs; [ (dotnetCorePackages.combinePackages [ dotnetCorePackages.sdk_8_0 dotnetCorePackages.sdk_10_0 ]) ];
      extraPlugins = [ neopywal ];
      colorscheme = "neopywal";
      plugins = {
	nvim-autopairs.enable = true;
	telescope.enable = true;
	web-devicons.enable = true;
      	barbar = {
	  enable = true;
	  settings.animation = false;
	};
	treesitter = {
          enable = true;
          highlight.enable = true;
	  indent.enable = true;
	  autoLoad = true;

	  grammarPackages = with config.programs.nixvim.plugins.treesitter.package.builtGrammars; [
	    bash
	    json
	    lua
	    make
	    markdown
	    markdown_inline
	    nix
	    regex
	    toml
	    vim
	    vimdoc
	    xml
	    yaml

	    c_sharp
	    gdscript
	    godot_resource
	    gdshader
	  ];
        };
	neo-tree = {
	  enable = true;
	  autoLoad = true;
	};
	lsp = {
	  enable = true;
	  servers = {
	    nixd.enable = true;
	    marksman.enable = true;
	    csharp_ls.enable = true;
	  };
	};
	blink-cmp = {
	  enable = true;
	  settings = {
	    completion.documentation.auto_show = true;
	    keymap = {
	      preset = "none";
	      "<Tab>" = [ "select_next" "fallback" ];
	      "<S-Tab>" = [ "select_prev" "fallback" ];
	      "<CR>" = [ "accept" "fallback" ];
	    };
	  };
	};
      };
    };
  };
}
