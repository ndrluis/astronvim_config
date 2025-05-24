-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = { "cpp", "vim", "lua", "python", "yaml", "javascript", "html", "css", "elixir", "typescript", "rust" }
  },
  highlight = {
    disable = { "yaml", "css" },
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "python" } },
  incremental_selection = { enable = true },
}
