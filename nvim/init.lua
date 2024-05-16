-- -----------------------------------------------------------------------------
-- General
-- -----------------------------------------------------------------------------
vim.g.is_posix = true

vim.opt.mouse       = "a"
vim.opt.swapfile    = false
vim.opt.writebackup = false
vim.opt.syntax      = "on"
vim.opt.backup      = false
vim.opt.undodir     = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile    = true

-- -----------------------------------------------------------------------------
-- Miscellaneous
-- -----------------------------------------------------------------------------

-- Case only matters with mixed case expressions.
vim.opt.ignorecase = true
vim.opt.smartcase  = true

-- -----------------------------------------------------------------------------
-- Spacing
-- -----------------------------------------------------------------------------
vim.opt.expandtab   = true
vim.opt.shiftwidth  = 2
vim.opt.softtabstop = 2
vim.opt.tabstop     = 2
vim.opt.smartindent = true
vim.opt.wrap        = false

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
local plugins = {
  -- ------------------
  -- LSP configurations
  -- ------------------
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "j-hui/fidget.nvim",
    },
    config = function()
      local cmp = require('cmp')
      local cmp_lsp = require("cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
          "force",
          {},
          vim.lsp.protocol.make_client_capabilities(),
          cmp_lsp.default_capabilities())

      require("fidget").setup({})
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "gopls",
        },
        handlers = {
          function(server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {
              capabilities = capabilities
            }
          end,

          ["lua_ls"] = function()
              local lspconfig = require("lspconfig")
              lspconfig.lua_ls.setup {
                capabilities = capabilities,
                settings = {
                  Lua = {
                    runtime = { version = "Lua 5.1" },
                    diagnostics = {
                      globals = {
                        "vim",
                        "it",
                        "describe",
                        "before_each",
                        "after_each"
                      },
                    }
                  }
                }
              }
          end,
        }
      })

      local cmp_select = { behavior = cmp.SelectBehavior.Select }

      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- For luasnip users.
        }, {
          { name = 'buffer' },
        })
      })

      vim.diagnostic.config({
        -- update_in_insert = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })
    end
  },

  -- -----------
  -- File finder
  -- -----------
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    config = function()
      require('telescope').setup({})

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
      vim.keymap.set('n', '<C-p>', builtin.git_files, {})
      vim.keymap.set('n', '<leader>pws', function()
        local word = vim.fn.expand("<cword>")
        builtin.grep_string({ search = word })
      end)
      vim.keymap.set('n', '<leader>pWs', function()
        local word = vim.fn.expand("<cWORD>")
        builtin.grep_string({ search = word })
      end)
      vim.keymap.set('n', '<leader>ps', function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end)
      vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
    end
  },

  -- -----------
  -- Tree Sitter
  -- -----------
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        -- A list of parser names, or "all"
        ensure_installed = {
          "vimdoc",
          "c",
          "lua",
          "rust",
          "elixir",
          "erlang",
          "jsdoc",
          "bash",
        },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don"t have `tree-sitter`
        -- CLI installed locally
        auto_install = true,

        indent = {
          enable = true
        },

        highlight = {
          -- `false` will disable the whole extension
          enable = true,

          -- Setting this to true will run `:h syntax` and tree-sitter
          -- at the same time. Set this to `true` if you depend on
          -- "syntax" being enabled (like for indentation). Using this
          -- option may slow down your editor, and you may see some
          -- duplicate highlights. Instead of true it can also be a
          -- list of languages
          additional_vim_regex_highlighting = { "markdown" },
        },
      })

      local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      treesitter_parser_config.templ = {
        install_info = {
          url = "https://github.com/vrischmann/tree-sitter-templ.git",
          files = {"src/parser.c", "src/scanner.c"},
          branch = "master",
        },
      }

      vim.treesitter.language.register("templ", "templ")
    end
  },
}

local options = {
  -- Enable automatically checking for plug-in updates.
  checker = {
    enabled = true,
    frequency = 86400
  }
}

require("lazy").setup(plugins, options)
