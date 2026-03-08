-- File: ~/.config/nvim/lua/plugins/completion.lua
return {
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      vim.opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }

      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local win = require("cmp.config.window")

      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        preselect = cmp.PreselectMode.None,
        performance = {
          debounce = 25,
          throttle = 20,
          fetching_timeout = 150,
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = {
          autocomplete = {
            cmp.TriggerEvent.InsertEnter,
            cmp.TriggerEvent.TextChanged,
          },
          completeopt = "menu,menuone,noselect,noinsert",
          keyword_length = 1,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp", priority = 1000 },
          { name = "luasnip", priority = 750 },
          { name = "path", priority = 500 },
          { name = "buffer", priority = 250, keyword_length = 3 },
        }),
        sorting = {
          priority_weight = 2,
          comparators = {
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            cmp.config.compare.kind,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
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

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })

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
