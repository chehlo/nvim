-- Database UI configuration
vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_winwidth = 30
vim.g.db_ui_show_database_icon = 1

-- Key mappings for database work
vim.keymap.set("n", "<leader>db", ":DBUI<CR>", { desc = "Open Database UI" })
