-- -----------------------------------------------------------------------------
-- General
-- -----------------------------------------------------------------------------
vim.g.is_posix = true

vim.opt.mouse       = "a"
vim.opt.swapfile    = false
vim.opt.writebackup = false
vim.opt.syntax      = "on"

-- -----------------------------------------------------------------------------
-- Miscellaneous
-- -----------------------------------------------------------------------------

-- Case only matters with mixed case expressions.
vim.opt.ignorecase = true
vim.opt.smartcase  = true

-- -----------------------------------------------------------------------------
-- Spacing
-- -----------------------------------------------------------------------------
vim.opt.tabstop     = 2
vim.opt.softtabstop = 2
vim.opt.expandtab   = true
vim.opt.shiftwidth  = 2

-- -----------------------------------------------------------------------------
-- Display extra whitespace.
-- -----------------------------------------------------------------------------
vim.opt.list        = true
vim.opt.listchars   = "tab:»·,trail:·"

-- -----------------------------------------------------------------------------
-- Layout
-- -----------------------------------------------------------------------------
vim.opt.showmode    = false
vim.opt.number      = true
vim.opt.numberwidth = 5
vim.opt.scrolloff   = 4

vim.opt.colorcolumn = "88,120"

-- -----------------------------------------------------------------------------
-- Case only matters with mixed case expressions.
-- -----------------------------------------------------------------------------
vim.opt.ignorecase = true
vim.opt.smartcase  = true

-- -----------------------------------------------------------------------------
-- Formats
-- -----------------------------------------------------------------------------

-- Enable spell check and set text width for Markdown files.
vim.api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  {
    pattern  = { "*md", "*.markdown" },
    callback = function()
      vim.opt_local.spell     = true
      vim.opt_local.textwidth = 80
    end
  }
)

-- -----------------------------------------------------------------------------
-- Package Manager
-- -----------------------------------------------------------------------------

-- Determine the package manager path.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Install the package manager, if missing.
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=main",
    lazypath,
  })
end

-- Add the package manager to the runtime path.
vim.opt.rtp:prepend(lazypath)

-- -----------------------------------------------------------------------------
-- Plug-ins
-- -----------------------------------------------------------------------------
--
-- STRUCTURE THIS ALL BETTER
--
-- https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/lazy/lsp.lua
--
--
-- local plugins = {
--   -- LSP configurations.
--   {
--     "neovim/nvim-lspconfig",
--     dependencies = require("plug-ins.lspconfig").dependencies,
--     init         = require("plug-ins.lspconfig").init
--   },

--   -- File finder.
--   {
--     "nvim-telescope/telescope.nvim",
--     dependencies = require("plug-ins.telescope").dependencies,
--     config       = true,
--     init         = require("plug-ins.telescope").init,
--     opts         = require("plug-ins.telescope").opts
--   },
-- }

-- local options = {
--   -- Enable automatically checking for plug-in updates.
--   checker = {
--     enabled = true,
--     frequency = 86400
--   }
-- }

-- require("lazy").setup(plugins, options)
