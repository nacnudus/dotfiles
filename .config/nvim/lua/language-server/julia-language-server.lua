-- Install:
-- julia --project=~/.julia/environments/nvim-lspconfig -e 'using Pkg; Pkg.add("LanguageServer")'
--
-- Update:
-- julia --project=~/.julia/environments/nvim-lspconfig -e 'using Pkg; Pkg.update()'
--
-- Instantiate a project so that the server can see it
-- julia --project=/path/to/my/project -e 'using Pkg; Pkg.instantiate()'
require'lspconfig'.julials.setup { on_attach = On_attach }
