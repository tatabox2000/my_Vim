".gvimrc カラー設定
"カラー設定した後にCursorIMを定義する方法
colorscheme desert

gui
set transparency=235

if has('multi_byte_ime')
  highlight Cursor guifg=NONE guibg=Green
  highlight CursorIM guifg=NONE guibg=Purple
endif

vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>


set guioptions =m
gui
:set nu!
:set splitbelow
:set splitright
"set list                " 不可視文字の可視化
set wrap                " 長いテキストの折り返し
set textwidth=0         " 自動的に改行が入るのを無効化
set colorcolumn=80      " 80文字目にラインを入れる

" スクリーンベルを無効化
set t_vb=
set novisualbell
"タブ表示
set showtabline=2
" 自動補完の色
hi Pmenu guibg=#f5f5dc guifg=#000000
hi PmenuSel guibg=#0000ff guifg=#ffffff
hi PmenuSbar guibg=#aaaaaa
hi PmenuThumb guifg=#0000ff
