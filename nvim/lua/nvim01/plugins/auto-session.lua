return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      auto_restore_enabled = false,
      auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
    })

    local keymap = vim.keymap

    -- restore session silently
    keymap.set("n", "<leader>wr", "<cmd>silent! AutoSession restore<CR>", { desc = "Restore session for cwd" })
    
    -- save session silently
    keymap.set("n", "<leader>ws", "<cmd>silent! AutoSession save<CR>", { desc = "Save session for cwd" })

  end,
}
