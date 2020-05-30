" Set ag as search program for ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

