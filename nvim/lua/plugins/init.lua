return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- format on save
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
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- c/cpp stuff
        "clangd",
        "clang-format",

        -- rust stuff
        "rust-analyzer",

        -- dotnet stuff
        "omnisharp",

        -- debugger
        "codelldb",

        -- python stuff
        "pyright",
        "debugpy",
        "ruff",

        -- web stuff
        "html-lsp",
        "css-lsp",
        "typescript-language-server",
        "js-debug-adapter",
        "eslint-lsp",
        "prettier",
        "deno",
      },
    },
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
