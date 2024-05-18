return {
  "ojroques/nvim-osc52",
  opts = function(_, _)
    local function copy(lines, _)
      require('osc52').copy(table.concat(lines, '\n'))
    end
    local function paste()
      require { vim.fn.split(vim.fn.getreg(''), '\n'), vim.fn.getregtype('') }
    end
    vim.g.clipboard = {
      name = 'osc52',
      copy = { ['+'] = copy, ['*'] = copy },
      paste = { ['+'] = paste, ['*'] = paste },
    }
  end,
  -- opts = function(_, _)
  --   function copy()
  --     if vim.v.event.operator == 'y' and vim.v.event.regname == '+' then
  --       require('osc52').copy_register('+')
  --     end
  --   end
  --
  --   vim.api.nvim_create_autocmd('TextYankPost', { callback = copy })
  -- end,
}
