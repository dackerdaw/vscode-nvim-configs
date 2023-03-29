
local opt = vim.opt

-------------------------------------- options ------------------------------------------
opt.laststatus = 3 -- global statusline
opt.showmode = false

opt.clipboard = "unnamedplus"
opt.cursorline = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.autoindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false

-- disable nvim intro
opt.shortmess:append "sI"

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"



-------------------------------------- mappings ------------------------------------------
vim.g.mapleader = " "

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- empty mode is same as using <cmd> :map
-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
vim.api.nvim_set_keymap("n", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
vim.api.nvim_set_keymap("n", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
vim.api.nvim_set_keymap("n", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
vim.api.nvim_set_keymap("n", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

-- vim.api.nvim_set_keymap("v", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
-- vim.api.nvim_set_keymap("v", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
-- vim.api.nvim_set_keymap("x", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
-- vim.api.nvim_set_keymap("x", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
-- Don't copy the replaced text after pasting in visual mode
-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
vim.api.nvim_set_keymap("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { silent = true })

-- split window navigation navigation
vim.api.nvim_set_keymap("n", "<C-j>", ":call VSCodeNotify('workbench.action.navigateDown')<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<C-j>", ":call VSCodeNotify('workbench.action.navigateDown')<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", ":call VSCodeNotify('workbench.action.navigateUp')<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<C-k>", ":call VSCodeNotify('workbench.action.navigateUp')<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-h>", ":call VSCodeNotify('workbench.action.navigateLeft')<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<C-h>", ":call VSCodeNotify('workbench.action.navigateLeft')<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", ":call VSCodeNotify('workbench.action.navigateRight')<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<C-l>", ":call VSCodeNotify('workbench.action.navigateRight')<CR>", { noremap = true, silent = true })

-- whichkey
vim.api.nvim_set_keymap("n", "<Leader>", ":call VSCodeNotify('whichkey.show')<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<Leader>", ":call VSCodeNotify('whichkey.show')<CR>", { noremap = true, silent = true })

-- clear highlights
vim.api.nvim_set_keymap("n", "<Esc>", ":noh <CR>", { noremap = true, silent = true })
