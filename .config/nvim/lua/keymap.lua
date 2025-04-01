vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle<CR>')

-- Telescope
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>tg', builtin.git_files, { desc = 'Telescope find Git files' })
vim.keymap.set('n', '<leader>tf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>t/', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>tb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>th', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>tc', builtin.command_history, { desc = 'Telescope command history' })
vim.keymap.set('n', '<leader>tr', builtin.registers, { desc = 'Telescope vimregisters' })

vim.keymap.set('n', '<leader>tld', builtin.diagnostics, { desc = 'Telescope diagnostics' })
