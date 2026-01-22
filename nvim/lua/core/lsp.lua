-- :h lsp-config

local kind_icons = {
  Text = "",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰜢",
  Variable = "󰀫",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "󰑭",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "",
  File = "󰈙",
  Reference = "󰌹",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "󰙅",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "",
  Unknown = "?",
}




local function is_whitespace()
  local col = vim.fn.col('.') - 1
  local line = vim.fn.getline('.')
  local char_under_cursor = string.sub(line, col, col)
  ret_val = false
  if col == 0 or string.match(char_under_cursor, '%s') then
    ret_val = true
  end
  return ret_val
end


-- enable lsp completion
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    -- manual trigger
    vim.keymap.set("i", "<C-n>", function()
      vim.lsp.completion.get()
    end)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not client then
      return
    end
    if client:supports_method("textDocument/completion") then
      vim.api.nvim_create_autocmd({ 'TextChangedI' }, {
        buffer = ev.buf,
        callback = function()
          if not is_whitespace() then
            vim.lsp.completion.get()
          end
        end
      })

      ----------------------------------
      --   -- Hover documentation
      -- if client:supports_method("textDocument/hover") or client:supports_method("textDocument/signatureHelp") then
      --   vim.keymap.set("n", "K", function()
      --     vim.lsp.buf.hover({
      --       silent = true,
      --       border = "single",
      --       max_width = math.floor(vim.o.columns / 2),
      --     })
      --   end, { buffer = ev.buf, noremap = true, desc = "LSP: Show Documentation" })
      -- end
      ----------------------------------
      vim.lsp.completion.enable(true, client.id, ev.buf, {
        autotrigger = true,
        convert = function(item)
          local kind = vim.lsp.protocol.CompletionItemKind[item.kind] or 'Unknown'
          local kind_icon = string.format('%s %s', kind_icons[kind], kind)
          return {
            abbr = item.label:gsub('%b()', ''),
            kind = kind_icon,
            menu = item.detail or '',
            icase = 1,
            dup = 0,
            empty = 0,
            kind_hlgroup = "BlinkCmpKind" .. (vim.lsp.protocol.CompletionItemKind[item.kind] or "")
          }
        end,
      })
      ---------------------------------
    end
  end,
})



-- enable configured language servers
-- you can find server configurations from lsp/*.lua files
vim.lsp.enable('lua_ls')
vim.lsp.enable('pyright')

vim.diagnostic.config({
  virtual_text = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN] = "WarningMsg",
    },
  },
})

