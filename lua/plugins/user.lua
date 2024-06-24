-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  {
    "martinda/Jenkinsfile-vim-syntax",
    ft = { "jenkinsfile" },
  },
  {
    "towolf/vim-helm",
    event = { "BufRead *.yaml", "BufRead *.tpl" },
  },
  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      colorcolumn = "90",
      disabled_filetypes = { "help" },
    },
  },
  {
    "nvim-neotest/neotest",
    config = function()
      vim.diagnostic.config {
        virtual_text = {
          format = function(diagnostic)
            local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
          end,
        },
      }
      require("neotest").setup {
        adapters = {
          require "neotest-elixir",
          require "neotest-rust",
          require "neotest-python" {
            dap = { justMyCode = false },
          },
          require "neotest-jest" {
            jestCommand = "npm test --",
            jestConfigFile = "custom.jest.config.ts",
            env = { CI = true },
          },
        },
      }
    end,
    ft = { "rust", "elixir", "python", "javascript" },
    dependencies = {
      "rouge8/neotest-rust",
      "nvim-neotest/nvim-nio",
      "jfpedroza/neotest-elixir",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-jest",
    },
  },
  {
    "cappyzawa/trim.nvim",
    lazy = false,
    opts = {
      trim_on_write = true,
    },
  },
  { "mbbill/undotree", event = "User AstroFile" },
  {
    "lukoshkin/highlight-whitespace",
    lazy = false,
    opts = {
      tws = "\\s\\+$",
      clear_on_winleave = false,
      palette = {
        markdown = {
          tws = "RosyBrown",
        },
        other = {
          tws = "PaleVioletRed",
        },
      },
    },
  },
  {
    "ur4ltz/surround.nvim",
    event = "BufRead",
    config = function() require("surround").setup { mappings_style = "surround", map_insert_mode = false } end,
  },
}
