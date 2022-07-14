vim.api.nvim_exec(
	[[
  try
    colorscheme onedarker
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
   " let g:colors_name = "hybrid"
   " execute 'source' fnameescape("~/.config/nvim-config/themes/hybrid.vim")
]],
	true
)
