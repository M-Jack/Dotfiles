set nocompatible

" set the runtime path to in Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Add maktaba and codefmt to the runtimepath.
Plugin 'tpope/vim-sensible'
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'
Plugin 'vim-syntastic/syntastic'
Plugin 'rust-lang/rust.vim'

" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'valloric/youcompleteme'


call vundle#end()            " required

call glaive#Install()

" Common set up
set number
:imap jk <Esc> " Remap the terribly far away
let mapleader = ','

" remove trailing whitespace
nnoremap <Leader>rtw :%s/\s\+$//e<CR>


" Make ariline simpler again
let g:airline_powerline_fonts = 0
let g:airline_symbols = {}
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_theme = 'solarized'

" Rust pref
let g:rustfmt_autosave = 1
let g:syntastic_rust_rustc_exe = 'cargo check'
let g:syntastic_rust_rustc_fname = ''
let g:syntastic_rust_rustc_args = '--'
let g:syntastic_rust_checkers = ['rustc']


" Fuzzy finder

set path+=**
set wildmenu

" Auto code formatting on save
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  autocmd FileType rust let g:syntastic_rust_checkers = ['rustc']
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END


" tabs
set tabstop=2
set shiftwidth=2
set expandtab
