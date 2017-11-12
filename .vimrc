""" ~/.vimrc
""" vim Personal Preference File @tearoom6

"" plugins (managed by Dein.vim)
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" install Dein.vim itself if it is not installed yet
if &runtimepath !~# '/dein.vim'
   if !isdirectory(s:dein_repo_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
   endif
   execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif
" load plugins list
if dein#load_state(s:dein_dir)
   let g:rc_dir    = expand('~/.vim/rc')
   let s:toml      = g:rc_dir . '/dein.toml'
   let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
   call dein#begin(s:dein_dir)
   call dein#load_toml(s:toml,      {'lazy': 0})
   call dein#load_toml(s:lazy_toml, {'lazy': 1})
   call dein#end()
   call dein#save_state()
endif
" install if it is not installed yet
if dein#check_install()
   call dein#install()
endif

"" set option
" about operation
set backspace=eol,indent,start
set hidden
if v:version > 740
   set spell
   set spelllang=en,cjk
endif
" about completion
set dictionary=~/.vim/dict/ruby.dict
set wildmode=list,full
" about view helper
set showcmd
set cursorline
set number
" about encoding
set encoding=utf-8
"set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
set fileformats=unix,dos,mac
" about status line
set laststatus=2
"set statusline=%<%f\ %m%r%h%w
"set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}
"set statusline+=%=%l/%L,%c%V%8P
" about search
set ignorecase
set smartcase
set hlsearch
" about tab
"set expandtab
"set shiftwidth=3
"set softtabstop=3
"set tabstop=3
" about backupskip path
set backupskip=/tmp/*,/private/tmp/*
" about clipboard
" Check availabiliby by running `vim --version | grep clipboard`
set clipboard=unnamed,unnamedplus

"" change key binding
" about escape key
inoremap jj <Esc>
inoremap kk <Esc>
" about control key
inoremap <C-v> <BS>
inoremap <C-m> <CR>
" about Ex command
noremap ;   :
noremap :   ;
" about move line
noremap j   gj
noremap k   gk
noremap gj   j
noremap gk   k
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
nnoremap <C-a> ^
nnoremap <C-e> $
inoremap <C-a> <Esc>^i
inoremap <C-e> <Esc>$i
" increment / decrement
nnoremap + <C-a>
nnoremap - <C-x>
" about tab window
nmap <C-k> [Tab]
noremap [Tab]<C-n> :<C-u>tabnext<CR>
noremap [Tab]<C-p> :<C-u>tabprevious<CR>
noremap [Tab]<C-k> :<C-u>tabnew<CR>
noremap [Tab]<C-r> :<C-u>tabclose<CR>
" about tags
nmap <C-j> [Tag]
nnoremap [Tag]<C-j>  g<C-]>
nnoremap [Tag]<C-h>  :<C-u>tag<CR>
nnoremap [Tag]<C-k>  :<C-u>pop<CR>
nnoremap [Tag]<c-l>  :<C-u>tags<CR>
" about .vimrc
nnoremap <Space>.   :<C-u>edit $MYVIMRC<CR>
nnoremap <Space>s.   :<C-u>source $MYVIMRC<CR>
" about help
nnoremap <C-h>   :<C-u>help<Space>
nnoremap <C-h><C-h>   :<C-u>help<Space><C-r><C-w><CR>
" insert timestamp
inoremap <expr> ,df   strftime('%Y-%m-%dT%H:%M:%S')
inoremap <expr> ,dd   strftime('%Y-%m-%d')
inoremap <expr> ,dt   strftime('%H:%M:%S')
" select last pasted text
nnoremap gc   `[v`]
vnoremap gc   :<C-u>normal gc<CR>
onoremap gc   :<C-u>normal gc<CR>
" about Unite.vim
nmap <Space> [Unite]
nnoremap <silent> [Unite]a :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [Unite]f :<C-u>Unite<Space>buffer file_mru<CR>
nnoremap <silent> [Unite]d :<C-u>Unite<Space>directory_mru<CR>
nnoremap <silent> [Unite]b :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [Unite]r :<C-u>Unite<Space>register<CR>
nnoremap <silent> [Unite]t :<C-u>Unite<Space>tab<CR>
nnoremap <silent> [Unite]h :<C-u>Unite<Space>history/yank<CR>
nnoremap <silent> [Unite]o :<C-u>Unite<Space>outline<CR>
nnoremap <silent> [Unite]m :<C-u>Unite<Space>rails/model<CR>
nnoremap <silent> [Unite]v :<C-u>Unite<Space>rails/view<CR>
nnoremap <silent> [Unite]c :<C-u>Unite<Space>rails/controller<CR>
nnoremap <silent> [Unite]cc :<C-u>Unite<Space>rails/config<CR>
nnoremap <silent> [Unite]db :<C-u>Unite<Space>rails/db -input=migrate<CR>
nnoremap <silent> [Unite]<CR> :<C-u>Unite<Space>file_rec:!<CR>
" about NERDTree
nnoremap <silent> <C-l> :NERDTreeToggle<CR>
" about vim-fugitive
nmap <Space>g [fugitive]
nnoremap <silent> [fugitive]s :<C-u>Gstatus<CR>
nnoremap <silent> [fugitive]l :<C-u>Glog<CR>
nnoremap <silent> [fugitive]d :<C-u>Gvdiff<CR>
nnoremap <silent> [fugitive]b :<C-u>Gblame<CR>
nnoremap <silent> [fugitive]r :<C-u>Gread<CR>
nnoremap <silent> [fugitive]a :<C-u>Gwrite<CR>
nnoremap <silent> [fugitive]c :<C-u>Gcommit<CR>

"" auto command
" persist last edited section
autocmd BufWinLeave ?* silent mkview
autocmd BufWinEnter ?* silent loadview
" define original highlight
autocmd ColorScheme *
   \ highlight TabLine
   \           cterm=NONE
   \           ctermfg=lightgray
   \           ctermbg=darkgray
doautocmd ColorScheme _
" highlight current-window's cursor line
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

"" user-defined Ex command
" about encoding
command! Cp932   edit ++enc=cp932
command! Eucjp   edit ++enc=euc-jp
command! Iso2022jp   edit ++enc=iso-2022-jp
command! Utf8   edit ++enc=utf-8
command! Jis   Iso2022jp
command! Sjis   Cp932
" alter cd completion functionality
command! -complete=customlist,CompleteCD -nargs=? CD   cd <args>
function! CompleteCD(arglead, cmdline, cursorpos)
   let pattern = join(split(a:cmdline, '\s', !0)[1:], ' ') . '*/'
   return split(globpath(&cdpath, pattern), "\n")
endfunction
cnoreabbrev <expr> cd   (getcmdtype() == ':' && getcmdline() ==# 'cd') ? 'CD' : 'cd'

"" filetype plugin
" handle by file type
filetype plugin indent on
syntax enable

"" color scheme
" default
colorscheme darkblue

"" plugin configs
" vim-indent-guides
let g:indent_guides_auto_colors=1
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1
" lightline.vim
let g:lightline = {
\    'colorscheme': 'wombat',
\    'active': {
\       'left': [
\          ['mode', 'paste'],
\          ['fugitive', 'readonly', 'filename', 'modified']
\       ]
\    },
\    'component_function': {
\       'fugitive': 'LightLineFugitive',
\       'readonly': 'LightLineReadonly',
\       'modified': 'LightLineModified',
\    },
\ }
function! LightLineFugitive()
   return exists('*fugitive#head') ? fugitive#head() : ''
endfunction
function! LightLineReadonly()
   return &filetype != 'help' ? '' : &readonly ? 'RO' : ''
endfunction
function! LightLineModified()
   return &filetype != 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

