# noti.nvim

The neovim plugin that makes the editing process of noti layout files more pleasant.

## Features

- **File type detection**
- **Highlight**
- **Folds**
- **Indents**
- **Commentaries**

## Usage

Put the plugin name in your favorite plugin manager - "noti-rs/noti.nvim".

For `lazy.nvim`:

```lua
{
  "noti-rs/noti.nvim",
  build = "python3 clone_queries.py",
  opts = {},
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    -- Optional
    "numToStr/Comment.nvim",
  }
}
```

And then install the tree-sitter parser using `nvim-treesitter`: `:TSInstall noti`.

> [!NOTE]
> Recommended to update tree-sitter by `:TSUpdate noti` command when the `noti.nvim` plugin
> updates. It should avoid any problems with tree-sitter parser.

## Contributing

Want to improve the plugin? Open a new Pull Request with your feature!
