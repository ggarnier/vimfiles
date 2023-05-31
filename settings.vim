" ========= Appearance ================
set t_Co=256

set background=dark
set hlsearch
silent! color monokai
set cursorline
set mouse=a
set clipboard+=unnamedplus
runtime macros/matchit.vim
if has("gui_running")
    set guioptions-=T " no toolbar
    set guioptions-=m " no menus
    set guioptions-=r " no scrollbar on the right
    set guioptions-=R " no scrollbar on the right
    set guioptions-=l " no scrollbar on the left
    set guioptions-=b " no scrollbar on the bottom
    set guioptions-=L

    if has("gui_gtk2")
      set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
    else
      set guifont=Meslo\ LG\ M\ Regular\ for\ Powerline:h15
    endif
endif

" ========= NERDTree =================
let NERDTreeIgnore = ['\.pyc$']

" set laststatus=2

" ======== Folding ====================
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" ========= Trailing ==================
autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
autocmd FileType python set sw=4 sts=4 et
autocmd BufRead *.md  set ai formatoptions=tcroqn2 comments=n:&gt;
autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;
fun! StripTrailingWhitespace()
    " Only strip if the b:noStripeWhitespace variable isn't set
		"if &ft =~ '*.snap'
    if exists('b:noStripWhitespace')
        return
    endif
    %s/\s\+$//e
endfun
autocmd BufWritePre * call StripTrailingWhitespace()
autocmd BufRead *.js.snap,*.jsx.snap,*.markdown,*.md let b:noStripWhitespace=1

" ======= EasyMotion ================
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)


" CTRL P
let g:ctrlp_custom_ignore = 'deps\|_build\|vendor\|node_modules\|coverage'
let g:ctrlsf_ackprg = 'rg'

" Vim Go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_fmt_options = {'gofmt': '-s'}
"let g:go_auto_sameids = 1
"let g:go_auto_type_info = 1
let g:go_addtags_transform = "snakecase"

" jedi-vim
let jedi#smart_auto_mappings = 1
let g:jedi#goto_command = "t"

let NERDTreeMapOpenVSplit='v'

let g:neocomplete#enable_at_startup = 1
set completeopt-=preview
" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
let g:go_snippet_engine = "neosnippet"

set shell=/bin/bash

" Tabline colors
hi TabLineFill gui=none guifg=#E8E8E3 guibg=#2D2E27
hi TabLineSel  gui=none guifg=black guibg=#E6DB74

hi TabLineFill cterm=none ctermfg=252 ctermbg=235
hi TabLineSel  cterm=none ctermfg=black ctermbg=186

let g:sneak#streak = 1
let g:sneak#s_next = 1
let g:sneak#absolute_dir = 1
let g:sneak#use_ic_scs = 1

nmap <leader>g <Plug>Sneak_s
nmap <leader>G <Plug>Sneak_S
xmap <leader>g <Plug>Sneak_s
xmap <leader>G <Plug>Sneak_S
omap <leader>g <Plug>Sneak_s
omap <leader>G <Plug>Sneak_S

let g:alchemist_tag_map = 't'


function Multiple_cursors_before()
  let g:deoplete#disable_auto_complete = 1
endfunction
function Multiple_cursors_after()
  let g:deoplete#disable_auto_complete = 0
endfunction


" coc-go / gopls
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
