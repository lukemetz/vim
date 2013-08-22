" From https://github.com/pivotalforks/vim-config/blob/master/init/language.vim
" Strip trailing whitespace for code files on save
function! StripTrailingWhitespace()
  let save_cursor = getpos(".")
  %s/\s\+$//e
  call setpos('.', save_cursor)
endfunction

autocmd BufWritePre *.m,*.h,*.c,*.mm,*.cpp,*.hpp,*.js,*.html call StripTrailingWhitespace()
