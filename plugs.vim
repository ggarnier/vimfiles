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
"Plug 'tpope/vim-obsession' " Dependency for vim-prosession
"Plug 'dhruvasagar/vim-prosession'
Plug 'jremmen/vim-ripgrep'

" ======= Vim improvments ===
Plug 'vim-scripts/bufkill.vim'
Plug 'justinmk/vim-sneak'
Plug 'sickill/vim-pasta'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'Raimondi/delimitMate'
Plug 'tomtom/tcomment_vim'
Plug 'easymotion/vim-easymotion'
Plug 'mtth/scratch.vim'

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'benekastah/neomake'
Plug 'ervandew/supertab'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" ====== Python ==========
Plug 'davidhalter/jedi-vim'

" ====== JS ==========
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

" Add plugins to &runtimepath
call plug#end()
