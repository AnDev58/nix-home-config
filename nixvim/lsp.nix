{
  enable = true;
  servers = {
    # Bash
    bashls.enable = true;

    # C/C++
    clangd.enable = true;

    # CSS
    cssls.enable = true;

    # Go
    gopls.enable = true;

    # HTML
    html.enable = true;

    # JavaScript/TypeScript
    tsserver.enable = true;

    # Lua
    lua-ls = {
      enable = true;
      settings.telemetry.enable = false;
    };

    # Markdown
    marksman.enable = true;

    # Nix
    nil-ls.enable = true;

    # Python
    pyright.enable = true;

    # Tailwind CSS
    tailwindcss.enable = true;


  };
}
