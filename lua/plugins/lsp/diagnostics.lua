-- 1. 核心诊断配置：禁用虚拟文本和虚拟行，启用符号和下划线
vim.diagnostic.config({
  virtual_text = false,     -- 禁用行尾虚拟文本 [1, 2, 3]
  virtual_lines = false,    -- 禁用行下虚拟行 [4] (避免代码移位 [5, 6])
  underline = true,         -- 保留下划线 [4, 7]
  signs = true,             -- 保留侧边栏符号 [4, 7]
  update_in_insert = false, -- 不在插入模式更新 (默认, 减少干扰) [4, 8, 2, 7]
                            -- 注意: 此设置有时可能导致进入插入模式时光标行符号短暂消失引起跳动 [9]
                            -- 如果跳动问题比插入模式干扰更严重, 可以尝试设为 true
  severity_sort = true,     -- 按严重性排序诊断信息 [4, 8, 7]

  -- 2. 配置浮动窗口 (用于按需查看)
  float = {
    source = "if_many", -- 仅在有多个诊断来源时显示来源名称 [4, 2, 10]
    border = "rounded", -- 为浮动窗口设置圆角边框 [4, 2, 10]
    -- 可选: 自定义浮动窗口中每条消息的格式 [2, 5]
    -- format = function(diagnostic)
    --   -- 示例: 移除换行符并显示 来源 和 代码
    --   local message = diagnostic.message:gsub("[\n\r]+", " ")
    --   local code = diagnostic.code or (diagnostic.user_data and diagnostic.user_data.lsp and diagnostic.user_data.lsp.code) or ''
    --   return string.format(
    --     "%s (%s) [%s]",
    --     message,
    --     diagnostic.source or '',
    --     code
    --   )
    -- end,
  },
})

-- 3. 设置快捷键
-- 使用 <Leader>d (通常是 \d 或 空格d) 打开当前行的浮动诊断窗口
vim.keymap.set("n", "<Leader>d", function()
  vim.diagnostic.open_float(nil, { scope = "line" }) -- 'line' 范围仅显示当前行 [4, 1, 10, 3]
end, { desc = "显示当前行诊断 (Show line diagnostics)" })

-- 使用 <Leader>D 打开整个缓冲区的浮动诊断窗口
vim.keymap.set("n", "<Leader>D", function()
  vim.diagnostic.open_float(nil, { scope = "buffer" }) -- 'buffer' 范围显示整个文件 [4, 10]
end, { desc = "显示缓冲区诊断 (Show buffer diagnostics)" })

-- Neovim LSP 默认会映射 ]d 和 [d 用于跳转，如果需要可以取消注释或自定义
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "跳转到下一个诊断 (Go to next diagnostic)" })
-- vim.keymap.set("n", " = signs.Error,
--       = signs.Warn,
--       [vim.diagnostic.severity.INFO] = signs.Info,
--       = signs.Hint,
--     },
--   }
-- })
-- [10, 11, 12, 13, 5]

-- 5. (可选) 自定义诊断高亮颜色 (示例)
-- vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#E06C75", bold = true }) -- 红色加粗
-- vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#E5C07B" }) -- 黄色
-- vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#61AFEF" }) -- 蓝色
-- vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#C678DD" }) -- 紫色
-- -- 单独配置下划线样式 (默认不链接到基础高亮) [4, 7]
-- vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "#E06C75" })
-- vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = "#E5C07B" })

-- 提示信息
--print("诊断配置已加载。使用 <Leader>d 查看当前行诊断。")
