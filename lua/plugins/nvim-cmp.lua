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
    opts.sources = {
      { name = "codeium" },
    }
    -- local icons = require "nvchad.icons.lspkind"
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
        local codeium = require("lspkind").cmp_format {
          mode = "symbol",
          maxwidth = 50,
          ellipsis_char = "...",
          symbol_map = { Codeium = "" },
        }(entry, vim_item)
        local kind = require("lspkind").cmp_format { mode = "symbol_text", maxwidth = 50 }(entry, vim_item)
        -- local strings = vim.split(kind.kind, " ", { trimempty = true })
        local strings = vim.split(kind.kind, "%s", { trimempty = true })
        -- kind.kind = string.format(" %s  %s", icons[vim_item.kind], strings[1])
        if entry.source.name == "codeium" then
          kind.kind = string.format(" %s", codeium.kind, strings[1])
        else
          kind.kind = " " .. (strings[1] or "") .. " "
        end
        -- kind.menu = " " .. (strings[2] or "") .. ""
        kind.menu = "    (" .. (strings[2] or "") .. ")"

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
    require("cmp").setup.cmdline(":", {
      mapping = require("cmp").mapping.preset.cmdline(),
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
      opts = {
        enable_chat = true,
      },
    },
    {
      "supermaven-inc/supermaven-nvim",
      -- commit = "df3ecf7",
      event = "User FilePost",
      opts = {
        disable_keymaps = false,
        disable_inline_completion = false,
        keymaps = {
          accept_suggestion = "<S-TAB>",
          clear_suggestion = "<Nop>",
          accept_word = "<C-y>",
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
