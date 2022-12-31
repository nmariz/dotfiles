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
        -- Package manager
        use {"wbthomason/packer.nvim", opt = true}

        -- LSP Configuration & Plugins
        use {
            "neovim/nvim-lspconfig",
            requires = {
                -- Automatically install LSPs to stdpath for neovim
                "williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim",

                -- Useful status updates for LSP
                "j-hui/fidget.nvim",

                -- Additional lua configuration, makes nvim stuff amazing
                "folke/neodev.nvim",
            },
        }

        -- Autocompletion
        use {
            "hrsh7th/nvim-cmp",
            requires = {
                "hrsh7th/cmp-nvim-lsp",
                "L3MON4D3/LuaSnip",
                "saadparwaiz1/cmp_luasnip"
            },
        }

        -- Telescope
        use {
            "nvim-telescope/telescope.nvim",
            requires = {
                {"nvim-lua/popup.nvim"},
                {"nvim-lua/plenary.nvim"},
                {"nvim-telescope/telescope-symbols.nvim"}
            }
        }

        -- Highlight, edit, and navigate code
        use {
            "nvim-treesitter/nvim-treesitter",
            run = function()
                pcall(require("nvim-treesitter.install").update { with_sync = true })
            end,
        }

        -- Additional text objects via treesitter
        use {
            "nvim-treesitter/nvim-treesitter-textobjects",
            after = "nvim-treesitter",
        }

        -- Other
        use "cespare/vim-toml"
        use "fisadev/vim-isort"
        use "geoffharcourt/one-dark.vim"
        use "jiangmiao/auto-pairs"
        use "kyazdani42/nvim-web-devicons"
        use "lewis6991/gitsigns.nvim"
        use "marko-cerovac/material.nvim"
        use "ntpeters/vim-better-whitespace"
        use "nvim-lualine/lualine.nvim"
        use "psf/black"
        use "rust-lang/rust.vim"
        use "tpope/vim-commentary"
    end
)

require("keys")
require("options")
require("plugins")
