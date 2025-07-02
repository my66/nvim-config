-- 添加你的插件在这里
return {
  -- UI 相关插件
  { import = "plugins.ui" },

  { import = "plugins.nvim-tree" },

  -- LSP 相关插件
  { import = "plugins.lsp.mason" },
  { import = "plugins.lsp.lspconfig" },
  { import = "plugins.completion" },
  { import = "plugins.telescope" },
  { import = "plugins.which-key" },
  { import = "plugins.treesitter" },
  { import = "plugins.commentary" },
  { import = "plugins.toggleterm" },
  { import = "plugins.ui_enhancements" },
  { import = "plugins.autotag" },
  { import = "plugins.markdown-preview" },


}
