require("copilot").setup({
  suggestion = {
    enabled = true,
    auto_trigger = false, -- Disable auto-trigger
    keymap = {
      accept = "<C-y>",
      accept_word = "<C-w>",
      accept_line = "<C-l>",
      next = "<C-]>",
      prev = "<C-[>",
      dismiss = "<C-e>",
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

-- Custom keymaps for manual Copilot control
vim.keymap.set('i', '<F2>', trigger_copilot, { desc = "Trigger Copilot suggestion" })
vim.keymap.set('n', '<F2>', trigger_copilot, { desc = "Trigger Copilot suggestion" })
vim.keymap.set('n', '<leader>cpp', ':Copilot panel<CR>', { desc = "Open Copilot panel" })
vim.keymap.set('n', '<leader>cpe', ':Copilot enable<CR>', { desc = "Enable Copilot" })
vim.keymap.set('n', '<leader>cpd', ':Copilot disable<CR>', { desc = "Disable Copilot" })
vim.keymap.set('n', '<leader>cps', ':Copilot status<CR>', { desc = "Copilot status" })
