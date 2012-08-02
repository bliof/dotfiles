let s:UsedEncodings = {}

function! SetLastEncoding()
	let filename = expand('%:p')
	if(has_key(s:UsedEncodings, filename) && s:UsedEncodings[filename] !=# &fileencoding)
    	execute 'e ++enc='.s:UsedEncodings[filename].' %:p'
	endif
endf

function! ChangeFileencoding()
  if(!exists('b:initial_encoding')) 
    let b:initial_encoding = &fileencoding
  endif
  let encodings = [b:initial_encoding]
  if exists("g:encodingOptions")
  	let encodings += g:encodingOptions
  endif
  let prompt_encs = []
  let index = 0 
  while index < len(encodings)
    call add(prompt_encs, index.'. '.encodings[index])
    let index = index + 1 
  endwhile
  let choice = inputlist(prompt_encs)
  if choice >= 0 && choice < len(encodings)
	let filename = expand('%:p')
	let s:UsedEncodings[filename] = encodings[choice]
    execute 'e ++enc='.encodings[choice].' %:p'
  endif
endf

function! DumpUsedEncodings()
	echo string(s:UsedEncodings)
endf

nmap <F5> :call ChangeFileencoding()<CR>
