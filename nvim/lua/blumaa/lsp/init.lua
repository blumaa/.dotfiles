local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("blumaa.lsp.lsp-installer")
require("blumaa.lsp.null-ls")
require("blumaa.lsp.handlers").setup()

