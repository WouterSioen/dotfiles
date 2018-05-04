" vim:fdm=marker

silent execute '!mkdir -p $HOME/.vim/tmp/undo'
filetype plugin indent on

" -----------------------------------------------------------------------------
" important {{{1
" -----------------------------------------------------------------------------

set nocompatible         " use Vim defaults.
set nopaste              " don't use stupid paste settings
xnoremap p "_dP"         " don't put the content you paste over in the register
set runtimepath+=~/.vim/snippets " adds snippets to our runtimepath
set runtimepath+=~/.vim/my-snippets " adds snippets to our runtimepath

set rtp+=/usr/local/opt/fzf

" trigger FZF by using <c-p> shortcut
map <c-p> :Files<CR>

" -----------------------------------------------------------------------------
" moving around, searching, and patterns {{{1
" -----------------------------------------------------------------------------

set incsearch            " do incremental search.
set nohlsearch           " don't hightlight search results
set ignorecase           " no case sensitivity please.
set smartcase            " search case sensitive if i'm willing to.

" -----------------------------------------------------------------------------
" tags {{{1
" -----------------------------------------------------------------------------

set tags+=./tags;/       " Add our tags file

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

" -----------------------------------------------------------------------------
" multiple windows {{{1
" -----------------------------------------------------------------------------

set cursorline          " visualize current line.
set splitbelow          " a new horizontal split is always put on the bottom
set splitright          " a new vertical split is always put at the right
set hidden              " keep buffers in memory when not shown on window

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
"set omnifunc=syntaxcomplete#Complete " function for filetype specific completion

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
set wildmode=list:longest,full " improves command line completion

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

" register and start language server
let g:LanguageClient_serverCommands = {'php':[ 'php', '~/.composer/vendor/bin/php-language-server.php' ]}
let g:LanguageClient_diagnosticsEnable = 0

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

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
highlight LineNr ctermbg=none
highlight! link SignColumn LineNr

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree configuration {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" show hidden files by default
let g:NERDTreeShowHidden = 1
"let NERDTreeDirArrowExpandable = " "
"let NERDTreeDirArrowCollapsible = " "
highlight NERDTreeOpenable ctermfg=bg
highlight NERDTreeClosable ctermfg=bg
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['.idea']
let g:NERDTreeWinSize = 30

" devicons config
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

" hides non breaking spaces in our NERDTree view
autocmd FileType nerdtree setlocal nolist

" this should hide squre brackets before icons but it doesn't. To investigate
"set conceallevel=3

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ale configuration {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_php_phpmd_ruleset = 'codesize,controversial,design,unusedcode'
let g:ale_php_phpcs_standard = 'PSR2'

let g:ale_linters = {
\   'php': ['php', 'phpcs', 'phpmd'],
\}

let g:ale_sign_error = '>>'
let g:ale_sign_warning = '>>'

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
" lightline config {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'relativepath', 'modified' ] ],
      \  'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ] ]
      \ },
      \ 'component_function': {
      \   'filetype': 'WebDevIconsGetFileTypeSymbol',
      \ }
      \ }

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom mapping {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" on editing, jump to last known cursor position.
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" on save, remove trailing spaces.
autocmd BufWritePre * :%s/\s\+$//e

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

" use rg instead of ack
if executable('rg')
    let g:ackprg = 'rg --vimgrep'
    set grepprg=rg\ --vimgrep
    set grepformat^=%f:%l:%c:%m
endif

" PHP Find Usage
noremap <Leader>fu :call PhpUsage('<cword>')<CR>
function! PhpUsage(word)
    exe 'Ack "::' . a:word . '\(|>' . a:word . '\("'
endfunction

" PHP Find Implementations
noremap <Leader>fi :call PhpImplementations('<cword>')<CR>
function! PhpImplementations(word)
    exe 'Ack "implements.*' . a:word . ' *($|{)"'
endfunction

" PHP Find Subclasses
noremap <Leader>fe :call PhpSubclasses('<cword>')<CR>
function! PhpSubclasses(word)
    exe 'Ack "extends.*' . a:word . ' *($|{)"'
endfunction

" Add use statement and sort
noremap <Leader>us :call PhpAddUseStatementAndSort()<CR>
function! PhpAddUseStatementAndSort()
    :call PhpInsertUse()
    :call PhpSortUse()
endfunction

" sort php use statements
autocmd FileType php inoremap <Leader>s <Esc>:call PhpSortUse()<CR>
autocmd FileType php noremap <Leader>s :call PhpSortUse()<CR>

" -----------------------------------------------------------------------------
" project specific vimrc files {{{1
" -----------------------------------------------------------------------------

set exrc " allow projects to have their specific vimrc files
set secure " don't allow insecure commands in project specific vimrc files

" -----------------------------------------------------------------------------
" Highlight yanked data {{{1
" -----------------------------------------------------------------------------

if !exists('##TextYankPost')
  map y <Plug>(highlightedyank)
endif
