local Yank = {}

local function reg(expr)
  return function()
    vim.fn.setreg('+', vim.fn.expand(expr))
  end
end

Yank.path = reg('%:.')
Yank.absolute_path = reg('%')
Yank.filename = reg('%:t')
Yank.filename_no_ext = reg('%:t:r')

Yank.setup = function(opts)
  opts = opts or {}
  Yank.keymaps = opts.keymaps or {
    path = "<leader>yp",
    absolute_path = "<leader>ypa",
    filename = "<leader>ypf",
    filename_no_ext = "<leader>ypfx",
  }

  for name, key in pairs(Yank.keymaps) do
    vim.keymap.set('n', key, Yank[name], {
      desc = "Yank current file's " ..name:gsub('_', ''),
      noremap = true,
      silent = true
    })
  end
end

Yank.setup()

return Yank
