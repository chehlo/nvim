local map = vim.keymap.set
vim.g.mapleader = "\\"

-- Basic keymaps
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Better indenting
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Cscope keymaps
map("n", "<leader>cs", ":cs find s <C-R>=expand('<cword>')<CR><CR>", { desc = "Find symbol" })
map("n", "<leader>cg", ":cs find g <C-R>=expand('<cword>')<CR><CR>", { desc = "Find definition" })
map("n", "<leader>cc", ":cs find c <C-R>=expand('<cword>')<CR><CR>", { desc = "Find functions calling" })
map("n", "<leader>ct", ":cs find t <C-R>=expand('<cword>')<CR><CR>", { desc = "Find text" })
map("n", "<leader>ce", ":cs find e <C-R>=expand('<cword>')<CR><CR>", { desc = "Find egrep pattern" })
map("n", "<leader>cf", ":cs find f <C-R>=expand('<cfile>')<CR><CR>", { desc = "Find file" })
map("n", "<leader>ci", ":cs find i <C-R>=expand('<cfile>')<CR><CR>", { desc = "Find files #including" })
map("n", "<leader>cd", ":cs find d <C-R>=expand('<cword>')<CR><CR>", { desc = "Find functions called by" })

-- Web development keymaps
map("n", "<leader>mp", ":Prettier<CR>", { desc = "Format with Prettier" })
map("n", "<leader>el", ":EslintFixAll<CR>", { desc = "ESLint fix all" })
map("n", "<leader>nt", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
map("n", "<leader>nf", ":NvimTreeFocus<CR>", { desc = "Focus NvimTree" })
map("n", "<leader>dt", ":DBUIToggle<CR>", { desc = "Toggle Database UI" })
map("n", "<leader>dd", ":DBUIFindBuffer<CR>", { desc = "Find DB buffer" })
