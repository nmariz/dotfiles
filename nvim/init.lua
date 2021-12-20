-- Install packer
local execute = vim.api.nvim_command
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

vim.cmd [[packadd packer.nvim]]
vim.api.nvim_exec(
    [[
    augroup Packer
        autocmd!
        autocmd BufWritePost plugins.lua PackerCompile
    augroup end
    ]],
    false
)

local use = require("packer").use
require("packer").startup(
    function()
        use "airblade/vim-gitgutter"
        use "cespare/vim-toml"
        use "fisadev/vim-isort" -- install: pip install isort
        use "geoffharcourt/one-dark.vim"
        use "hrsh7th/nvim-compe"
        use "jiangmiao/auto-pairs"
        use "kabouzeid/nvim-lspinstall"
        use "majutsushi/tagbar"
        use "neovim/nvim-lspconfig"
        use "ntpeters/vim-better-whitespace"
        use "nvim-lua/plenary.nvim"
        use "nvim-lua/popup.nvim"
        use "nvim-lualine/lualine.nvim"
        use "nvim-telescope/telescope-symbols.nvim"
        use "psf/black" -- install: pip install black
        use "rust-lang/rust.vim"
        use "tpope/vim-commentary"
        use 'marko-cerovac/material.nvim'
        use {"kyazdani42/nvim-web-devicons"}
        use {"nvim-telescope/telescope.nvim", requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}}
        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
        use {"wbthomason/packer.nvim", opt = true}
        use {"ray-x/lsp_signature.nvim"}
    end
)

require("keys")
require("options")
require("lsp")
require("plugins")
