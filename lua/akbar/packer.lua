-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
    use { "nvim-neotest/nvim-nio" }

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use("rebelot/kanagawa.nvim")

	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	use("nvim-lua/plenary.nvim") -- don't forget to add this one if you don't have it yet!
	use({
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("mbbill/undotree")
	use("tpope/vim-fugitive")

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			--- Uncomment these if you want to manage LSP servers from neovim
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
		},
	})
	use("preservim/nerdcommenter")

	use("nvim-tree/nvim-tree.lua")
	use("nvim-tree/nvim-web-devicons")

	use("zbirenbaum/copilot.lua")
	use("zbirenbaum/copilot-cmp")

	-- Lua
	use({
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	})

	use("folke/zen-mode.nvim")

	use("hrsh7th/cmp-path")

	use("Pocco81/auto-save.nvim")

	use({ "catppuccin/nvim", as = "catppuccin" })

	use({ "mhartington/formatter.nvim" })

	use("lukas-reineke/indent-blankline.nvim")

	use("ggandor/leap.nvim")

	use("ckolkey/ts-node-action")

	use("rust-lang/rust.vim")

	use("mrcjkb/rustaceanvim")

	use("mfussenegger/nvim-dap")

	use("saecki/crates.nvim")

	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
end)
