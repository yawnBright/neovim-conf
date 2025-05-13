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

--- 全选
vim.keymap.set({ "i", "n", "v" }, "<C-a>", "<esc>ggVG", { desc = "Select all" })

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

local builtin = require("telescope.builtin")
local function get_current_file_extension()
  local filename = vim.fn.expand("%:t")
  local extension = vim.fn.fnamemodify(filename, ":e")
  return extension
end

local function live_grep_current_extension()
  local extension = get_current_file_extension()
  local word_under_cursor = vim.fn.expand("<cword>")
  -- local common_files = { "*.lua", "*.py", "*.js", "*.html", "*.css", "*.cpp", "*.java", "*.rs", "*.go", "*.json" }
  -- local args = {}
  -- if extension ~= "" then
  --   table.insert(common_files, "*." .. extension)
  -- end
  -- builtin.live_grep({ additional_args = { "--glob", table.unpack(common_files) }, default_text = word_under_cursor })
  if extension ~= "" then
    builtin.live_grep({ additional_args = { "--glob", "*." .. extension }, default_text = word_under_cursor })
  else
    print("No file extension found.")
  end
end

-- 用于全局字符串搜索，根据当前文件后缀查找
vim.keymap.set(
  "n",
  "<C-f>",
  live_grep_current_extension,
  { desc = "Search globally for a string in files with the same extension as the current file" }
)

vim.keymap.set("n", "<F7>", function()
  -- print("f7")
  require("dap").step_over()
end, { desc = "Step Over" })

vim.keymap.set("n", "<F8>", function()
  -- print("f8")
  require("dap").step_into()
end, { desc = "Step Into" })
