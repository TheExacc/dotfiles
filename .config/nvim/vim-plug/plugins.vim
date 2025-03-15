" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
    Plug 'turbio/bracey.vim', { 'do': 'npm install --prefix server' }
    Plug 'ellisonleao/carbon-now.nvim'
    Plug 'https://github.com/ycm-core/YouCompleteMe'
    Plug 'ggreer/the_silver_searcher'
    Plug 'erietz/vim-terminator', { 'branch': 'main'}
    Plug 'sheerun/vim-polyglot'
    Plug 'scrooloose/NERDTree'
    Plug 'jiangmiao/auto-pairs'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'http://github.com/tpope/vim-surround'
    Plug 'neovim/nvim-lspconfig' 
    Plug 'nvim-lua/completion-nvim'
    Plug 'http://github.com/tpope/vim-surround'
    Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
    Plug 'https://github.com/mbbill/undotree'
    Plug 'github/copilot.vim'
   " Plug 'https://github.com/numirias/semshi'
    Plug 'https://github.com/tpope/vim-fugitive'
    Plug 'https://github.com/preservim/tagbar', {'on': 'TagbarToggle'} " Tagbar for code navigation
    Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
    Plug 'https://github.com/vim-airline/vim-airline' " Status bar
    Plug 'vim-airline/vim-airline-themes'
    Plug 'https://github.com/davidhalter/jedi-vim'
    Plug 'https://github.com/junegunn/fzf.vim' " Fuzzy Finder, Needs Silversearcher-ag for :Ag
    Plug 'https://github.com/junegunn/fzf'
    Plug 'morhetz/gruvbox'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'myusuf3/numbers.vim'
    Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-lua/plenary.nvim'
call plug#end()

set encoding=UTF-8

:colorscheme gruvbox

" VIM AIRLINE CONFIGURATION
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text'
    \]

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"C/C++
let g:runner_c_compiler = 'gcc'
let g:runner_cpp_compiler = 'g++'
let g:runner_c_options = '-std=c99 -Wall'
let g:runner_cpp_options = '-std=c++11 -Wall'

nmap <F8> :TagbarToggle<CR>
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

" for coc keybinding
let g:ycm_auto_trigger = 0
imap <c-d> <plug>(YCMComplete)

nnoremap <leader>jd :YcmCompleter GoTo<CR>
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>" 
function MyCustomHighlights()
    hi semshiGlobal      ctermfg=blue guifg=#61afef
	hi semshiImported    ctermfg=red guifg=#d28fd7 cterm=bold gui=bold
	hi semshiBuiltin     ctermfg=yellow guifg=#f5d08b
	hi semshiSelected    ctermfg=white guifg=#dddddd ctermbg=gray guibg=#454c5a
endfunction
autocmd FileType python call MyCustomHighlights()



" NERDTree Configuration

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let g:python_highlight_all = 1

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :UndotreeToggle<CR>

let mapleader= '\'
