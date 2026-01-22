-- Command-line completion
vim.opt.wildmenu = true
vim.opt.wildmode = { "noselect:lastused", "full" }
vim.opt.wildoptions = { "pum", "fuzzy" }
vim.api.nvim_create_autocmd("CmdlineChanged", {
  pattern = { ":", "/", "?" },
  callback = function()
    vim.fn.wildtrigger()
  end
})


local filescache = {}
function _G.FindFiles(arg, _)
  if #filescache == 0 then filescache = vim.fn.systemlist("fd --type f --follow --hidden  --exclude .git") end
  return #arg == 0 and filescache or vim.fn.matchfuzzy(filescache, arg)
end

vim.o.findfunc = "v:lua.FindFiles"

vim.api.nvim_create_autocmd({ "CmdlineLeave", "CmdlineLeavePre", "CmdlineChanged" }, {
  pattern = ":",
  callback = function(ev)
    if ev.event == "CmdlineChanged" then
      vim.fn.wildtrigger()
    elseif ev.event == "CmdlineLeavePre" then
      local info = vim.fn.cmdcomplete_info()
      if info.matches and #info.matches > 0 then
        if vim.fn.getcmdline():match("^%s*fin[d]?%s") and info.selected == -1 then
          vim.fn.setcmdline("find " .. info.matches[1])
        end
      end
    elseif ev.event == "CmdlineLeave" then
      filescache = {}
    end
  end,
})
vim.keymap.set('n', '<leader>ff', ':find ', { desc = 'Find files', silent = true })
