return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" }, -- Required
		{
			"williamboman/mason.nvim",
			build = function()
				pcall(vim.cmd, "MasonUpdate")
			end,
		}, -- Optional
		{ "williamboman/mason-lspconfig.nvim" }, -- Optional

		-- Autocompletion
		{ "hrsh7th/nvim-cmp" }, -- Required
		{ "hrsh7th/cmp-nvim-lsp" }, -- Required
		{ "hrsh7th/cmp-buffer" }, -- Optional
		{ "hrsh7th/cmp-path" }, -- Optional
		{ "saadparwaiz1/cmp_luasnip" }, -- Optional
		{ "hrsh7th/cmp-nvim-lua" }, -- Optional

		-- Snippets
		{ "L3MON4D3/LuaSnip" }, -- Required
		{ "rafamadriz/friendly-snippets" }, -- Optional
	},
	config = function()
		local lsp = require("lsp-zero")
		local cmp = require("cmp")
		lsp.preset("recommended")
		require("mason").setup({ ui = { border = "rounded" } })
		lsp.nvim_workspace()
		lsp.setup()
		lsp.setup_nvim_cmp({
			preselect = "none",
			completion = {
				completeopt = "menu,menuone,noinsert,noselect",
			},
		})

		cmp.setup({
			mapping = {
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			},
		})
		require("lspconfig.ui.windows").default_options.border = "rounded"
	end,
}
