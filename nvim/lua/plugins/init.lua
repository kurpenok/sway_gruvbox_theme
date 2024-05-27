return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre',
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- vim stuff
        "vim",
        "vimdoc",
        "lua",

        -- compilable stuff
        "c",
        "cpp",
        "make",
        "cmake",
        "rust",
        "c_sharp",
        "java",
        "kotlin",

        -- scripting stuff
        "bash",
        "python",
        "javascript",
        "typescript",
        "tsx",
        "vue",

        -- markup stuff
        "markdown",
        "markdown_inline",
        "html",
        "css",
        "xml",
        "json",
        "yaml",
        "csv",
        "sql",
        "tmux",
        "latex",
      },
    },
  },
}
