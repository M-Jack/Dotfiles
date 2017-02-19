set nocompatible              " be iMproved, required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Add maktaba and codefmt to the runtimepath.
Plugin 'tpope/vim-sensible'
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-syntastic/syntastic'
Plugin 'rust-lang/rust.vim'
Plugin 'tpope/vim-vividchalk'

" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" airline bars
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()            " required

call glaive#Install()

set number
:imap jk <Esc> " Remap the terribly far away

syntax enable
set background=dark
colorscheme solarized
" Default syntastic params

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Rust pref
let g:rustfmt_autosave = 1
autocmd FileType rust let g:syntastic_rust_checkers = ['rustc']
