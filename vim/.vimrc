
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2006 Aug 12
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()



" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'plasticboy/vim-markdown' " markdown syntax highlighting and shortcuts
Plugin 'Valloric/YouCompleteMe'
Plugin 'derekwyatt/vim-scala'
Plugin 'klen/python-mode'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



"-------------------------------------------
"End of Vundle stuff

"" When started as "evim", evim.vim will already have done these settings.
"if v:progname =~? "evim"
"  finish
"endif

" this is adding all plugin for directory exploring maybe want to change this
" later
" filetype plugin on

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" In an xterm the mouse should work quite well, thus enable it.
set mouse=a

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
"command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
"	 	\ | wincmd p | diffthis
"
"
" Added by Tom
set modeline
set ls=2
set nu
set shiftwidth=4
set tabstop=4
" set textwidth=80
set backupdir=~/tmp
set splitbelow
set splitright
set expandtab
set hidden " so that can navigate through buffers that have yet to be written
" this maps %% to the directory of the active buffer in commandline mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/': '%%'
" Making file completion like bash
if has("wildmenu")
	set wildignore+=*.a,*.o
	set wildignore+=.DS_Store
	set wildignore+=*~,*.swp,*.tmp
	set wildmenu
	set wildmode=longest,list
endif
" Not sure that I want to keep this
set ignorecase
set smartcase

" for markdown in all .md files
au BufNewFile,BufRead *.md set filetype=markdown
let g:vim_markdown_folding_disabled=1 " markdown - don't want folding


" this is for .td files in llvm
augroup filetype
	au! BufRead,BufNewFile *.td set filetype=tablegen
augroup END

" this is for .ll files
augroup filetype
	au! BufRead,BufNewFile *.ll set filetype=llvm
augroup END

" this is for ctags stuff
set tags=./tags;
" this is for you complete me file extension
let g:ycm_collect_identifiers_from_tags_files = 1
let g:tex_flavor='latex'
let g:ycm_filetype_blacklist = {'plaintex' : 1,
			\ 'tex' : 1,
			\ 'text': 1}
" might want to add more filetypes to this blacklist...
"
" python stuff
au FileType Python set autoindent
au FileType Python set textwidth=79
au FileType Python set tabstop=4
au FileType Python set softtabstop=4
au FileType Python set shiftwidth=4
au FileType Python set expandtab
" au FileType Python set list
" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0
