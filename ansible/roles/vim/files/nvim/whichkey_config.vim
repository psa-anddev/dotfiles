let g:which_key_map =  { 'name' : 'leader key mappings' }
let g:which_key_map.f = 'open file browser'
let g:which_key_map.l = { 'name' : '+language-server' }
let g:which_key_map.l.g = { 'name' : '+go-to' }
let g:which_key_map.l.g.d = 'definition'
let g:which_key_map.l.r = { 'name' : '+refactor' }
let g:which_key_map.l.r.r = 'rename'
let g:which_key_map.l.r.q = 'quickfix'
let g:which_key_map.g = { 'name' : '+git' }
let g:which_key_map.g.s = 'status'
let g:which_key_map.g.w = 'save-and-stage'
let g:which_key_map.g.r = 'revert'
let g:which_key_map.g.c = 'commit'
let g:which_key_map.g.b = 'blame'
let g:which_key_map.g.l = 'log'
let g:which_key_map.g.k = 'push'
let g:which_key_map.g.t = 'pull'
let g:which_key_map.g.f = 'find-files-in-repo'
let g:which_key_map.g.F = 'find-files-in-repo-with-untracked'
let g:which_key_map[" "] = 'find-file'
let g:which_key_map.L = 'find-lines-in-project'
let g:which_key_map.B = 'find-buffers'

" Register keyboard shortcuts dictionary.
autocmd! User vim-which-key call which_key#register(mapleader, "g:which_key_map")

