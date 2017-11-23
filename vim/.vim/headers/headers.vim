" Automatic headers for various file types

function WriteHeader(ext,commentchar,uselicense)
	" Format for created and last modified dates
	let datefmt = "%a %b %d, %Y | %I:%M%P %Z"
	" Extract first character from commentchar if applicable
	let firstchar = strpart(a:commentchar,0,1)

	" Paste header text
	exe 'au bufnewfile *.'.a:ext.' so $HOME/.vim/headers/header_template.vim'

	" Paste license text if required
	if (a:uselicense)
		exe 'au bufnewfile *.'.a:ext.' so $HOME/.vim/headers/license_template.vim'
	endif

	" Replace comments with appropriate character
	exe 'au bufnewfile *.'.a:ext.' silent exe "%s@#@"."'.a:commentchar.'@g"'
	" For 2-letter comments (C++ //), remove extra dashes
	if len(a:commentchar) > 1
		exe 'au bufnewfile *.'.a:ext.' silent exe "%s@-@@g"'
		exe 'au bufnewfile *.'.a:ext.' exe "norm 7GA'.a:commentchar.'"'
		exe 'au bufnewfile *.'.a:ext.' exe "norm 9GA'.a:commentchar.'"'
		exe 'au bufnewfile *.'.a:ext.' exe "norm 26GA'.a:commentchar.'"'
	endif
	" Replace file name
	exe 'au bufnewfile *.'.a:ext.' exe "1,6g/File Name:.*/s//File Name: " .expand("%")'
	" Write date created
	exe 'au bufnewfile *.'.a:ext.' exe "1,6g/Created:.*/s//Created: " .strftime("'.datefmt.'")'
	" Move cursor to description field
	exe 'au bufnewfile *.'.a:ext.' exe "norm 2GA "'
	" Enter insert mode upon opening file - ! for append mode
	"exe 'au bufnewfile *.'.a:ext.' exe "startinsert!"'

	" Write 'Last Modified' date upon saving
	" Remembder cursor location
	exe 'au Bufwritepre,filewritepre *.'.a:ext.' exe "normal ma"'
	" Replace date
	exe 'au Bufwritepre,filewritepre *.'.a:ext.' exe "1," . 6 . "g/Last Modified:.*/s/Last Modified:.*/Last Modified: " .strftime("'.datefmt.'")'
	" Return cursor to original location
	exe 'au bufwritepost,filewritepost *.'.a:ext.' exe "normal `a"'
endfunction

" Fortran 77
call WriteHeader('f','c',0)

" Fortran 90
call WriteHeader('f90','!',1)

" C++
call WriteHeader('cpp','//',1)

" Python
call WriteHeader('py','#',1)

" Bash
call WriteHeader('sh','#',0)

" Latex
call WriteHeader('tex','%',0)

" C
call WriteHeader('c','//',1)
