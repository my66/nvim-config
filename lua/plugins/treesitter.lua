return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "lua",
          "python",
          "javascript",
          "typescript",
          "html", -- 确保 HTML 解析器被安装
          "css",
          "c",
          "cpp",
          "rust",
          "bash",
          -- 根据你的常用语言添加更多...
        },
        highlight = { enable = true },
        indent    = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            node_decremental = "grm",
          },
        },
      }
    end,
  },
  -- 如果想用可视化面板，继续加：
  { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
}

