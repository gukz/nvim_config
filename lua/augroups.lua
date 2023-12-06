return {
  _common = {
    -- { "BufWinEnter", "*", "checktime" },
    { "BufWritePre", "*", "set buftype=" },
  },
  _complete = {
    { "FileType", "go,cs", "inoremap <silent> <buffer> . .<c-x><c-o>"},
  },
  -- _lspformat = {
  --   { "BufWritePre", "*.lua,*.py,*.cs,*.go", "lua vim.lsp.buf.formatting_sync(nil, 500)" },
  -- },
  _omnisharp = {
    { "FileType", "cs", "nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)"},
  --   -- gD go to declaration
    { "FileType", "cs", "nmap <silent> <buffer> gr <Plug>(omnisharp_find_usages)"},
    { "FileType", "cs", "nmap <silent> <buffer> gi <Plug>(omnisharp_find_implementations)"},
    { "FileType", "cs", "nmap <silent> <buffer> gh <Plug>(omnisharp_fix_usings)"},
  --   { "FileType", "cs", "nmap <silent> <buffer> gk <Plug>(omnisharp_global_code_check)"},       -- show line Diagnostics
  --   { "FileType", "cs", "nmap <silent> <buffer> gp <Plug>(omnisharp_preview_definition)"},
  --   { "FileType", "cs", "nmap <silent> <buffer> gh <Plug>(omnisharp_preview_implementations)"},
  --   { "FileType", "cs", "nmap <silent> <buffer> gs <Plug>(omnisharp_signature_help)"},
  --
  --   -- cs only
  --   { "FileType", "cs", "nmap <silent> <buffer> gc <Plug>(omnisharp_code_actions)"},
  --   { "FileType", "cs", "xmap <silent> <buffer> gc <Plug>(omnisharp_code_actions)"},
  --   { "FileType", "cs", "nmap <silent> <buffer> g. <Plug>(omnisharp_code_action_repeat)"},
  --   { "FileType", "cs", "xmap <silent> <buffer> g. <Plug>(omnisharp_code_action_repeat)"},
  --   { "FileType", "cs", "nmap <silent> <buffer> g= <Plug>(omnisharp_code_format)"},   -- format code
  --   { "FileType", "cs", "nmap <silent> <buffer> gl <Plug>(omnisharp_type_lookup)"},
  --   { "FileType", "cs", "nmap <silent> <buffer> gF <Plug>(omnisharp_find_symbol)"},
  --   { "FileType", "cs", "nmap <silent> <buffer> gM <Plug>(omnisharp_documentation)"},
  --   { "FileType", "cs", "nmap <silent> <buffer> gR <Plug>(omnisharp_rename)"},
  --   -- Navigate up and down by method/property/field
  --   { "FileType", "cs", "nmap <silent> <buffer> <C-p> <Plug>(omnisharp_navigate_up)"},
  --   { "FileType", "cs", "nmap <silent> <buffer> <C-n> <Plug>(omnisharp_navigate_down)"},
  },
}
