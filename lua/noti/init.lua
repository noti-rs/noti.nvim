local M = {}

function M.setup()
  vim.filetype.add {
    extension = {
      noti = "noti"
    }
  }

  local set_comment, ft = pcall(require, "Comment.ft")
  if set_comment then
    ft.set("noti", {"//%s", "/*%s*/"})
  end

  local noti_group = vim.api.nvim_create_augroup("Noti", {})
  vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    group = noti_group,
    pattern = { "*.noti" },
    desc = "Creates the specific commentstring for .noti filetype",
    callback = function(data)
      if not set_comment then
        vim.api.nvim_set_option_value("commentstring", "//%s", { buf = data.buf })
      end

      vim.treesitter.start(data.buf, "noti")
    end,
  })

  ---@class ParserInfo[]
  local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
  parser_config.noti = {
    install_info = {
      url = "https://github.com/noti-rs/tree-sitter-noti",
      files = { "src/parser.c", "src/scanner.c" },
      branch = "main",
      filetype = "noti",
    },
  }

  local queries = require("noti.queries")
  for name, text in pairs(queries) do
    vim.treesitter.query.set("noti", name, text)
  end
end

return M
