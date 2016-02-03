" ----- Defaults -----

set nocompatible         " use Vim defaults.

" ----- Pathogen -----

call pathogen#infect()   " Pathogen must be called before filetype detection.
call pathogen#helptags()
filetype plugin indent on

" ----- Text formatting -----

set autoindent          " automatic indent new lines.
set smartindent         " make it smart.
set copyindent          " copy structure of existing lines.
set cindent             " enable automatic C program indenting.
set nowrap              " do not wrap lines.
set shiftwidth=4        " use four characters for tabs.
set softtabstop=4       " mindblowing.
set tabstop=4           " skullcracking.
set expandtab
set backspace=indent,eol,start
set guifont=Meslo\ LG\ M\ Regular\ for\ Powerline:h15

" ----- UI settings -----

set nu                  " show line numbers
set ruler               " always show cursor position.
set showmode            " show the mode we're currently in.
set showcmd             " always display commands.
set showmatch           " highlight matching brackets/showbraces.
set list                " enable listcharacters.
set laststatus=2        " show status line.
set cursorline          " visualize current line.
set nopaste             " don't use stupid paste settings
set colorcolumn=80      " add a line on the 80th character
set autoread            " autoreload files after changes (works only in gui vim)
set history=1000        " bigger history
set listchars=tab:→\ ,extends:»,precedes:«,trail:▒,nbsp:· "show hidden characters
set shortmess=a         " decrease message size to avoid the "Hit ENTER to continue" prompts

" More natural position of new splits
set splitbelow
set splitright

" Remember undo's even when buffer has been in the background.
" Also allows for sending buffers to the background without saving...
set hidden
set autowrite

" persist undo files, to make sure we can undo after closing a file
set undofile

silent execute '!mkdir -p $HOME/.vim/tmp/undo'
set undodir=$HOME/.vim/tmp/undo

" ----- File navigation -----

set wildmenu           " display all possibilities on autocomplete.
set wildmode=longest,list,full

" ----- Command settings -----
set shell=bash

" ----- Movement -----


" ----- Key bindings -----

" Make <Leader> char something more accessible on a AZERTY keyboard
let mapleader = ","
let g:mapleader = ","

" Less finger wrecking window navigation.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" This will enable us to have a nice choice with ctags
nnoremap <C-]> g<C-]>

" Hop from method to method
nmap <c-n> ]]
nmap <c-m> [[

" ----- Clipboard -----

" Copy to our clipboard
set clipboard=unnamed

" ----- Searching -----

set ignorecase           " no case sensitivity please.
set smartcase            " search case sensitive if i'm willing to.
set incsearch            " do incremental search.

" ----- Syntax and such -----

syntax on                " enable syntax highlighting.
set background=dark
colorscheme solarized
set synmaxcol=512        " try highlighting maximum 512 columns.

" ----- Formatting -----

set fileformat=unix      " always use unix fileformat.
set encoding=utf-8       " force UTF-8 encoding.

" ----- Autocomplete ----
set tags=./tags;/       " Ctags, look in current dir and up
autocmd BufReadPost *.php silent! :echom system("if [ ! -f tags ]; then /usr/local/bin/ctags -R . &2>/dev/null; fi")
set completeopt=longest,menuone
set omnifunc=syntaxcomplete#Complete

let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 'ra'

" Tell ctrlp some new settings
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$\|cache$\|vendor$\|web$\|coverage$\|bower_components$\|code-coverage$\|code-documentation$\|cookbooks$\|Resources\/doc$\|frontend\/files$\|compiled_templates$',
    \ 'file': '\.exe$\|\.so$\|\.swp\|\.DS_STORE\|.php\~$',
    \ }

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
if executable('ag')
    let g:ctrlp_user_command = 'ag -l --nocolor -g "" %s'
    let g:ctrlp_use_caching = 0
endif

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
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_error_symbol = "✗"
let g:syntastic_style_warning_symbol = "⚠"

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim php refactoring toolbox config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_php_refactoring_auto_validate_visibility = 1
let g:vim_php_refactoring_default_property_visibility = 'private'
let g:vim_php_refactoring_default_method_visibility = 'private'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1


" ----- Custom mapping -----

" F7 toggles highlighted search.
map <F7> :set hlsearch!<CR>

" on editing, jump to last known cursor position.
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" on save, remove trailing spaces.
autocmd BufWritePre * :%s/\s\+$//e

" Do not pollute the working directory with swap and other files.
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" .tpl files are mainly (x)html files, xhtml gives better omni completion.
autocmd BufNewFile,BufRead *.tpl set filetype=xhtml
autocmd BufNewFile,BufRead *.xml.dist set filetype=xml
autocmd BufNewFile,BufRead *.yml.dist set filetype=yaml
autocmd BufNewFile,BufRead *.twig set filetype=htmldjango
autocmd FileType yaml setlocal ts=4 sts=4 sw=4 expandtab

" crontab can only be edited using these settings
autocmd filetype crontab setlocal nobackup nowritebackup

" use ack instead of ag
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" enable spelling om some filetypes
autocmd FileType gitcommit setlocal spell
autocmd FileType markdown setlocal spell
