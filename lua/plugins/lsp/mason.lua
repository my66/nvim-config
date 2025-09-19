return {
  {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      local server_configs = require("plugins.lsp.server_configs")
      local ensure_installed = vim.tbl_keys(server_configs)
      table.sort(ensure_installed)

      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      require("mason-lspconfig").setup({
        ensure_installed = ensure_installed,
      })
    end,
  },
}
