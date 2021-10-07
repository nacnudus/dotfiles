require('neoclip').setup({
  default_register = { '"', '+', '*' },
  enable_persistant_history = true,
  keys = {
    i = {
      select = '<cr>',
      paste = '<c-y>',
      paste_behind = '<c-b>',
      custom = {},
    },
    n = {
      select = '<cr>',
      paste = 'p',
      paste_behind = 'P',
      custom = {},
    },
  },
})
