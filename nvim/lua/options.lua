-- Aliases
local opt = vim.opt -- global

-- General
opt.confirm = true -- prompt when existing from an unsaved file
opt.hidden = true -- allow hiding buffers instead of closing them
opt.wildmenu = true -- better command-line completion
opt.autoread = true -- automatically read a file that has changed on disk
opt.history = 1000
opt.undolevels = 1000
opt.backspace = "indent,eol,start" -- more powerful backspacing
opt.encoding = "utf-8" -- set the default file encoding to UTF-8:
opt.pastetoggle = "<F2>"
opt.clipboard = "unnamed"

-- Mouse
opt.mouse = "a" -- on OSX press ALT and click

-- Display settings
opt.textwidth = 0 -- text width
opt.report = 0 -- always report number of lines changed
opt.wrap = true -- wrap lines
opt.linebreak = true -- don't break words
opt.list = false -- list disables linebreak
opt.scrolloff = 2 -- 2 lines above/below cursor when scrolling
opt.number = true -- show line number
opt.relativenumber = true -- show relative numbers
opt.showmatch = true -- show matching bracket (briefly jump)
opt.showcmd = true -- show typed command in status bar
opt.title = true -- show file in titlebar
opt.laststatus = 2 -- use 2 lines for the status bar
opt.matchtime = 2 -- show matching bracket for 0.2 seconds
opt.matchpairs = opt.matchpairs + "<:>" -- specially for html
opt.wildignore = "*.o,*.class,*.so*,*.swp,*.pyc,*.pyo,core"
opt.hlsearch = true -- highlight search matches
opt.incsearch = true -- show search matches as you type
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- ignore case if search pattern is all lowercase, case-sensitive otherwise
opt.splitright = true -- open file in right split
opt.splitbelow = true -- set the preview window in the bottom
opt.showmode = false -- disable show mode in status line
opt.laststatus = 2 -- show filename at bottom of buffer

-- Folding settings
opt.foldmethod = "indent" -- fold based on indent
opt.foldnestmax = 10 -- deepest fold is 10 levels
opt.foldenable = false -- dont fold by default
opt.foldlevel = 1 -- this is just what i use

-- Real programmers don't use TABs but spaces
opt.autoindent = true
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.shiftround = true
opt.expandtab = true

-- No backup files
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- Set updatetime
opt.ttimeoutlen = 0

-- I'm sorry, but I'm a spaces type of person!
opt.list = true
opt.listchars= "tab:T>"

-- ColorScheme
opt.termguicolors = false
opt.background = "dark"
opt.cursorline = true
vim.g.material_style = "deep ocean" -- available 'palenight', 'darker', 'oceanic'
vim.cmd [[colorscheme material]]

-- ColorColumn
vim.api.nvim_command("highlight ColorColumn ctermbg=magenta ctermfg=white guibg=magenta guifg=white")
vim.api.nvim_command("call matchadd('ColorColumn', '\\%80v', 100)")
