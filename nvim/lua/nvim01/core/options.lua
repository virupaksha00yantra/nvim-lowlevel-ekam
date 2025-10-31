vim.cmd("let g:netrw_liststyle = 3")
vim.cmd("let g:netrw_banner = 0")
vim.cmd("let g:netrw_preview = 1")

-- Enable numbers in Netrw
vim.api.nvim_create_augroup("netrw_numbers", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = "netrw_numbers",
	pattern = "netrw",
	command = "setlocal number relativenumber",
})

local opt = vim.opt

opt.relativenumber = true
opt.number = true
opt.wrap = false
-- Tabbing and indentation options
opt.tabstop = 3
opt.shiftwidth = 3
opt.expandtab = true
opt.autoindent = true

-- Search setting options
opt.ignorecase = true
opt.smartcase = true

-- cursoreline setting options
opt.cursorline = true
opt.cursorcolumn = true

-- colours setting options
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Back space setting options
opt.backspace = "indent,eol,start"

-- clipboard setting options
opt.clipboard:append("unnamedplus")

-- Split setting options
opt.splitright = true
opt.splitbelow = true

opt.swapfile = false
