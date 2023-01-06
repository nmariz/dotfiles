-- General
vim.opt.confirm = true -- prompt when existing from an unsaved file
vim.opt.hidden = true -- allow hiding buffers instead of closing them
vim.opt.wildmenu = true -- better command-line completion
vim.opt.autoread = true -- automatically read a file that has changed on disk
vim.opt.history = 1000
vim.opt.undolevels = 1000
vim.opt.backspace = "indent,eol,start" -- more powerful backspacing
vim.opt.encoding = "utf-8" -- set the default file encoding to UTF-8:
vim.opt.pastetoggle = "<F2>"
vim.opt.clipboard = "unnamed"

-- Mouse
vim.opt.mouse = "a" -- on OSX press ALT and click

-- Display settings
vim.opt.textwidth = 0 -- text width
vim.opt.report = 0 -- always report number of lines changed
vim.opt.wrap = true -- wrap lines
vim.opt.linebreak = true -- don't break words
vim.opt.list = false -- list disables linebreak
vim.opt.scrolloff = 2 -- 2 lines above/below cursor when scrolling
vim.opt.number = true -- show line number
vim.opt.relativenumber = true -- show relative numbers
vim.opt.showmatch = true -- show matching bracket (briefly jump)
vim.opt.showcmd = true -- show typed command in status bar
vim.opt.title = true -- show file in titlebar
vim.opt.laststatus = 2 -- use 2 lines for the status bar
vim.opt.matchtime = 2 -- show matching bracket for 0.2 seconds
vim.opt.matchpairs = vim.opt.matchpairs + "<:>" -- specially for html
vim.opt.wildignore = "*.o,*.class,*.so*,*.swp,*.pyc,*.pyo,core"
vim.opt.hlsearch = true -- highlight search matches
vim.opt.incsearch = true -- show search matches as you type
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- ignore case if search pattern is all lowercase, case-sensitive otherwise
vim.opt.splitright = true -- open file in right split
vim.opt.splitbelow = true -- set the preview window in the bottom
vim.opt.showmode = false -- disable show mode in status line
vim.opt.laststatus = 2 -- show filename at bottom of buffer

-- Folding settings
vim.opt.foldmethod = "indent" -- fold based on indent
vim.opt.foldnestmax = 10 -- deepest fold is 10 levels
vim.opt.foldenable = false -- dont fold by default
vim.opt.foldlevel = 1 -- this is just what i use

-- Real programmers don't use TABs but spaces
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true

-- No backup files
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Set updatetime
vim.opt.ttimeoutlen = 0

-- I'm sorry, but I'm a spaces type of person!
vim.opt.list = true
vim.opt.listchars= "tab:T>"

-- ColorScheme
vim.opt.termguicolors = false
vim.opt.background = "dark"
vim.opt.cursorline = true
vim.g.material_style = "deep ocean" -- available 'palenight', 'darker', 'oceanic'
vim.cmd [[colorscheme material]]

-- ColorColumn
vim.api.nvim_command("highlight ColorColumn ctermbg=magenta ctermfg=white guibg=magenta guifg=white")
vim.api.nvim_command("call matchadd('ColorColumn', '\\%89v', 100)")

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})
