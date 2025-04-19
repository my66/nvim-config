return {
  {
    "neovim/nvim-lspconfig",
    -- 在读取缓冲区或新建文件时启动
    event        = { "BufReadPre", "BufNewFile" },
    dependencies = { "folke/neodev.nvim" },
    config = function()
      local lspconfig   = require("lspconfig")
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      -- 如果你用 nvim-cmp，可取消注释下面一行来增强 capabilities：
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      -- 0.11+ 原生补全自动触发
      --vim.api.nvim_create_autocmd("LspAttach", {
      --  callback = function(ev)
      --    local client = vim.lsp.get_client_by_id(ev.data.client_id)
      --    if client and client.supports_method("textDocument/completion") then
      --      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      --    end
      --  end,
      --})

      -- 通用 on_attach：绑定快捷键
      local on_attach = function(_, bufnr)
        local km   = vim.keymap.set
        local opts = { buffer = bufnr, silent = true }
        km("n", "gd", vim.lsp.buf.definition,      opts)
        km("n", "K",  vim.lsp.buf.hover,           opts)
        km("n", "gi", vim.lsp.buf.implementation,  opts)
        km("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "重命名" })
      end

      -- 要启用的服务器列表
      local servers = {
        "clangd",        -- C/C++
        "bashls",        -- Shell
        "html",          -- HTML
        "cssls",         -- CSS
        "pyright",       -- Python
        "ts_ls",         -- TypeScript/JavaScript
        "lua_ls",        -- Lua
        "rust_analyzer", -- Rust
      }
      -- 循环设置以上所有服务器
      for _, name in ipairs(servers) do
        lspconfig[name].setup({ on_attach = on_attach, capabilities = capabilities })
      end

      -- 针对 lua_ls 的特殊配置（全局 vim 识别）
      lspconfig.lua_ls.setup({
        on_attach    = on_attach,
        capabilities = capabilities,
        settings     = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      })

      -- 针对 pyright 的特殊配置：关闭可选成员访问和可选下标访问警告
      lspconfig.pyright.setup({
        on_attach    = on_attach,
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              reportOptionalMemberAccess = "none",
              reportOptionalSubscript    = "none",
            },
          },
        },
      })
    end,
  },
}
