local hl = require("actions-preview.highlight")

require("actions-preview").setup {
    diff = {
        ignore_whitespace = true,
    },

    -- Use of highlighter, highlighting diffs --
    highlight_command = {
        hl.delta("delta --no-gitconfig --side-by-side")
        -- hl.diff_so_fancy()
        -- hl.diff_highlight()
    },

    -- Priority list of preferred backend --
    backend = { "telescope" },

    -- Options related to telescope.nvim window --
    telescope = {
        sorting_strategy = "ascending",
        layout_strategy = "vertical",
        layout_config = {
            width = 0.8,
            height = 0.9,
            prompt_position = "top",
            preview_cutoff = 20,
            preview_height = function(_, _, max_lines)
                return max_lines - 10
            end,
        },
    },
}
