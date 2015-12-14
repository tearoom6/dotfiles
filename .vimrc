""" ~/.vimrc

"" plugins (managed by NeoBundle)
set runtimepath+=~/.vim/bundle/neobundle.vim
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
" common
NeoBundle 'Shougo/vimproc'
" utility
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neoyank.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'scrooloose/nerdtree'
" editor
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'szw/vim-tags'
NeoBundle 'tpope/vim-endwise'
" Ruby
NeoBundle 'tpope/vim-rails'
NeoBundle 'basyura/unite-rails'
call neobundle#end()
NeoBundleCheck   " confirm if allows new plugin install

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
set statusline=%<%f\ %m%r%h%w
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}
set statusline+=%=%l/%L,%c%V%8P
" about search
set ignorecase
set smartcase
set hlsearch
" about tab
"set expandtab
"set shiftwidth=3
"set softtabstop=3
"set tabstop=3

"" change key binding
" about escape key
imap jj <Esc>
" about Ex command
noremap ;   :
noremap :   ;
" about move line
noremap j   gj
noremap k   gk
noremap gj   j
noremap gk   k
" about tab window
noremap <silent> <C-n> :tabnext<CR>
noremap <silent> <C-p> :tabprevious<CR>
noremap <silent> <C-t><C-t> :tabnew<CR>
noremap <silent> <C-t>x :tabclose<CR>
" about ctags
nnoremap <C-]> g<C-]>
nnoremap <C-[> <C-t>
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
nnoremap <silent> <C-a> :NERDTreeToggle<CR>

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
