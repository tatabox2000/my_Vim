if has('vim_starting')
  set runtimepath+=~/vimfiles/bundle/neobundle.vim
  call neobundle#rc(expand('~/vimfiles/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'thinca/vim-template'
NeoBundle 'lambdalisue/vim-django-support'
NeoBundle 'lightline.vim'
NeoBundle 'vobornik/vim-mql4'
NeoBundle 'tukiyo/previm'

NeoBundle 'tyru/open-browser.vim'
filetype plugin indent on     " required!
filetype indent on
syntax on

" 入力モード中に素早くjjと入力した場合はESCとみなす
inoremap jj <Esc>

" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk

" スワップファイル等無効化
set nowritebackup
set nobackup
set noswapfile



" カーソル下の単語を * で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk

" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %

"neocomplete
let g:neocomplete#enable_at_startup = 1
inoremap <expr><Up> pumvisible() ? neocomplete#close_popup()."\<Up>" : "\<Up>"
inoremap <expr><Down> pumvisible() ? neocomplete#close_popup()."\<Down>" : "\<Down>"

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>" 
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>" 
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
"quickrunの設定
NeoBundleLazy "thinca/vim-quickrun", {
      \ "autoload": {
      \   "mappings": [['nxo', '<Plug>(quickrun)']]
      \ }}

let s:hooks = neobundle#get_hooks("vim-quickrun")
function! s:hooks.on_source(bundle)
    let g:quickrun_config={'*': {'split': ''}}
    set splitbelow
    let g:quickrun_config = {\ "*": {"runner": "remote/vimproc"},\ }

endfunction

"quickrun実行（スペース＋r）
silent! nmap <Space>r <Plug>(quickrun)

"スマートインデント
set smartindent
" VimShell の起動コマンド
silent! nmap <Space>m <Plug>(vimshell)
"open-brawser
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)



" Previm
let g:previm_open_cmd = ''
augroup PrevimSettings
	autocmd!
	autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

nnoremap [previm] <Nop>
nmap <Space>p [previm]
nnoremap <silent> [previm]o :<C-u>PrevimOpen<CR>
nnoremap <silent> [previm]r :call previm#refresh()<CR>
