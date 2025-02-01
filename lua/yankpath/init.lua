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
    path = "<leader>yp",
    absolute_path = "<leader>ypa",
    filename = "<leader>ypf",
    filename_no_ext = "<leader>ypfx",
  }

  for name, key in pairs(Yank.keymaps) do
    vim.api.nvim_set_keymap('n', key, ":lua require'yankpath'." .. name .. "()<CR>", {
      noremap = true,
      silent = true
    })
  end
end

Yank.setup()

return Yank
