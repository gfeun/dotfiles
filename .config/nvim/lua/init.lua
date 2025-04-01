vim.opt.signcolumn = 'yes'

--vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require 'lsp'
require 'plugin-setup'
require 'keymap'
