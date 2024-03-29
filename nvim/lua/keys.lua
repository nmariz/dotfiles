-- Map helper
local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Easier moving between tabs
map("n", "<Leader>p", "<esc>:tabprevious<CR>")
map("n", "<Leader>n", "<esc>:tabnext<CR>")

-- Easier switching between buffers
map("n", "<C-Right>", ":bn<CR>", { silent = true })
map("n", "<C-Left>", ":bp<CR>", { silent = true })
map("n", "<C-J>", ":bn<CR>", { silent = true })
map("n", "<C-k>", ":bp<CR>", { silent = true })

-- <Leader>l redraws the screen and remove any search highlighting
map("n", "<Leader>l", ":nohl<CR>")

-- Use Enter for inserting a line after the current line without the insert mode
map("n", "<CR>", "o<Esc>")

-- Map sort function to a key
map("v", "<Leader>s", ":sort<CR>")

-- Easier moving of code blocks
-- Try to go into visual mode (v), thenselect several lines of code here and then press ``>`` several times.
map("v", "<", "<gv") -- better indentation
map("v", ">", ">gv") -- better indentation

map("n", "<Leader>b", ":buffers<cr>:b<space>")

-- Map sort function to a key
map("v", "<Leader>s", ":sort<CR>")

-- psf/black
map("n", "<Leader>pb", ":Black<CR>")

-- fisadev/vim-isort
map("n", "<Leader>ps", ":Isort<CR>")

-- rust-lang/rust.vim
map("n", "<Leader>cr", ":Crun<CR>")
map("n", "<Leader>cc", ":Ccheck<CR>")
map("n", "<Leader>ct", ":Ctest<CR>")
