" movetabs.vim - A vim plugin that provides shortcut keys to move tabs around
" Author: Ya'ar Hever
" Version: 1.0.0

if exists("g:movetabs_plugin_installed") || &cp || v:version < 700
  finish
endif
let g:movetabs_plugin_installed = 1

function! s:move_tab(value)
  let move_to = tabpagenr()

  if a:value == 1
    let move_to = tabpagenr() + 1

    if move_to > tabpagenr('$')
      let move_to = 0
    endif

  elseif a:value == -1
    let move_to = tabpagenr() - 2

    if move_to < 0
      let move_to = tabpagenr('$')
    endif

  endif

  execute 'tabmove ' . move_to
endfu

nnoremap <silent> tl :<C-U>call <SID>move_tab(1)<cr>
nnoremap <silent> th :<C-U>call <SID>move_tab(-1)<cr>
