" Turn on highlighted search results
set hlsearch  

" Clear search highlight and bar
nnoremap <silent> <space>/ :nohlsearch<Bar>:echo<CR>

" # Keybinds
" ===================
" //: search for visually selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
