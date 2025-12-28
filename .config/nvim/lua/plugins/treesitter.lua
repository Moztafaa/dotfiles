return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	-- Use LazyVim's built-in config and just provide opts to merge.
	-- This avoids requiring the module before it's available in some launch contexts (e.g., LazyGit).
	opts = {
		auto_install = true,
		sync_install = false,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = { enable = true },
		textobjects = {
			move = {
				enable = true,
				set_jumps = true,
				goto_next_start = {
					["]m"] = "@function.outer",
					["]c"] = "@class.outer",
				},
				goto_next_end = {
					["]M"] = "@function.outer",
					["]C"] = "@class.outer",
				},
			},
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["am"] = "@function.outer",
					["im"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
					["ib"] = "@block.inner",
					["ab"] = "@block.outer",
					["iP"] = "@parameter.inner",
					["aP"] = "@parameter.outer",
				},
			},
		},
	},
}
