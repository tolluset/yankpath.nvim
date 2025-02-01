## Overview

`yankpath` is a simple NeoVim plugin for yank path or filename. You can use it [without installation](https://github.com/tolluset/yankpath.nvim#without-installation) by directly adding keymaps.

## Features

- `yp`: yank relative path
- `ypa`: yank absolute path
- `ypf`: yank filename
- `ypx`: yank filename with extension

## Usage

```
-- full path: /Users/xxx/yyy/zzz.lua
-- current path: xxx

-- `yp`: yank relative path
yyy/zzz.lua

-- `ypa`: yank absolute path
/Users/xxx/yyy/zzz.lua

-- `ypf`: yank filename
zzz

-- `ypx`: yank filename with extension
zzz.lua
```

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

map("n", "yp", ':let @+ = expand("%:.")<CR>', { desc = "Yank current file's path" })
map("n", "ypa", ':let @+ = expand("%")<CR>', { desc = "Yank current file's absolute path" })
map("n", "ypf", ':let @+ = expand("%:t:r")<CR>', { desc = "Yank current file's filename" })
map("n", "ypx", ':let @+ = expand("%:t")<CR>', { desc = "Yank current file's filename with ext" })
```
