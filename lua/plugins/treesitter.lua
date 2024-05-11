return {
	"nvim-treesitter/nvim-treesitter",
	-- ensure these language parsers are installed
	opts = {
		ensure_installed = {
			"bash",
			"c",
			"cmake",
			"cpp",
			"cuda",
			"dockerfile",
			"gitignore",
			"lua",
			"make",
			"markdown",
			"markdown_inline",
			"yaml",
		},
	},
}
