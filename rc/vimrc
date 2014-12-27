" I probably don't need to have Vi compatibility.
set nocompatible

" Copied from /usr/local/vim/vimrc of Debian.

" Show syntax colours
syntax on

set showcmd     " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
"set incsearch      " Incremental search
set autowrite       " Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
"set mouse=a        " Enable mouse usage (all modes)

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

" Show hidden characters via http://www.perturb.org/display/679_Make_Vim_show_hidden_characters.html
set invlist

"Prefer to UNIX line endings, but understand DOS too.
set fileformats=unix,dos

"Use UTF-8!
set encoding=utf-8
set fileencoding=utf-8

" Remove BOMs. They broke things yesterday nd now they wasted my time
" at school! via http://techwelkin.com/how-to-remove-byte-order-mark-bom-characters
set nobomb

" Copied from https://github.com/ProgVal/misc/blob/master/dotfiles/.vimrc
set autoindent
set softtabstop=4
filetype plugin indent on

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" End of copied from https://raw.githubusercontent.com/ProgVal/misc/master/dotfiles/.vimrc

" If we have tabs, remove them
"if has("autocmd") 
"    au BufReadPost * if &modifiable | retab | endif 
"endif 

" dos2unix ^M copied from http://stackoverflow.com/a/5361702/1675649
fun! Dos2unixFunction()
    let _s=@/
    let l = line(".")
    let c = col(".")
    try
        set ff=unix
        w!
        "%s/\%x0d$//e
    catch /E32:/
        echo "Sorry, the file is not saved."
    endtry
    let @/=_s
    call cursor(l, c)
endfun
com! Dos2Unix keepjumps call Dos2unixFunction()
au BufReadPost * keepjumps call Dos2unixFunction()

" Copied from Edelwin: https://gist.github.com/Edelwin/ca9a819e5509f1ede2d7
iab  #i #include
iab  #z #!/usr/bin/env zsh
iab  #p #!/usr/bin/env python3
iab  #r #!/usr/bin/env ruby
" end of copied from Edelwin
iab #b #!/usr/bin/env bash

" Highlight all search results
set hlsearch
