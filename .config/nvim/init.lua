-- Nvim plugins
require("Kojjan.plugins-setup")     -- Setup packages with packer

-- Core --
require("Kojjan.core.options")      -- Vim options
require("Kojjan.core.keymaps")      -- All keybinds
require("Kojjan.core.colorscheme")  -- Colors
require("Kojjan.core.reload")       -- Lua script for reloading configs live in nvim
require("Kojjan.core.syntax")       -- Syntax highlighting --

-- LSP --
require("Kojjan.LSP.nvim-cmp")      -- 
require("Kojjan.LSP.lspconfig")     -- LSP / Mason / Mason-configs
require("Kojjan.LSP.nvim-lint")     -- Linter
require("Kojjan.LSP.formatter")     -- Formatting code
require("Kojjan.LSP.codeaction")    -- Code actions with git-delta
require("Kojjan.LSP.completions")   -- VSCode like code snippets / completions
require("Kojjan.LSP.copilot")       -- Copilot, need to authenticate

-- Plugins --
require("Kojjan.plugins.telescope") -- Telescope fuzzy find
require("Kojjan.plugins.nvim-tree") -- Tree like explorer
require("Kojjan.plugins.lualine")   -- Statusline
require("Kojjan.plugins.colorizer") -- Colors
require("Kojjan.plugins.indent")    -- Automatic indentation
require("Kojjan.plugins.notify")    -- Notifications

-- LeetCode --
require("Kojjan.LeetCode.leetcode") -- LeetCode problems
