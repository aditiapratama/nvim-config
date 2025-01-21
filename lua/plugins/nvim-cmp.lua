---@type NvPluginSpec
-- NOTE: Completion Engine

return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  init = function()
    vim.keymap.set("n", "<leader>oa", function()
      vim.g.toggle_cmp = not vim.g.toggle_cmp
      if vim.g.toggle_cmp then
        vim.notify("Toggled On", vim.log.levels.INFO, { title = "Autocomplete" })
      else
        vim.notify("Toggled Off", vim.log.levels.INFO, { title = "Autocomplete" })
      end
    end, { desc = "Options | Toggle Autocomplete" })
  end,
  config = function(_, opts)
    -- table.insert(opts.sources, 2, { name = "codeium" })
    -- table.insert(opts.sources, 1, { name = "supermaven" })

    opts.mapping = vim.tbl_extend("force", {}, opts.mapping, {
      -- You can add here new mappings.
    })

    opts.completion["completeopt"] = "menu,menuone,noselect" -- disable autoselect

    opts.enabled = function()
      return (vim.g.toggle_cmp and vim.bo.buftype == "")
    end

    local icons = require "nvchad.icons.lspkind"

    -- Add your custom menu here
    local menu = {
      -- ["vim-dadbod-completion"] = "",
    }

    opts.window = {
      completion = {
        winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
        col_offset = -3,
        side_padding = 0,
      },
    }

    opts.formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        local kind = require("lspkind").cmp_format { menu = menu, mode = "text", maxwidth = 50 }(entry, vim_item)
        local strings = vim.split(kind.kind, " ", { trimempty = true })
        kind.kind = string.format(" %s  %s", icons[vim_item.kind], strings[1])
        kind.menu = " " .. (kind.menu or "")
        return kind
      end,
    }

    require("luasnip").filetype_extend("javascriptreact", { "html" })
    require("luasnip").filetype_extend("typescriptreact", { "html" })
    require("luasnip").filetype_extend("svelte", { "html" })
    require("luasnip").filetype_extend("vue", { "html" })
    require("luasnip").filetype_extend("php", { "html" })

    --NOTE: add border for cmp window
    if vim.g.border_enabled then
      opts.window = {
        completion = require("cmp").config.window.bordered(),
        documentation = require("cmp").config.window.bordered(),
      }
    end

    require("cmp").setup(opts)

    local cmdline_mappings = vim.tbl_extend("force", {}, require("cmp").mapping.preset.cmdline(), {
      -- ["<CR>"] = { c = require("cmp").mapping.confirm { select = true } },
    })

    require("cmp").setup.cmdline(":", {
      mapping = cmdline_mappings,
      sources = {
        { name = "cmdline" },
      },
    })
  end,
  dependencies = {
    -- Icons
    {
      "onsails/lspkind.nvim",
    },
    -- For Rust
    {
      "saecki/crates.nvim",
      tag = "v0.4.0",
      opts = {},
    },
    -- Commandline completions
    {
      "hrsh7th/cmp-cmdline",
    },
    -- AI Autocomplete
    {
      "Exafunction/codeium.nvim",
      cond = false,
      opts = {
        enable_chat = true,
      },
    },
    {
      "supermaven-inc/supermaven-nvim",
      -- commit = "df3ecf7",
      event = "VeryLazy",
      opts = {
        disable_keymaps = false,
        disable_inline_completion = false,
        keymaps = {
          accept_suggestion = "<A-f>",
          clear_suggestion = "<Nop>",
          accept_word = "<A-w>",
        },
      },
    },
    {
      "L3MON4D3/LuaSnip",
      dependencies = "rafamadriz/friendly-snippets",
      build = "make install_jsregexp",
    },
  },
}
