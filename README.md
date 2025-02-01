## Overview

`yankpath` is a simple NeoVim plugin for yank path or filename. You can use without installation, just add keymaps to it.

## Features

- `<leader>yp`: yank relative path
- `<leader>ypa`: yank absolute path
- `<leader>ypf`: yank filename
- `<leader>ypfx`: yank filename without extension

## Installation

- lazy.nvim

```lua
return {
  "tolluset/yankpath.nvim",
}
```

- packer

```lua
use "tolluset/yankpath.nvim"
```

## Keymaps

If the keymaps conflict, you can swap them out as shown below.

```lua
return {
  "tolluset/yankpath.nvim",
  config = function()
    require('yankpath').setup({
      keymaps = {
        path = "<leader>yrp", -- e.g.) change from yp to yrp
        absolute_path = "<leader>yrpa",
        filename = "<leader>yrf",
        filename_no_ext = "<leader>yrfx",
      }
    })
  end
}
```

## Without Installation

```lua
map("n", "<leader>yp", ':let @+ = expand("%:.")<CR>', { desc = "Yank current files's path" })
map("n", "<leader>ypa", ':let @+ = expand("%")<CR>', { desc = "Yank current file's absolute path" })
map("n", "<leader>ypf", ':let @+ = expand("%:t")<CR>', { desc = "Yank current file's filename" })
map("n", "<leader>ypfx", ':let @+ = expand("%:t:r")<CR>', { desc = "Yank current file's filename no ext" })
```
