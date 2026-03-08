-- 设置 Leader 键 (必须在映射之前设置)
vim.g.mapleader = "," -- 将 Leader 键设置为逗号
vim.g.maplocalleader = " " -- 将 Local Leader 设置为空格

local map = vim.keymap.set
-- 定义基础选项，包含 noremap 和 silent
local opts = { noremap = true, silent = true }

-- [[ 模式切换 ]]
-- Insert 模式映射
-- 合并基础 opts 和 desc
map('i', 'jj', '<Esc>', vim.tbl_extend("force", opts, { desc = "快速退出Insert模式" }))

-- [[ 通用功能 ]]
-- 清除搜索高亮
-- 合并基础 opts 和 desc
map("n", "<leader>nh", ":nohl<CR>", vim.tbl_extend("force", opts, { desc = "清除搜索高亮" }))

-- [[ 窗口管理 ]]
-- 合并基础 opts 和 desc
map("n", "<leader>sv", "<C-w>v", vim.tbl_extend("force", opts, { desc = "垂直分割窗口" }))
map("n", "<leader>sh", "<C-w>s", vim.tbl_extend("force", opts, { desc = "水平分割窗口" }))
map("n", "<leader>se", "<C-w>=", vim.tbl_extend("force", opts, { desc = "所有窗口等宽等高" }))
map("n", "<leader>sx", "<cmd>close<CR>", vim.tbl_extend("force", opts, { desc = "关闭当前所在的分屏窗口" }))
-- 新增的交换窗口映射，也使用 opts
map("n", "<leader>sj", "<cmd>wincmd x<CR>", vim.tbl_extend("force", opts, { desc = "交换当前窗口与下一个窗口" }))

-- [[ 标签页管理 ]]
-- 合并基础 opts 和 desc
map("n", "<leader>to", "<cmd>tabnew<CR>", vim.tbl_extend("force", opts, { desc = "打开一个新的标签页" }))
map("n", "<leader>tx", "<cmd>tabclose<CR>", vim.tbl_extend("force", opts, { desc = "关闭当前的标签页" }))
map("n", "<leader>tn", "<cmd>tabn<CR>", vim.tbl_extend("force", opts, { desc = "切换到下一个标签页" }))
map("n", "<leader>tp", "<cmd>tabp<CR>", vim.tbl_extend("force", opts, { desc = "切换到上一个标签页" }))
map("n", "<leader>tf", "<cmd>tabnew %<CR>", vim.tbl_extend("force", opts, { desc = "在一个新的标签页中打开当前正在编辑的文件" }))

-- [[ 窗口/缓冲区导航 ]]
-- 合并基础 opts 和 desc
map('n', '<C-h>', '<C-w>h', vim.tbl_extend("force", opts, { desc = "切换到左侧窗口" }))
map('n', '<C-l>', '<C-w>l', vim.tbl_extend("force", opts, { desc = "切换到右侧窗口" }))
map('n', '<C-j>', '<C-w>j', vim.tbl_extend("force", opts, { desc = "切换到下方窗口" }))
map('n', '<C-k>', '<C-w>k', vim.tbl_extend("force", opts, { desc = "切换到上方窗口" }))

-- [[ 诊断导航 (Neovim 内置) ]]
-- 这里只需要基础 opts，不需要 desc (因为 Neovim 会自动处理描述)
-- 或者如果你想让 which-key 显示，也可以添加 desc
map("n", "]d", vim.diagnostic.goto_next, vim.tbl_extend("force", opts, { desc = "跳到下一个诊断/错误" }))
map("n", "[d", vim.diagnostic.goto_prev, vim.tbl_extend("force", opts, { desc = "跳到上一个诊断/错误" }))

-- [[ 注释相关 (Neovim 0.10+ 原生注释) ]]
map("n", "<leader>/", "gcc", { remap = true, silent = true, desc = "切换当前行注释" })
map("v", "<leader>/", "gc", { remap = true, silent = true, desc = "切换选区注释" })

-- 注意: 原 keymaps.lua 文件中的 <leader>tt 和 <leader>tv 已被注释掉，
-- 因为 toggleterm.lua 中定义了功能更完善的终端切换快捷键。
-- map("n", "<leader>tt", "<cmd>split term://bash<CR>", vim.tbl_extend("force", opts, { desc = "在下方打开终端" }))
-- map("n", "<leader>tv", "<cmd>vsplit term://bash<CR>", vim.tbl_extend("force", opts, { desc = "在右方打开终端" }))

