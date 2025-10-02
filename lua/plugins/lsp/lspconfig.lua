return {
  {
    "neovim/nvim-lspconfig",
    -- 在读取缓冲区或新建文件时启动
    event        = { "BufReadPre", "BufNewFile" },
    dependencies = { "folke/neodev.nvim" },
    config = function()
      local servers = require("plugins.lsp.servers")

      if not vim.lsp or not vim.lsp.config then
        vim.notify("当前 Neovim 不支持 vim.lsp.config 接口", vim.log.levels.ERROR)
        return
      end

      require("neodev").setup()

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
        local base = vim.lsp.config[name]
        if not base then
          vim.notify(string.format("未找到 %s 的默认 LSP 配置", name), vim.log.levels.WARN)
        end

        local overrides = servers.server_settings[name] or {}
        local merged = vim.tbl_deep_extend("force", {}, base or {}, { capabilities = capabilities }, overrides)
        merged.autostart = merged.autostart ~= false
        vim.lsp.config[name] = merged
      end
    end,
  },
}
