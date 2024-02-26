cd %:h
set makeprg=cat\ logfile.log
set errorformat=%.%#error:\ %f:%l,
set errorformat+=%.%#xmvlog:\ (%f\\,%l\|%c),
" set errorformat+=%.%#xmvlog:\ %\\%#E\\,%l
" set errorformat+=%.%#xmvlog:\ %\\%#E\\,%.%#(%f\\,%l\|%c):\ %m
set errorformat+=%.%#xmvlog:\ %\\%#%t\\,%o%.%#(%f\\,%l\|%c):\ %m
" set errorformat+=%.%#xmsim:\ %\\%#E\\,%o:\ %m
set errorformat+=%E%.%#xmsim:\ %\\%#E\\,%o:\ %m,%C%.%#File:\ %f\\,\ line\ =\ %l\\,\ pos\ =\ %c,%Z
set errorformat+=%EUVM_FATAL\ @\ %.%#:\ %o
set errorformat+=%E%o\ %f(%l)\ @\ %c:\ %m%.%#
w
tabnew +make | copen
