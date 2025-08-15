-- Set XDG directories explicitly (in case env vars aren't loaded)
if os.getenv("XDG_DATA_HOME") then
  vim.fn.stdpath = function(what)
    if what == "data" then
      return os.getenv("XDG_DATA_HOME") .. "/nvim"
    elseif what == "cache" then
      return os.getenv("XDG_CACHE_HOME") .. "/nvim"
    elseif what == "state" then
      return os.getenv("XDG_STATE_HOME") .. "/nvim"
    end
    return vim.fn.stdpath(what)
  end
end

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- core settings
require("core")

-- plugins
require("lazy").setup("plugins", {
  defaults = { lazy = true },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})
