-- RELATIVE NUMBER LINES
vim.wo.relativenumber = true

-- LAZY.NVIM PACKAGE MANAGER
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- NEW PLUGINS LIST
require("lazy").setup({
	{
		"rebelot/kanagawa.nvim",
		lazy=false
	},
	{
 	   	'nvim-lualine/lualine.nvim',
    		dependencies = { 'nvim-tree/nvim-web-devicons' },
		lazy=false
	},
	{
    		"nvim-telescope/telescope-file-browser.nvim",
    		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		lazy=false
	},
	{
    		'nvim-telescope/telescope.nvim', 
		tag = '0.1.5',
		dependencies = {'nvim-lua/plenary.nvim'},
		lazy=false
	}}
)

require("telescope").setup {
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
}

vim.cmd("colorscheme kanagawa")

require('lualine').setup()

require("telescope").load_extension "file_browser"
