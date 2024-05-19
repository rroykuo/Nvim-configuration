return {
    "nvim-treesitter/nvim-treesitter",
    -- ensure these language parsers are installed
    opts = {
        -- ensure_installed = {
        -- 	"bash",
        -- 	"c",
        -- 	"cmake",
        -- 	"cpp",
        -- 	"cuda",
        -- 	"dockerfile",
        -- 	"gitignore",
        -- 	"lua",
        -- 	"make",
        -- 	"markdown",
        -- 	"markdown_inline",
        -- 	"python",
        -- 	"yaml",
        -- },
        -- auto_install = true,
        highlight = {
            enable = true,
        },
        autopairs = {
            enable = true,
        },
        indent = {
            enable = true,
        },
        context_commetstring = {
            enable = true,
        },
        -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
        disable = function(_, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
    },
}
