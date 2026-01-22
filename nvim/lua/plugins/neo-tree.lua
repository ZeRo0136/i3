vim.pack.add({
  { src = "https://github.com/nvim-neo-tree/neo-tree.nvim", version = "v3.x" },
  "https://github.com/nvim-lua/plenary.nvim",
  'https://github.com/nvim-tree/nvim-web-devicons',
  "https://github.com/MunifTanjim/nui.nvim",
})

-- vim.keymap.set("n", "-", "<cmd>Neotree toggle current reveal<CR>", { desc = "Neotree" })

require("neo-tree").setup({
  event_handlers = {

    {
      event = "file_open_requested",
      handler = function()
        require("neo-tree.command").execute({ action = "close" })
      end,
    },
  },
  sources = { "filesystem" },
  source_selector = {
    content_layout = "center",
    winbar = true,
    sources = {
      { source = "filesystem" },
    },
  },
  name = {
    highlight_opened_files = true,
  },
})
vim.keymap.set("n", "<C-n>", "<cmd>Neotree toggle<CR>", { silent = true })
