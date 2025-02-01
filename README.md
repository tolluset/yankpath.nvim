## Overview

`yankpath` is a simple NeoVim plugin for yank path or filename. You can use [without installation](https://github.com/tolluset/yankpath.nvim#without-installation), just add keymaps to it.

## Features

- `yp`: yank relative path
- `ypa`: yank absolute path
- `ypf`: yank filename
- `ypx`: yank filename with extension

## Installation

- lazy.nvim

```lua
return {
  "tolluset/yankpath.nvim",
  config = function ()
    require('yankpath').setup()
  end
}
```

- packer

```lua
use {
  "tolluset/yankpath.nvim",
  config = function ()
    require('yankpath').setup()
  end
}
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
        filename = "yrpf",
        filename_no_ext = "yrpx",
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
map("n", "ypx", ':let @+ = expand("%:t:r")<CR>', { desc = "Yank current file's filename with ext" })
```
