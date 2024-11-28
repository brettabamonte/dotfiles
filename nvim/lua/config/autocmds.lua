-- Commands for spacing in tsx and ts files
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	command = "setlocal shiftwidth=2 tabstop=2"
})
