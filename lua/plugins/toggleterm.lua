return {
  "akinsho/toggleterm.nvim",
  version = "*", -- 或者指定一个版本，例如 "v2.9.0"
  -- lazy = false, -- 如果你希望启动时就加载可以取消注释，但通常按需加载更好
  opts = {
    -- [[ 基本设置 ]]
    -- 终端窗口大小，可以是数字（行数/列数）或百分比（相对于编辑器大小）
    size = function(term)
      if term.direction == "horizontal" then
        return 15 -- 水平分割时，高度为 15 行
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4 -- 垂直分割时，宽度为编辑器宽度的 40%
      end
      -- 对于浮动窗口，可以不设置 size，让它自适应，或者也设置固定值/百分比
      -- return 20
    end,
    open_mapping = [[<c-\>]], -- 设置一个在 Normal 模式下快速打开终端的映射 (Ctrl + \)
                              -- 注意：这只是打开，我们通常会另外设置切换映射
    hide_numbers = true, -- 打开终端时隐藏行号
    shade_filetypes = {}, -- 不需要着色的文件类型
    shade_terminals = true, -- 给终端窗口加上一点阴影背景
    shading_factor = 2, -- 阴影强度 (1-3)
    start_in_insert = true, -- 打开终端时自动进入 Insert 模式
    insert_mappings = true, -- 允许在 Insert 模式下使用映射 (比如下面的 <esc>)
    persist_size = true, -- 记住上次终端的大小
    -- 终端打开时的方向: 'float', 'horizontal', 'vertical', 'tab'
    direction = 'float', -- 默认打开为浮动窗口
    close_on_exit = true, -- 终端进程退出时自动关闭窗口
    shell = vim.o.shell, -- 使用 Neovim 配置的默认 shell (通常会自动检测)
    float_opts = {
      -- 浮动窗口的选项
      border = 'curved', -- 边框类型: 'single', 'double', 'rounded', 'solid', 'shadow', 'curved'
      -- width = <value>,
      -- height = <value>,
      winblend = 3, -- 浮动窗口透明度 (0-100)
    },

    -- [[ 自定义终端映射 ]]
    -- 你可以在这里为不同的终端类型定义特定的映射
    -- term_mappings = function(term) ... end,

    -- [[ 自动命令 ]]
    -- 打开终端时执行的函数
    -- on_open = function(term)
    --   vim.cmd("setlocal nonumber norelativenumber")
    --   vim.cmd("startinsert!")
    -- end,
    -- 关闭终端时执行的函数
    -- on_close = function(term) ... end,
  },
  config = function(_, opts)
    -- 加载配置
    require("toggleterm").setup(opts)

    -- 定义切换终端的快捷键
    local map = vim.keymap.set
    -- Normal 模式下的快捷键
    -- 使用 <leader>t 切换默认终端 (上面 direction 设置的 float)
    map("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "切换浮动终端", silent = true })
    -- 使用 <leader>ht 切换水平分割终端
    map("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "切换水平终端", silent = true })
    -- 使用 <leader>vt 切换垂直分割终端
    map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", { desc = "切换垂直终端", silent = true })

    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "term://*",
      callback = function(event)
        local term_map_opts = { buffer = event.buf, silent = true }

        map("t", "jj", "<C-\\><C-n>", term_map_opts)
        map("t", "<esc>", "<C-\\><C-n>", term_map_opts)
        map("t", "<leader>tt", "<cmd>ToggleTerm<CR>",
          vim.tbl_extend("force", term_map_opts, { desc = "切换终端" }))
      end,
    })
  end
}
