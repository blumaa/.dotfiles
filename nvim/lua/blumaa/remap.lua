vim.g.mapleader = " "

-- move line up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- bring lower line up to end of current line
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
-- vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
-- vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>=", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>pp", ":Prettier<CR>")

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>tr", ":Telescope lsp_references<CR>")

-- search and replace current word
vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- easily save and exit windows
vim.keymap.set("n", "<RIGHT>", ":q<CR>")
vim.keymap.set("n", "fd", ":q<CR>")
vim.keymap.set("n", "<DOWN>", ":w<CR>")

vim.keymap.set("i", "jk", "<ESC>")

vim.keymap.set("n", "<leader>1", ":vertical resize +4<CR>")
vim.keymap.set("n", "<leader>2", ":vertical resize -4<CR>")

-- Formatting
-- keymap("n", "<leader>=", ":CocCommand prettier.formatFile<cr>", )
-- keymap("n", "<leader>-", ":Neoformat stylua<cr>", )

-- close buffer without closing split
-- keymap("n", "<leader>bd", ":b#<bar>bd#<cr>", )

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Nvimtree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>")

-- LSP toggle diagnostics virtual_text
vim.g.diagnostics_visible = true

function _G.toggle_diagnostics()
  if vim.g.diagnostics_visible then
    vim.g.diagnostics_visible = false
    vim.diagnostic.config({ virtual_text = false })
  else
    vim.g.diagnostics_visible = true
    vim.diagnostic.config({ virtual_text = true })
  end
end

vim.keymap.set('n', '<Leader>d', ':call v:lua.toggle_diagnostics()<CR>')
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
