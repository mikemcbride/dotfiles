# telescope-mru.nvim

Project-wide recent file picker for Telescope

## Why?

I often find myself wanting to edit the same few files in a project. The default `oldfiles` picker finds files across all projects, which often times includes many files that are not relevant to me. I want to be able to search through a list of most recently used files within the current project, which is what this plugin provides.

## Requirements

- Neovim (>= 0.9.0)
- Telescope

## Installation

Install the plugin with your preferred package manager:

```
--lazy
{
    "mikemcbride/telescope-mru.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
}

-- packer
use {
    "mikemcbride/telescope-mru.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
}
```

## Setup and Configuration

You can configure the plugin like any other Telescope picker. You can see the available options below.

```
-- To get the plugin loaded and working with telescope,
-- you need to call load_extension somewhere after setup function:
require("telescope").load_extension "mru_files"
```

## Usage

You can use the `telescope-mru` plugin as follows:

```
vim.keymap.set("n", "<space>sr", ":Telescope mru_files<CR>")

-- Alternatively, using lua API
vim.keymap.set("n", "<space>sr", function()
	require("telescope").extensions.mru_files.mru_files({})
end)
```

### Options

The `mru_files` can take an options table. The default values are below:

```
{
    ignore = function(path, ext)
        return (string.find(path, "COMMIT_EDITMSG")) or (vim.tbl_contains(default_mru_ignore, ext))
    end,
    max_items = 50
}
```

- `ignore` is a function that takes a path and file extension and returns a boolean. It should return `true` if the file should be ignored from the list.
- `max_items` is the maximum number of items the picker should show. If omitted, it will default to 50.

<!-- vim: set ft=markdown: -->