return {
  -- 主题：tokyonight.nvim
  {
    "folke/tokyonight.nvim",
    priority = 1000, -- 确保在其他插件前加载
    config = function()
      local bg           = "#011628"
      local bg_dark      = "#011423"
      local bg_highlight = "#143652"
      local bg_search    = "#0A64AC"
      local bg_visual    = "#275378"
      local fg           = "#CBE0F0"
      local fg_dark      = "#B4D0E9"
      local fg_gutter    = "#627E97"
      --local border       = "#547998"
      local border       = "#FFDA7B"

      require("tokyonight").setup({
        style = "night",
        on_colors = function(colors)
          colors.bg            = bg
          colors.bg_dark       = bg_dark
          colors.bg_float      = bg_dark
          colors.bg_highlight  = bg_highlight
          colors.bg_popup      = bg_dark
          colors.bg_search     = bg_search
          colors.bg_sidebar    = bg_dark
          colors.bg_statusline = bg_dark
          colors.bg_visual     = bg_visual
          colors.border        = border
          colors.fg            = fg
          colors.fg_dark       = fg_dark
          colors.fg_float      = fg
          colors.fg_gutter     = fg_gutter
          colors.fg_sidebar    = fg_dark
        end,
      })
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])

    end,
  },

  -- 状态栏：lualine.nvim
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local lualine     = require("lualine")
      local lazy_status = require("lazy.status") -- 用于显示 pending updates

      local colors = {
        blue       = "#65D1FF",
        green      = "#3EFFDC",
        violet     = "#FF61EF",
        yellow     = "#FFDA7B",
        red        = "#FF4A4A",
        fg         = "#c3ccdc",
        bg         = "#112638",
        inactive_bg = "#2c3043",
      }

      local my_lualine_theme = {
        normal = {
          a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        insert = {
          a = { bg = colors.green, fg = colors.bg, gui = "bold" },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        visual = {
          a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        command = {
          a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        replace = {
          a = { bg = colors.red, fg = colors.bg, gui = "bold" },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        inactive = {
          a = { bg = colors.inactive_bg, fg = colors.inactive_bg, gui = "bold" },
          b = { bg = colors.inactive_bg, fg = colors.inactive_bg },
          c = { bg = colors.inactive_bg, fg = colors.inactive_bg },
        },
      }

      lualine.setup({
        options  = { theme = my_lualine_theme },
        sections = {
          lualine_x = {
            {
              lazy_status.updates,
              cond  = lazy_status.has_updates,
              color = { fg = "#ff9e64" },
            },
            "encoding", "fileformat", "filetype",
          },
        },
      })
    end,
  },
}
