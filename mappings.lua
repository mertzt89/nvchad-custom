---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

M.telescope = {
  n = {
    ["gs"] = {
      function()
        vim.go.operatorfunc = "v:lua.telescope_grep_op"
        vim.api.nvim_feedkeys("g@", "n", false)
      end,
      "Grep Operator",
    },
    ["gS"] = {
      function()
        vim.go.operatorfunc = "v:lua.telescope_grep_all_op"
        vim.api.nvim_feedkeys("g@", "n", false)
      end,
      "Grep Operator (incl. ignored)",
    },
  },

  x = {
    ["gs"] = {
      ":<c-u>call v:lua.telescope_grep_op(visualmode())<CR>",
      "Grep Operator",
    },
    ["gS"] = {
      ":<c-u>call v:lua.telescope_grep_all_op(visualmode())<CR>",
      "Grep Operator (incl. ignored)",
    },
  },
}

return M
