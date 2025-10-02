local ensure_installed = {
  "clangd",        -- C/C++
  "bashls",        -- Shell
  "html",          -- HTML
  "cssls",         -- CSS
  "pyright",       -- Python
  "ts_ls",         -- TypeScript/JavaScript
  "lua_ls",        -- Lua
  "rust_analyzer", -- Rust
  "gopls",         -- Go
}

local server_settings = {
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  },
  pyright = {
    settings = {
      python = {
        analysis = {
          reportOptionalMemberAccess = "none",
          reportOptionalSubscript = "none",
        },
      },
    },
  },
}

return {
  ensure_installed = ensure_installed,
  server_settings = server_settings,
}
