return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls" }
				-- ensure_installed = { "lua_ls", "gopls", "pyright", "ts_ls" }
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.diagnostic.config({
				virtual_text = true,
				underline = true,
				update_in_insert = true,
				severity_sort = true,
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local servers = { "lua_ls" }
			for _, server in ipairs(servers) do
				vim.lsp.config(server, { capabilities = capabilities })
				vim.lsp.enable(server)
			end

			vim.api.nvim_create_autocmd('LspAttach', {
				callback = function(args)
					local opts = { buffer = args.buf }
					vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
					vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
				end
			})
		end
	}
}
