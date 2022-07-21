vim.cmd([[
  try
   " colorscheme onedarker
   set background=dark
  " colorscheme tender
  " colorscheme  stellarized
  " colorscheme solarized8_low
  colorscheme solarized8_flat
  " colorscheme oceanic_material
  " autocmd BufWinEnter * :hi VertSplit ctermfg=bg ctermbg=bg guifg=bg guibg=bg
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
   " let g:colors_name = "hybrid"
   " execute 'source' fnameescape("~/.config/nvim-config/themes/hybrid.vim")
]])
