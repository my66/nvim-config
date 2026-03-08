return {
  {
    "neovim/nvim-lspconfig",
    -- 在读取缓冲区或新建文件时启动
    event        = { "BufReadPre", "BufNewFile" },
    dependencies = { "folke/lazydev.nvim" },
    config = function()
      local servers = require("plugins.lsp.servers")
      local lspconfig = require("lspconfig")

      require("lazydev").setup()

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP 基础按键绑定",
        callback = function(event)
          local function map(lhs, rhs, desc)
            local opts = { buffer = event.buf, silent = true }
            if desc then
              opts.desc = desc
            end
            vim.keymap.set("n", lhs, rhs, opts)
          end

          map("gd", vim.lsp.buf.definition, "跳转到定义")
          map("gi", vim.lsp.buf.implementation, "跳转到实现")
          map("K", vim.lsp.buf.hover, "显示悬停文档")
          map("<leader>rn", vim.lsp.buf.rename, "重命名符号")
        end,
      })

      for _, name in ipairs(servers.ensure_installed) do
        local overrides = servers.server_settings[name] or {}
        local merged = vim.tbl_deep_extend("force", {}, { capabilities = capabilities }, overrides)
        merged.autostart = merged.autostart ~= false

        if vim.lsp and vim.lsp.config and vim.lsp.enable then
          vim.lsp.config(name, merged)
          vim.lsp.enable(name)
        elseif lspconfig[name] then
          lspconfig[name].setup(merged)
        else
          vim.notify(string.format("未找到 %s 的 LSP 配置", name), vim.log.levels.WARN)
        end
      end
    end,
  },
}
