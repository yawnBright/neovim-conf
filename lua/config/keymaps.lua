-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- vim.keymap.del({ "n", "i", "s" }, "<esc>")

--- xx -> esc
vim.keymap.set({ "i", "n", "s", "v" }, "xx", function()
  vim.cmd("noh")
  LazyVim.cmp.actions.snippet_stop()
  return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" })

---
vim.keymap.set("n", "<C-Left>", "<C-w>h")
vim.keymap.set("n", "<C-Right>", "<C-w>l")
vim.keymap.set("n", "<C-Up>", "<C-w>k")
vim.keymap.set("n", "<C-Down>", "<C-w>j")

vim.keymap.set("n", "<C-h>", "<C-w>>")
vim.keymap.set("n", "<C-j>", "<C-w>-")
vim.keymap.set("n", "<C-k>", "<C-w>+")
vim.keymap.set("n", "<C-l>", "<C-w><")

vim.keymap.set("n", "<S-Left>", "<cmd>bprev<CR>")
vim.keymap.set("n", "<S-Right>", "<cmd>bnext<CR>")

vim.keymap.set({ "v" }, "<C-c>", "y")
vim.keymap.set({ "n" }, "<C-c>", "p")

vim.keymap.set("n", "<F7>", function()
  -- print("f7")
  require("dap").step_over()
end, { desc = "Step Over" })

vim.keymap.set("n", "<F8>", function()
  -- print("f8")
  require("dap").step_into()
end, { desc = "Step Into" })
