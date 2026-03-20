require("copilot").setup({
  suggestion = {
    enabled = true,
    auto_trigger = false, -- Suggestions only on demand (F2)
    keymap = {
      accept = "<C-y>",
      accept_word = "<C-w>",
      accept_line = "<C-l>",
      next = "<C-]>",
      prev = "<C-[>",
      dismiss = "<Esc>",
    },
  },
  panel = {
    enabled = true,
    auto_refresh = false,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<C-CR>", -- Use Ctrl+Enter to open panel
    },
    layout = {
      position = "bottom",
      ratio = 0.4
    },
  },
  filetypes = {
    yaml = false,
    markdown = false,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
  },
})

-- Manual trigger function
local function trigger_copilot()
  require('copilot.suggestion').next()
end

-- Keymaps set after plugin loads (enable/disable/status are in plugin spec keys)
vim.keymap.set('i', '<F2>', trigger_copilot, { desc = "Trigger Copilot suggestion" })
vim.keymap.set('n', '<F2>', trigger_copilot, { desc = "Trigger Copilot suggestion" })
vim.keymap.set('n', '<leader>cpp', ':Copilot panel<CR>', { desc = "Open Copilot panel" })
