vim.g.mapleader = " "
vim.keymap.set("n", "<leader>g", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")



-- greatest remap ever

vim.keymap.set("n", "<leader>ff", vim.cmd.FZF)
vim.keymap.set("n", ">", ">>")
vim.keymap.set("n", "<", "<<")
vim.keymap.set("n", "S", "?")
vim.keymap.set("n", "s", "/")
vim.keymap.set("n", "U", "~")
vim.keymap.set("n", "v", "<C-v>")

-- This is going to get me cancelled



vim.keymap.set("n", "<leader>e", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "e", "A")
