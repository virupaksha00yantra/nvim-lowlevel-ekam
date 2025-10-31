return {
  "neanias/everforest-nvim",
  version = false,
  lazy = false, -- Load immediately
  priority = 1000, -- Load before other UI plugins
  config = function()
    require("everforest").setup({
      on_highlights = function(hl, palette)
        hl.DiagnosticError = { fg = palette.none, bg = palette.none, sp = palette.red }
        hl.DiagnosticWarn  = { fg = palette.none, bg = palette.none, sp = palette.yellow }
        hl.DiagnosticInfo  = { fg = palette.none, bg = palette.none, sp = palette.blue }
        hl.DiagnosticHint  = { fg = palette.none, bg = palette.none, sp = palette.green }
        hl.TSBoolean       = { fg = palette.purple, bg = palette.none, bold = true }
        hl.TSDanger        = {} -- optional, empty highlight
      end,
      background = "medium", -- soft, medium, hard
      transparent_background_level = 1,
      italics = true,
    })
    vim.cmd.colorscheme("everforest") -- Apply the theme
  end,
}
