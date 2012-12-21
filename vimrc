" I probably don't need to have Vi compatibility.
set nocompatible

" Copied from /usr/local/vim/vimrc of Debian.

" Show syntax colours
syntax on

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
"set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" end of copied from /usr/local/vim/vimrc

" Copied from nyuszika7h http://nyuszika7h.dyndns.org/~nyuszika7h/.vimrc

set number          " Show line numbers.

set ruler           " Show the line and column number of the cursor position,
                    " separated by a comma.
 
set background=dark " When set to "dark", Vim will try to use colors that look
                    " good on a dark background. When set to "light", Vim will
                    " try to use colors that look good on a light background.
                    " Any other value is illegal.

" end of copied from nyuszika7h


"Use modelines!
set modeline

"end of copied fron vimwiki.

" copied from http://www.linuxquestions.org/questions/suse-novell-60/how-to-make-a-tab-is-4-spaces-width-in-vim-355658/

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" end of copied fron linuxquestions.org

" Copied from whttp://items.sjbach.com/319/configuring-vim-right

" Longer history
set history=1000

" Extended % matching
runtime macros/matchit.vim

" Make tab filler useful.
set wildmenu
set wildmode=list:longest

" Flash, do not beep!
set visualbell
" End of copied from http://items.sjbach.com/319/configuring-vim-right

" gvim has light background
if has('gui_running')
    set background=light
endif
