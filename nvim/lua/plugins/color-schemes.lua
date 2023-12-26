return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      -- vim.cmd([[colorscheme catppuccin]])
    end
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    name = "kanagawa",
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme kanagawa]])
    end
  },
  {
    "morhetz/gruvbox",
    lazy = false,
    name = "gruvbox",
    priority = 1000,
    config = function()
      -- vim.cmd([[colorscheme gruvbox]])
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    name = "tokionight",
    priority = 1000,
    config = function()
      -- vim.cmd([[colorscheme gruvbox]])
    end
  },
}
