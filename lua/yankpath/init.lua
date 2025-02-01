local Yank = {}

function Yank.path()
  vim.fn.setreg('+', vim.fn.expand('%:.'))
end

function Yank.absolute_path()
  vim.fn.setreg('+', vim.fn.expand('%'))
end

function Yank.filename()
  vim.fn.setreg('+', vim.fn.expand('%:t'))
end

function Yank.filename_no_ext()
  vim.fn.setreg('+', vim.fn.expand('%:t:r'))
end

function Yank.setup(opts)
  opts = opts or {}
  Yank.keymaps = opts.keymaps or {
    path = "<leader>yp",
    absolute_path = "<leader>ypa",
    filename = "<leader>ypf",
    filename_no_ext = "<leader>ypfx",
  }

  vim.keymap.set('n', Yank.keymaps.path, Yank.path, { desc = "Copy current file's relative path", noremap = true, silent = true })
  vim.keymap.set('n', Yank.keymaps.absolute_path, Yank.absolute_path, { desc = "Copy current file's absolute path", noremap = true, silent = true })
  vim.keymap.set('n', Yank.keymaps.filename, Yank.filename, { desc = "Copy current file name", noremap = true, silent = true })
  vim.keymap.set('n', Yank.keymaps.filename_no_ext, Yank.filename_no_ext, { desc = "Copy current file name without extension", noremap = true, silent = true })
end

return Yank
