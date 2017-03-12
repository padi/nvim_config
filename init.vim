set nocompatible              " be iMproved, required

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
"syntax on
"syntax enable

" undo all autocommands to prevent entering any autocmd twice
" when sourcing vimrc twice:
autocmd!

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all 
" the plugins.
" let mapleader=","

" =============== Vundle Initialization ===============
" This loads all the plugins specified in ~/.config/nvim/vundles.vim
" Use Vundle plugin to manage all other plugins
if filereadable(expand("~/.config/nvim/vundles.vim"))
  source ~/.config/nvim/vundles.vim
endif
au BufNewFile,BufRead *.vundle set filetype=vim

" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" " Keep undo history across sessions, by storing in file.
" " Only works all the time.
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>


" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" From: "How to do 90% of What Plugins Do w/ Just Vim" by Thoughtbot
" Youtube Channel
" COVERS:
" - Basic Setup
" - Fuzzy File Search
" - Tag jumping
" - Autocomplete
" - File browsing
" - Snippets
" - Build Integration (if we have time)
"
" BASIC SETUP:
" enter current millenium vim
" set nocompatible

" enable syntax and plugins
syntax enable
filetype plugin on

" FUZZY FILE SEARCH:
" Search down into subfolders
" Provides tab completion for all file-related tasks
set path+=**
" Display all matching files when tabbing while using :find
set wildmenu
" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make :find fuzzy
" THINGS TO CONSIDER
" - :b lets you autocomplete any open buffer

" TAG JUMPING:
" create the `tags` file for (may need to install ctags first)
command! MakeTags !ctags -R .
" NOW WE CAN
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back the tag stack
" THINGS TO CONSIDER
" - This doesn't help if you want a visual list of tags

" AUTOCOMPLETE:
" The good stuff is documented on |ins-completion|
" HIGHLIGHTS:
" - ^x^n for just this file
" - ^x^f for filenames (works with path trick)
" - ^x^] for tags only
" - ^n for anything specified by the complete option
" NOW WE CAN:
" - Use ^n and ^p to go back and forth between the suggestion list

" FILE BROWSING:
" Tweaks for browsing
" let g:netrw_banner = 0        " disable annoying banner
let g:netrw_browse_split = 4  " open in prior window
let g:netrw_altv = 1          " open splits to the right
let g:netrw_liststyle = 3     " tree view
let g:netrw_list_hide = netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings

" SNIPPETS:
" Read an empty HTML template and move cursor to title
" (WARNING: .skeleton.html must exist!)
nnoremap ,html :-1read $HOME/.config/nvim/.skeleton.html<CR>3jwf>a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""

" quickfix vim-ruby ftplugin in neovim.
" see: https://github.com/vim-ruby/vim-ruby/issues/248
" let g:ruby_path = system('rbenv prefix')
let g:ruby_path = []


" ================ Custom Settings ========================
" TODO put custom settings here should it rise in count
" so ~/.yadr/vim/settings.vim

" PERSONAL KEYBOARD SHORTCUTS:
imap jk <Esc>
nnoremap // :nohlsearch<CR>
nnoremap ,n :NERDTreeToggle<CR>
