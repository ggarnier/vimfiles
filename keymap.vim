" ----------
" Leader key
" ----------
let mapleader = ","

imap jk <ESC>
nnoremap ; :

" Paste mode - REMOVED IN NEOVIM 0.9: https://neovim.io/doc/user/news-0.9.html
" set pastetoggle=<Leader>p

" Search
nmap <Space> /
nnoremap / /\v
vnoremap / /\v

" Insert blank line in normal mode
nmap <CR> o<Esc>

" Rotating among results
map <C-i> :cn<CR>
map <C-p> :cp<CR>

" Clear search
nnoremap <leader><space> :noh<cr>

" Saving and buffer stuff
" nmap <leader><ESC> :wqa!<CR>
nmap <leader>q :q<CR>
nmap <leader>w :w!<CR>

" Switch between / delete buffers
noremap <S-l> :bn<CR>
noremap <S-h> :bp<CR>
nmap <leader>d :BD<CR>
nmap <leader>D :bufdo bd<CR>

" " NERDtree
nmap <silent> <leader>m :NERDTreeToggle<cr>%

" Ctrlp.vim
let g:ctrlp_map = '<leader>t'
let g:ctrlp_working_path_mode = 'ra'

" ,# Surround a word with #{ruby interpolation}
map ,# ysiw#
vmap ,# c#{<C-R>"}<ESC>

" ," Surround a word with "quotes"
map ," ysiw"
vmap ," c"<C-R>""<ESC>

" ,' Surround a word with 'single quotes'
map ,' ysiw'
vmap ,' c'<C-R>"'<ESC>

" ,) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
map ,( ysiw(
map ,) ysiw)
vmap ,( c( <C-R>" )<ESC>
vmap ,) c(<C-R>")<ESC>

" ,[ Surround a word with [brackets]
map ,] ysiw]
map ,[ ysiw[
vmap ,[ c[ <C-R>" ]<ESC>
vmap ,] c[<C-R>"]<ESC>

" ,{ Surround a word with {braces}
map ,} ysiw}
map ,{ ysiw{
vmap ,} c{ <C-R>" }<ESC>
vmap ,{ c{<C-R>"}<ESC>

map ,` ysiw`

map <leader>co :TComment<CR>
imap <D-/> <Esc>:TComment<CR>i

" ==============================
" Window/Tab/Split Manipulation
" ==============================
" Move between split windows by using the four directions H, L, I, N
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-j> <C-w>j

" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" Fix commom typos
if has("user_commands")
    command! -bang -nargs=? -complete=file E e<bang> <args>
    command! -bang -nargs=? -complete=file W w<bang> <args>
    command! -bang -nargs=? -complete=file Wq wq<bang> <args>
    command! -bang -nargs=? -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
endif

" Faster scroll
" nnoremap <silent> <c-f> 5<c-e>
" nnoremap <silent> <c-d> 5<c-y>

" Copy line
nmap çç yyp

vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

inoremap II <Esc>I
inoremap AA <Esc>A
inoremap OO <Esc>O
inoremap JJ <Esc>o

" Moving in insert mode
inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-l> <C-o>l

" Dash
nmap <silent> <leader>f <Plug>DashSearch

nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

nnoremap <silent>mm :MaximizerToggle<CR>

" coc.vim
nmap <silent> t <Plug>(coc-definition)
nmap <silent> <leader>r <Plug>(coc-references)
" nmap <silent> <leader>dj <Plug>(coc-implementation)
nmap <silent> [e <Plug>(coc-diagnostic-prev)
nmap <silent> ]e <Plug>(coc-diagnostic-next)
nmap <silent> <leader>n <Plug>(coc-rename)
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
let g:coc_global_extensions = ['coc-go', 'coc-jedi', 'coc-json', 'coc-tsserver', 'coc-yaml']
" Use <tab> and <S-tab> to navigate completion list:
function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackSpace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" Use <c-space> to trigger completion:
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Use <CR> to confirm completion
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

" Vim tags
au FileType ruby nnoremap t <C-]>

" Delete without copying (blackhole register)
map <leader><BS> "_d

if has('nvim')
  nmap <BS> <C-W>h
endif
