vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
  end,
})

-- Auto-connect to cscope database if it exists
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if vim.fn.filereadable("cscope.out") == 1 then
      vim.cmd("silent! cs add cscope.out")
    end
  end,
})
