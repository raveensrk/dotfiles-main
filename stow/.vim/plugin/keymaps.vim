" imap nnn <Esc>
" This will create a file under cursor
nmap <leader>gf :e <cfile><CR>
" Find all reference of the string under cursor
nnoremap <leader>ref :grep  * -r<CR>
nmap <leader>= magg=G`a<CR>
nnoremap Y yg_
nmap <leader>b :Buffers<CR>
