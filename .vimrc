" vim:fdm=marker

silent execute '!mkdir -p $HOME/.vim/tmp/undo'
filetype plugin indent on

" -----------------------------------------------------------------------------
" pathogen {{{1
" -----------------------------------------------------------------------------

call pathogen#infect()   " Pathogen must be called before filetype detection.
call pathogen#helptags()

" -----------------------------------------------------------------------------
" important {{{1
" -----------------------------------------------------------------------------

set nocompatible         " use Vim defaults.
set nopaste              " don't use stupid paste settings
set runtimepath+=~/.vim/snippets " adds snippets to our runtimepath

" -----------------------------------------------------------------------------
" moving around, searching, and patterns {{{1
" -----------------------------------------------------------------------------

set incsearch            " do incremental search.
set ignorecase           " no case sensitivity please.
set smartcase            " search case sensitive if i'm willing to.

" -----------------------------------------------------------------------------
" tags {{{1
" -----------------------------------------------------------------------------

set tags+=./tags;/,./tags.vendors;/ " Add both normal and vendors tags file

" -----------------------------------------------------------------------------
" displaying text {{{1
" -----------------------------------------------------------------------------

set nowrap              " do not wrap lines.
set guifont=Meslo\ LG\ M\ Regular\ for\ Powerline:h14 " which font to use
set number              " show line numbers
set list                " enable listcharacters.
set listchars=tab:→\ ,extends:»,precedes:«,trail:▒,nbsp:· "show hidden characters

" -----------------------------------------------------------------------------
" syntax, highlighting and spelling {{{1
" -----------------------------------------------------------------------------

set laststatus=2        " show status line.
set colorcolumn=80      " add a line on the 80th character
set background=dark     " The background color brightness
set synmaxcol=512       " try highlighting maximum 512 columns.

" set some filetypes for better autocompletion
autocmd BufNewFile,BufRead *.tpl set filetype=xhtml
autocmd BufNewFile,BufRead *.xml.dist set filetype=xml
autocmd BufNewFile,BufRead *.yml.dist set filetype=yaml
autocmd BufNewFile,BufRead *.twig set filetype=htmldjango

" enable spelling om some filetypes
autocmd FileType gitcommit setlocal spell
autocmd FileType markdown setlocal spell

" F7 toggles highlighted search.
map <F7> :set hlsearch!<CR>

" -----------------------------------------------------------------------------
" multiple windows {{{1
" -----------------------------------------------------------------------------

set cursorline          " visualize current line.
set splitbelow          " a new horizontal split is always put on the bottom
set splitright          " a new vertical split is always put at the right
set hidden              " keep buffers in memory when not shown on window
set statusline+=%#warningmsg# " Syntastic status line
set statusline+=%{SyntasticStatuslineFlag()} " Syntastic status line
set statusline+=%* " Syntastic status line

" -----------------------------------------------------------------------------
" multiple tab pages {{{1
" -----------------------------------------------------------------------------


" -----------------------------------------------------------------------------
" terminal {{{1
" -----------------------------------------------------------------------------


" -----------------------------------------------------------------------------
" using the mouse {{{1
" -----------------------------------------------------------------------------


" -----------------------------------------------------------------------------
" printing {{{1
" -----------------------------------------------------------------------------


" -----------------------------------------------------------------------------
" messages and info {{{1
" -----------------------------------------------------------------------------

set ruler               " always show cursor position.
set showmode            " show the mode we're currently in.
set showcmd             " always display commands.
set shortmess=a         " decrease message size to avoid the "Hit ENTER to continue" prompts

" -----------------------------------------------------------------------------
" selecting text {{{1
" -----------------------------------------------------------------------------

set clipboard=unnamed   " copy to our clipboard

" -----------------------------------------------------------------------------
" editing text {{{1
" -----------------------------------------------------------------------------

set backspace=indent,eol,start "specifies what backspace can do in insert mode
set showmatch           " highlight matching brackets/showbraces.
set completeopt=longest,menuone " style of autocomplete popup menu
set omnifunc=syntaxcomplete#Complete " function for filetype specific completion

" -----------------------------------------------------------------------------
" tabs and indenting {{{1
" -----------------------------------------------------------------------------

set autoindent          " automatic indent new lines.
set smartindent         " make it smart.
set copyindent          " copy structure of existing lines.
set cindent             " enable automatic C program indenting.
set shiftwidth=4        " use four characters for indentation
set softtabstop=4       " number of spaces inserted for a tab
set tabstop=4           " number of spaces a tab stands for
set expandtab           " use tabs instead of spaces in insert mode

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab " other defaults for yaml

" -----------------------------------------------------------------------------
" folding {{{1
" -----------------------------------------------------------------------------


" -----------------------------------------------------------------------------
" diff mode {{{1
" -----------------------------------------------------------------------------


" -----------------------------------------------------------------------------
" mapping {{{1
" -----------------------------------------------------------------------------


" -----------------------------------------------------------------------------
" reading and writing files {{{1
" -----------------------------------------------------------------------------

set autoread            " autoreload files after changes (works only in gui vim)
set autowrite           " automatically write a file when leaving a modified buffer
set fileformat=unix     " always use unix fileformat.

" crontab can only be edited using these settings
autocmd filetype crontab setlocal nobackup nowritebackup

" -----------------------------------------------------------------------------
" the swap file {{{1
" -----------------------------------------------------------------------------

" Do not pollute the working directory with swap and other files.
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" -----------------------------------------------------------------------------
" command line editing {{{1
" -----------------------------------------------------------------------------

set history=1000        " bigger history
set undofile            " persist undo files, to make sure we can undo after
                        " closing a file
set undodir=$HOME/.vim/tmp/undo " set the undo directory
set wildmenu           " display all possibilities on autocomplete.
set wildmode=longest,list,full " improves command line completion

" -----------------------------------------------------------------------------
" executing external commands {{{1
" -----------------------------------------------------------------------------

set shell=bash

" -----------------------------------------------------------------------------
" running make and jumping to errors {{{1
" -----------------------------------------------------------------------------


" -----------------------------------------------------------------------------
" language specific {{{1
" -----------------------------------------------------------------------------


" -----------------------------------------------------------------------------
" multi-byte characters {{{1
" -----------------------------------------------------------------------------

set encoding=utf-8       " force UTF-8 encoding.

" -----------------------------------------------------------------------------
" various {{{1
" -----------------------------------------------------------------------------


" -----------------------------------------------------------------------------
" keybindings {{{1
" -----------------------------------------------------------------------------

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

" ---- Syntax highlighting ----
syntax on
colorscheme solarized

" ----- Autocomplete ----
autocmd BufReadPost *.php silent! :echom system("if [ ! -f tags ]; then /usr/local/bin/ctags -R src &2>/dev/null; fi;")
autocmd BufReadPost *.php silent! :echom system("if [ ! -f tags.vendor ]; then /usr/local/bin/ctags -R -f tags.vendors vendor &2>/dev/null; fi")

let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP configuration {{{1
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
" NERDTree configuration {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" show hidden files by default
let g:NERDTreeShowHidden = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic configuration {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
" Ultisnips config {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim php namespace config {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
noremap <Leader>u :call PhpInsertUse()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim php refactoring toolbox config {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_php_refactoring_auto_validate_visibility = 1
let g:vim_php_refactoring_default_property_visibility = 'private'
let g:vim_php_refactoring_default_method_visibility = 'private'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline config {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fugitive-gitlab config {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fugitive_gitlab_domains = ['http://git.sumocoders.be']

" ----- Custom mapping -----

" on editing, jump to last known cursor position.
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" on save, remove trailing spaces.
autocmd BufWritePre * :%s/\s\+$//e

" set phpunit as compiler for test files
autocmd BufNewFile,BufRead *Test.php compiler phpunit
autocmd BufWritePost *Test.php Dispatch bin/phpunit

" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" use ack instead of ag
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
