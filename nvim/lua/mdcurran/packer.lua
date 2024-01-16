vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
	-- Packer is able to manage itself.
	use "wbthomason/packer.nvim"

	-- Telescope is a fuzzy finder for traversing files in a directory or
	-- Git repository. ripgrep is a dependency.
	use {
		"nvim-telescope/telescope.nvim", tag = "0.1.5",
		requires = { {"nvim-lua/plenary.nvim"} }
	}

	-- Treesitter is a parsing library that builds concrete syntax trees
	-- for source files. This is used in conjunction with other plugins to
	-- provide syntax highlighting, syntax error detection, and a bunch of
	-- other stuff to make the Vim experience easier.
	use {
		"nvim-treesitter/nvim-treesitter",
		{run=":TSUpdate"}
	}

	-- Colour scheme/theme.
	use {
		"Mofiqul/dracula.nvim", as = "dracula",
		config = function()
			vim.cmd("colorscheme dracula")
		end
	}
end)
