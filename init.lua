vim.o.virtualedit = "all"
vim.o.wrap = false

-- Custom grep operator
local function grep_operator(t, searh_all, ...)
  local regsave = vim.fn.getreg "@"
  local selsave = vim.o.selection
  local selvalid = true

  vim.o.selection = "inclusive"

  if t == "v" or t == "V" then
    vim.api.nvim_command 'silent execute "normal! gvy"'
  elseif t == "line" then
    vim.api.nvim_command "silent execute \"normal! '[V']y\""
  elseif t == "char" then
    vim.api.nvim_command 'silent execute "normal! `[v`]y"'
  else
    require("lib.log").error "Unsupported selection mode!"
    selvalid = false
  end

  vim.o.selection = selsave
  if selvalid then
    local query = vim.fn.getreg "@"
    local opts = { search = query }
    if searh_all == true then
      opts = { search = query, additional_args = { "--no-ignore-vcs", "--hidden" } }
    end
    require("telescope.builtin").grep_string(opts)
  end

  vim.fn.setreg("@", regsave)
end

_G.telescope_grep_op = function(t, ...)
  grep_operator(t, false, ...)
end
_G.telescope_grep_all_op = function(t, ...)
  grep_operator(t, true, ...)
end
