" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" #source ~/.vimrc

call plug#begin( system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"') )
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()

let g:lsp_settings = {
            \'clangd': {'cmd': ['clangd-11']},
            \'efm-langserver': {'disabled': v:false}
            \}

set laststatus=2
set clipboard=unnamed
set number
set hlsearch

" Indentation configuration
" Make that backspace delete the entire indentation instead of char by char
set softtabstop=4
set shiftwidth=4
set expandtab

syntax on
filetype plugin on

map <F7> :tabp<CR>
map <F8> :tabn<CR>
