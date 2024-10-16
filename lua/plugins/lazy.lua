-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
    cmd = "Trouble",
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },
  -- override nvim-cmp and add cmp-emoji
  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = {
  --     "L3MON4D3/LuaSnip",
  --     "hrsh7th/cmp-buffer",
  --     "hrsh7th/cmp-cmdline",
  --     "hrsh7th/cmp-emoji",
  --     "hrsh7th/cmp-nvim-lsp",
  --     "hrsh7th/cmp-nvim-lua",
  --     "hrsh7th/cmp-path",
  --     "saadparwaiz1/cmp_luasnip",
  --   },
  --   config = function()
  --     local cmp = require("cmp")
  --     vim.opt.completeopt = { "menu", "menuone", "noselect" }
  --
  --     cmp.setup({
  --       snippet = {
  --         expand = function(args)
  --           require("luasnip").lsp_expand(args.body)
  --         end,
  --       },
  --
  --       window = {
  --         -- comletion = cmp.config.window.bordered(),
  --         -- documentation = cmp.config.window.bordered(),
  --       },
  --       sources = cmp.config.sources({
  --         { name = "nvim_lsp" },
  --         { name = "nvim_lua" },
  --         { name = "luasnip" },
  --         -- { name = "orgmode" },
  --       }, {
  --         { name = "buffer" },
  --         { name = "path" },
  --       }),
  --     })
  --
  --     cmp.setup.cmdline(":", {
  --       mapping = cmp.mapping.present.cmdline(),
  --       sources = cmp.config.sources({
  --         { name = "path" },
  --       }, {
  --         { name = "cmdline" },
  --       }),
  --     })
  --   end,
  --
  --   ---@param opts cmp.ConfigSchema
  --   opts = function(_, opts)
  --     table.insert(opts.sources, { name = "emoji" })
  --   end,
  -- },

  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },

  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
      },
    },
  },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },

  -- -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- -- would overwrite `ensure_installed` with the new value.
  -- -- If you'd rather extend the default config, use the code below instead:
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = function(_, opts)
  --     -- add tsx and treesitter
  --     vim.list_extend(opts.ensure_installed, {
  --       "tsx",
  --       "typescript",
  --     })
  --   end,
  -- },
  -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
  { import = "lazyvim.plugins.extras.lang.json" },
  --
  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "flake8",
        "shellcheck",
        "shfmt",
        "stylua",
      },
    },
  },
}
