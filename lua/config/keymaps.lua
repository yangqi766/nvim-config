local opts = { noremap = true, silent = true }
-- local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = ";"

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

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
keymap("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", opts)
keymap("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", opts)
keymap("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", opts)
keymap("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", opts)
keymap("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", opts)
keymap("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", opts)
keymap("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", opts)
keymap("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", opts)

-- accelerated j k
keymap("n", "j", "<Plug>(accelerated_jk_j)", {})
keymap("n", "k", "<Plug>(accelerated_jk_k)", {})

-- Cross line down from the beginning of the line
keymap("n", "=", "+", opts)

-- Save & Quit
keymap("n", "<leader>w", "<cmd>w<CR>", opts)
keymap("n", "<leader>q", "<cmd>q<CR>", opts)
keymap("n", "<C-q>", ":q!<CR>", opts) -- force quit

-- Double leader key for toggling visual-line mode
keymap("n", "<leader><leader>", "V", opts)

-- Toggle fold
keymap("n", "<CR>", "za", opts)

-- Yank from cursor position to end-of-line
keymap("n", "Y", "y$", opts)

-- Re-select blocks after indenting in visual/select mode
keymap("x", "<", "<gv", opts)
keymap("x", ">", ">gv", opts)

-- Use tab for indenting in visual/select mode
keymap("x", "<Tab>", ">gv|", opts)
keymap("x", "<S-Tab>", "<gv", opts)

-- Move text up and down
keymap("n", "<A-j>", ":move+<CR>==", opts)
keymap("n", "<A-k>", ":move-2<CR>==", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)

-- Duplicate lines without affecting PRIMARY and CLIPBOARD selections.
keymap("n", "<leader>d", 'm`""Y""P``', opts)
keymap("n", "<leader>d", '""Y""Pgv', opts)

-- Duplicate paragraph
keymap("n", "<leader>cp", "yap<S-}>p", opts)

-- Insert --
keymap("i", "jk", "<ESC>", opts)
keymap("i", "<C-h>", "<Left>", opts)
keymap("i", "<C-l>", "<Right>", opts)
keymap("i", "<C-k>", "<Up>", opts)
keymap("i", "<C-j>", "<Down>", opts)

keymap("i", "<C-o>", "<ESC>o", opts) -- switch to next new line
keymap("i", "<C-a>", "<ESC>I", opts) -- jump to begin
keymap("i", "<C-e>", "<ESC>A", opts) -- jump to end
keymap("i", "<C-d>", "<ESC>lcl", opts) -- delete one char

-- command --
keymap("c", "<C-h>", "<Left>", {})
keymap("c", "<C-l>", "<Right>", {})
keymap("c", "<C-a>", "<Home>", {})
keymap("c", "<C-e>", "<End>", {})

-- tagbar
keymap("n", "<C-t>", ":Tagbar<CR>", opts)

-- copy buffer terminal
keymap("v", "<leader>p", '"*p', opts)
keymap("v", "<leader>y", '"*y', opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- select single work && copy             :   yaw /yiw
-- delete to end                          :   D
-- modify to end                          :   C
-- modify current line                    :   S / cc
-- modify one current character           :   s
-- delete current word ,exclude blank     :   diw
-- delete current word ,include blank     :   daw
-- insert at the beginning                :   A
-- insert at the end                      :   I

--  d           - Delete: [range]d<motion>
-- 	dd          - delete current line
-- 	dj          - delete current and next line (j = down)
-- 	2dj         - delete current and 2 lines downward
--
--  c           - Change (Same as d but put me in insert mode)
-- 	cw          - change word
-- 	cc/S        - Delete current line and enter insert mode
-- 	2cw         - Delete 2 words and enter insert mode
--
-- ~            - toggle the case of character under cursor
-- g~           - Toggle case of [motion]
-- g~w          - Toggle case of cursor -> end of word
-- tr|ue -> g~w -> trUE
-- g~iw - Toggle case of entire word under cursor
-- tr|ue -> g~iw -> tRUE

------- easymotion mapping -------------
keymap("n", "\\", "<Plug>(easymotion-prefix)", opts)
-- \f{char}      | Find {char} to the right. See |f|.
-- \F{char}      | Find {char} to the left. See |F|.
-- \t{char}      | Till before the {char} to the right. See |t|.
-- \T{char}      | Till after the {char} to the left. See |T|.
-- \w            | Beginning of word forward. See |w|.
-- \W            | Beginning of WORD forward. See |W|.
-- \b            | Beginning of word backward. See |b|.
-- \B            | Beginning of WORD backward. See |B|.
-- \e            | End of word forward. See |e|.
-- \E            | End of WORD forward. See |E|.
-- \ge           | End of word backward. See |ge|.
-- \gE           | End of WORD backward. See |gE|.
-- \j            | Line downward. See |j|.
-- \k            | Line upward. See |k|.
-- \n            | Jump to latest "/" or "?" forward. See |n|.
-- \N            | Jump to latest "/" or "?" backward. See |N|.
-- \s            | Find(Search) {char} forward and backward.

----  vim-surround ---------------
-- cs"'          | "Hello world!" to 'Hello world!'
-- ds"           | To remove the delimiters entirely, press ds".  "Hello world!" to Hello world!
