return {
    "nvim-treesitter/nvim-treesitter",
    -- ensure these language parsers are installed
    opts = {
        highlight = {
            enable = true,
            disable = function(_, buf)
                local max_filesize = 10 * 1024 -- 10 KB
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                    return true
                end
            end,
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
    },
}
