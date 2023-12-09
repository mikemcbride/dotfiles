require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black", "isort" },
		go = { "gofmt", "goimports" },
	},
})
