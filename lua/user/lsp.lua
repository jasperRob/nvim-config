local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
  local opts = {
	  automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
	  ui = {
		  icons = {
			  server_installed = "✓",
			  server_pending = "➜",
			  server_uninstalled = "✗"
		  }
	  }
  }
  server:setup(opts)
end)
