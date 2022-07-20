vim.g.indent_guides_enable_on_vim_startup = 1
vim.g.indent_guides_default_mapping = 0
vim.g.indent_guides_tab_guides = 0
vim.g.indent_guides_color_change_percent = 3
vim.g.indent_guides_auto_colors = 1
vim.g.indent_guides_guide_size = 1
vim.api.nvim_exec(
	[[
    let g:indent_guides_exclude_filetypes = [
      \ 'help', 'man', 'fern', 'defx', 'denite', 'denite-filter', 'startify',
      \ 'vista', 'vista_kind', 'tagbar', 'lsp-hover', 'clap_input', 'fzf',
      \ 'any-jump', 'gina-status', 'gina-commit', 'gina-log', 'minimap',
      \ 'quickpick-filter', 'lsp-quickpick-filter', 'lspinfo', 'alpha']

    " set smarttab        " Tab insert blanks according to 'shiftwidth'
    " set autoindent      " Use same indenting on new lines
    " set smartindent     " Smart autoindenting on new lines
    " set shiftround      " Round indent to multiple of 'shiftwidth'

    augroup user_plugin_indentguides
      autocmd!
      autocmd BufEnter *
        \ if ! empty(&l:filetype) && empty(&buftype) && ! &previewwindow
        \|   if g:indent_guides_autocmds_enabled == 0 && &l:expandtab
        \|     IndentGuidesEnable
        \|   elseif g:indent_guides_autocmds_enabled == 1 && ! &l:expandtab
        \|     IndentGuidesDisable
        \|   endif
        \| elseif g:indent_guides_autocmds_enabled == 1
        \|   IndentGuidesDisable
        \| endif
    augroup END
]],
	true
)
