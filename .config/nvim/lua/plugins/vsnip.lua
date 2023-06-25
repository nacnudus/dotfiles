-- NOTE: You can use other key to expand snippet.

-- Expand
vim.keymap.set(
	'i', '<C-j>',
	function()
		return require 'vsnip'.expandable()
			and '<Plug>(vsnip-expand)'
	end,
	{ expr = true }
)
vim.keymap.set(
	's', '<C-j>',
	function()
		return require 'vsnip'.expandable()
			and '<Plug>(vsnip-expand)'
	end,
	{ expr = true }
)

-- Expand or jump
vim.keymap.set(
	'i', '<C-l>',
	function()
		return require 'vsnip'.available()
			and '<Plug>(vsnip-expand-or-jump)'
	end,
	{ expr = true }
)
vim.keymap.set(
	's', '<C-l>',
	function()
		return require 'vsnip'.available()
			and '<Plug>(vsnip-expand-or-jump)'
	end,
	{ expr = true }
)

-- Jump forward or backward
vim.keymap.set(
	'i', '<Tab>',
	function()
		return require 'vsnip'.jumpable()
			and '<Plug>(vsnip-jump-next)'
	end,
	{ expr = true }
)
vim.keymap.set(
	's', '<Tab>',
	function()
		return require 'vsnip'.jumpable()
			and '<Plug>(vsnip-jump-next)'
	end,
	{ expr = true }
)
vim.keymap.set(
	'i', '<S-Tab>',
	function()
		return require 'vsnip'.jumpable()
			and '<Plug>(vsnip-jump-prev)'
	end,
	{ expr = true }
)
vim.keymap.set(
	's', '<S-Tab>',
	function()
		return require 'vsnip'.jumpable()
			and '<Plug>(vsnip-jump-prev)'
	end,
	{ expr = true }
)
