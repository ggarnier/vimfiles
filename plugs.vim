call plug#begin('~/.config/nvim/plugged')
" On-demand loading
" ======== Interface ==========
Plug 'drmingdrmer/vim-tabbar'
Plug 'crusoexia/vim-monokai'
Plug 'szw/vim-maximizer'

" ======== Project ===========
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'kien/ctrlp.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'jremmen/vim-ripgrep'

" ======= Vim improvments ===
Plug 'vim-scripts/bufkill.vim'
Plug 'sickill/vim-pasta'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'Raimondi/delimitMate'
Plug 'tomtom/tcomment_vim'

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'benekastah/neomake'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" ====== Python ==========
Plug 'davidhalter/jedi-vim'
Plug 'psf/black'

" ====== JS ==========
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Add plugins to &runtimepath
call plug#end()
