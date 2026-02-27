require("crates").setup({
  completion = {
    cmp = {
      enabled = true,
    },
  },
})

-- Keymaps for Cargo.toml files
vim.api.nvim_create_autocmd("BufRead", {
  group = vim.api.nvim_create_augroup("CratesKeymaps", { clear = true }),
  pattern = "Cargo.toml",
  callback = function(ev)
    local opts = { silent = true, buffer = ev.buf }
    local crates = require("crates")
    vim.keymap.set("n", "<leader>Ct", crates.toggle, vim.tbl_extend("force", opts, { desc = "Toggle crates info" }))
    vim.keymap.set("n", "<leader>Cu", crates.update_crate, vim.tbl_extend("force", opts, { desc = "Update crate" }))
    vim.keymap.set("n", "<leader>Ca", crates.update_all_crates, vim.tbl_extend("force", opts, { desc = "Update all crates" }))
    vim.keymap.set("n", "<leader>Cf", crates.show_features_popup, vim.tbl_extend("force", opts, { desc = "Show features" }))
    vim.keymap.set("n", "<leader>Cv", crates.show_versions_popup, vim.tbl_extend("force", opts, { desc = "Show versions" }))
    vim.keymap.set("n", "<leader>Cd", crates.open_documentation, vim.tbl_extend("force", opts, { desc = "Open docs" }))
  end,
})
