require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "javascript", "typescript", "tsx", "json", "html", "css", "sql",
    "lua", "vim", "vimdoc", "markdown", "yaml", "dockerfile", "bash", "c", "cpp"
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
  indent = { enable = true },
})
