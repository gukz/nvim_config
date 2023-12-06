-- Dont' try to add new plugin here, you just waste time.
return {
  { "Mofiqul/vscode.nvim", lazy = true, },
  { "projekt0n/github-nvim-theme", lazy = true, },
  { "EdenEast/nightfox.nvim", lazy = true, },
  { "hardhackerlabs/theme-vim", lazy = true, },
  { "LunarVim/synthwave84.nvim", lazy = true, },
  { "rose-pine/neovim", name = 'rose-pine', lazy = true, },

  { "pechorin/any-jump.vim", cmd = "AnyJump", },
  { "m4xshen/autoclose.nvim", }, -- auto add/remove ,),">
  { "jghauser/mkdir.nvim", },  -- auto create missing folder when save file
  -- { "gelguy/wilder.nvim", opts = { modes = { ":",}, }, },
  { "axkirillov/hbac.nvim", }, -- buffer auto close, hold 10 buffer with lru
  { "williamboman/mason.nvim", config = true }, -- maintain the lsp server
  { "vladdoster/remember.nvim"},
  { 
    "mfussenegger/nvim-lint",
    config = function()
      require('lint').linters_by_ft = {
        go = {'golangcilint', 'revive'}
      }
      local golangcilint = require("lint.linters.golangcilint")
      golangcilint.append_fname = true
      golangcilint.args = {"run", "--out-format", "json"}
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signcolumn = false,
      current_line_blame_formatter = "<abbrev_sha> <author>, <author_time:%Y-%m-%d> <summary>",
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "right_align",
        delay = 500,
        ignore_whitespace = false,
      },
    },
    lazy = true,
  },
  { "gukz/ftFT.nvim", keys = { "f", "t", "F", "T" }, config = true, },
  { "kevinhwang91/nvim-bqf", ft = "qf" },
  { "sindrets/winshift.nvim", cmd = "WinShift", },
  { "xiyaowong/nvim-cursorword", },
  { "echasnovski/mini.jump2d", version = "*", config = true, },
  { "numToStr/Comment.nvim", opts = {}, lazy = false, },
  { -- show file name in window bar
    "b0o/incline.nvim",
    opts = {
      highlight = {
        groups = {
          InclineNormal = {
            default = true,
            group = "lualine_a_normal"
          },
          InclineNormalNC = {
            default = true,
            group = "lualine_b_normal"
          }
        }
      },
    },
    config = true,
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    cmd = "NvimTreeToggle",
    opts = function()
      return {
        sort_by = "case_sensitive",
        view = { width = "20%", side = "right", float = { enable = false }, signcolumn = 'no' },
        git = {enable=false},
        filters = { dotfiles = true, },
        on_attach = function(bufnr)
          local api = require('nvim-tree.api')
          local function opts(desc)
            return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
          end
          vim.keymap.set('n', 's',     api.tree.change_root_to_node,          opts('CD'))
          vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
          vim.keymap.set('n', 'u',     api.tree.change_root_to_parent,        opts('Up'))
          vim.keymap.set('n', '<C-k>', api.node.show_info_popup,              opts('Info'))
          vim.keymap.set('n', '<C-t>', api.node.open.tab,                     opts('Open: New Tab'))
          vim.keymap.set('n', '<C-v>', api.node.open.vertical,                opts('Open: Vertical Split'))
          vim.keymap.set('n', '<C-x>', api.node.open.horizontal,              opts('Open: Horizontal Split'))
          vim.keymap.set('n', '<BS>',  api.node.navigate.parent_close,        opts('Close Directory'))
          vim.keymap.set('n', '.',     api.node.run.cmd,                      opts('Run Command'))
          vim.keymap.set('n', 'a',     api.fs.create,                         opts('Create'))
          vim.keymap.set('n', 'c',     api.fs.copy.node,                      opts('Copy'))
          vim.keymap.set('n', 'd',     api.fs.remove,                         opts('Delete'))
          vim.keymap.set('n', 'E',     api.tree.expand_all,                   opts('Expand All'))
          vim.keymap.set('n', 'C',     api.tree.collapse_all,                 opts('Collapse'))
          vim.keymap.set('n', 'r',     api.fs.rename_basename,                opts('Rename: Basename'))
          vim.keymap.set('n', '<C-r>', api.fs.rename,                         opts('Rename'))
          vim.keymap.set('n', 'g?',    api.tree.toggle_help,                  opts('Help'))
          vim.keymap.set('n', 'gy',    api.fs.copy.absolute_path,             opts('Copy Absolute Path'))
          vim.keymap.set('n', 'i',     api.tree.toggle_hidden_filter,         opts('Toggle Dotfiles'))
          vim.keymap.set('n', 'I',     api.tree.toggle_gitignore_filter,      opts('Toggle Git Ignore'))
          vim.keymap.set('n', 'm',     api.marks.toggle,                      opts('Toggle Bookmark'))
          vim.keymap.set('n', 'o',     api.node.open.edit,                    opts('Open'))
          vim.keymap.set('n', '<CR>',  api.node.open.edit,                    opts('Open'))
          vim.keymap.set('n', '<2-LeftMouse>',  api.node.open.edit,           opts('Open'))
          vim.keymap.set('n', 'O',     api.node.open.no_window_picker,        opts('Open: No Window Picker'))
          vim.keymap.set('n', 'p',     api.fs.paste,                          opts('Paste'))
          vim.keymap.set('n', 'P',     api.node.navigate.parent,              opts('Parent Directory'))
          vim.keymap.set('n', 'q',     api.tree.close,                        opts('Close'))
          vim.keymap.set('n', 'R',     api.tree.reload,                       opts('Refresh'))
          vim.keymap.set('n', 'x',     api.fs.cut,                            opts('Cut'))
          vim.keymap.set('n', 'y',     api.fs.copy.filename,                  opts('Copy Name'))
          vim.keymap.set('n', 'Y',     api.fs.copy.relative_path,             opts('Copy Relative Path'))
          -- vim.keymap.set('n', 'd',     api.fs.trash,                          opts('Trash'))
          -- vim.keymap.set('n', 'e',     api.fs.rename_sub,                     opts('Rename: Omit Filename'))
          -- vim.keymap.set('n', '<Tab>', api.node.open.preview,                 opts('Open Preview'))
          -- vim.keymap.set('n', '>',     api.node.navigate.sibling.next,        opts('Next Sibling'))
          -- vim.keymap.set('n', '<',     api.node.navigate.sibling.prev,        opts('Previous Sibling'))
          -- vim.keymap.set('n', 'bmv',   api.marks.bulk.move,                   opts('Move Bookmarked'))
          -- vim.keymap.set('n', '<C-e>', api.node.open.replace_tree_buffer,     opts('Open: In Place'))
          -- vim.keymap.set('n', 'B',     api.tree.toggle_no_buffer_filter,      opts('Toggle No Buffer'))
          -- vim.keymap.set('n', 'C',     api.tree.toggle_git_clean_filter,      opts('Toggle Git Clean'))
          -- vim.keymap.set('n', '[c',    api.node.navigate.git.prev,            opts('Prev Git'))
          -- vim.keymap.set('n', ']c',    api.node.navigate.git.next,            opts('Next Git'))
          -- vim.keymap.set('n', ']e',    api.node.navigate.diagnostics.next,    opts('Next Diagnostic'))
          -- vim.keymap.set('n', '[e',    api.node.navigate.diagnostics.prev,    opts('Prev Diagnostic'))
          -- vim.keymap.set('n', 'F',     api.live_filter.clear,                 opts('Clean Filter'))
          -- vim.keymap.set('n', 'f',     api.live_filter.start,                 opts('Filter'))
          -- vim.keymap.set('n', 'J',     api.node.navigate.sibling.last,        opts('Last Sibling'))
          -- vim.keymap.set('n', 'K',     api.node.navigate.sibling.first,       opts('First Sibling'))
          -- vim.keymap.set('n', 's',     api.node.run.system,                   opts('Run System'))
          -- vim.keymap.set('n', 'S',     api.tree.search_node,                  opts('Search'))
          -- vim.keymap.set('n', 'U',     api.tree.toggle_custom_filter,         opts('Toggle Hidden'))
        end,
      }
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    opts = function()
      local tele = require('telescope')
      local actions = require('telescope.actions')
      return {
        defaults = {
         find_command = {'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'},
         entry_prefix = "  ",
         initial_mode = "insert",
         selection_strategy = "reset",
         sorting_strategy = "descending",
         layout_strategy = "vertical",-- "horizontal",
         layout_config = {
           width = 0.9,
           height = 0.9,
           prompt_position = "bottom",
           preview_cutoff = 0.5,
           horizontal = {mirror = false},
           vertical = {mirror = false},
         },
         file_ignore_patterns = {"*.cache", "bin/*", "obj/*", "build/*", ".undo/*", "docs/*", "samples/*", "*.json", "*.pb.go", "UnitTests/*" },
         path_display = {'absolute'}, -- 'shorten','absolute','tail'
         winblend = 0,
         border = {},
         color_devicons = true,
         use_less = true,
         set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
         mappings = {
           i = {
             ["<C-j>"] = actions.move_selection_next,
             ["<C-k>"] = actions.move_selection_previous,
             ["<C-n>"] = actions.move_selection_next,
             ["<C-p>"] = actions.move_selection_previous,
             ["<C-o>"] = actions.smart_send_to_qflist + actions.open_qflist,
             ["<esc>"] = actions.close,
             ["<CR>"] = actions.select_default + actions.center,
           },
           n = {
             ["<C-j>"] = actions.move_selection_next,
             ["<C-k>"] = actions.move_selection_previous,
             ["<C-n>"] = actions.move_selection_next,
             ["<C-p>"] = actions.move_selection_previous,
             ["<C-o>"] = actions.smart_send_to_qflist + actions.open_qflist,
             -- ["<C-i>"] = my_cool_custom_action,
           }
         }
       }
      }
    end,
  },
  {
    'Exafunction/codeium.vim',
    keys = {"<C-g>",},
    -- ft = {"go", "cs", "py"},
    config = function(_, opts)
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true })
      vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
      vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
      vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
      vim.g.codeium_disable_bindings = 1
    end
  },
  {
    "folke/which-key.nvim",
    keys = {"<space>",},
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup({
        window = {
          border = "double",
        },
      })
      wk.register(
      {
        [" "] = {"<cmd>lua require('telescope.builtin').resume()<cr>",             "Telescope"},
        a = {"<cmd>AnyJump<CR>",                                                   "Any Jump"},
        b = {"<cmd>lua require('gitsigns').toggle_current_line_blame()<cr>",       "Toggle Git Blame"},
        c = {"<cmd>lua require('codium').setup()<cr>",                             "Start Codeium"},
        e = {"<cmd>NvimTreeToggle<cr>",                                            "Toggle Tree"},
        f = {"<cmd>%!python -m json.tool<cr>",                                     "Format json"},
        h = {"<cmd>lua require('utils').edit_hosts_path()<cr>",                    "Copy Hosts path"},
        j = {"<cmd>lua MiniJump2d.start()<cr>",                                    "Page Jump"},
        p = {"<cmd>lua require('utils').copy_path()<cr>",                          "Copy path"},
        q = {"<cmd>lua require('utils').toggle_qf()<cr>",                          "Toggle Quickfix"},
        s = {
          name = "+Search",
          b = {"<cmd>lua require('telescope.builtin').buffers()<cr>",              "Buffers"},
          c = {"<cmd>lua require('telescope.builtin').commands()<cr>",             "Commands"},
          d = {"<cmd>lua require('telescope.builtin').diagnostics()<cr>",          "Diagnositics"},
          f = {"<cmd>lua require('telescope.builtin').find_files()<cr>",           "Files"},
          g = {"<cmd>lua require('telescope.builtin').git_files()<cr>",            "Tracked Files"},
          h = {"<cmd>lua require('telescope.builtin').search_history()<cr>",       "History"},
          o = {"<cmd>lua require('telescope.builtin').oldfiles()<cr>",             "Opened Files"},
          t = {"<cmd>lua require('telescope.builtin').live_grep()<cr>",            "Text"},
          w = {"<cmd>lua require('telescope.builtin').grep_string()<cr>",          "Cursor"},
        },
        t = {"<cmd>ToggleTerm<cr>",                                                "Toggle Terminal"},
        u = {"<cmd>cd %:h<cr>",                                                    "Set pwd to current"},
        v = {"<cmd>lua require('utils').toggle_bg()<cr>",                          "Visual BG"},
        w = {"<cmd>WinShift<CR>",                                                  "Move Window"},
      },
      {
        mode = "n", -- NORMAL mode
        prefix = "<leader>",
        buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      })
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    event = "VimEnter",
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      options={
        globalstatus = true,
        disabled_filetypes = {
          statusline = {},
          winbar = {
            'help', 'startify', 'dashboard', 'alpha', 'packer', 'lazy',
            'neogitstatus', 'NvimTree', 'Trouble', 'lir', 'Outline',
            'spectre_panel', 'toggleterm', 'qf',
          },
        },
      },
    },
  },
  {
    "fatih/vim-go",
    ft = {"go",},
    config = function(_, opts)
      vim.g.go_fmt_command = "goimports"
    end
  },
  { "akinsho/nvim-toggleterm.lua",
    cmd = "ToggleTerm",
    opts = {
      -- size can be a number or function which is passed the current terminal
      size = function(term)
        if term.direction == "horizontal" then
          return 12
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        else
          return 10
        end
      end,
      open_mapping = [[<c-\>]],
      hide_numbers = false, -- hide the number column in toggleterm buffers
      shade_filetypes = {},
      shade_terminals = false,
      shading_factor = '<number>', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
      start_in_insert = false,
      persist_size = false,
      direction = 'horizontal', -- direction = 'vertical' | 'horizontal' | 'window' | 'float',
      close_on_exit = true, -- close the terminal window when the process exits
      shell = vim.o.shell, -- change the default shell
      float_opts = { -- This field is only relevant if direction is set to 'float'
        -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
  	    border = 'double',
        width = 60,
        height = 14,
        winblend = 3,
        highlights = {
          border = "Normal",
          background = "Normal",
        }
      }
    },
  },
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    keys = {
      {".", mode="i"},
    },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    opts = function()
      local cmp = require("cmp")
      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        }),
        experimental = {
          ghost_text = {
            hl_group = "LspCodeLens",
          },
        },
      }
    end,
  },
  {
    "OmniSharp/omnisharp-vim",
    ft = {"cs",},
    opts = function()
      vim.g.OmniSharp_server_use_net6 = 1
      vim.g.asyncomplete_auto_popup = 1
      vim.g.asyncomplete_auto_completeopt = 1
      vim.g.asyncomplete_force_refresh_on_context_changed = 1
      vim.g.OmniSharp_highlight_types = 2
      vim.g.omnicomplete_fetch_full_documentation  = 1
      vim.g.OmniSharp_diagnostic_exclude_paths = {
       'obj', 'out', 'build', '[Tt]emp', '.nuget', '<AssemblyInfo.cs>',
       'UnitTests', 'packages', 'CloudTest', 'TestResults'
      }
      return {}
    end,
    config = true,
  },
}
