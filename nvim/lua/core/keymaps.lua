local keymap = vim.keymap
local opts = { noremap = true, silent = true }


-- Cycle to the next buffer
keymap.set("n", "<Tab>", ":bnext<CR>", opts, { desc = "Next buffer" })

-- Cycle to the previous buffer
keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts, { desc = "Previous buffer" })

-- Resize window height
keymap.set("n", "<C-Up>", ":resize +5<CR>", opts, { desc = "Increase window height" })
keymap.set("n", "<C-Down>", ":resize -5<CR>", opts, { desc = "Decrease window height" })

-- Resize window width
keymap.set("n", "<C-Right>", ":vertical resize +5<CR>", opts, { desc = "Increase window width" })
keymap.set("n", "<C-Left>", ":vertical resize -5<CR>", opts, { desc = "Decrease window width" })

keymap.set("n", "<S-Left>", "<C-w>h", { desc = "Move focus to the left window" })
keymap.set("n", "<S-Right>", "<C-w>l", { desc = "Move focus to the right window" })
keymap.set("n", "<S-Down>", "<C-w>j", { desc = "Move focus to the lower window" })
keymap.set("n", "<S-Up>", "<C-w>k", { desc = "Move focus to the upper window" })

-- Close current buffer with Ctrl+w
keymap.set("n", "<C-w>", ":bd<CR>", { noremap = true, silent = true })

-- Disable C-z suspend
keymap.set({ "n", "v", "o" }, "<C-z>", "<Nop>", { noremap = true, silent = true })

-- better up/down
keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- better indenting
keymap.set("v", "<", "<gv", { noremap = true })
keymap.set("v", ">", ">gv", { noremap = true })

-- save file
keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- search keys
keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true })
keymap.set("n", "n", "'Nn'[v:searchforward]", { expr = true })
keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true })
keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true })
keymap.set("n", "N", "'nN'[v:searchforward]", { expr = true })
keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true })

keymap.set("n", "<leader>ft", vim.lsp.buf.format, { desc = "Format with LSP" })

-- Move lines up/down
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
