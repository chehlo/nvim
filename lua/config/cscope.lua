require("cscope_maps").setup({
  disable_maps = false, -- Enable default keymaps
  cscope = {
    db_file = "./cscope.out",
    exec = "cscope",
    picker = "telescope", -- Use telescope for results
    use_telescope = true,
  }
})

local map = vim.keymap.set

map("n", "<leader>cs", ":Cs find s <C-R>=expand('<cword>')<CR><CR>", { desc = "Find symbol" })
map("n", "<leader>cg", ":Cs find g <C-R>=expand('<cword>')<CR><CR>", { desc = "Find definition" })
map("n", "<leader>cc", ":Cs find c <C-R>=expand('<cword>')<CR><CR>", { desc = "Find functions calling" })
map("n", "<leader>ct", ":Cs find t <C-R>=expand('<cword>')<CR><CR>", { desc = "Find text" })
map("n", "<leader>ce", ":Cs find e <C-R>=expand('<cword>')<CR><CR>", { desc = "Find egrep pattern" })
map("n", "<leader>cf", ":Cs find f <C-R>=expand('<cfile>')<CR><CR>", { desc = "Find file" })
map("n", "<leader>ci", ":Cs find i <C-R>=expand('<cfile>')<CR><CR>", { desc = "Find files #including" })
map("n", "<leader>cd", ":Cs find d <C-R>=expand('<cword>')<CR><CR>", { desc = "Find functions called by" })
