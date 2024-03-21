let g:vim_addon_qf_layout = {}
" let g:vim_addon_qf_layout.quickfix_formatters = [ 'vim_addon_qf_layout#DefaultFormatter', 'NOP', 'vim_addon_qf_layout#FormatterNoFilename', 'vim_addon_qf_layout#Reset' ]
" noremap \no_filenames call vim_addon_qf_layout#ReformatWith('vim_addon_qf_layout#FormatterNoFilename')<cr>
let g:vim_addon_qf_layout.quickfix_formatters = [ 'vim_addon_qf_layout#DefaultFormatter', 'vim_addon_qf_layout#Reset']
let g:vim_addon_qf_layout.lhs_cycle = '<buffer> \v'
let g:vim_addon_qf_layout.file_name_align_max_width = 20

nmap ,,C :lclose<cr>
nmap ,,c :lopen<cr>
nmap ,,n :lnext<cr>,,
nmap ,,p :lprevious<cr>,,
nmap ,n :cnext<cr>,
nmap ,p :cprevious<cr>,
nmap ,c :copen<cr>
nmap ,C :cclose<cr>
