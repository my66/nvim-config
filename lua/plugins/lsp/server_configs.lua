local servers = {
  clangd = {},
  bashls = {},
  html = {},
  cssls = {},
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
  ts_ls = {},
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = "Replace",
        },
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          checkThirdParty = false,
        },
      },
    },
  },
  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
        },
        check = {
          command = "clippy",
        },
      },
    },
  },
  gopls = {
    settings = {
      gopls = {
        gofumpt = true,
        usePlaceholders = true,
      },
    },
  },
}

return servers
