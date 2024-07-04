{
  enable = true;
  settings = {
    snippet.expand = 
    ''
      function(args)
        require('luasnip').lsp_expand(args.body)
      end
    '';
    mapping = {
      "<Tab>" = 
      ''
        cmp.mapping(function(fallback)
          local luasnip = require("luasnip")
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" })
      '';

      "<CR>" = 
      ''
        cmp.mapping({
          i = function(fallback)
            if cmp.visible() and cmp.get_active_entry() then
              cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
            else
              fallback()
            end
          end,
          s = function(fallback)
            if cmp.visible() then
              if luasnip.expandable() then
                luasnip.expand()
              else
                cmp.confirm({
                  select = true,
                })
              end
            else
              fallback()
            end
          end,
          c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
        })
      '';

      "<S-Tab>" = 
      ''
        cmp.mapping(function(fallback)
          local luasnip = require("luasnip")
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" })
      '';

      "<C-e>" = 
      ''
        cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        })
      '';
    };
    sources = [
      { name = "nvim_lsp"; }
      { name = "nvim_lsp_signature_help"; }
      { name = "luasnip"; }
      { name = "buffer"; }
      { name = "path"; }
      { name = "emoji"; }
      { name = "cmdline"; }
    ];
  };
}
