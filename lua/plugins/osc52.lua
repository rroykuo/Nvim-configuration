return {
  "ojroques/nvim-osc52",
  opts = function()
    local function copy()
      if vim.v.event.operator == 'y' and vim.v.event.regname == '+' then
        require('osc52').copy_register('+')
      end
    end

    vim.api.nvim_create_autocmd('TextYankPost', { callback = copy })
    vim.keymap.set('v', '<leader>y', require('osc52').copy_visual, { desc = "Copy to clipboard (OSC52)" })
  end,
}
