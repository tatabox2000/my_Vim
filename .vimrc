if !1 | finish | endif
"tab to space
set expandtab
set tabstop=4
set shiftwidth=4
imap <C-j> <esc>
set swapfile
set dir=c:\\Temp
set undodir=c:\\Temp


let s:dein_dir = expand('~\vimfiles\dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '\repos\github.com\Shougo\dein.vim'
" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    "execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
    execute 'set runtimepath^=' . s:dein_repo_dir   
endif



"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
"set runtimepath+=/c/Users/tatab/vimfiles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " Let dein manage dein
  " Required:
  call dein#add(s:dein_repo_dir)
  
  call dein#add('vim-scripts/VimClojure')
  call dein#add('Shougo/vimproc')
  call dein#add('Shougo/vimshell')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/neocomplete')
  call dein#add('Shougo/neosnippet')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('jpalardy/vim-slime')
  call dein#add('davidhalter/jedi-vim')
  call dein#add('Shougo/vimfiler')
  call dein#add('thinca/vim-template')
  call dein#add('lambdalisue/vim-django-support')
  call dein#add('itchyny/lightline.vim')
  call dein#add('vobornik/vim-mql4')
  call dein#add('tukiyo/previm')
  call dein#add('tyru/open-browser.vim')
  call dein#add('tpope/vim-dispatch')
  call dein#add('thinca/vim-quickrun') 
  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif
let g:quickrun_config = {'*': {'hook/time/enable': '1'},}
"let g:quickrun_config = {
"  \ 'python': {
"  \   'command': 'python3'
"  \ },}
" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------


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
let g:neocomplete#enable_complete_select = 1
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>" 
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>" 
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"


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
set pythonthreedll=C:\ProgramData\Anaconda3\python36.dll
set pythondll=C:\ProgramData\Anaconda3\python36.dll
