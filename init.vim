set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


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
" to make use of plugins written in python
" http://ricostacruz.com/til/neovim-with-python-on-osx
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

" quickfix vim-ruby ftplugin in neovim.
" see: https://github.com/vim-ruby/vim-ruby/issues/248
" let g:ruby_path = system('rbenv prefix')
let g:ruby_path = []

" PERSONAL KEYBOARD SHORTCUTS:
imap jk <Esc>
nnoremap // :nohlsearch<CR>
nnoremap ,n :NERDTreeToggle<CR>

" PLUGIN SPECIFIC SETTINGS
set rtp+=/usr/local/opt/fzf
