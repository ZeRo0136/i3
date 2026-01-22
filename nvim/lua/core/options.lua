-- Basic settings
vim.wo.number = true           -- Line numbers
vim.opt.relativenumber = false -- Relative line numbers
vim.opt.cursorline = true      -- Highlight current line
vim.opt.wrap = false           -- Don't wrap lines
vim.opt.scrolloff = 10         -- Keep 10 lines above/below cursor
vim.opt.sidescrolloff = 8      -- Keep 8 columns left/right of cursor
vim.opt.smoothscroll = true
-- Indentation
vim.opt.tabstop = 4        -- Tab width
vim.opt.shiftwidth = 4     -- Indent width
vim.opt.softtabstop = 4    -- Soft tab stop
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.smartindent = true -- Smart auto-indenting
vim.opt.autoindent = true  -- Copy indent from current line
vim.opt.copyindent = true
-- Search settings
vim.opt.ignorecase = true -- Case insensitive search
vim.opt.smartcase = true  -- Case sensitive if uppercase in search
vim.opt.hlsearch = true   -- Don't highlight search results
vim.opt.incsearch = true  -- Show matches as you type

-- Visual settings
vim.opt.termguicolors = true -- Enable 24-bit colors
vim.opt.signcolumn = "yes"   -- Always show sign column
vim.opt.showmatch = true     -- Highlight matching brackets
vim.opt.matchtime = 2        -- How long to show matching bracket
vim.opt.cmdheight = 1        -- Command line height
vim.opt.showtabline = 1

-- vim.opt.completeopt = "menu,menuone,noinsert,noselect,popup,preview" -- Completion options
-- vim.opt.completeopt = 'menu,noselect,menuone,popup'
vim.opt.completeopt = { "menuone", "noselect", "fuzzy", "nosort" }
vim.opt.complete = { ".", "w", "b", "u", "kspell" }

-- vim.opt.completeitemalign = "abbr,kind"
vim.opt.showmode = false  -- Don't show mode in command line
vim.opt.lazyredraw = true -- Don't redraw during macros

vim.opt.numberwidth = 2
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.opt.background = "dark"
vim.opt.fillchars = { eob = " " }
vim.opt.winborder = "rounded"
vim.opt.pumborder = "rounded"
-- vim.o.winborder='+,-,+,|,+,-,+,|'

-- File handling

vim.opt.undofile = true                           -- Persistent undo
vim.opt.undodir = vim.fn.expand("~/.vim/undodir") -- Undo directory
vim.opt.updatetime = 200                          -- Faster completion
vim.opt.timeoutlen = 500                          -- Key timeout duration
-- vim.opt.ttimeoutlen = 0     -- Key code timeout
-- vim.opt.autoread = true     -- Auto reload files changed outside vim
-- vim.opt.autowrite = false   -- Don't auto save
vim.opt.undolevels = 10000 -- 10x more undo levels

-- Behavior settings

vim.opt.backspace = "indent,eol,start"  -- Better backspace behavior
-- vim.opt.autochdir = false               -- Don't auto change directory
vim.opt.path:append("**")               -- include subdirectories in search
vim.opt.mouse = "a"                     -- Enable mouse support
vim.opt.clipboard:append("unnamedplus") -- Use system clipboard
-- vim.opt.modifiable = true               -- Allow buffer modifications
-- vim.opt.encoding = "UTF-8"              -- Set encoding

-- Cursor settings
vim.opt.guicursor = "n:blinkon200,i-ci-ve:ver25"
-- Folding settings

-- Split behavior
vim.opt.splitbelow = true -- Horizontal splits go below
vim.opt.splitright = true -- Vertical splits go right

-- Key mappings
vim.g.mapleader = " " -- Set leader key to space
-- vim.g.maplocalleader = " " -- Set local leader key (NEW)


vim.opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })
vim.opt.pumheight = 12
vim.opt.pumwidth = 10
vim.opt.winblend = 0
-- vim.opt.pumblend = 3
vim.opt.guifont = "JetBrainsMono Nerd Font 14"
vim.g.icons_enabled = true

vim.o.ruler = false
vim.loader.enable()
vim.opt.title = false
vim.g.url_effect_enabled = true
-- vim.o.list = true
-- vim.opt.listchars = { lead = '.', trail = '.' }
