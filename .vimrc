""" ~/.vimrc

"" plugins (managed by NeoBundle)
set runtimepath+=~/.vim/bundle/neobundle.vim
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
" My Bundles here:
NeoBundle 'Shougo/vimproc'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'szw/vim-tags'
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
" about .vimrc
nnoremap <Space>.   :<C-u>edit $MYVIMRC<Enter>
nnoremap <Space>s.   :<C-u>source $MYVIMRC<Enter>
" about help
nnoremap <C-h>   :<C-u>help<Space>
nnoremap <C-h><C-h>   :<C-u>help<Space><C-r><C-w><Enter>
" insert timestamp
inoremap <expr> ,df   strftime('%Y-%m-%dT%H:%M:%S')
inoremap <expr> ,dd   strftime('%Y-%m-%d')
inoremap <expr> ,dt   strftime('%H:%M:%S')
" select last pasted text
nnoremap gc   `[v`]
vnoremap gc   :<C-u>normal gc<Enter>
onoremap gc   :<C-u>normal gc<Enter>
" about NERDTree
nnoremap <silent><C-f> :NERDTreeToggle<CR>

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
