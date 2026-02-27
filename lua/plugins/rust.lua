return {
  -- Rust enhanced LSP experience (manages rust-analyzer automatically)
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false, -- plugin handles its own lazy loading
    config = function() require("config.rust") end,
  },

  -- Cargo.toml dependency management
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function() require("config.crates") end,
  },
}
