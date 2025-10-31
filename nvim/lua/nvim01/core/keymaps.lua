vim.g.mapleader = " "

local keymap = vim.keymap -- creating a local veriable

keymap.set("n","<leader>nh", ":nohl<CR>", { desc = " user space + nh for clear search history "})

-- keymap for incrementing and decrimenting numbers
keymap.set("n","<leader>+", "<C-a>", { desc = " Incrementing a number in normal mode "})
keymap.set("n","<leader>-", "<C-x>", { desc = " decrementing a number in normal mode "})

-- keymap for splits of windows in nvim
keymap.set("n","<leader>sv", "<C-w>v", { desc = " Split window vertically in normal mode "})
keymap.set("n","<leader>sh", "<C-w>s", { desc = " Split window horizontally in normal mode"})
keymap.set("n","<leader>se", "<C-w>=", { desc = " make split window equle in normal mode "})
keymap.set("n","<leader>sx", "<cmd>close<CR>", { desc = " cose the current split in normal mode "})

-- Keymap for my tabs in nvim
keymap.set("n","<leader>to", "<cmd>tabnew<CR>", { desc = " open a new tab in normal nvim "})
keymap.set("n","<leader>tx", "<cmd>tabclose<CR>", { desc = " close cureent tab in normal nvim "})
keymap.set("n","<leader>tn", "<cmd>tabn<CR>", { desc = " switch to next tab in normal nvim "})
keymap.set("n","<leader>tp", "<cmd>tabp<CR>", { desc = " switch to previous tab in normal nvim "})
keymap.set("n","<leader>tf", "<cmd>tabnew %<CR>", { desc = " open current buffer in new tab in normal nvim "})
