{
  code_actions = {
    gitsigns.enable = true;
    ts_node_action.enable = true;
    gomodifytags.enable = true;
    statix.enable = true;
  };
  diagnostics = {
    statix.enable = true;
    golangci_lint.enable = true;
    deadnix.enable = true;
    pylint.enable = true;
    checkstyle.enable = true;
  };
  formatting = {
    stylua.enable = true;
    nixpkgs_fmt.enable = true;
    shfmt.enable = true;
    prettier = {
      enable = true;
      disableTsServerFormatter = true;
    };
    black.enable = true;
    gofmt.enable = true;
    goimports.enable = true;
    sqlformat.enable = true;
    isort.enable = true;
    yapf.enable = true;
  };
  completion = {
    luasnip.enable = true;
    spell.enable = true;
  };
}
