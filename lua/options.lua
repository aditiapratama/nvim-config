-- NOTE: Neovim options
require "nvchad.options"

local options = {
  laststatus = 3, -- global statusline
  backup = false, -- creates a backup file
  conceallevel = 0, -- so that `` is visible in markdown files
  fileencoding = "utf-8", -- the encoding written to a file
  encoding = "utf-8",
  hidden = true, -- required to keep multiple buffers and open multiple buffers
  ignorecase = true, -- ignore case in search patterns
  mouse = "a", -- allow the mouse to be used in neovim
  pumheight = 8, -- pop up menu height
  pumblend = 0, -- transparency of pop-up menu
  showmode = false, -- we don't need to see things like -- INSERT -- anymore
  smarttab = true,
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  breakindent = true,
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = true, -- creates a swapfile
  timeoutlen = 500, -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  updatetime = 100, -- faster completion (4000ms default)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 4, -- the number of spaces inserted for each indentation
  tabstop = 4, -- insert 2 spaces for a tab
  softtabstop = 4, -- number of spaces in tab when editing
  -- colorcolumn = "80", -- column at which to fold long lines
  showmatch = true, -- show matching brackets.
  cursorline = false, -- highlight the current line
  number = true, -- set numbered lines
  relativenumber = true, -- set relative numbered lines
  numberwidth = 5, -- set number column width to 4 {default 4}
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  wrap = false, -- display lines as one long line
  scrolloff = 10, -- minimal number of columns to scroll horizontally.
  sidescrolloff = 8, -- minimal number of screen columns
  lazyredraw = false, -- Won't be redrawn while executing macros, register and other commands.
  termguicolors = true, -- Enables 24-bit RGB color in the TUI
  fillchars = { eob = " ", fold = " ", foldopen = "", foldsep = " ", foldclose = "", lastline = " " }, -- make EndOfBuffer invisible
  ruler = false,
  cmdheight = 0,
  helpheight = 0,
  -- shell = vim.fn.executable "pwsh" and "pwsh" or "powershell",
  -- shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
  -- shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
  -- shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
  -- shellquote = "",
  -- shellxquote = "",
}

local global = {
  startup_message = true, -- Show startup message
  toggle_cmp = true,
}

for name, value in pairs(options) do
  vim.opt[name] = value
end

for name, value in pairs(global) do
  vim.g[name] = value
end
