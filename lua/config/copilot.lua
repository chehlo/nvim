require("copilot").setup({
  suggestion = {
    enabled = true,
    auto_trigger = true,
    keymap = {
      accept = "<C-y>", -- Changed from <C-l> to avoid conflict
      next = "<C-]>",
      prev = "<C-[>",
      dismiss = "<C-e>",
    },
  },
  panel = { enabled = true },
})
