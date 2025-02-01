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
    filename_no_ext = "ypfx",
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
