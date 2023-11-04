local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("Packer require erro")
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use { "vim-scripts/ReplaceWithRegister" }
  use { "wbthomason/packer.nvim" } -- Have packer manage itself
  use { "nvim-lua/popup.nvim" }    -- An implementation of the Popup API from vim in Neovim
  use { "nvim-lua/plenary.nvim" }  -- Useful lua functions used ny lots of plugins
  use { "windwp/nvim-autopairs" }  -- Autopairs, integrates with both cmp and treesitter
  use { 'tpope/vim-dispatch', opt = true, cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } }
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && npm install', cmd = 'MarkdownPreview' }
  use { "kyazdani42/nvim-web-devicons", commit = "563f3635c2d8a7be7933b9e547f7c178ba0d4352" }
  use { "kyazdani42/nvim-tree.lua", commit = "7282f7de8aedf861fe0162a559fc2b214383c51c" }
  -- use { "akinsho/bufferline.nvim", commit = "83bf4dc7bff642e145c8b4547aa596803a8b4dc4" }
  use { 'romgrk/barbar.nvim' }
  use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }
  use { "nvim-lualine/lualine.nvim", commit = "a52f078026b27694d2290e34efa61a6e4a690621" }
  use { "lewis6991/gitsigns.nvim" }
  use { "numToStr/Comment.nvim", commit = "97a188a98b5a3a6f9b1b850799ac078faa17ab67" }
  use { "JoosepAlviste/nvim-ts-context-commentstring", commit = "4d3a68c41a53add8804f471fcc49bb398fe8de08" }
  use { "mfussenegger/nvim-dap-python" }
  use { "lukas-reineke/indent-blankline.nvim" }
  -- use { "mg979/vim-visual-multi" }
  use { "yamatsum/nvim-cursorline" }
  use {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
    config = function()
      require("venv-selector").setup({
        -- Your options go here
        -- name = "venv",
        -- auto_refresh = false
      })
    end,
  }
  use { 'ojroques/nvim-bufdel' }

  -- nolorschemes
  use { 'lunarvim/colorschemes' } -- a bunche of colorshemes
  use { 'folke/tokyonight.nvim' }
  use { "ellisonleao/gruvbox.nvim" }
  use { "ChristianChiarulli/onedark.nvim" }
  use { "lunarvim/darkplus.nvim", commit = "13ef9daad28d3cf6c5e793acfc16ddbf456e1c83" }
  use "rebelot/kanagawa.nvim"
  use { "catppuccin/nvim", as = "catppuccin" }
  use "EdenEast/nightfox.nvim" -- Packer
  use { "Mofiqul/dracula.nvim" }
  use { "bartekprtc/gruv-vsassist.nvim" }
  use { 'sainnhe/sonokai' }
  use({
    "neanias/everforest-nvim",
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require("everforest").setup()
    end,
  })

  -- cmp plugins
  use "hrsh7th/nvim-cmp"         -- The completion plugin
  use "hrsh7th/cmp-buffer"       -- buffer completions
  use "hrsh7th/cmp-path"         -- path completions
  use "hrsh7th/cmp-cmdline"      -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use { "akinsho/toggleterm.nvim", commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda" }

  -- snippets
  use "L3MON4D3/LuaSnip"             --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig"             -- enable LSP
  use "williamboman/mason.nvim"           -- simple to use language server installer
  use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
  use 'jose-elias-alvarez/null-ls.nvim'   -- LSP diagnostics and code actions

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-media-files.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    commit = "226c1475a46a2ef6d840af9caa0117a439465500",
  }
  use { "folke/which-key.nvim" }
  use { "goolord/alpha-nvim" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
