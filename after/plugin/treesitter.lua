local status, treesitter = pcall(require, "nvim-treesitter.configs")

if status then
  local config = require"nvim-treesitter.parsers".get_parser_configs()
  
  config.nim = {
    install_info = {
      url = "https://git.sr.ht/~xigoi/tree-sitter-nim",
      files = { "src/scanner.c", "src/parser.c"},
      generate_requires_npm = false,
      requires_generate_from_grammar = false,
    },
  }

  treesitter.setup {
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    auto_install = true
  }
end
return 
