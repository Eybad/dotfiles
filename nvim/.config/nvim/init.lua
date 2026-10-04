-- ~/.config/nvim/init.lua

-- 1. Opciones básicas y Tecla Leader (Espacio)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
-- Portapapeles del sistema desactivado intencionalmente

-- 2. Bootstrap de lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- 3. Configuración de Plugins
require("lazy").setup({
  -- Explorador de archivos (Oil)
  {
    "stevearc/oil.nvim",
    opts = {},
    keys = { { "-", "<cmd>Oil<cr>", desc = "Abrir directorio padre" } },
  },

  -- Git (Marcas en la columna de línea)
  {
    "lewis6991/gitsigns.nvim",
    opts = {},
  },

  -- Buscador (Telescope)
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Buscar archivos" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Buscar texto" },
    },
  },

  -- Tree-sitter (Resaltado de sintaxis)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      -- API nueva (reescritura 2025): setup() solo acepta install_dir.
      -- Los parsers se instalan con install(); el resaltado es nativo de Neovim.
      local ts = require("nvim-treesitter")
      local wanted = { "c", "lua", "vim", "vimdoc", "python", "bash" }
      local installed = ts.get_installed()
      local missing = vim.iter(wanted):filter(function(l)
        return not vim.tbl_contains(installed, l)
      end):totable()
      if #missing > 0 then
        ts.install(unpack(missing))
      end
    end,
  },

  -- Autocompletado (Cmp y Luasnip)
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_next_item() else fallback() end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_prev_item() else fallback() end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },

  -- LSP (Mason y servidores)
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        -- Dejamos Bash y Python en Mason. Sacamos Lua y C/C++.
        ensure_installed = { "bashls", "pyright" },
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      -- API nueva (nvim-lspconfig v2): vim.lsp.config + vim.lsp.enable
      -- 1. Servidores gestionados por Mason (bashls, pyright)
      -- 2. Servidores nativos de Termux (lua_ls, clangd)

      -- En Termux/Android los bins npm de Mason no ejecutan: su shebang
      -- "#!/usr/bin/env node" no resuelve (/usr/bin/env no existe en Android).
      -- Se invocan con node explicito sobre el symlink de mason/bin.
      local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
      local server_configs = {
        bashls = { cmd = { "node", mason_bin .. "/bash-language-server", "start" } },
        pyright = { cmd = { "node", mason_bin .. "/pyright-langserver", "--stdio" } },
        lua_ls = {},
        clangd = {},
      }
      for name, extra in pairs(server_configs) do
        extra.capabilities = capabilities
        vim.lsp.config(name, extra)
        vim.lsp.enable(name)
      end
    end,
  },
})

