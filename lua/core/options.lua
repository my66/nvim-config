local opt = vim.opt -- 简写，方便设定选项

-- 行号
opt.relativenumber = true    -- 显示相对行号
opt.number = true            -- 光标所在行显示绝对行号

-- 制表符和缩进
opt.tabstop = 2              -- 一个 Tab 等于 2 个空格宽度
opt.shiftwidth = 2           -- 自动缩进时使用 2 个空格
opt.expandtab = true         -- 将 Tab 键转换为空格
opt.autoindent = true        -- 新行继承上一行缩进

-- 行包装
opt.wrap = false             -- 禁用自动换行

-- 搜索设置
opt.hlsearch = true          -- 高亮搜索结果
opt.incsearch = true         -- 输入搜索词时实时高亮匹配
opt.ignorecase = true        -- 搜索时忽略大小写
opt.smartcase  = true        -- 搜索包含大写时，自动启用大小写敏感

-- 光标行高亮
opt.cursorline = true        -- 高亮显示当前行

-- 外观和主题

opt.termguicolors = true     -- 启用 24 位真彩色支持
opt.signcolumn     = "yes"   -- 总是显示符号列，避免文本抖动

-- 退格行为
opt.backspace = "indent,eol,start" -- 退格可跨缩进、行尾和插入点

-- 系统剪贴板
-- sudo apt update
--sudo apt install xclip        # 安装 xclip
--或者安装 xsel：
--sudo apt install xsel
opt.clipboard:append("unnamedplus") -- 默认使用系统剪贴板

-- 窗口分割
opt.splitright = true        -- 垂直分割窗口时，新窗口在右侧
opt.splitbelow = true        -- 水平分割窗口时，新窗口在下方

-- 交换文件与备份
opt.swapfile = false         -- 关闭 swap 文件
opt.backup = false           -- 关闭备份文件

-- 撤销历史
opt.undodir  = vim.fn.stdpath("data") .. "/undodir" -- 设置撤销目录 echo stdpath('data')
opt.undofile = true          -- 启用撤销文件，保存撤销历史


--行为
--opt.mouse = 'a'          -- 在所有模式下启用鼠标支持
opt.hidden = true        -- 允许在不保存的情况下切换缓冲区
opt.scrolloff = 8        -- 光标上下保留 8 行的上下文
opt.sidescrolloff = 8    -- 光标左右保留 8 列的上下文

opt.pumblend = 10    -- 范围 0-100，数值越大越透明

vim.cmd('filetype plugin indent on')

