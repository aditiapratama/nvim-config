---@type NvPluginSpec
return {
  "neovim/nvim-lspconfig",
  init = function()
    vim.keymap.set("n", "<leader>lf", "<cmd>Format<cr>", { desc = "LSP | Format", silent = true })
    vim.keymap.set("n", "<leader>lF", "<cmd>FormatToggle<cr>", { desc = "LSP | Toggle Autoformat", silent = true })
    vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "LSP | Info", silent = true })
    vim.keymap.set("n", "<leader>lR", "<cmd>LspRestart<cr>", { desc = "LSP | Restart", silent = true })

    vim.keymap.set("n", "<leader>lh", function()
      if vim.version().minor >= 10 then
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end
    end, { desc = "LSP | Toggle Inlay Hints", silent = true })
  end,
  cmd = "LspInfo",
  config = function()
    local config = {
      virtual_text = false,
      update_in_insert = false,
      underline = false,
      severity_sort = false,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    }

    local signs = { Error = "", Warn = "", Hint = "󰌵", Info = "" }

    if vim.version().minor >= 11 then
      config.signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = signs.Error,
          [vim.diagnostic.severity.WARN] = signs.Warn,
          [vim.diagnostic.severity.HINT] = signs.Hint,
          [vim.diagnostic.severity.INFO] = signs.Info,
        },
        -- linehl = {
        --   [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
        --   [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
        --   [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
        --   [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
        -- },
        -- numhl = {
        --   [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
        --   [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
        --   [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
        --   [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
        -- },
      }
    else
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
      config.signs = { active = signs }
    end

    vim.diagnostic.config(config)

    if vim.g.border_enabled then
      -- NOTE: Enable border for LSP UI Windows (lspinfo)
      require("lspconfig.ui.windows").default_options.border = "rounded"

      -- NOTE: Enable border for LSP hover, signature help. But cannot use along with Noice's hover, signature help!

      --   vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      --     border = "rounded",
      --   })
      --   vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      --     border = "rounded",
      --   })
    end

    local configure = function(server_name)
      local on_attach = require("plugins.lsp.opts").on_attach
      local on_init = require("plugins.lsp.opts").on_init
      local capabilities = require("plugins.lsp.opts").capabilities

      local opts = {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
      }

      local require_ok, server = pcall(require, "plugins.lsp.settings." .. server_name)
      if require_ok then
        opts = vim.tbl_deep_extend("force", opts, server)
      end

      if vim.version().minor >= 11 then
        vim.lsp.config(server_name, opts)
        vim.lsp.enable(server_name)
      else
        require("lspconfig")[server_name].setup(opts)
      end
    end

    for server in pairs(vim.lsp._enabled_configs) do
      configure(server)
    end
  end,
}
--   if vim.g.border_enabled then
--     require("lspconfig.ui.windows").default_options.border = "rounded"
--   end
-- end,
-- opts = {
--   inlay_hints = { enabled = false },
--   --@type lspconfig.options
--   servers = {
--     cssls = {},
--     -- marksman = {
--     --   filetypes = { "markdown" },
--     --   -- root_dir = require("lspconfig.util").root_pattern(".git", ".marksman.toml"),
--     -- },
--     tailwindcss = {
--       filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact" },
--       root_dir = function(fname)
--         local util = require "lspconfig.util"
--         local root = util.root_pattern(
--           "tailwind.config.js",
--           "tailwind.config.cjs",
--           "tailwind.config.mjs",
--           "tailwind.config.ts",
--           "postcss.config.js",
--           "postcss.config.cjs",
--           "package.json",
--           ".git"
--         )(fname)
--
--         -- Further validate by checking if package.json contains "tailwindcss"
--         if root and util.path.is_file(util.path.join(root, "package.json")) then
--           local package_json = util.path.join(root, "package.json")
--           local content = vim.fn.readfile(package_json)
--           for _, line in ipairs(content) do
--             if line:match '"tailwindcss"' then
--               return root
--             end
--           end
--         end
--         return nil
--       end,
--     },
--     tsserver = {
--       root_dir = function(fname)
--         return require("lspconfig.util").root_pattern("tsconfig.json", "package.json", ".git")(fname)
--       end,
--       single_file_support = false,
--       settings = {
--         typescript = {
--           inlayHints = {
--             includeInlayParameterNameHints = "literal",
--             includeInlayParameterNameHintsWhenArgumentMatchesName = false,
--             includeInlayFunctionParameterTypeHints = true,
--             includeInlayVariableTypeHints = false,
--             includeInlayPropertyDeclarationTypeHints = true,
--             includeInlayFunctionLikeReturnTypeHints = true,
--             includeInlayEnumMemberValueHints = true,
--           },
--         },
--         javascript = {
--           inlayHints = {
--             includeInlayParameterNameHints = "all",
--             includeInlayParameterNameHintsWhenArgumentMatchesName = false,
--             includeInlayFunctionParameterTypeHints = true,
--             includeInlayVariableTypeHints = true,
--             includeInlayPropertyDeclarationTypeHints = true,
--             includeInlayFunctionLikeReturnTypeHints = true,
--             includeInlayEnumMemberValueHints = true,
--           },
--         },
--       },
--     },
--     html = {},
--     yamlls = {
--       settings = { keyOrdering = false },
--     },
--     lua_ls = {
--       single_file_support = true,
--       settings = {
--         Lua = {
--           workspace = { checkThirdParty = false },
--           completion = { workspaceWord = true, callSnippet = "Both" },
--           hint = {
--             enable = true,
--             setType = false,
--             paramType = true,
--             paramName = "Disable",
--             semicolon = "Disable",
--             arrayIndex = "Disable",
--           },
--           diagnostics = {
--             disable = { "incomplete-signature-doc", "trailing-space" },
--             unusedLocalExclude = { "_*" },
--           },
--           format = {
--             enable = false,
--             defaultConfig = {
--               indent_style = "space",
--               indent_size = "2",
--               continuation_indent_size = "2",
--             },
--           },
--         },
--       },
--     },
--   },
--   setup = {},
-- },
-- }
