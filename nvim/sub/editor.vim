" Editor configs
set backspace=indent,eol,start " backspace over anything
set autoindent
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.
set noerrorbells visualbell t_vb= "disable horrible bell
set incsearch " Enable searching as you type, rather than waiting till you press enter.
set ignorecase "ignore case in search
set smartcase "except when I put a capital in the query
set incsearch "highlight all matches:
set mouse+=a "enable mouse support
set undodir=~/.vimdid "permanent undo
set undofile "permanent undo

" Spelling
set spell spelllang=en_gb
set spellsuggest+=10 "don't take up the entire screen with spell suggestions
set hidden "allow to hide an unsaved buffer
set splitbelow "new split goes bottom
set splitright "new split goes right
set tabstop=4
set shiftwidth=4

" Display
syntax on " highlighting

set number " line number in column
set relativenumber " offset to current line in column
set laststatus=2 " always show status at bottom even if only one window
set termguicolors " use terminal scheme
highlight Comment cterm=italic gui=italic

" Automatic paste mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
	  return ""
endfunction

" Keybinds
" ===================================
" search for file to open
nnoremap <leader>o :Clap files<CR>
" open/close file tree
nnoremap <leader>t :CHADopen<CR>
" find in files
nnoremap <leader>f :Clap grep<CR>
" view a tree of all undoes
nnoremap <leader>u :MundoToggle<CR>

" Indent with TAB
nnoremap <TAB> >
nnoremap <S-TAB> <
nnoremap <TAB><TAB> >>
nnoremap <S-TAB><S-TAB> <<

" digraph
" inoremap <C-\> <C-k>

" <C-l> to enter latex symbols
nnoremap <C-l> :call unicoder#start(0)<CR>
inoremap <C-l> <Esc>:call unicoder#start(1)<CR>
