-- File: ~/.config/nvim/lua/plugins/completion.lua
return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      -- 补全菜单行为：弹出但不自动插入或选中
      vim.opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }
      -- 半透明弹出框，数值越大越透明

      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local win = require("cmp.config.window")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = {
          --autocomplete = { cmp.TriggerEvent.TextChanged },
          --autocomplete = { cmp.TriggerEvent.InsertEnter, cmp.TriggerEvent.TextChanged }
          autocomplete = false
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"]      = cmp.mapping.confirm({ select = false }),
          -- 使用 cmp 自身的行为插入并选择
          ["<C-n>"]     = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"]     = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip"    },
        },
        experimental = {
          ghost_text = true,
        },
        window = {
          completion = win.bordered({
            winhighlight = "Normal:CmpPmenu,CursorLine:CmpPmenuSel,Search:None",
          }),
          documentation = win.bordered({
            winhighlight = "Normal:CmpDoc,CursorLine:CmpDocSel",
          }),
        },
      })

      -- 自定义补全菜单和文档的高亮
      vim.cmd([[ 
        highlight CmpPmenu      guibg=#1e222a guifg=#c5c8c6
        highlight CmpPmenuSel   guibg=#3e4452 guifg=#ffffff
        highlight CmpDoc        guibg=#22272e guifg=#abb2bf
        highlight CmpDocSel     guibg=#3e4452 guifg=#ffffff
        highlight PmenuSbar     guibg=#181a1f
        highlight PmenuThumb    guibg=#5b6268
      ]])
    end,
  },
}

