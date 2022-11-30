" --- General Settings ---

syntax on

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/syntastic'
Plug 'dense-analysis/ale'
Plug 'altercation/vim-colors-solarized'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'preservim/tagbar'
Plug 'sheerun/vim-polyglot'
Plug 'davidhalter/jedi-vim'
Plug 'makerj/vim-pdf'

call plug#end()

set encoding=UTF-8
set backspace=indent,eol,start
set ruler
set background=dark
set relativenumber
set number
set showcmd
set incsearch
set ignorecase
set smartcase
set hlsearch
set laststatus=2

nnoremap <silent><expr> <Leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:solarized_termcolors=256

let NERDTreeShowHidden=1
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

let g:ale_linters = {'python': ['flake8', 'pylint']}
let g:ale_fixers = {'python': ['yapf']}
nmap <F10> :ALEFix<CR>
let g:ale_fix_on_save = 1

" vim-powered terminal in split window
map <Leader>t :bo term ++rows=10 ++close<cr>
tmap <Leader>t <c-w>:bo term ++rows=10 ++close<cr>
" vim-powered terminal in new tab
map <Leader>T :tab term ++close<cr>
tmap <Leader>T <c-w>:tab term ++close<cr>
" fzf
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>R :Ag<CR>
" tagbar
nmap <F8> :TagbarToggle<CR>

let g:jedi#popup_on_dot = 0

command! -bang -nargs=+ -complete=dir Rag call fzf#vim#ag_raw(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

colorscheme solarized
