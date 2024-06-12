-- Auto install packer if not installed
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end
-- local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- Autocommand that reloads neovim and installs/updates/removes plugins when file is saved
vim.cmd([[ 
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
    augroup end
]])

-- Import packer safely --
local status, packer = pcall(require, "packer")
if not status then
    return
end

-- Plugins --
return packer.startup(function(use)
-- Let Packer manage itself
use("wbthomason/packer.nvim")

use("navarasu/onedark.nvim")        -- Dark theme
use("nvim-tree/nvim-tree.lua")      -- File explorer
use("nvim-tree/nvim-web-devicons")  -- VS-Code like icons
use("nvim-lualine/lualine.nvim")    -- Statusline
use("norcalli/nvim-colorizer.lua")  -- Colorizer

-- Syntax highlighting and indenting with tree-sitter --
use("nvim-treesitter/nvim-treesitter")

-- Telescope --
use("nvim-telescope/telescope.nvim")
use("nvim-lua/plenary.nvim")

-- Mason LSP manager
use("williamboman/mason.nvim")
use("williamboman/mason-lspconfig.nvim")
use("neovim/nvim-lspconfig")

-- Mason linter/formatter helpers --
use("mfussenegger/nvim-lint")
use("mhartington/formatter.nvim")

-- Auto completion --
use("hrsh7th/nvim-cmp")
use("hrsh7th/cmp-nvim-lsp")
use("L3MON4D3/LuaSnip")
use("saadparwaiz1/cmp_luasnip")
use("rafamadriz/friendly-snippets")

use("aznhe21/actions-preview.nvim")

-- Copilot --
use("github/copilot.vim")
use("zbirenbaum/copilot.lua")
use("zbirenbaum/copilot-cmp")

-- Go language support --
use("fatih/vim-go")

use("nmac427/guess-indent.nvim")

-- LeetCode --
use("kawre/leetcode.nvim")
use("MunifTanjim/nui.nvim")
use("rcarriga/nvim-notify")

-- if packer_bootstrap then;
--     require("packer").sync()
-- end
end)
