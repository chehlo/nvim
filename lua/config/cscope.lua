require("cscope_maps").setup({
  disable_maps = false, -- Enable default keymaps
  cscope = {
    db_file = "./cscope.out",
    exec = "cscope",
    picker = "telescope", -- Use telescope for results
    use_telescope = true,
  }
})
