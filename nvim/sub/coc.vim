" # I'll believe this stuff
" ============================
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" end of believing
" ============================

" # Keybinds
" ---------------------------------------------------
" <TAB>               Scroll through autocompletion
" <C-SPACE>           Open autocomplete list
" <CR>                Confirm completion while in list
" <space><LEFT>/<space><RIGHT>    Navigate diagnostics (errors)
" gd/gt/gi/gr         GOTO definition/type-definition/implementation/references
" K                   Show documentation in window
" rn                  Rename current word
" F                   Format selected region
" <SPACE>c            Show coc commands
" <SPACE>lf           List symbols in current file
" <SPACE>lw           List symbols in current workspace
" <SPACE>d            List current diagnostics (errors)
" ============================

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" <TAB> Scroll through autocompletion with CR
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
inoremap <expr> <DOWN> pumvisible() ? "\<C-n>" : "\<DOWN>"
inoremap <expr> <UP> pumvisible() ? "\<C-p>" : "\<UP>"
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" <C-SPACE> Open autocomplete list with 
inoremap <silent><expr> <c-space> coc#refresh()

" <TAB> to confirm completion (also includes dependecies), `<C-g>u` means break undo chain at current position.
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<C-g>u\<TAB>"

" d-> and d<- to navigate diagnostics (errors)
nmap <silent> <leader><LEFT> <Plug>(coc-diagnostic-prev)
nmap <silent> <leader><RIGHT> <Plug>(coc-diagnostic-next)

" GOTOs
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>F  <Plug>(coc-format-selected)
nmap <leader>F  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" <SPACE>c: Show coc commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" <SPACE>lf: List symbols in current file
nnoremap <silent> <space>lf  :<C-u>CocList outline<cr>
" <SPACE>lw: List symbols in current workspace
nnoremap <silent> <space>lw  :<C-u>CocList -I symbols<cr>
" <SPACE>d: List current diagnostics (errors)
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
