local options = {
  formatters_by_ft = {
    lua = { "stylua" },

    sh = { "shfmt" },
    bash = { "shfmt" },

    c = { "clang_format" },
    cpp = { "clang_format" },
    rust = { "rustfmt" },

    python = { "isort", "ruff_format" },

    html = { "prettier" },
    css = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },

    yaml = { "yamlfmt" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
