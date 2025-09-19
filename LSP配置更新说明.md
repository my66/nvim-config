# LSP 配置更新说明

本次调整针对 NVIM v0.11.3 的变更，对原有配置做了以下改进：

## 关键改动

- **统一管理语言服务器**：新增 `lua/plugins/lsp/server_configs.lua`，集中维护所有语言服务器的个性化配置，避免在多个文件中重复声明，后续增删服务器时只需改动一处。
- **修复重复 setup 提示**：原配置对 `lua_ls` 和 `pyright` 调用了两次 `setup`，在 0.11 版本会提示需要调整。现在通过遍历统一的配置表，仅执行一次 `setup`，避免启动警告，同时保留全部功能。
- **按需自动安装**：`mason-lspconfig` 现在直接复用统一配置表生成 `ensure_installed` 列表，保证 Mason 与实际启用的语言服务器保持一致。
- **键位与能力优化**：整理 LSP `on_attach`，在保留原有按键（如 `gd`、`K`、`gi`、`<leader>rn`）的同时补充常用快捷键（如 `gD`、`gr`、`<leader>ca`），并为每个映射增加描述以配合 which-key 等插件展示。
- **补全能力整合**：将 `cmp-nvim-lsp` 加入依赖，并通过 `vim.tbl_deep_extend` 合并默认能力，保证补全、代码动作等功能在最新 Neovim 中工作正常。
- **服务器细化设置**：
  - `lua_ls`：禁用第三方库提示、启用 snippet 替换，继续声明全局 `vim`。
  - `pyright`：沿用原有的可选类型提示配置。
  - `rust_analyzer` / `gopls`：加入常用的格式化与诊断选项，以提升日常体验。

## 使用建议

- Mason 会在启动时提示缺失的服务器，可根据需要选择安装。
- 如需调整服务器或新增语言，只需在 `server_configs.lua` 中增删条目，同时配置会自动影响到 Mason。
- 若希望启用/禁用额外快捷键，可在 `lua/plugins/lsp/lspconfig.lua` 的 `on_attach` 函数中进行修改。

如在升级或使用过程中遇到问题，欢迎根据上述文件定位配置项并进一步微调。
