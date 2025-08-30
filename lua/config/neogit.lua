require("neogit").setup({
  disable_hint = false,
  disable_context_highlighting = false,
  disable_signs = false,
  graph_style = "unicode",
  integrations = {
    telescope = true,
    diffview = true,
  },
})

-- Open Neogit
vim.keymap.set("n", "<leader>gs", ":Neogit<CR>", { desc = "Open Neogit" })
