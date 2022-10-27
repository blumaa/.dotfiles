local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Allow gf to open non-existent files
keymap('n', 'gf', 'gf', opts)
 -- map gf :edit <cfile><cr>


--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
 -- after searching for matching terms, clear highlight
 keymap('n', '<esc>', ':noh<CR>', opts)

-- exit using arrows
 keymap('n', '<RIGHT>', ':q<CR>', opts)
 keymap('n', '<DOWN>', ':w<CR>', opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- maximize window
keymap("n", "<leader>(", "<C-W>_<C-W><bar>", opts)
keymap("n", "<leader>)", "<C-W>=", opts)
keymap("n", "<leader>1", ":vertical resize +4<CR>", opts)
keymap("n", "<leader>2", ":vertical resize -4<CR>", opts)
-- noremap <silent> ,_  <C-W>_<C-W><bar>

keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)

-- BarBar buffers
-- keymap("n", "<S-l>", ":BufferNext<CR>", opts)
-- keymap("n", "<S-h>", ":BufferPrevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>f", "<cmd>lua require('telescope.builtin').find_files({hidden=true})<cr>", opts)
-- keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({}))<cr>", opts)
keymap("n", "<leader>p", "<cmd>Telescope live_grep<cr>", opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- formatting 
keymap("n", "<C-f>", ":Format<cr>", opts)

-- gitsigns
keymap("n", "<leader>bb", ":Gitsigns blame_line<cr>", opts)

keymap("n", "<leader>bw", ":BufferOrderByWindowNumber<cr>", opts)

keymap("n", "<leader>=", ":CocCommand prettier.formatFile<cr>", opts)

-- close buffer without closing split
keymap("n", "<leader>bd", ":b#<bar>bd#<cr>", opts)

