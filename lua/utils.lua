-- Utility functions can be added here as needed
local M = {}

-- Function to build cscope database
M.build_cscope = function()
  vim.cmd("!find . -name '*.c' -o -name '*.cpp' -o -name '*.h' -o -name '*.hpp' > cscope.files")
  vim.cmd("!cscope -b -i cscope.files")
  print("Cscope database built successfully!")
end

-- Add a command to rebuild cscope
vim.api.nvim_create_user_command("CscopeBuild", M.build_cscope, {})

return M
