return {
	{
		'nvim-telescope/telescope.nvim',
		version = '*',
		dependencies = {
			'nvim-lua/plenary.nvim',
			-- optional but recommended
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		},
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>" },
		}
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup {
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown {
						}
					}
				}
			}
			require("telescope").load_extension("ui-select")
		end
	}
}

