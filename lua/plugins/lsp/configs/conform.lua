local formatters_by_ft = {
  lua = { "stylua" },
  python = { "isort", "black" },
  cpp = { "clang_format" },
  c = { "clang_format" },
  go = { "gofumpt" },
  cs = { "csharpier" },
  yaml = { "yamlfmt" },
  css = { "prettier" },
  flow = { "prettier" },
  graphql = { "prettier" },
  html = { "prettier" },
  json = { "prettier" },
  javascriptreact = { "prettier" },
  javascript = { "prettier" },
  less = { "prettier" },
  markdown = { "prettier" },
  scss = { "prettier" },
  typescript = { "prettier" },
  typescriptreact = { "prettier" },
  vue = { "prettier" },
}

-- local prettier_ft = {
--   "css",
--   "flow",
--   "graphql",
--   "html",
--   "json",
--   "javascriptreact",
--   "javascript",
--   "less",
--   "markdown",
--   "scss",
--   "typescript",
--   "typescriptreact",
--   "vue",
-- }
--
-- for _, filetype in pairs(prettier_ft) do
--   formatters_by_ft[filetype] = { "prettier" }
-- end

---@type NvPluginSpec
return {
  -- NOTE: Formatting
  "stevearc/conform.nvim",
  event = "BufReadPost",
  opts = {
    -- format_after_save = {
    --   async = true,
    -- },
    -- format_on_save = {
      -- These options will be passed to conform.format()
      -- quiet = true,
      -- lsp_fallback = true,
    -- },
    formatters_by_ft = formatters_by_ft,
  },
}
