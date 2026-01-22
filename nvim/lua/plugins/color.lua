-- vim.pack.add { 'https://github.com/Mofiqul/vscode.nvim' }
-- local c = require('vscode.colors').get_colors()
-- require("vscode").setup({
--   transparent = true,
--   italic_comments = true,
--   terminal_colors = true,
--   color_overrides = {
--     vscBack = '#141415',
--     vscPopupBack = "#141415",
--     vscDarkYellow = "#d9c76a"
--   },
--   group_overrides = {
--     PmenuKind           = { fg = c.vscOrange, bg = 'NONE' },
--     PmenuKindSel        = { fg = c.vscOrange, bg = c.vscPopupHighlightBlue },
--     PmenuMatch          = { fg = c.vscMediumBlue, bg = 'NONE', bold = true },
--     NeoTreeIndentMarker = { fg = '#f5b062', bg = 'NONE' },
--     NeoTreeTabActive    = { fg = '#0f0f0f', bg = c.vscBlue },
--     -- CursorLine              = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
--
--
--   }
-- })

vim.pack.add { "https://github.com/scottmckendry/cyberdream.nvim" }
require("cyberdream").setup({
    transparent = true,
    saturation = 0.63,
    extensions = {
        rainbow_delimiters = true,
        indentblankline = true,
    }
})
vim.cmd.colorscheme('cyberdream')

-- vim.cmd.colorscheme('vscode')


