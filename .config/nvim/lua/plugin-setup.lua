require 'nvim-web-devicons'.setup {
  default = true,
}

require('hurl').setup {}

require("aerial").setup {}

require('lualine').setup {
  extensions = { 'quickfix', 'aerial', 'fugitive' }
}

require('hologram').setup {
  auto_display = false -- WIP automatic markdown image display, may be prone to breaking
}

require('luasnip').setup {}
require("luasnip.loaders.from_vscode").lazy_load()

require 'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}

require 'treesitter-context'.setup {}

require('gitsigns').setup()
require("screenkey").setup(
  {
    win_opts = {
      -- row = vim.o.lines - vim.o.cmdheight - 1,
      row = vim.o.cmdheight - 1,
      col = vim.o.columns - 1,
      relative = "editor",
      anchor = "SE",
      width = 40,
      height = 3,
      border = "single",
    },
  }
)

require("trouble").setup()

local cmp = require('cmp')

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'luasnip', keyword_length = 2 },
    { name = 'buffer',  keyword_length = 3 },
  },
  mapping = {
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
      -- You need Neovim v0.10 to use vim.snippet
      --vim.snippet.expand(args.body)
    end,
  },
})


-- empty setup using defaults
require("nvim-tree").setup()

local actions = require("telescope.actions")
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
      file_ignore_patterns = { 'node_modules', '.git' }
    },
    live_grep = {
      hidden = true
    },
    file_browser = {
      hidden = true
    }
  },
}

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.tf", "*.tfvars" },
  callback = function() vim.lsp.buf.format() end,
})
