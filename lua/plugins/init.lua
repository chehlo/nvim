return {
  { "nvim-lua/plenary.nvim", lazy = true },

  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = function() require("config.copilot") end,
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function() require("config.lsp") end,
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
    },
    config = function() require("config.cmp") end,
  },

  {
    "dhananjaylatkar/cscope_maps.nvim",
    lazy = false,
    config = function() require("config.cscope") end,
  },

  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function() require("config.telescope") end,
  },
  require("plugins.web-dev"),
  require("plugins.git"),
}
