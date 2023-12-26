local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    "ansible-lint",
    "bash-language-server",
    "clang-format",
    "clangd",
    "css-lsp",
    "deno",
    "docker-compose-language-service",
    "dockerfile-language-server",
    "hadolint",
    "html-lsp",
    "json-lsp",
    "lua-language-server",
    "markdown-toc",
    "markdownlint",
    "prettier",
    "shellcheck",
    "stylua",
    "terraform-ls",
    "tflint",
    "typescript-language-server",
    -- "yaml-language-server",
    "yamlfix",
    "yamllint",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
