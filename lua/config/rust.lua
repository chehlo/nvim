vim.g.rustaceanvim = {
  server = {
    on_attach = function(client, bufnr)
      local bufopts = { noremap = true, silent = true, buffer = bufnr }

      -- Standard LSP keymaps (same as config/lsp.lua)
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)

      -- Rust-specific keymaps (rustaceanvim commands)
      vim.keymap.set("n", "<leader>rr", function() vim.cmd.RustLsp("runnables") end,
        { buffer = bufnr, desc = "Rust runnables" })
      vim.keymap.set("n", "<leader>rd", function() vim.cmd.RustLsp("debuggables") end,
        { buffer = bufnr, desc = "Rust debuggables" })
      vim.keymap.set("n", "<leader>re", function() vim.cmd.RustLsp("expandMacro") end,
        { buffer = bufnr, desc = "Expand macro" })
      vim.keymap.set("n", "<leader>rc", function() vim.cmd.RustLsp("openCargo") end,
        { buffer = bufnr, desc = "Open Cargo.toml" })
      vim.keymap.set("n", "<leader>rp", function() vim.cmd.RustLsp("parentModule") end,
        { buffer = bufnr, desc = "Parent module" })
      vim.keymap.set("n", "<leader>rj", function() vim.cmd.RustLsp("joinLines") end,
        { buffer = bufnr, desc = "Join lines" })
      vim.keymap.set("n", "<leader>ra", function() vim.cmd.RustLsp("codeAction") end,
        { buffer = bufnr, desc = "Rust code actions" })
    end,
    default_settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
        },
        checkOnSave = true,
        check = {
          command = "clippy",
        },
        inlayHints = {
          parameterHints = { enable = true },
          typeHints = { enable = true },
          chainingHints = { enable = true },
        },
      },
    },
  },
}
