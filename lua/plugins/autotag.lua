return {
  {
    "windwp/nvim-ts-autotag",
    -- 依赖于 Treesitter，但配置是独立的
    -- event = { "BufReadPre", "BufNewFile" }, -- 可以指定加载事件
    -- ft = { "html", "javascriptreact", "typescriptreact" }, -- 或指定文件类型触发
    dependencies = { "nvim-treesitter/nvim-treesitter" }, -- 明确依赖
    config = function()
      require("nvim-ts-autotag").setup({
        -- 使用默认配置即可满足基本需求
        -- 如果需要可以添加配置项，例如:
        -- filetypes = { "html", "xml", "javascriptreact", "typescriptreact" }
      })
    end,
  },
}
