return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- ===============================
    -- Everforest hard dark + transparent editor
    -- ===============================
    require("everforest").setup({
      background = "hard",
      transparent_background_level = 1,
      italics = true,
      disable_italic_comments = false,
    })
    vim.cmd([[colorscheme everforest]])

    -- Transparent background for editor
    vim.cmd([[
      hi Normal guibg=NONE ctermbg=NONE
      hi NormalNC guibg=NONE ctermbg=NONE
      hi SignColumn guibg=NONE ctermbg=NONE
      hi LineNr guibg=NONE ctermbg=NONE
      hi EndOfBuffer guibg=NONE ctermbg=NONE
    ]])

    -- ===============================
    -- LSP Diagnostics function
    -- ===============================
    local function lsp_status()
      local diagnostics = vim.diagnostic.get(0)
      local counts = { E = 0, W = 0, H = 0, I = 0 }
      for _, d in ipairs(diagnostics) do
        if d.severity == vim.diagnostic.severity.ERROR then
          counts.E = counts.E + 1
        elseif d.severity == vim.diagnostic.severity.WARN then
          counts.W = counts.W + 1
        elseif d.severity == vim.diagnostic.severity.HINT then
          counts.H = counts.H + 1
        elseif d.severity == vim.diagnostic.severity.INFO then
          counts.I = counts.I + 1
        end
      end

      local icons = {
        E = "􀁡",
        W = "􀇿",
        I = "􀅵",
        H = "􀋨",
      }

      local result = ""
      for _, key in ipairs({ "E", "W", "I", "H" }) do
        local v = counts[key]
        if v > 0 then
          result = result .. "%#" .. key .. "Color#" .. icons[key] .. ":" .. v .. " "
        end
      end
      return result
    end

    -- Define highlight groups for diagnostics
    vim.api.nvim_set_hl(0, "EColor", { fg = "#E67E80", bg = "NONE" })
    vim.api.nvim_set_hl(0, "WColor", { fg = "#DBBC7F", bg = "NONE" })
    vim.api.nvim_set_hl(0, "IColor", { fg = "#7FBBB3", bg = "NONE" })
    vim.api.nvim_set_hl(0, "HColor", { fg = "#D699B6", bg = "NONE" })

    -- ===============================
    -- Lazy plugin pending updates
    -- ===============================
    local lazy_status = require("lazy.status")

    -- ===============================
    -- Setup lualine
    -- ===============================
    require("lualine").setup({
      options = {
        globalstatus = true,
        theme = "everforest",
        section_separators = "",
        component_separators = "",
      },
      sections = {
        -- LEFT SIDE
        lualine_a = {
          {
            function() return " " end,  -- Vim/Neovim logo
            color = { fg = "#E69875", bg = "NONE", gui = "bold" },
          },
          {
            "mode",
            fmt = function(str) return " " .. str .. " " end,
            color = { bg = "#E69875", fg = "#000000", gui = "bold" },
          },
        },
        lualine_b = {
          {
            "filename",
            file_status = true,
            path = 1,
            color = { bg = "NONE", fg = "#E69875" },
            fmt = function(name)
              local ok, devicons = pcall(require, "nvim-web-devicons")
              if ok then
                local icon, _ = devicons.get_icon_color(name, vim.fn.expand("%:e"), { default = true })
                if icon then
                  return icon .. " " .. name
                end
              end
              return name
            end,
          },
          { "branch", icon = "" }, -- git branch
        },
        lualine_c = { lsp_status },

        -- RIGHT SIDE
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#E69875", bg = "NONE" }, -- Everforest orange
          },
        },
        lualine_y = {},
        lualine_z = {
          { "progress", color = { fg = "#DBBC7F", bg = "NONE", gui = "bold" } }, -- file ratio %
          { "location", color = { fg = "#E69875", bg = "NONE" } }, -- line:col
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = { "filename" },
        lualine_c = { lsp_status },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#E69875", bg = "NONE" },
         },
        },
        lualine_y = {},
        lualine_z = {
          "progress",
          "location",
        },
      },
      extensions = {},
    })
  end,
}
