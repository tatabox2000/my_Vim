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
NeoBundle 'itchyny/lightline.vim'


filetype plugin indent on     " required!
filetype indent on
syntax on

" ���̓��[�h���ɑf����jj�Ɠ��͂����ꍇ��ESC�Ƃ݂Ȃ�
inoremap jj <Esc>

" j, k �ɂ��ړ���܂�Ԃ��ꂽ�e�L�X�g�ł����R�ɐU�镑���悤�ɕύX
nnoremap j gj
nnoremap k gk

" �X���b�v�t�@�C����������
set nowritebackup
set nobackup
set noswapfile



" �J�[�\�����̒P��� * �Ō���
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>

" ������ɃW�����v�����ۂɌ����P�����ʒ����Ɏ����Ă���
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" j, k �ɂ��ړ���܂�Ԃ��ꂽ�e�L�X�g�ł����R�ɐU�镑���悤�ɕύX
nnoremap j gj
nnoremap k gk

" TAB�ɂđΉ��y�A�ɃW�����v
nnoremap <Tab> %
vnoremap <Tab> %

"neocomplete
let g:neocomplete_enable_at_startup = 0
inoremap <expr><Up> pumvisible() ? neocomplete#close_popup()."\<Up>" : "\<Up>"
inoremap <expr><Down> pumvisible() ? neocomplete#close_popup()."\<Down>" : "\<Down>"

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>" 
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>" 
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
"quickrun�̐ݒ�
NeoBundleLazy "thinca/vim-quickrun", {
      \ "autoload": {
      \   "mappings": [['nxo', '<Plug>(quickrun)']]
      \ }}

let s:hooks = neobundle#get_hooks("vim-quickrun")
function! s:hooks.on_source(bundle)
  let g:quickrun_config = {
      \ "*": {"runner": "remote/vimproc"},
      \ }
endfunction

"quickrun���s�i�X�y�[�X�{r�j
silent! nmap <Space>r <Plug>(quickrun)

"�X�}�[�g�C���f���g
set smartindent
" VimShell �̋N���R�}���h
silent! nmap <Space>m <Plug>(vimshell)
