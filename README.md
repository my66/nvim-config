# Neovim 快捷键速查表

- `<Leader>` 映射为 `,`
- `<LocalLeader>` 映射为空格 `␠`

---

## 常用模式切换

| 模式   | 快捷键 | 操作             | 说明             |
|--------|--------|------------------|------------------|
| Insert | `jj`   | `<Esc>`          | 快速退出插入模式 |

## 通用功能

| 模式 | 快捷键      | 操作          | 说明           |
|------|-------------|---------------|----------------|
| Normal | `<Leader>nh` | `:nohl<CR>`   | 清除搜索高亮   |

## 注释与代码隔离（vim-commentary）

| 模式 | 快捷键        | 操作                          | 说明                         |
|------|---------------|-------------------------------|------------------------------|
| Normal | `<Leader>/`    | `<Plug>CommentaryLine`         | 切换当前行注释               |
| Visual | `<Leader>/`    | `<Plug>Commentary`             | 切换选中区域注释             |
| Normal/Visual | `gc{motion}` | vim-commentary 默认按键       | 依动作注释/取消注释对应范围 |
| Normal | `gcc`          | vim-commentary 默认行注释快捷键 | 注释/恢复当前整行           |

## 窗口与标签页

| 模式 | 快捷键      | 操作                   | 说明                 |
|------|-------------|------------------------|----------------------|
| Normal | `<Leader>sv` | `<C-w>v`               | 垂直分割窗口         |
| Normal | `<Leader>sh` | `<C-w>s`               | 水平分割窗口         |
| Normal | `<Leader>se` | `<C-w>=`               | 所有窗口等宽等高     |
| Normal | `<Leader>sx` | `<cmd>close<CR>`       | 关闭当前窗口         |
| Normal | `<Leader>sj` | `<cmd>wincmd x<CR>`    | 与下一个窗口交换     |
| Normal | `<Leader>to` | `<cmd>tabnew<CR>`      | 新建标签页           |
| Normal | `<Leader>tx` | `<cmd>tabclose<CR>`    | 关闭当前标签页       |
| Normal | `<Leader>tn` | `<cmd>tabn<CR>`        | 切换到下一个标签页   |
| Normal | `<Leader>tp` | `<cmd>tabp<CR>`        | 切换到上一个标签页   |
| Normal | `<Leader>tf` | `<cmd>tabnew %<CR>`    | 当前文件在新标签打开 |
| Normal | `<C-h>`      | `<C-w>h`               | 跳到左侧窗口         |
| Normal | `<C-j>`      | `<C-w>j`               | 跳到下方窗口         |
| Normal | `<C-k>`      | `<C-w>k`               | 跳到上方窗口         |
| Normal | `<C-l>`      | `<C-w>l`               | 跳到右侧窗口         |

## 诊断导航

| 模式 | 快捷键 | 操作                         | 说明           |
|------|--------|------------------------------|----------------|
| Normal | `]d`    | `vim.diagnostic.goto_next`   | 跳到下一个诊断 |
| Normal | `[d`    | `vim.diagnostic.goto_prev`   | 跳到上一个诊断 |
| Normal | `<Leader>ds` | `vim.diagnostic.open_float` | 当前行诊断浮窗 |
| Normal | `<Leader>dl` | `vim.diagnostic.open_float` | 整个缓冲区诊断 |

## LSP（通过 `LspAttach` 自动加载）

| 模式 | 快捷键      | 操作                  | 说明       |
|------|-------------|-----------------------|------------|
| Normal | `gd`         | `vim.lsp.buf.definition`      | 跳转到定义 |
| Normal | `gi`         | `vim.lsp.buf.implementation`  | 跳转到实现 |
| Normal | `K`          | `vim.lsp.buf.hover`           | 显示悬停文档 |
| Normal | `<Leader>rn` | `vim.lsp.buf.rename`          | 重命名符号 |

## nvim-tree 文件树

| 模式 | 快捷键      | 操作                              | 说明       |
|------|-------------|-----------------------------------|------------|
| Normal | `<Leader>ee` | `:NvimTreeToggle`                 | 切换文件树 |
| Normal | `<Leader>ef` | `:NvimTreeFindFileToggle`         | 定位当前文件 |
| Normal | `<Leader>ec` | `:NvimTreeCollapse`               | 折叠全部节点 |
| Normal | `<Leader>er` | `:NvimTreeRefresh`                | 刷新文件树 |

## Telescope

| 模式 | 快捷键      | 操作                          | 说明           |
|------|-------------|-------------------------------|----------------|
| Normal | `<Leader>ff` | `:Telescope find_files`        | 文件搜索       |
| Normal | `<Leader>fr` | `:Telescope oldfiles`          | 最近文件       |
| Normal | `<Leader>fs` | `:Telescope live_grep`         | 全文搜索       |
| Normal | `<Leader>fc` | `:Telescope grep_string`       | 搜索光标单词   |
| Insert (Telescope) | `<C-k>` | 上移选择 | 结果上移 |
| Insert (Telescope) | `<C-j>` | 下移选择 | 结果下移 |
| Insert (Telescope) | `<C-q>` | 发送到 quickfix | 加入 Quickfix |

## ToggleTerm

| 模式     | 快捷键          | 操作                                      | 说明             |
|----------|-----------------|-------------------------------------------|------------------|
| Normal   | `<C-\>`          | 打开浮动终端                             | 全局终端映射     |
| Normal   | `<Leader>tt`     | `:ToggleTerm`                            | 切换浮动终端     |
| Normal   | `<Leader>th`     | `:ToggleTerm direction=horizontal`       | 水平终端         |
| Normal   | `<Leader>tv`     | `:ToggleTerm direction=vertical`         | 垂直终端         |
| Terminal | `jj` / `<Esc>`   | `<C-\><C-n>`                            | 终端返回 Normal |
| Terminal | `<Leader>tt`     | 同上                                    | 关闭/切换终端   |

## nvim-cmp 补全

| 模式 | 快捷键        | 操作                         | 说明           |
|------|---------------|------------------------------|----------------|
| Insert | `<C-k>`        | `cmp.complete()`             | 手动触发补全   |
| Insert | `<CR>`         | `cmp.confirm()`              | 确认补全       |
| Insert | `<C-n>`        | `cmp.select_next_item()`     | 下一个建议     |
| Insert | `<C-p>`        | `cmp.select_prev_item()`     | 上一个建议     |
| Insert | `<Tab>` / `<S-Tab>` | 跳转补全/片段              | 智能跳转       |

## Treesitter 增量选择

| 模式        | 快捷键 | 操作                | 说明         |
|-------------|--------|---------------------|--------------|
| Normal/Visual | `gnn`  | `init_selection`     | 开始增量选择 |
| Normal/Visual | `grn`  | `node_incremental`   | 扩大选择     |
| Normal/Visual | `grm`  | `node_decremental`   | 缩小选择     |

> 以上按键来源于 `init.lua` 及 `lua/` 目录中的显式映射，若插件自身提供额外快捷键，请结合 `:verbose map` 查看。
