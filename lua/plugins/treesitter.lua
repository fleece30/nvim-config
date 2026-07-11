local opts = {
  -- LazyVim config for treesitter
  indent = { enable = true }, ---@type lazyvim.TSFeat
  highlight = { enable = true }, ---@type lazyvim.TSFeat
  folds = { enable = true }, ---@type lazyvim.TSFeat
  ensure_installed = {
    "bash",
    "c",
    "diff",
		"go",
    "html",
    "javascript",
    "jsdoc",
    "json",
    "lua",
    "luadoc",
    "luap",
    "markdown",
    "markdown_inline",
    "printf",
    "python",
    "query",
    "regex",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "xml",
    "yaml",
  },
}

return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
	opts = opts
}
