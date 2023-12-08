-- the function in the vim command is for detecting gohtmltmpl file types for hugo dev
-- the augroup filetypedetect will implement the function
vim.cmd([[
  function DetectGoHtmlTmpl()
      if expand('%:e') == "html" && search("{{") != 0
          setfiletype gohtmltmpl
      endif
  endfunction
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  augroup end
  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end
  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end
  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd =
  augroup end
  augroup filetypedetect
    au BufRead,BufNewFile *.html call DetectGoHtmlTmpl()
    au BufRead,BufNewFile *.gohtml :setl ft=gohtmltmpl
  augroup END
  augroup remember_folds
    autocmd!
    autocmd BufWinLeave * silent! mkview
    autocmd BufWinEnter * silent! loadview
  augroup END

]])

vim.api.nvim_exec(
  [[
  autocmd BufWritePre *.go :silent! lua require('go.format').goimport()
]],
  false
)
  --augroup StatusLine
  --  au!
   -- au WinEnter,BufEnter * setlocal statusline=%!v:lua.require'bret.me'.statusline()
    --au WinLeave,BufLeave * setlocal statusline=%!v:lua.require'bret.me'.statusline()
  --augroup END
-- gohtml
  -- augroup filetypedetect
  --   au BufRead,BufNewFile *.html call DetectGoHtmlTmpl()
  --   au BufRead,BufNewFile *.gohtml :setl ft=gohtmltmpl
  -- augroup END
