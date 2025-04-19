-- 设置 Leader 键 (必须在映射之前设置)
vim.g.mapleader = "," -- 将 Leader 键设置为空格
vim.g.maplocalleader = " " -- 将 Local Leader 也设置为空格

local map = vim.keymap.set
local opts = { noremap = true, silent = true } --noremap防止映射被递归解释,silent执行时不回显命令本身

-- In sert 模式映射
map ('i', 'jj', '<Esc>', { desc = "快速退出Insert模式" })

--清除搜索高亮
map("n", "<leader>nh", ":nohl<CR>", { desc = "清除搜索高亮" })

--windows
map("n", "<leader>sv", "<C-w>v", { desc = "垂直分割窗口" })
map("n", "<leader>sh", "<C-w>s", { desc = "水平分割窗口" })
map("n", "<leader>se", "<C-w>=", { desc = "所有窗口等宽等高" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "关闭当前所在的分屏窗口" })

map("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "打开一个新的标签页" })
map("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "关闭当前的标签页" })
map("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "切换到下一个标签页" })
map("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "切换到上一个标签页" })
map("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "在一个新的标签页中打开当前正在编辑的文件" })
 
map('n', '<leader>pv', '<cmd>Ex<cr>', { desc = "打开 Netrw 文件浏览器" })
map('n', '<C-h>', '<C-w>h', { desc = "切换到左侧窗口" })
map('n', '<C-l>', '<C-w>l', { desc = "切换到右侧窗口" })
map('n', '<C-j>', '<C-w>j', { desc = "切换到下方窗口" })
map('n', '<C-k>', '<C-w>k', { desc = "切换到上方窗口" })

--打开终端
map("n", "<leader>tt", "<cmd>split term://bash<CR>", { desc = "在下方打开终端" })
map("n", "<leader>tv", "<cmd>vsplit term://bash<CR>", { desc = "在右方打开终端" })


-- **诊断跳转**（E 错误标记）
map("n", "]d", vim.diagnostic.goto_next, { desc = "跳到下一个诊断/错误" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "跳到上一个诊断/错误" })
