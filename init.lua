vim.g.mapleader = ' '
vim.g.editorconfig = false
local utils = require("utils")
utils.install_lazy()
utils.startTimers()
if vim.fn.has('win64') == 1 then
  utils.init_powershell()
end
require("lazy").setup(require("plugins"), {})
pcall(utils.set_options, require("options"))
pcall(utils.add_keymap, require("keymappings"))
pcall(utils.define_augroups, require("augroups"))

-- pcall(vim.cmd.colorscheme, "vscode")
pcall(vim.cmd.colorscheme, "github_light")
-- pcall(vim.cmd.colorscheme, "dayfox")
-- pcall(vim.cmd.colorscheme, "hardhacker")
-- pcall(vim.cmd.colorscheme, "rose-pine")
-- pcall(vim.cmd.colorscheme, "synthwave84")
