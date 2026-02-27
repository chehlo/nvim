require("telescope").setup({
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "truncate" },
    file_ignore_patterns = { ".git/", "node_modules/", "target/" },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      previewer = false,
    },
    buffers = {
      theme = "dropdown",
      previewer = false,
    },
  },
})

-- LSP code browsing via Telescope (works for all languages with LSP)
local map = vim.keymap.set
map("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Document symbols" })
map("n", "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", { desc = "Workspace symbols" })
map("n", "<leader>lr", "<cmd>Telescope lsp_references<cr>", { desc = "References" })
map("n", "<leader>li", "<cmd>Telescope lsp_implementations<cr>", { desc = "Implementations" })
map("n", "<leader>ld", "<cmd>Telescope diagnostics<cr>", { desc = "Diagnostics" })
