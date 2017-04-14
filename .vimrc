set number
syntax enable
colorscheme basic-dark

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" красивый статусбар
Plugin 'vim-airline/vim-airline'
" сниппеты
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" отображение папок
Plugin 'scrooloose/nerdtree'

" тема
Plugin 'altercation/vim-colors-solarized'

call vundle#end()            " required
filetype plugin indent on    " required

" airline all the time!
set laststatus=2
let g:airline_powerline_fonts=1
