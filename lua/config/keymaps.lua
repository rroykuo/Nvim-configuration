-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- ：local map = vim.keymap
vim.keymap.del({ "i", "v", "n" }, "<A-j>")
vim.keymap.del({ "i", "v", "n" }, "<A-k>")
