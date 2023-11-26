require("neotest").setup({
  adapters = {
    require('neotest-jest')({
      jestCommand = "yarn test --",
      jestConfigFile = "custom.jest.config.ts",
      env = { CI = true },
      cwd = function(path)
        return vim.fn.getcwd()
      end,
    }),
  },
  -- output_panel = {
  --   enabled = true,
  --   open = "botright split | resize 145"
  -- },
})

-- Toggle Output Panel
vim.api.nvim_set_keymap("n", "<leader>ntp", ":lua require('neotest').output_panel.toggle()<cr>",
  { noremap = true, silent = true })

-- Toggle Summary
vim.api.nvim_set_keymap("n", "<leader>nts", ":lua require('neotest').summary.toggle()<cr>",
  { noremap = true, silent = true })

-- Run nearest test file
vim.api.nvim_set_keymap("n", "<leader>ntt", ":lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>",
  { noremap = true, silent = true })

-- Run nearest test file
vim.api.nvim_set_keymap("n", "<leader>nta", ":lua require('neotest').run.run(vim.fn.expand('%'))<cr>",
  { noremap = true, silent = true })

-- { "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File" },
-- { "<leader>tT", function() require("neotest").run.run(vim.loop.cwd()) end, desc = "Run All Test Files" },
-- { "<leader>tr", function() require("neotest").run.run() end, desc = "Run Nearest" },
-- { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle Summary" },
-- { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output" },
-- { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel" },
-- { "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop" },
