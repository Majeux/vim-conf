" Plugins
call plug#begin('~/.vim/plugged')
" GUI
Plug 'machakann/vim-highlightedyank'
Plug 'https://github.com/lifepillar/vim-solarized8'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'

" Semantic language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntactic language support
Plug 'sheerun/vim-polyglot' "language pack (syntax+indents)
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'joom/latex-unicoder.vim'

" GUI Tools
Plug 'simnalamburt/vim-mundo'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' } " needs pyvim

" Tools
Plug 'tpope/vim-commentary'
Plug 'conradirwin/vim-bracketed-paste'
Plug 'airblade/vim-rooter'

" Nouns, Verbs, textobjects
Plug 'tpope/vim-surround'
" - Place surround: ys[text][char]. 	Ex: ysiw(
" - Place surround line: yss[char].
" - Change surrounded: cs[from][to]. 	Ex: cs'"
" - delete surrounded: ds[del]. 		Ex: ds(
Plug 'tpope/vim-repeat'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'

call plug#end()

" # Basic behaviour
" ========================================================================
set pyxversion=3 " use python3
let mapleader="\<SPACE>" "Map the leader key to SPACE

source ~/.config/nvim/sub/editor.vim
source ~/.config/nvim/sub/search.vim
source ~/.config/nvim/sub/coc.vim

" # Small plugin behaviours (not worth their own file)
" ========================================================================
" disables multiple modes in clap which allows escape to always quit clap
let g:clap_insert_mode_only = v:true

" let airline display ALE info
let g:airline#extensions#ale#enabled = 1

" Use coc for lsp
let g:ale_disable_lsp = 1
let g:ale_completion_enabled = 1
let b:coc_suggest_disable = 0

" set startup menu
let g:startify_list = [
  \ { 'type': 'sessions',  'header': ['   Sessions'],      },
  \ { 'type': 'files',     'header': ['   MRU']            },
  \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': 'commands',  'header': ['   Commands']       },
  \ ]

" # Misc Keybindings
" ========================================================================
" put contents of visual select in clipboard
vnoremap <C-c> "+y
" automatically enter insert mode when entering terminal window
autocmd TermOpen * startinsert
" escape from insert mode into normal mode when in terminal
tnoremap <ESC> <C-\><C-n> 

" */# put current word in search, but stay on current word
nnoremap # #N
nnoremap * *N

" toggle between last buffer
nnoremap <leader><leader> <c-^>

" swap ; : in normal mode
nnoremap ; :
nnoremap : ;

" open buffers
nnoremap <Leader>b :buffers<CR>:buffer<Space>

"yank till end of line
nnoremap Y y$

colorscheme solarized8_high
