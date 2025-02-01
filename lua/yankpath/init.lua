local Yank = {}

local function reg(expr)
  return function()
    vim.fn.setreg('+', vim.fn.expand(expr))
  end
end

Yank.path = reg('%:.')
Yank.absolute_path = reg('%')
Yank.filename = reg('%:t:r')
Yank.filename_with_ext = reg('%:t')

Yank._initialized = false

Yank.setup = function(opts)
  if Yank._initialized then
    return
  end

  Yank._initialized = true

  opts = opts or {}
  Yank.keymaps = opts.keymaps or {
    path = "yp",
    absolute_path = "ypa",
    filename = "ypf",
    filename_with_ext = "ypx",
  }

  for key, value in pairs(Yank.keymaps) do
    vim.keymap.set('n', value, Yank[key], {
      desc = "Yank current file's " ..key:gsub('_', ' '),
      noremap = true,
      silent = true
    })
  end
end

return Yank
