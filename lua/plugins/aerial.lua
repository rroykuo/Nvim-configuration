return {
    "stevearc/aerial.nvim",
    opts = {
        disable_max_lines = 20000, -- 20k lines
        disable_max_size = 10000000, -- 10 MB file
        backends = { "treesitter", "lsp", "markdown", "man" },
    },
}
