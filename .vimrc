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
"if executable('ag')
    "let g:ctrlp_user_command = 'ag -l --nocolor -g "" %s'
    "let g:ctrlp_use_caching = 0
"endif

let g:ctrlp_user_command = ['.git/', 'git ls-files --cached --others  --exclude-standard %s']
let g:ctrlp_use_caching = 0

let g:ctrlp_cmd = 'FZF'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree configuration {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" show hidden files by default
let g:NERDTreeShowHidden = 1
"let NERDTreeDirArrowExpandable = " "
"let NERDTreeDirArrowCollapsible = " "
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['.idea']

" devicons config
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

" hides non breaking spaces in our NERDTree view
autocmd FileType nerdtree setlocal nolist

" this should hide squre brackets before icons but it doesn't. To investigate
"set conceallevel=3

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic configuration {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_phpcs_args="--standard=PSR2 -n --report=csv"
if filereadable("ruleset.xml")
    let g:syntastic_php_phpcs_args="--standard=ruleset.xml -n --report=csv"
endif
let g:syntastic_php_phpmd_post_args = 'codesize,controversial,design,unusedcode'
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_error_symbol = "✗"
let g:syntastic_style_warning_symbol = "⚠"
let g:syntastic_aggregate_errors = 1

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
      \              [ 'syntastic', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag'
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
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
