-- Shorten function name
local keymap = vim.api.nvim_set_keymap
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
--keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--  normal_mode = "n",
--  insert_mode = "i",
--  visual_mode = "v",
--  visual_block_mode = "x",
--  term_mode = "t",
--  command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", { unpack(opts), desc = "Clear highlights" })

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Save with CTRL + s
keymap("n", "<C-s>", ":update<CR>", opts)
keymap("v", "<C-s>", "<C-C>:update<CR>", opts)
keymap("i", "<C-s>", "<C-O>:update<CR>", opts)

-- Copies buffer full path to clipboard
keymap("n", "<C-f>", ":let @+ = expand('%:p')<CR>", opts)

-- CTRL + q to quit
keymap("n", "<C-q>", ":q<CR>", opts)

-- Insert --
-- Press jj fast to leave insert mode
keymap("i", "jj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts) -- Persists yanked text

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Git
keymap("n", "<leader>g", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { unpack(opts), desc = "Opens LazyGit" })

-- Comment
keymap(
	"n",
	"<leader>/",
	"<cmd>lua require('Comment.api').toggle.linewise_current()<CR>",
	{ unpack(opts), desc = "Comment" }
)
keymap(
	"x",
	"<leader>/",
	'<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>',
	{ unpack(opts), desc = "Comment" }
)

-- GitBlame
keymap("n", "<leader>gb", ":GitBlameToggle<CR>", opts)

-- True-Zen keymaps
keymap("n", "<leader>zn", ":TZNarrow<CR>", opts)
keymap("v", "<leader>zn", ":'<,'>TZNarrow<CR>", opts)
keymap("n", "<leader>zf", ":TZFocus<CR>", opts)
keymap("n", "<leader>zm", ":TZMinimalist<CR>", opts)
keymap("n", "<leader>za", ":TZAtaraxis<CR>", opts)

-- Harpoon
keymap("n", "<leader>a", ":lua require'harpoon.mark'.add_file()<CR>", opts)

keymap("n", "<C-e>", ":lua require'harpoon.ui'.toggle_quick_menu()<CR>", opts)

keymap("n", "<leader>tc", ":lua	require'harpoon.cmd-ui'.toggle_quick_menu()<CR>", opts)

keymap("n", "<C-1>", ":lua require'harpoon.ui'.nav_file(1)<CR>", opts)

keymap("n", "<C-2>", ":lua require'harpoon.ui'.nav_file(2)<CR>", opts)

keymap("n", "<C-3>", ":lua require'harpoon.ui'.nav_file(3)<CR>", opts)

keymap("n", "<C-4>", ":lua require'harpoon.ui'.nav_file(4)<CR>", opts)

-- DAP
keymap("n", "<F5>", ":lua require'dap'.continue()<CR>", { unpack(opts), desc = "Continue" })
keymap("n", "<F2>", ":lua require'dap'.step_into()<CR>", { unpack(opts), desc = "Step into" })
keymap("n", "<F3>", ":lua require'dap'.step_over()<CR>", { unpack(opts), desc = "Step over" })
keymap("n", "<F12>", ":lua require'dap'.step_out()<CR>", { unpack(opts), desc = "Step out" })
keymap("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", { unpack(opts), desc = "Set a breakpoint" })
keymap(
	"n",
	"<leader>B",
	":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	{ unpack(opts), desc = "Condtional breakpoint" }
)
keymap(
	"n",
	"<leader>dl",
	":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
	{ unpack(opts), desc = "Log point" }
)
keymap("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", opts)
keymap("n", "<leader>dt", ":lua require'dap-go'.debug_test()<CR>", { unpack(opts), desc = "Start go test" })
keymap("n", "<leader>do", ":lua require'dapui'.toggle()<CR>", { unpack(opts), desc = "Toggle UI" })
