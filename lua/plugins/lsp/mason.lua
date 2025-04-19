return {
  {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed   = "✓",
            package_pending     = "➜",
            package_uninstalled = "✗",
          },
        },
      })
      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd",        -- C/C++
          "bashls",        -- Shell
          "html",          -- HTML
          "cssls",         -- CSS
          "pyright",       -- Python
          "ts_ls",         -- TypeScript/JavaScript
          "lua_ls",        -- Lua
          "rust_analyzer", -- Rust
        },
      })
    end,
  },
}
