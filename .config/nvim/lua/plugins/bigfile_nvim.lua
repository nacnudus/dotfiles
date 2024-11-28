-- default config
require("bigfile").setup {
  filesize = 1, -- size of the file in MiB, the plugin round file sizes to the closest MiB
  -- pattern = { "*" }, -- autocmd pattern or function see <### Overriding the detection of big files>
  pattern = function(bufnr, filesize_mib)
    local filetype = vim.filetype.match({ buf = bufnr })
    if filetype == "json" then
      -- you can't use `nvim_buf_line_count` because this runs on BufReadPre
      local file_contents = vim.fn.readfile(vim.api.nvim_buf_get_name(bufnr))
      local file_length = #file_contents
      if file_length > 5000 then
        return true
      end
    end
  end,
  features = { -- features to disable
    -- "indent_blankline",
    -- "illuminate",
    -- "lsp",
    "treesitter"
    -- "syntax",
    -- "matchparen",
    -- "vimopts",
    -- "filetype",
  },
}
