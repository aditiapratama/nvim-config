# AGENTS.md - Neovim Configuration

## Build/Lint/Test Commands
- **Format Lua**: `stylua .` (uses .stylua.toml config)
- **Lint Lua**: `luacheck .` or `selene .` (uses selene.toml if present)
- **No automated tests** - manual testing via `:checkhealth` and plugin functionality

## Code Style Guidelines
- **Indentation**: 2 spaces (defined in .stylua.toml)
- **Line width**: 120 characters max
- **Quote style**: Auto-prefer double quotes
- **Function calls**: No parentheses when possible
- **File structure**: Organize by `lua/plugins/`, `lua/core/`, `lua/configs/`

## Naming Conventions
- **Files**: kebab-case (e.g., `nvim-treesitter.lua`, `auto-session.lua`)
- **Functions**: snake_case (e.g., `run_code`, `substitute`)
- **Variables**: snake_case with descriptive names
- **Plugin specs**: Use `---@type NvPluginSpec` annotation

## Import/Require Style
- Use `require` without parentheses: `require "module.name"`
- Group requires at top of file, core modules first
- Use relative paths from lua root: `require "core.utils"`

## Error Handling
- Use `vim.notify()` for user messages with appropriate log levels
- Validate file extensions and conditions before operations
- Provide fallbacks for missing dependencies or files

## Architecture
- **NvChad-based**: Extends NvChad v2.5 framework
- **Plugin management**: Lazy.nvim with lazy loading
- **Modular structure**: Separate configs in `configs/` directory