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

    ["<leader>fs"] = { "<cmd> Telescope lsp_dynamic_workspace_symbols <CR>", "LSP symbols" },
    ["<leader>fd"] = { "<cmd> Telescope lsp_document_symbols <CR>", "LSP document symbols" },
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

M.dap = {
  n = {
    ["<leader><space>b"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "Toggle Breakpoint",
    },
    ["<leader><space>c"] = {
      function()
        require("dap").continue()
      end,
      "Continue",
    },
    ["<leader><space>p"] = {
      function()
        require("dap").pause()
      end,
      "Pause",
    },
    ["<leader><space>C"] = {
      function()
        require("dap").run_to_cursor()
      end,
      "Run to Cursor",
    },
    ["<leader><space>n"] = {
      function()
        require("dap").step_over()
      end,
      "Step Over",
    },
    ["<leader><space>s"] = {
      function()
        require("dap").step_into()
      end,
      "Step Into",
    },
    ["<leader><space>f"] = {
      function()
        require("dap").step_out()
      end,
      "Step Out",
    },
    ["<leader><space>u"] = {
      function()
        require("dap").up()
      end,
      "Frame Up",
    },
    ["<leader><space>d"] = {
      function()
        require("dap").down()
      end,
      "Frame Down",
    },
    ["<leader><space>K"] = {
      function()
        require("dap.ui.widgets").hover()
      end,
      "Hover Info",
    },
    ["<leader><space>R"] = {
      function()
        require("dap").restart()
      end,
      "Restart Session",
    },
    ["<leader><space>q"] = {
      function()
        require("dap").terminate()
      end,
      --require("dapui").close()
      "Terminate Debugging",
    },
  },
}

return M
