" I probably don't need to have Vi compatibility.
set nocompatible

" Copied from /usr/local/vim/vimrc of Debian.
" This should read Debian default config files too.
runtime! debian.vim

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
"set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

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

" Copied from http://vim.wikia.com/wiki/Modeline_magic
" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d :",
        \ &tabstop, &shiftwidth, &textwidth)
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

"end of copied fron vimwiki.

" copied from http://www.linuxquestions.org/questions/suse-novell-60/how-to-make-a-tab-is-4-spaces-width-in-vim-355658/

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" end of copied fron linuxquestions.org

" Copied from whttp://items.sjbach.com/319/configuring-vim-right

" Set leader key as ,
let mapleader = ","

" Longer history
set history=1000

" Extended % matching
runtime macros/matchit.vim

" Make tab filler useful.
set wildmenu
set wildmode=list:longest

" Set terminal title (This probably helps with tmux)
set title

" Flash, do not beep!
set visualbell
" End of copied from http://items.sjbach.com/319/configuring-vim-right
