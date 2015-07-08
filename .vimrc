" ----- Defaults -----

set nocompatible		" use Vim defaults.

" ----- Pathogen -----

call pathogen#infect()	" Pathogen must be called before filetype detection.
filetype plugin indent on

" ----- Text formatting -----

set autoindent			" automatic indent new lines.
set smartindent			" make it smart.
set copyindent			" copy structure of existing lines.
set cindent				" enable automatic C program indenting.
set nowrap				" do not wrap lines.
set shiftwidth=4		" use four characters for tabs.
set softtabstop=4		" mindblowing.
set tabstop=4			" skullcracking.
set expandtab
set backspace=indent,eol,start
set guifont=Meslo\ LG\ M\ Regular\ for\ Powerline:h15
let g:airline_powerline_fonts = 1

" ----- UI settings -----

set nu					" show line numbers
set ruler				" always show cursor position.
set showmode			" show the mode we're currently in.
set showcmd				" always display commands.
set showmatch			" highlight matching brackets/showbraces.
set list				" enable listcharacters.
set laststatus=2		" show status line.
set cursorline			" visualize current line.
set nopaste				" don't use stupid paste settings
set colorcolumn=80
set autoread
set history=1000

" Remember undo's even when buffer has been in the background.
" Also allows for sending buffers to the background without saving...
set hidden
set autowrite

" ----- File navigation -----

set wildmenu			" display all possibilities on autocomplete.
set wildmode=longest,list,full

" ----- Command settings -----
set shell=bash

" ----- Movement -----


" {{{1 Key bindings
"===============================================================================
" Make <Leader> char something more accessible on a AZERTY keyboard
let mapleader = ","
let g:mapleader = ","

" Less finger wrecking window navigation.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" More natural position of new splits
set splitbelow
set splitright

" This will enable us to have a nice choice with ctags
nnoremap <C-]> g<C-]>

" Hop from method to method
nmap <c-n> ]]
nmap <c-m> [[

" Copy to our clipboard
set clipboard=unnamed

" ----- Searching -----

set ignorecase			" no case sensitivity please.
set smartcase			" search case sensitive if i'm willing to.
set incsearch			" do incremental search.

" ----- Syntax and such -----

syntax on				" enable syntax highlighting.
set background=dark
colorscheme solarized
set synmaxcol=512		" try highlighting maximum 512 columns.

" ----- Formatting -----

set fileformat=unix		" always use unix fileformat.
set encoding=utf-8		" force UTF-8 encoding.

" ----- Autocomplete ----
set tags=./tags;/       " Ctags, look in current dir and up
autocmd BufWritePost *.php silent! :echom system("/usr/local/bin/ctags -R . &2>/dev/null")
set completeopt=longest,menuone
set omnifunc=syntaxcomplete#Complete

" let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
		\ 'dir':  'frontend/files$\|\.git$\|\.svn$\|\compiled_templates$',
		\ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" show hidden files by default
let g:NERDTreeShowHidden = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_phpmd_disable = 1
let g:syntastic_php_phpcs_args="--standard=PSR2 -n --report=csv"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ultisnips config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
set runtimepath+=~/.vim/snippets

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim php namespace config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
noremap <Leader>u :call PhpInsertUse()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

" ----- Custom mapping -----

" F7 toggles highlighted search.
map <F7> :set hlsearch!<CR>

" visualize stuff.
set listchars=tab:→\ ,extends:»,precedes:«,trail:▒,nbsp:·

" on editing, jump to last known cursor position.
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" on save, remove trailing spaces.
autocmd BufWritePre * :%s/\s\+$//e

" Do not pollute the working directory with swap and other files.
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" custom statusline
set statusline=%<%f\ %m%r\ %=line\ %l\ of\ %L\ %(@\ %c%V%)\ %25.25(%{&ff},%{strlen(&fenc)?&fenc:'none'}\ %y%)\ "

" .tpl files are mainly (x)html files, xhtml gives better omni completion.
autocmd BufNewFile,BufRead *.tpl set filetype=xhtml
autocmd BufNewFile,BufRead *.twig set filetype=htmldjango
autocmd FileType yaml setlocal ts=4 sts=4 sw=4 expandtab

" Tell ctrlp some new settings
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$\|cache$\|vendor$\|web$\|code-coverage$\|code-documentation$\|cookbooks$\|Resources\/doc$',
    \ 'file': '\.exe$\|\.so$\|\.swp\|\.DS_STORE\|.php\~$',
    \ }
