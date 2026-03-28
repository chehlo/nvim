local parsers = {
  "javascript", "typescript", "tsx", "json", "html", "css", "sql",
  "lua", "vim", "vimdoc", "markdown", "yaml", "dockerfile", "bash", "c", "cpp",
  "rust", "toml"
}

local ok, configs = pcall(require, "nvim-treesitter.configs")
if ok then
  -- Legacy nvim-treesitter (< 1.0) with configs module
  configs.setup({
    ensure_installed = parsers,
    sync_install = false,
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  })
else
  -- New nvim-treesitter (>= 1.0): highlight/indent are built into Neovim
  vim.treesitter.start()
  vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

  -- Auto-install missing parsers
  local installed = require("nvim-treesitter.parsers").installed()
  local missing = vim.tbl_filter(function(p) return not vim.tbl_contains(installed, p) end, parsers)
  if #missing > 0 then
    vim.cmd("TSInstall " .. table.concat(missing, " "))
  end
end
