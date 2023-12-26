
return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {})
      vim.keymap.set('n', '<leader>ft', builtin.colorscheme, {})
      vim.keymap.set('n', '<C-f>', builtin.live_grep, {}) --Live grep
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
            -- This is your opts table
        require("telescope").setup ({
          extensions = {
            ["ui-select"] = {
              require("telescope.themes").get_dropdown {
              }
            }
          }
        })
        require("telescope").load_extension("ui-select")
    end
  }
}
