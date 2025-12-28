return {
  "akinsho/toggleterm.nvim",
  -- event = "VeryLazy",
  -- cmd = "ToggleTerm",
  keys = {
    
    { "<C-\\>", "<cmd>:1ToggleTerm direction=float<CR>", mode = { "n", "i", "t" } },
    { "<M-F1>", "<cmd>:2ToggleTerm direction=horizontal size=20<CR>", mode = { "n", "t" } },
    { "<M-F2>", "<cmd>:3ToggleTerm direction=vertical size=100<CR>", mode = { "n", "t" } },
    { "<M-F3>", "<cmd>:4ToggleTerm direction=float<CR>", mode = { "n", "t" } },
    { "<leader>gl", function() end, mode = { "n", "t" } },
    { "<leader>fr", function() end, mode = { "n", "t" } },
  },
  version = "*",
  config = function()
    -- Pick a sensible shell per-OS. On Linux, default to your current shell (usually bash)
    local function pick_shell()
      if vim.fn.has("win32") == 1 then
        return "pwsh.exe -NoLogo -NoProfile"
      elseif vim.fn.executable("pwsh") == 1 then
        -- Use PowerShell Core on non-Windows if available
        return "pwsh -NoLogo"
      else
        return vim.o.shell -- use current shell (bash/zsh/fish)
      end
    end
    
    require("toggleterm").setup({
      start_in_insert = true,
      terminal_mappings = true,
      -- direction = 'float',
      shell = pick_shell(),
      auto_scroll = true,
      -- persist_mode = true,
      persist_size = true,
      close_on_exit = true,
    })
    -- function _lazygit_toggle()
    -- local Terminal = require('toggleterm.terminal').Terminal
    -- local lazygit = Terminal:new({ cmd = 'lazygit', hidden = true, direction = 'float' })
    -- lazygit:toggle()
    -- end
    
    -- vim.keymap.set({ 'n', 't' }, '<leader>gl', function() _lazygit_toggle() end)
    vim.keymap.set({ "n", "t" }, "<leader>gl", function()
      if vim.fn.executable("lazygit") == 0 then
        vim.notify("lazygit not found in PATH", vim.log.levels.WARN)
        return
      end
      local terminal = require("toggleterm.terminal").Terminal
      local lazygit = terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
      lazygit:toggle()
    end, { desc = "LazyGit" })
    
    vim.keymap.set({ "n", "t" }, "<leader>fr", function()
      if vim.fn.executable("scooter") == 0 then
        vim.notify("scooter not found in PATH", vim.log.levels.WARN)
        return
      end
      local terminal = require("toggleterm.terminal").Terminal
      local scooter = terminal:new({ cmd = "scooter", hidden = true, direction = "float" })
      scooter:toggle()
    end, { desc = "Find and Replace" })
  end,
}
