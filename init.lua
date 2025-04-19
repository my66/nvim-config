-- 核心设置
require("core.options")
require("core.keymaps")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- lua print(vim.fn.stdpath("data")) 查看目录位置
if not vim.loop.fs_stat(lazypath) then
  print("Installing lazy.nvim...")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath) -- 把 lazy.nvim 添加到运行时路径 (runtimepath)

-- 加载插件
local plugin_specs = require("plugins")
require("lazy").setup(plugin_specs, {
  checker = { enabled = true, notify = false },
  change_detection = { notify = false },
})

-- diagnostics.lua 只是配置，不作为插件加载，单独 require
require("plugins.lsp.diagnostics")

