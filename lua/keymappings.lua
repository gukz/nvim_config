return {
  i = {
    -- I hate escape
    { "jj", "<ESC>", { noremap = true, silent = true }},
    { "jk", "<ESC>", { noremap = true, silent = true }},
    -- Move current line / block with Alt-j/k ala vscode.
    { "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true }},
    { "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true }},
    -- navigation
    { "<A-Up>", "<C-\\><C-N><C-w>h", { noremap = true, silent = true }},
    { "<A-Down>", "<C-\\><C-N><C-w>j", { noremap = true, silent = true }},
    { "<A-Left>", "<C-\\><C-N><C-w>k", { noremap = true, silent = true }},
    { "<A-Right>", "<C-\\><C-N><C-w>l", { noremap = true, silent = true }},
    -- easy jump around window
    { '<C-h>', '<C-\\><C-N><C-w>h', { noremap = true, silent = true }},
    { '<C-j>', '<C-\\><C-N><C-w>j', { noremap = true, silent = true }},
    { '<C-k>', '<C-\\><C-N><C-w>k', { noremap = true, silent = true }},
    { '<C-l>', '<C-\\><C-N><C-w>l', { noremap = true, silent = true }},
  },
  n = {
    -- lsp
    { "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true }},
    { "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true }},
    { "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true }},
    { "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true }},
    { "gl", '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ show_header = false, border = "single" })<CR>', { noremap = true, silent = true }},
    { "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true }},
    { "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true }},
    { "<C-p>", "<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = single}})<CR>", { noremap = true, silent = true }},
    { "<C-n>", "<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = {border = single}})<CR>", { noremap = true, silent = true }},

    -- zoom
    { '=', '<c-w>=', {noremap = true, silent = true}},

    -- Better window movement
    { "<C-h>", "<C-w>h", { noremap = true, silent = true }},
    { "<C-j>", "<C-w>j", { noremap = true, silent = true }},
    { "<C-k>", "<C-w>k", { noremap = true, silent = true }},
    { "<C-l>", "<C-w>l", { noremap = true, silent = true }},

    -- Resize with arrows
    { "<C-Up>", ":resize -2<CR>", { noremap = true, silent = true }},
    { "<C-Down>", ":resize +2<CR>", { noremap = true, silent = true }},
    { "<C-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true }},
    { "<C-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true }},

    -- Tab switch buffer
    { "<TAB>", ":bnext<CR>", { noremap = true, silent = true }},
    { "<S-TAB>", ":bprevious<CR>", { noremap = true, silent = true }},
    -- Move current line / block with Alt-j/k a la vscode.
    { "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true }},
    { "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true }},

    -- QuickFix
    { "]q", ":cnext<CR>", { noremap = true, silent = true }},
    { "[q", ":cprev<CR>", { noremap = true, silent = true }},

    -- cr clear highlight
    { "<cr>", ":noh<CR><CR>", { noremap = true, silent = true }},

  },
  t = {
    -- Terminal window navigation
    { '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true }},
    { "<C-h>", "<C-\\><C-N><C-w>h", { noremap = true, silent = true }},
    { "<C-j>", "<C-\\><C-N><C-w>j", { noremap = true, silent = true }},
    { "<C-k>", "<C-\\><C-N><C-w>k", { noremap = true, silent = true }},
    { "<C-l>", "<C-\\><C-N><C-w>l", { noremap = true, silent = true }},
  },
  v = {
    -- Better indenting
    { "<", "<gv", { noremap = true, silent = true }},
    { ">", ">gv", { noremap = true, silent = true }},
  },
  x = {
    -- when replace content, do not modify the pause register
    { "p", '"_dP', { noremap = true, silent = true }},
    -- Move selected line / block of text in visual mode
    { "J", ":move '>+1<CR>gv-gv", { noremap = true, silent = true }},
    { "K", ":move '<-2<CR>gv-gv", { noremap = true, silent = true }},

    -- Move current line / block with Alt-j/k ala vscode.
    { "<A-j>", ":m '>+1<CR>gv-gv", { noremap = true, silent = true }},
    { "<A-k>", ":m '<-2<CR>gv-gv", { noremap = true, silent = true }},
  },
  s = {
    { "<S-Tab>", "v:lua.s_tab_complete()", { expr = true }},
    { "<Tab>", "v:lua.tab_complete()", { expr = true }},
  },
}
