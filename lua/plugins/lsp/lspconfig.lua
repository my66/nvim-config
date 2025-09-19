return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "folke/neodev.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("neodev").setup({})

      local lspconfig = require("lspconfig")
      local server_configs = require("plugins.lsp.server_configs")

      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        require("cmp_nvim_lsp").default_capabilities()
      )

      local on_attach = function(_, bufnr)
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
        end

        map("n", "gd", vim.lsp.buf.definition, "跳转到定义")
        map("n", "gD", vim.lsp.buf.declaration, "跳转到声明")
        map("n", "gi", vim.lsp.buf.implementation, "跳转到实现")
        map("n", "gr", vim.lsp.buf.references, "查看引用")
        map("n", "K", vim.lsp.buf.hover, "悬浮文档")
        map("n", "<leader>rn", vim.lsp.buf.rename, "重命名")
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "代码操作")
      end

      for server, config in pairs(server_configs) do
        local opts = vim.tbl_deep_extend("force", {
          on_attach = on_attach,
          capabilities = capabilities,
        }, config or {})

        lspconfig[server].setup(opts)
      end
    end,
  },
}
