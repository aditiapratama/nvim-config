local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require "null-ls"
local options = {
  debounce = 150,
  -- save_after_format = false,
  sources = {
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.black.with {
      extra_args = function()
        return { "--line-length", "79" }
      end,
    },
    null_ls.builtins.diagnostics.mypy.with {
      extra_args = function()
        local virtual = os.getenv "VIRTUAL_ENV" or "/usr"
        return { "--python-executable", virtual .. "/bin/python" }
      end,
    },
    require "none-ls.diagnostics.ruff",
    -- null_ls.builtins.code_actions.cspell,
    null_ls.builtins.code_actions.refactoring,
    -- null_ls.builtins.diagnostics.cspell,
    -- null_ls.builtins.diagnostics.fish,
    null_ls.builtins.diagnostics.markdownlint,
    null_ls.builtins.formatting.fish_indent,
    null_ls.builtins.formatting.mdformat,
    null_ls.builtins.formatting.prettier,
    -- null_ls.builtins.formatting.shfmt,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.diagnostics.selene.with {
      condition = function(utils)
        return utils.root_has_file { "selene.toml" }
      end,
    },
  },
  root_dir = require("null-ls.utils").root_pattern(
      "package.json",
      ".null-ls-root",
      ".neoconf.json",
      ".git"
  ),
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr, timeout_ms = 5000 }
        end,
      })
    end
  end,
}

require("null-ls").setup(options)
