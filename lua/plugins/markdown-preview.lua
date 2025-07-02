return {
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    -- 注意：这将需要你的系统上安装了 Node.js 和 npm (或 yarn)
    -- 如果插件的 app 目录使用 yarn，你可能需要用 "cd app && yarn install && yarn build" (具体命令看插件文档)
    build = "cd app && npm install", -- 或者 "cd app && yarn install"
    keys = {
      {
        "<leader>mp",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "切换 Markdown 预览",
        mode = "n",
      },
      {
        "<leader>md",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "切换 Markdown 预览",
        mode = "n",
      },
    },
    init = function()
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_page_title = "「${name}」- Preview"
    end,
  },
}

