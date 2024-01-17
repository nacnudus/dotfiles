require("oil").setup()

-- oil.nvim breaks :GBrowse from vim-fugitive and vim-rhubarb, so we define our
-- own :Browse command as it suggests.
-- https://vi.stackexchange.com/a/43348
vim.api.nvim_create_user_command(
  'Browse',
  function (opts)
    vim.fn.system { 'xdg-open', opts.fargs[1] }
  end,
  { nargs = 1 }
)
