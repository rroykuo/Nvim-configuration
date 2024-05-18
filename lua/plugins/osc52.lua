return {
  "ojroques/nvim-osc52",
  opts = function()
    local function copy(lines, _)
      require('osc52').copy(table.concat(lines, '\n'))
    end

    local function paste()
      return { vim.fn.split(vim.fn.getreg(''), '\n'), vim.fn.getregtype('') }
    end

    vim.g.clipboard = {
      name = 'osc52',
      copy = { ['+'] = copy, ['*'] = copy },
      paste = { ['+'] = paste, ['*'] = paste },
    }
    vim.keymap.set('v', '<leader>y', '"+y', { desc = "Copy to clipboard (OSC52)" })
  end,
}
