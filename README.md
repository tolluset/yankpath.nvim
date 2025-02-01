## Overview

`yankpath` is a simple NeoVim plugin for yank path or filename. You can use [without installation](https://github.com/tolluset/yankpath.nvim#without-installation), just add keymaps to it.

## Features

- `yp`: yank relative path
- `ypa`: yank absolute path
- `ypf`: yank filename
- `ypfx`: yank filename without extension

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
        path = "yrp", -- e.g.) change from yp to yrp
        absolute_path = "yrpa",
        filename = "yrf",
        filename_no_ext = "yrfx",
      }
    })
  end
}
```

## Without Installation

Add keymaps directly.

e.g.) lazy.nvim

```lua
local map = LazyVim.safe_keymap_set

map("n", "yp", ':let @+ = expand("%:.")<CR>', { desc = "Yank current files's path" })
map("n", "ypa", ':let @+ = expand("%")<CR>', { desc = "Yank current file's absolute path" })
map("n", "ypf", ':let @+ = expand("%:t")<CR>', { desc = "Yank current file's filename" })
map("n", "ypfx", ':let @+ = expand("%:t:r")<CR>', { desc = "Yank current file's filename no ext" })
```
