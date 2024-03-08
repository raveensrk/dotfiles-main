let g:fzf_vim = {}
let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.7, 'relative': v:true } }
let g:fzf_preview_window = ['hidden,right,50%,<70(up,40%)', 'ctrl-/']
let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_tags_command = 'ctags -R'
let g:fzf_commands_expect = 'alt-enter,ctrl-x'
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
imap <expr> <c-x>f fzf#vim#complete#path('rg --hidden --files')
imap <c-x>k <plug>(fzf-complete-word)
imap <c-x>l <plug>(fzf-complete-line)
command! -bang DOT call fzf#vim#files('$MY_REPOS/dotfiles-main', <bang>0)
nmap <leader>f. :DOT<CR>
command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, {'options': ['--exact', '--layout=reverse', '--info=inline']}, <bang>0)
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})
if exists("g:rg_path_list")
else
    let g:rg_path_list = [" . "]
endif
let g:rg_path = join(uniq(sort(g:rg_path_list)), " ")
let g:rgsource = "rg --follow -n ^ --color always --hidden " . g:rg_path

inoremap <expr> <c-x>L fzf#vim#complete(fzf#wrap({
      \ 'prefix': '^.*$',
      \ 'source': g:rgsource,
      \ 'options': '--ansi --delimiter : --nth 3..',
      \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

function! s:make_sentence(lines)
    return substitute(join(a:lines), '^.', '\=toupper(submatch(0))', '').'.'
endfunction

inoremap <expr> <c-x><c-s> fzf#vim#complete({
      \ 'source':  'cat /usr/share/dict/words',
      \ 'reducer': function('<sid>make_sentence'),
      \ 'options': '--multi --reverse --margin 15%,0',
      \ 'left':    20})

let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit' }

function! s:build_quickfix_list(lines)
    call setqflist(map(copy(a:lines), '{ "filename": v:val, "lnum": 1 }'))
    copen
    cc
endfunction

let g:fzf_action = {
            \ 'ctrl-q': function('s:build_quickfix_list'),
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit' }


let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

let g:fzf_history_dir = '~/.local/share/fzf-history'

" command! -nargs=* Rg
"       \ call fzf#vim#grep(
"       \   'rg --hidden --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>),
"       \   1,
"       \   {'options': '--delimiter : --nth 1..'})

command! -nargs=* DOTG
      \ call fzf#vim#grep(
      \   'rg . --hidden --column --line-number --no-heading --color=always --smart-case $HOME/my_repos/dotfiles-main '.shellescape(<q-args>),
      \   1,
      \   {'options': ' --delimiter : --nth 1..'})

let g:fzf_vim.listproc = { list -> fzf#vim#listproc#location(list) }

command! -bang -nargs=* History 
            \ call fzf#vim#history(
            \ {'options': 
            \ ['--layout=reverse', 
            \ '--info=inline', 
            \ '--delimiter=/', 
            \ '--with-nth=-1']
            \ })
