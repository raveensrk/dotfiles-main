function! s:Format(line1,line2) abort
	let save_cursor = getcurpos()
	execute a:line1 . ',' . a:line2 . '!black -q  -l 100 -'
	call setpos('.', save_cursor)
endfunction

command! -buffer -range=% Format call s:Format(<line1>,<line2>)
command! -buffer Lint !pylint --logging-format-style=new %
command! CommentInspect call CommentAllMatchingLines('^\s\+inspect')
