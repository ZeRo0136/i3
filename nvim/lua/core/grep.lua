if (vim.fn.executable("rg") > 0) then
    vim.o.grepprg = "rg --vimgrep --smart-case --hidden --color=always"
    vim.o.grepformat = "%f:%l:%c:%m,%f:%l:%m"
end



-- Custom Grep command with QuickFix window
-- Converts VimScript grep functionality to Lua for Neovim

local M = {}

-- Get grep program and ensure it supports $*
local function get_grep_cmd(pattern)
    local grepprg = vim.o.grepprg
    if not grepprg:match("%$%*") then
        grepprg = grepprg .. " $*"
    end

    -- Escape special characters and substitute $* with the pattern
    local escaped_pattern = pattern:gsub("\\", "\\\\")
    local cmd = grepprg:gsub("%$%*", vim.fn.shellescape(escaped_pattern))

    return cmd
end

-- Setup the :Grep command
function M.setup()
    -- Create the custom :Grep command
    vim.api.nvim_create_user_command(
        "Grep",
        function(opts)
            local pattern = table.concat(opts.fargs, " ")

            if #pattern <= 1 then
                vim.notify("Pattern too short", vim.log.levels.WARN)
                return
            end

            local cmd = get_grep_cmd(pattern)
            local results = vim.fn.systemlist(cmd)

            if #results == 0 then
                vim.notify("No results found", vim.log.levels.WARN)
                return
            end

            -- Populate quickfix list
            vim.fn.setqflist({}, " ", {
                lines = results,
                efm = vim.o.grepformat,
            })

            -- Open quickfix window
            vim.cmd("copen")
        end,
        {
            nargs = "+",
        }
    )
end

-- Initialize on module load
M.setup()

return M
