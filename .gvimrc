".gvimrc �J���[�ݒ�
"�J���[�ݒ肵�����CursorIM���`������@
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
"set list                " �s�������̉���
set wrap                " �����e�L�X�g�̐܂�Ԃ�
set textwidth=0         " �����I�ɉ��s������̂𖳌���
set colorcolumn=80      " 80�����ڂɃ��C��������

" �X�N���[���x���𖳌���
set t_vb=
set novisualbell
"�^�u�\��
set showtabline=2
" �����⊮�̐F
hi Pmenu guibg=#f5f5dc guifg=#000000
hi PmenuSel guibg=#0000ff guifg=#ffffff
hi PmenuSbar guibg=#aaaaaa
hi PmenuThumb guifg=#0000ff
