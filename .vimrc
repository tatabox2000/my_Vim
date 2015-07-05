if !1 | finish | endif
"tab to space
set expandtab
set tabstop=4
set shiftwidth=4
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

   " Required:
  set runtimepath+=~/vimfiles/bundle/neobundle.vim/
endif

 " Required:
call neobundle#begin(expand('~/vimfiles/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'thinca/vim-template'
NeoBundle 'lambdalisue/vim-django-support'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'vobornik/vim-mql4'
NeoBundle 'tukiyo/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'tpope/vim-dispatch'
NeoBundleLazy 'OmniSharp/omnisharp-vim', {
\   'autoload': {'filetypes': ['cs']},
\   'build': {
\     'windows': 'MSBuild.exe server/OmniSharp.sln /p:Platform="Any CPU"',
\     'mac': 'xbuild server/OmniSharp.sln',
\     'unix': 'xbuild server/OmniSharp.sln',
\   }
\ }

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

 " Required:
filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
NeoBundleCheck


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

nnoremap / g/

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
autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" "neocomplete tuika
let g:jedi#auto_vim_configuration = 0
if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
let g:neocomplete#force_omni_input_patterns.cs = '.*[^=\);]'

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
