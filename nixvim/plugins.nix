pkgs: {
  # Plugins that can be configured with Nix
  native = {
    # LSP Configuration
    lsp = import ./lsp.nix;

    # Completion configuration
    cmp = import ./cmp.nix;

    # Devicons for CMP
    lspkind = {
      enable = true;
      mode = "symbol_text";
      preset = "codicons";
      cmp.enable = true;
    };

    # Snippets
    luasnip = {
      enable = true;
      fromVscode = [{ }];
    };

    # Syntax highlighting
    treesitter = {
      enable = true;
      indent = true;
    };

    # Create beautiful statusline
    lualine = {
      enable = true;
    };

    # Create beautiful buffer bar
    bufferline = {
      enable = true;
    };

    # Make `nvim .` look prettier
    oil.enable = true;

    # Auto-closing brackets/HTML tags
    ts-autotag.enable = true;
    nvim-autopairs.enable = true;

    # Toggle commentaries
    commentary.enable = true;

    # Telescope (no presentation required)
    telescope = {
      enable = true;
      extensions = {
        fzf-native = {
          enable = true;
        };
      };
    };

    # Color TODO comments
    todo-comments = {
      enable = true;
      colors = {
        error = [ "DiagnosticError" "ErrorMsg" "#DC2626" ];
        warning = [ "DiagnosticWarn" "WarningMsg" "#FBBF24" ];
        info = [ "DiagnosticInfo" "#2563EB" ];
        hint = [ "DiagnosticHint" "#10B981" ];
        default = [ "Identifier" "#7C3AED" ];
        test = [ "Identifier" "#FF00FF" ];
      };
    };

    # Some IDE features
    none-ls = {
      enable = true;
      settings.on_attach = ''
        function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                vim.lsp.buf.format({ async = false })
              end,
            })
          end
        end
      '';
      sources = import ./sources.nix;
    };

    # Linting
    lint = {
      enable = true;
      lintersByFt = {
        text = [ "vale" ];
        json = [ "jsonlint" ];
        markdown = [ "vale" ];
        janet = [ "janet" ];
        inko = [ "inko" ];
        go = [ "gofmt" ];
        js = [ "eslint" ];
        ts = [ "eslint" ];
        dockerfile = [ "hadolint" ];
        terraform = [ "tflint" ];
      };
    };

    # Git info inside editor
    gitsigns = {
      enable = true;
      settings.current_line_blame = true;
    };

    # File tree
    neo-tree = import ./neo-tree.nix;

    # Notifications
    notify = {
      enable = true;
      backgroundColour = "#1e1e2e";
      fps = 60;
      render = "default";
      timeout = 500;
      topDown = true;
    };


  };


  # Extra plugins
  extras = with pkgs.vimPlugins;
    [
      vim-go
    ];
}
