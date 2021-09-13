-- pip install jedi-language-server
require'lspconfig'.jedi_language_server.setup{ 
	on_attach = On_attach,
	cmd = { "/home/nacnudus/.virtualenvs/neovim-python3/bin/jedi-language-server" }
}
