vim.cmd('set runtimepath^=~/.vim runtimepath+=~/.vim/after')
vim.cmd('let &packpath = &runtimepath')
vim.cmd('source ~/.vimrc')

vim.cmd('set inccommand=split " show substitute commands interactively')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {}

table.insert(
    plugins,
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {"nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
        lazy = false,
        opts = {
            filesystem = {
                hijack_netrw_behavior = "open_default",
                filtered_items = {
                    visible = true,
                }
            },
        },
    }
)

table.insert(plugins, { "dense-analysis/ale" })
table.insert(plugins, { "neoclide/coc.nvim", branch = "release" })
table.insert(plugins, { "junegunn/fzf" })
table.insert(plugins, { "junegunn/fzf.vim" })
table.insert(plugins, { "maximbaz/lightline-ale" })
table.insert(plugins, { "itchyny/lightline.vim" })
table.insert(plugins, { "dense-analysis/ale" })
table.insert(plugins, { "arnaud-lb/vim-php-namespace" })
table.insert(plugins, { "adoy/vim-php-refactoring-toolbox" })
table.insert(plugins, { "sheerun/vim-polyglot" })
table.insert(plugins, { "ludovicchabant/vim-gutentags" })
table.insert(plugins, { "honza/vim-snippets" })
table.insert(plugins, { "tpope/vim-fugitive" })
table.insert(plugins, { "tpope/vim-rhubarb" })
table.insert(plugins, { "SirVer/ultisnips" })
table.insert(plugins, { "jiangmiao/auto-pairs" })
table.insert(
    plugins,
    {
        "mfussenegger/nvim-dap-python",
        dependencies = { "mfussenegger/nvim-dap" },
    }
)

table.insert(
    plugins,
    {
        "maxmx03/solarized.nvim",
        lazy = false,
        priority = 1000,
        config = function()
          vim.o.background = 'light' -- or 'dark'

          vim.cmd.colorscheme 'solarized'
        end,
    }
)

table.insert(
    plugins,
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/neotest-python",
            "olimorris/neotest-phpunit",
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-python"),
                    require("neotest-phpunit"),
                },
            })
        end
    }
)

require("lazy").setup(plugins)

  -- Test running (neotest)
  vim.keymap.set('n', '<Leader>t', function()
    require("neotest").run.run()
  end, { silent = true })
  vim.keymap.set('n', '<Leader>ta', function()
    require("neotest").run.run(vim.fn.expand('%'))
  end, { silent = true })

  vim.keymap.set('n', '<Leader>to', function()
    require("neotest").output.open()
  end, { silent = true })
  vim.keymap.set('n', '<Leader>ts', function()
    require("neotest").summary.toggle()
  end, { silent = true })

