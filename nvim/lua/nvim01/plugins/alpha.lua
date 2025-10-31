return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
[[                                                                ]],
[[ ██╗   ██╗ █████╗ ██████╗ ██╗ ██████╗    ██╗   ██╗██╗███╗   ███╗]],
[[ ██║   ██║██╔══██╗██╔══██╗██║██╔════╝    ██║   ██║██║████╗ ████║]],
[[ ██║   ██║███████║██║  ██║██║██║         ██║   ██║██║██╔████╔██║]],
[[ ╚██╗ ██╔╝██╔══██║██║  ██║██║██║         ╚██╗ ██╔╝██║██║╚██╔╝██║]],
[[  ╚████╔╝ ██║  ██║██████╔╝██║╚██████╗     ╚████╔╝ ██║██║ ╚═╝ ██║]],
[[   ╚═══╝  ╚═╝  ╚═╝╚═════╝ ╚═╝ ╚═════╝      ╚═══╝  ╚═╝╚═╝     ╚═╝]],
[[                                                                ]],
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "􀣘   New File", "<cmd>ene<CR>"),
      dashboard.button("SPC ee", "􀈖   Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("SPC ff", "􀡢   Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs", "􁢏   Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("SPC wr", "􂅠   Restore Session ", "<cmd>SessionRestore<CR>"),
      dashboard.button("q", "􀑧   Quit NVIM", "<cmd>qa<CR>"),
    }

    vim.api.nvim_set_hl(0, "MyBanner", { fg = "#E69875", bold = true })

    -- Assign highlight to header
    dashboard.section.header.opts.hl = "MyBanner"

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
