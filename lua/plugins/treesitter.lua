return {
  -- 其他插件…
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",       -- 安装或更新时自动下载解析器
    config = function()
      require("nvim-treesitter.configs").setup {
        highlight = { enable = true },   -- 启用高亮
        indent    = { enable = true },   -- 启用基于语法的缩进
        incremental_selection = {        -- 增量选中
          enable = true,
          keymaps = {
            init_selection = "gnn",       -- 开始选中
            node_incremental = "grn",     -- 扩大选区
            node_decremental = "grm",     -- 缩小选区
          },
        },
        playground = {                   -- 如果安装了 playground
          enable = true,
          updatetime = 25,               -- 更新延迟
        },
      }
    end,
  },
  -- 如果想用可视化面板，继续加：
  { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
}
